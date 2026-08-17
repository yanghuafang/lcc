#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>

#include <exception>
#include <memory>
#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/IrIdioms.hpp"
#include "irgen/Operators.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/TypeRules.hpp"
#include "types/VarTypeQuery.hpp"

// Expressions -> LLVM IR: genCode() and genCodePtr() for every Expr node in
// ast/Nodes.hpp, plus the getExpr*/getLValue* type queries that are lcc's
// stand-in for a semantic-analysis pass — they supply the C type information
// lowering needs, since there is no typed IR between parsing and emission.
//
// The largest of the four walkers, because C's expression grammar is the
// largest part of the language. The binary operators are one level down in
// irgen/Operators.hpp, shared with their compound-assignment twins.
//
// == The one contract to understand before reading ==
//
// Every Expr implements two lowerings, and picking the wrong one is the most
// common way to break this file:
//
//   genCode()     the *value* of the expression   — usually a load
//   genCodePtr()  the *address* it designates     — an alloca, GEP, or global
//
// This is C's lvalue/rvalue distinction made concrete. `x = y` lowers the left
// side with genCodePtr() and the right with genCode(); `&x` is genCodePtr()
// with no load; `*p` is a genCode() that loads through what p evaluates to.
// Nodes that designate no storage — a literal, a call, an arithmetic result —
// implement genCodePtr() by throwing, which is what makes `1 = x` a compile
// error rather than silently wrong IR.
//
// == Where the type information comes from ==
//
// LLVM 20 pointers are opaque: an IR `ptr` value has no pointee type, so the
// element type for a load, store, or GEP cannot be read back off the value. It
// has to come from the AST, which is what the getExpr*/getLValue* queries here
// and types/VarTypeQuery.hpp exist to provide. Any place this file passes a
// VarType* alongside an llvm::Value*, that is why.
//
// == Known deviations from C, both in this file ==
//
// lcc lowers the three "lazy" operators eagerly, with select instead of
// branches, so an untaken operand's side effects still run:
//
//   - && and ||   LogicExpr::genBoolBinaryCode  (CreateLogicalAnd/Or)
//   - ?:          TernaryCondition::genTernarySelect  (CreateSelect)
//
// So `p != NULL && *p` is not safe here, and `f() ? g() : h()` calls both g and
// h. Fixing either means splitting into basic blocks and joining with a phi —
// the same shape StmtToIr.cpp already builds for if/else. The comma operator,
// by contrast, is correct: it evaluates the left side for effect and yields the
// right.

namespace AST {

namespace {

// sizeof(expr) must use the expression's AST type (e.g. array before decay),
// not the decayed pointer type used for IR loads.
llvm::Type* sizeofTypeForExpr(Expr* expr, CodeGenerator& generator) {
  if (VarType* lvalueType = expr->getLValueVarType(generator)) {
    return vartype::memoryAccessType(lvalueType, generator);
  }

  VarType* exprType = expr->getExprVarType(generator);
  if (exprType == nullptr) {
    throw std::logic_error("sizeof requires a known expression type.");
  }
  return exprType->getType(generator);
}

// Resolve struct/union VarType through typedef aliases and struct tag names
// (DefinedType such as "Employee" after "typedef struct Employee Employee").
VarType* resolveAggregateVarType(VarType* varType, CodeGenerator& generator) {
  varType = vartype::resolveTypedefVarType(varType, generator);
  if (varType == nullptr) {
    return nullptr;
  }
  if (varType->isStructType() || varType->isUnionType()) {
    return varType;
  }
  if (varType->isDefinedType()) {
    llvm::Type* llvmTy = varType->getType(generator);
    if (llvmTy != nullptr && llvmTy->isStructTy()) {
      auto* structTy = static_cast<llvm::StructType*>(llvmTy);
      if (StructType* astStruct = generator.findStructType(structTy)) {
        return astStruct;
      }
      if (UnionType* astUnion = generator.findUnionType(structTy)) {
        return astUnion;
      }
    }
  }
  return nullptr;
}

// C's relational, equality, and logical operators yield int — 0 or 1 — not a
// one-bit value. LLVM's icmp/fcmp produce i1, so widen here, at the single
// point each of those operators produces its result.
//
// This has to happen in genCode(), not at the use site: getExprTypeId() below
// reports INT for these nodes, and every consumer (typeCast, the usual
// arithmetic conversion in typeUpgrade, variadic promotion in FuncCall) derives
// signedness from that type id alone. An i1 left in place would be *sign*
// extended on the way to i32, making `int r = a < b` store -1.
//
// Zero extension, not sign: the comparison is unsigned-1-bit, so `zext`. Any
// consumer needing the bit back — an if/while condition, `&&` — calls
// castToBool, and -O1 and up fold the zext/icmp pair away entirely.
llvm::Value* boolToInt(llvm::IRBuilder<>& builder, llvm::Value* boolValue) {
  return builder.CreateZExt(boolValue, builder.getInt32Ty());
}

// Rvalue form of an lvalue expression: evaluate address, then load.
llvm::Value* loadFromLValuePtr(CodeGenerator& generator, Expr* expr) {
  return iridiom::createLoad(generator.getBuilder(),
                             expr->genCodePtr(generator),
                             expr->getLValueVarType(generator), generator);
}

// Ordered comparison (<, >, <=, >=) after usual arithmetic conversion, with
// extra rules for pointer-vs-pointer and pointer-vs-integer operands.
llvm::Value* compareOrdered(Expr* lhsExpr, Expr* rhsExpr, llvm::Value* lhs,
                            llvm::Value* rhs, ops::IntCmpPred intPred,
                            llvm::CmpInst::Predicate floatPred,
                            CodeGenerator& generator) {
  BuiltinType::TypeId lhsTypeId = lhsExpr->getExprTypeId(generator);
  BuiltinType::TypeId rhsTypeId = rhsExpr->getExprTypeId(generator);
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (convert::typeUpgrade(generator.getBuilder(), lhs, rhs, lhsTypeId,
                           rhsTypeId, resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return ops::createIntegerCmp(generator.getBuilder(), intPred, lhs, rhs,
                                   isUnsigned);
    }
    return generator.getBuilder().CreateFCmp(floatPred, lhs, rhs);
  }

  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    llvm::Value* lhsInt = generator.getBuilder().CreatePtrToInt(
        lhs, generator.getBuilder().getInt64Ty());
    llvm::Value* rhsInt = generator.getBuilder().CreatePtrToInt(
        rhs, generator.getBuilder().getInt64Ty());
    return ops::createIntegerCmp(generator.getBuilder(), intPred, lhsInt,
                                 rhsInt, true);
  }
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return ops::createIntegerCmp(
        generator.getBuilder(), intPred,
        generator.getBuilder().CreatePtrToInt(
            lhs, generator.getBuilder().getInt64Ty()),
        convert::typeUpgrade(generator.getBuilder(), rhs,
                             generator.getBuilder().getInt64Ty(), rhsTypeId,
                             BuiltinType::TypeId::ULONG),
        true);
  }
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return ops::createIntegerCmp(
        generator.getBuilder(), intPred,
        convert::typeUpgrade(generator.getBuilder(), lhs,
                             generator.getBuilder().getInt64Ty(), lhsTypeId,
                             BuiltinType::TypeId::ULONG),
        generator.getBuilder().CreatePtrToInt(
            rhs, generator.getBuilder().getInt64Ty()),
        true);
  }

  return nullptr;
}

// Shared struct/union member address logic for StructRef (.) and StructDeref
// (->).
llvm::Value* genStructMemberPtr(CodeGenerator& generator,
                                llvm::Value* structPtr, VarType* structVarType,
                                const std::string& memberName,
                                const char* unknownTypeMessage) {
  structVarType = vartype::resolveTypedefVarType(structVarType, generator);
  if (structVarType == nullptr) {
    throw std::logic_error(unknownTypeMessage);
  }

  if (structVarType->isStructType()) {
    auto* structType = static_cast<StructType*>(structVarType);
    size_t memberIndex = structType->getMemberIndex(memberName);
    if (memberIndex == static_cast<size_t>(-1)) {
      throw std::logic_error("The struct does not have a member named " +
                             memberName);
    }

    llvm::Type* llvmStructTy = structType->getType(generator);
    std::vector<llvm::Value*> indices;
    indices.push_back(generator.getBuilder().getInt32(0));
    indices.push_back(generator.getBuilder().getInt32(memberIndex));
    return generator.getBuilder().CreateGEP(llvmStructTy, structPtr, indices);
  }

  if (structVarType->isUnionType()) {
    auto* unionType = static_cast<UnionType*>(structVarType);
    llvm::Type* memberType = unionType->getMemberType(memberName, generator);
    if (memberType == nullptr) {
      throw std::logic_error("The union does not have a member named " +
                             memberName);
    }

    // A union is stored as its largest member (UnionType::genTypeBody), so all
    // members share one address: return the storage pointer (opaque) and let
    // the caller's load/store type reinterpret it -- no GEP, unlike a struct.
    return generator.getBuilder().CreatePointerCast(
        structPtr, llvm::PointerType::get(generator.getContext(), 0));
  }

  throw std::logic_error(unknownTypeMessage);
}

}  // namespace

VarType* Expr::getExprVarType(CodeGenerator& generator) { return nullptr; }

VarType* Expr::getLValueVarType(CodeGenerator& generator) { return nullptr; }

BuiltinType::TypeId Expr::getExprTypeId(CodeGenerator& generator) {
  VarType* varType = getExprVarType(generator);
  if (varType != nullptr) {
    return vartype::resolvedVarTypeToTypeId(varType, generator);
  }

  return BuiltinType::TypeId::UNKNOWN;
}

BuiltinType::TypeId Expr::getLValueTypeId(CodeGenerator& generator) {
  VarType* varType = getLValueVarType(generator);
  if (varType != nullptr) {
    return vartype::resolvedVarTypeToTypeId(varType, generator);
  }

  return BuiltinType::TypeId::UNKNOWN;
}

BuiltinType::TypeId Expr::binaryExprTypeId(Expr* lhs, Expr* rhs,
                                           CodeGenerator& generator) {
  bool isUnsigned = false;
  return typerules::usualArithmeticConversion(
      lhs->getExprTypeId(generator), rhs->getExprTypeId(generator), isUnsigned);
}

bool Expr::binaryIsUnsigned(Expr* lhs, Expr* rhs, CodeGenerator& generator) {
  bool isUnsigned = false;
  typerules::usualArithmeticConversion(
      lhs->getExprTypeId(generator), rhs->getExprTypeId(generator), isUnsigned);
  return isUnsigned;
}

BuiltinType::TypeId BinaryExpr::getExprTypeId(CodeGenerator& generator) {
  return binaryExprTypeId(lhs_, rhs_, generator);
}

llvm::Value* BinaryExpr::genBinaryCode(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return applyOp(lhs, rhs);
}

llvm::Value* BinaryExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
}

const char* Add::nonLValueErrorMessage() const {
  return "Add operator \"+\" can not return left value!";
}

const char* Sub::nonLValueErrorMessage() const {
  return "Sub operator \"-\" can not return left value!";
}

const char* Mul::nonLValueErrorMessage() const {
  return "Mul operator \"*\" can not return left value!";
}

const char* Div::nonLValueErrorMessage() const {
  return "Div operator \"/\" can not return left value!";
}

const char* Mod::nonLValueErrorMessage() const {
  return "Mod operator \"%\" can not return left value!";
}

const char* BitwiseAnd::nonLValueErrorMessage() const {
  return "Bitwise AND operator \"&\" can not return left value!";
}

const char* BitwiseOr::nonLValueErrorMessage() const {
  return "Bitwise OR operator \"|\" can not return left value!";
}

const char* BitwiseXor::nonLValueErrorMessage() const {
  return "Bitwise XOR operator \"^\" can not return left value!";
}

const char* LeftShift::nonLValueErrorMessage() const {
  return "Left shift operator \"<<\" can not return left value!";
}

const char* RightShift::nonLValueErrorMessage() const {
  return "Right shift operator \">>\" can not return left value!";
}

llvm::Value* ThrowingUnaryExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
}

llvm::Value* UnaryExpr::genIncDecCode(CodeGenerator& generator, bool increment,
                                      bool returnOperandPtr,
                                      const char* invalidTypeMessage) {
  llvm::Value* operand = operand_->genCodePtr(generator);
  VarType* lvalueVarType = operand_->getLValueVarType(generator);
  llvm::Value* value = generator.getBuilder().CreateLoad(
      vartype::memoryAccessType(lvalueVarType, generator), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    // Non-integers have no integer width; fall back to 64 so getOneValue yields
    // an i64 "1". createAdd/createSub then reinterpret it: a one-element GEP
    // step for pointers, or a promoted 1.0 for floats.
    size_t valueBitWidth =
        value->getType()->isIntegerTy()
            ? static_cast<llvm::IntegerType*>(value->getType())->getBitWidth()
            : 64;
    llvm::Value* oneValue =
        iridiom::getOneValue(generator.getBuilder(), valueBitWidth);
    llvm::Value* updated =
        increment ? ops::createAdd(generator.getBuilder(), value, oneValue,
                                   lvalueVarType, nullptr, generator,
                                   operand_->getLValueTypeId(generator),
                                   BuiltinType::TypeId::INT)
                  : ops::createSub(generator.getBuilder(), value, oneValue,
                                   lvalueVarType, nullptr, generator,
                                   operand_->getLValueTypeId(generator),
                                   BuiltinType::TypeId::INT);
    generator.getBuilder().CreateStore(updated, operand);
    return returnOperandPtr ? operand : value;
  }

  throw std::logic_error(invalidTypeMessage);
}

const char* UnaryPlus::nonLValueErrorMessage() const {
  return "Unary plus can not return left value!";
}

const char* UnaryMinus::nonLValueErrorMessage() const {
  return "Unary minus can not return left value!";
}

const char* AddressOf::nonLValueErrorMessage() const {
  return "AddressOf operator \"&\" can not return left value!";
}

const char* PostfixInc::nonLValueErrorMessage() const {
  return "Postfix inc operator \"++\" can not return left value!";
}

const char* PostfixDec::nonLValueErrorMessage() const {
  return "Postfix dec operator \"--\" can not return left value!";
}

const char* LogicNot::nonLValueErrorMessage() const {
  return "Logic NOT operator \"!\" can not return left value!";
}

const char* BitwiseNot::nonLValueErrorMessage() const {
  return "Bitwise NOT operator \"~\" can not return left value!";
}

VarType* Variable::getExprVarType(CodeGenerator& generator) {
  return generator.findVariableType(varName_);
}

VarType* Variable::getLValueVarType(CodeGenerator& generator) {
  return getExprVarType(generator);
}

BuiltinType::TypeId Constant::getExprTypeId(CodeGenerator& generator) {
  (void)generator;
  return typeId_;
}

BuiltinType::TypeId ConstStr::getExprTypeId(CodeGenerator& generator) {
  (void)generator;
  return BuiltinType::TypeId::UNKNOWN;
}

VarType* CommaExpr::getExprVarType(CodeGenerator& generator) {
  return rhs_->getExprVarType(generator);
}

VarType* FuncCall::getExprVarType(CodeGenerator& generator) {
  return generator.findFuncRetType(funcName_);
}

VarType* StructRef::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* StructRef::getLValueVarType(CodeGenerator& generator) {
  VarType* structVarType =
      resolveAggregateVarType(struct_->getExprVarType(generator), generator);
  if (structVarType == nullptr) {
    return nullptr;
  }

  return structVarType->getMemberVarType(memberName_);
}

VarType* StructDeref::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* StructDeref::getLValueVarType(CodeGenerator& generator) {
  VarType* pointerVarType = vartype::resolveTypedefVarType(
      structPtr_->getExprVarType(generator), generator);
  if (pointerVarType == nullptr || !pointerVarType->isPointerType()) {
    return nullptr;
  }

  VarType* pointeeType =
      resolveAggregateVarType(pointerVarType->getElementVarType(), generator);
  if (pointeeType == nullptr) {
    return nullptr;
  }

  return pointeeType->getMemberVarType(memberName_);
}

VarType* Subscript::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* Subscript::getLValueVarType(CodeGenerator& generator) {
  VarType* arrayVarType = array_->getExprVarType(generator);
  if (arrayVarType == nullptr) {
    return nullptr;
  }

  return arrayVarType->getElementVarType();
}

VarType* TypeCast::getExprVarType(CodeGenerator& generator) {
  (void)generator;
  return varType_;
}

BuiltinType::TypeId SizeOf::getExprTypeId(CodeGenerator& generator) {
  (void)generator;
  return BuiltinType::TypeId::LONG;
}

VarType* UnaryPlus::getExprVarType(CodeGenerator& generator) {
  return operand_->getExprVarType(generator);
}

VarType* UnaryMinus::getExprVarType(CodeGenerator& generator) {
  return operand_->getExprVarType(generator);
}

BuiltinType::TypeId UnaryMinus::getExprTypeId(CodeGenerator& generator) {
  return operand_->getExprTypeId(generator);
}

VarType* PointerDeref::getExprVarType(CodeGenerator& generator) {
  VarType* pointerVarType = operand_->getExprVarType(generator);
  pointerVarType = vartype::resolveTypedefVarType(pointerVarType, generator);
  if (pointerVarType == nullptr) {
    return nullptr;
  }

  return pointerVarType->getElementVarType();
}

VarType* PointerDeref::getLValueVarType(CodeGenerator& generator) {
  return getExprVarType(generator);
}

VarType* Assign::getExprVarType(CodeGenerator& generator) {
  return rhs_->getExprVarType(generator);
}

VarType* PostfixInc::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* PostfixInc::getLValueVarType(CodeGenerator& generator) {
  return operand_->getLValueVarType(generator);
}

VarType* PostfixDec::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* PostfixDec::getLValueVarType(CodeGenerator& generator) {
  return operand_->getLValueVarType(generator);
}

VarType* PrefixInc::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* PrefixInc::getLValueVarType(CodeGenerator& generator) {
  return operand_->getLValueVarType(generator);
}

VarType* PrefixDec::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* PrefixDec::getLValueVarType(CodeGenerator& generator) {
  return operand_->getLValueVarType(generator);
}

VarType* TernaryCondition::getExprVarType(CodeGenerator& generator) {
  return trueExpr_->getExprVarType(generator);
}

llvm::Value* Variable::genCode(CodeGenerator& generator) {
  llvm::Value* var = generator.findVariable(varName_);
  if (var != nullptr) {
    return iridiom::createLoad(generator.getBuilder(), var,
                               generator.findVariableType(varName_), generator);
  }

  var = generator.findConstant(varName_);
  if (var != nullptr) {
    return var;
  }

  if (generator.findTypedefAlias(varName_) != nullptr) {
    throw std::logic_error(varName_ + " is a typedef name, not a variable!");
  }

  throw std::logic_error(varName_ + " is neither a variable nor a constant!");
  return nullptr;
}

llvm::Value* Variable::genCodePtr(CodeGenerator& generator) {
  llvm::Value* var = generator.findVariable(varName_);
  if (var != nullptr) {
    return var;
  }

  var = generator.findConstant(varName_);
  if (var != nullptr) {
    throw std::logic_error(varName_ + " is const, not left value!");
  }

  if (generator.findTypedefAlias(varName_) != nullptr) {
    throw std::logic_error(varName_ + " is a typedef name, not a variable!");
  }

  throw std::logic_error(varName_ + " is neither a variable nor a constant!");
  return nullptr;
}

llvm::Value* Constant::genCode(CodeGenerator& generator) {
  switch (typeId_) {
    case BuiltinType::TypeId::CHAR:
      return generator.getBuilder().getInt8(charValue_);
    case BuiltinType::TypeId::INT:
      return generator.getBuilder().getInt32(intValue_);
    case BuiltinType::TypeId::UINT: {
      llvm::IntegerType* int32Type =
          llvm::Type::getInt32Ty(generator.getContext());
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int32Type, uintValue_);
      return constInt;
    }
    case BuiltinType::TypeId::LONG:
      return generator.getBuilder().getInt64(longValue_);
    case BuiltinType::TypeId::ULONG: {
      llvm::IntegerType* int64Type =
          llvm::Type::getInt64Ty(generator.getContext());
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int64Type, ulongValue_);
      return constInt;
    }
    case BuiltinType::TypeId::FLOAT:
      return llvm::ConstantFP::get(generator.getBuilder().getFloatTy(),
                                   floatValue_);
    case BuiltinType::TypeId::DOUBLE:
      return llvm::ConstantFP::get(generator.getBuilder().getDoubleTy(),
                                   doubleValue_);
    case BuiltinType::TypeId::BOOL:
      return generator.getBuilder().getInt1(boolValue_);
    default:
      throw std::logic_error("const type " +
                             std::to_string(static_cast<int>(typeId_)) +
                             " is not supported!");
  }
}

llvm::Value* Constant::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("constant is not left value!");
}

llvm::Value* ConstStr::genCode(CodeGenerator& generator) {
  return generator.getBuilder().CreateGlobalString(str_);
}

llvm::Value* ConstStr::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Left value const string is not supported!");
}

llvm::Value* CommaExpr::genCode(CodeGenerator& generator) {
  lhs_->genCode(generator);
  return rhs_->genCode(generator);
}

llvm::Value* CommaExpr::genCodePtr(CodeGenerator& generator) {
  lhs_->genCode(generator);
  return rhs_->genCode(generator);
}

llvm::Value* FuncCall::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.findFunction(funcName_);
  if (func == nullptr) {
    throw std::logic_error("Function " + funcName_ + " is not defined!");
  }

  // Check number of arguments.
  if (func->isVarArg() && argList_->size() < func->arg_size() ||
      !func->isVarArg() && argList_->size() != func->arg_size()) {
    throw std::logic_error("Wrong argument number for function call!");
  }

  // Check types of arguments and collect valid arguments.
  std::vector<llvm::Value*> args;
  size_t index = 0;
  for (auto* argIter = func->arg_begin(); argIter < func->arg_end();
       ++argIter, ++index) {
    llvm::Value* arg = argList_->at(index)->genCode(generator);
    VarType* paramVarType = generator.findFuncParamType(funcName_, index);
    arg = convert::typeCast(
        generator.getBuilder(), arg, argIter->getType(),
        argList_->at(index)->getExprTypeId(generator),
        vartype::resolvedVarTypeToTypeId(paramVarType, generator));
    if (arg == nullptr) {
      throw std::logic_error("Argument " + std::to_string(index) +
                             " does not match type to call function " +
                             funcName_);
    }

    args.push_back(arg);
  }

  // Continue to collect arguments if it is calling a variant function.
  if (func->isVarArg()) {
    for (; index < argList_->size(); ++index) {
      llvm::Value* arg = argList_->at(index)->genCode(generator);

      // C default argument promotions for the variadic tail (required by the
      // calling convention): char/short/bool -> int, float -> double.
      if (arg->getType()->isIntegerTy()) {
        arg = convert::typeUpgrade(
            generator.getBuilder(), arg, generator.getBuilder().getInt32Ty(),
            argList_->at(index)->getExprTypeId(generator),
            BuiltinType::TypeId::INT);
      } else if (arg->getType()->isFloatingPointTy()) {
        arg = convert::typeUpgrade(
            generator.getBuilder(), arg, generator.getBuilder().getDoubleTy(),
            argList_->at(index)->getExprTypeId(generator),
            BuiltinType::TypeId::DOUBLE);
      }

      args.push_back(arg);
    }
  }

  return generator.getBuilder().CreateCall(func, args);
}

llvm::Value* FuncCall::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Function call can not return left value!");
}

llvm::Value* StructRef::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* StructRef::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = struct_->genCodePtr(generator);
  VarType* structVarType =
      resolveAggregateVarType(struct_->getExprVarType(generator), generator);
  if (!structPtr->getType()->isPointerTy() || structVarType == nullptr) {
    throw std::logic_error(
        "Struct ref operator \".\" must apply on struct or union!");
  }

  return genStructMemberPtr(
      generator, structPtr, structVarType, memberName_,
      "Can not direct access to a variable of unknown type!");
}

llvm::Value* StructDeref::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* StructDeref::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = structPtr_->genCode(generator);
  VarType* pointerVarType = vartype::resolveTypedefVarType(
      structPtr_->getExprVarType(generator), generator);
  if (pointerVarType == nullptr || !pointerVarType->isPointerType()) {
    throw std::logic_error(
        "Struct deref operator \"->\" is not applied on struct or union!");
  }

  VarType* pointeeVarType =
      resolveAggregateVarType(pointerVarType->getElementVarType(), generator);
  if (!structPtr->getType()->isPointerTy() || pointeeVarType == nullptr) {
    throw std::logic_error(
        "Struct deref operator \"->\" is not applied on struct or union!");
  }

  return genStructMemberPtr(
      generator, structPtr, pointeeVarType, memberName_,
      "Can not dereference a variable pointer of unknown type!");
}

llvm::Value* Subscript::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* Subscript::genCodePtr(CodeGenerator& generator) {
  llvm::Value* arrayPtr = array_->genCode(generator);
  if (!arrayPtr->getType()->isPointerTy()) {
    throw std::logic_error(
        "Subscript operator \"[]\" must be applied to pointer or array!");
  }

  llvm::Value* idx = index_->genCode(generator);
  if (!idx->getType()->isIntegerTy()) {
    throw std::logic_error("Subscription index should be integer!");
  }

  // Pointer arithmetic in bytes/elements before integer type promotion.
  return ops::createAdd(
      generator.getBuilder(), arrayPtr, idx, array_->getExprVarType(generator),
      index_->getExprVarType(generator), generator,
      array_->getExprTypeId(generator), index_->getExprTypeId(generator));
}

llvm::Value* TypeCast::genCode(CodeGenerator& generator) {
  llvm::Value* ret = convert::typeCast(
      generator.getBuilder(), operand_->genCode(generator),
      varType_->getType(generator), operand_->getExprTypeId(generator),
      vartype::varTypeToTypeId(varType_));
  if (ret == nullptr) {
    throw std::logic_error("Unable to type cast!");
  }
  return ret;
}

llvm::Value* TypeCast::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Type cast can not return left value!");
}

llvm::Value* SizeOf::genCode(CodeGenerator& generator) {
  if (varType_ != nullptr) {
    return generator.getBuilder().getInt64(
        generator.getTypeSize(varType_->getType(generator)));
  }
  if (expr_ != nullptr) {
    return generator.getBuilder().getInt64(
        generator.getTypeSize(sizeofTypeForExpr(expr_, generator)));
  }
  if (!identifier_.empty()) {
    llvm::Type* type = generator.findType(identifier_);
    if (type != nullptr) {
      return generator.getBuilder().getInt64(generator.getTypeSize(type));
    }

    if (generator.findVariable(identifier_) != nullptr) {
      VarType* varType = generator.findVariableType(identifier_);
      return generator.getBuilder().getInt64(
          generator.getTypeSize(vartype::memoryAccessType(varType, generator)));
    }

    throw std::logic_error(identifier_ + " is neither a type nor a variable!");
  }
  throw std::logic_error("Invalid type or var in sizeof()!");
}

llvm::Value* SizeOf::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("sizeof can not return left value!");
}

llvm::Value* UnaryPlus::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy() ||
      operand->getType()->isFloatingPointTy()) {
    return operand;
  }

  throw std::logic_error(
      "Unary plus must be applied to variables of integer or floating point!");
}

llvm::Value* UnaryMinus::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy()) {
    return generator.getBuilder().CreateNeg(operand);
  }
  if (operand->getType()->isFloatingPointTy()) {
    return generator.getBuilder().CreateFNeg(operand);
  }
  throw std::logic_error(
      "Unary minus must be applied to variables of integer or floating "
      "point!");
}

llvm::Value* PointerDeref::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* PointerDeref::genCodePtr(CodeGenerator& generator) {
  llvm::Value* ptr = operand_->genCode(generator);
  if (ptr->getType()->isPointerTy()) {
    return ptr;
  }

  throw std::logic_error(
      "PointerDeref operator \"*\" only applies on variables of pointer or "
      "array!");
}

llvm::Value* AddressOf::genCode(CodeGenerator& generator) {
  return operand_->genCodePtr(generator);
}

llvm::Value* Assign::genCodePtr(CodeGenerator& generator) {
  return genSimpleAssignPtr(generator);
}

llvm::Value* LhsRhsAssign::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

VarType* LhsRhsAssign::getLValueVarType(CodeGenerator& generator) {
  // Expr-as-statement (lhs = rhs;) loads through lhs; rhs type is not the
  // lvalue type.
  return lhs_->getLValueVarType(generator);
}

llvm::Value* LhsRhsAssign::genSimpleAssignPtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return iridiom::createAssign(generator.getBuilder(), lhs, rhs,
                               lhs_->getLValueVarType(generator), generator,
                               rhs_->getExprTypeId(generator),
                               lhs_->getLValueTypeId(generator));
}

llvm::Value* LhsRhsAssign::genCompoundAssignPtr(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  VarType* lhsVarType = lhs_->getLValueVarType(generator);
  llvm::Value* loaded = generator.getBuilder().CreateLoad(
      vartype::memoryAccessType(lhsVarType, generator), lhs);
  return iridiom::createAssign(
      generator.getBuilder(), lhs, applyOp(loaded, rhs), lhsVarType, generator,
      rhs_->getExprTypeId(generator), lhs_->getLValueTypeId(generator));
}

llvm::Value* Add::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createAdd(
            generator.getBuilder(), lhs, rhs, lhs_->getExprVarType(generator),
            rhs_->getExprVarType(generator), generator,
            lhs_->getExprTypeId(generator), rhs_->getExprTypeId(generator));
      });
}

llvm::Value* Sub::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createSub(
            generator.getBuilder(), lhs, rhs, lhs_->getExprVarType(generator),
            rhs_->getExprVarType(generator), generator,
            lhs_->getExprTypeId(generator), rhs_->getExprTypeId(generator));
      });
}

llvm::Value* Mul::genCode(CodeGenerator& generator) {
  return genBinaryCode(generator,
                       [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
                         return ops::createMul(generator.getBuilder(), lhs, rhs,
                                               lhs_->getExprTypeId(generator),
                                               rhs_->getExprTypeId(generator));
                       });
}

llvm::Value* Div::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createDiv(generator.getBuilder(), lhs, rhs,
                              lhs_->getExprTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* Mod::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createMod(generator.getBuilder(), lhs, rhs,
                              lhs_->getExprTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* PostfixInc::genCode(CodeGenerator& generator) {
  return genIncDecCode(
      generator, true, false,
      "Postfix inc operator \"++\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PostfixDec::genCode(CodeGenerator& generator) {
  return genIncDecCode(
      generator, false, false,
      "Postfix dec operator \"--\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PrefixInc::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* PrefixInc::genCodePtr(CodeGenerator& generator) {
  return genIncDecCode(
      generator, true, true,
      "Prefix inc operator \"++\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PrefixDec::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* PrefixDec::genCodePtr(CodeGenerator& generator) {
  return genIncDecCode(
      generator, false, true,
      "Prefix dec operator \"--\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* AddAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(generator, [this, &generator](llvm::Value* loaded,
                                                            llvm::Value* rhs) {
    return ops::createAdd(
        generator.getBuilder(), loaded, rhs, lhs_->getLValueVarType(generator),
        rhs_->getExprVarType(generator), generator,
        lhs_->getLValueTypeId(generator), rhs_->getExprTypeId(generator));
  });
}

llvm::Value* SubAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(generator, [this, &generator](llvm::Value* loaded,
                                                            llvm::Value* rhs) {
    return ops::createSub(
        generator.getBuilder(), loaded, rhs, lhs_->getLValueVarType(generator),
        rhs_->getExprVarType(generator), generator,
        lhs_->getLValueTypeId(generator), rhs_->getExprTypeId(generator));
  });
}

llvm::Value* MulAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createMul(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator));
      });
}

llvm::Value* DivAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createDiv(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* ModAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createMod(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* BitwiseAnd::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createBitwiseAnd(generator.getBuilder(), lhs, rhs,
                                     lhs_->getExprTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseOr::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createBitwiseOr(generator.getBuilder(), lhs, rhs,
                                    lhs_->getExprTypeId(generator),
                                    rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseXor::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createBitwiseXor(generator.getBuilder(), lhs, rhs,
                                     lhs_->getExprTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseNot::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy()) {
    return generator.getBuilder().CreateNot(operand);
  }

  throw std::logic_error(
      "Bitwise NOT operator \"~\" must be applied to variable of integer.");
}

llvm::Value* BitwiseAndAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createBitwiseAnd(generator.getBuilder(), loaded, rhs,
                                     lhs_->getLValueTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseOrAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createBitwiseOr(generator.getBuilder(), loaded, rhs,
                                    lhs_->getLValueTypeId(generator),
                                    rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseXorAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createBitwiseXor(generator.getBuilder(), loaded, rhs,
                                     lhs_->getLValueTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* LeftShift::genCode(CodeGenerator& generator) {
  return genBinaryCode(generator,
                       [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
                         return ops::createShl(generator.getBuilder(), lhs, rhs,
                                               lhs_->getExprTypeId(generator),
                                               rhs_->getExprTypeId(generator));
                       });
}

llvm::Value* RightShift::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createShr(generator.getBuilder(), lhs, rhs,
                              lhs_->getExprTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* LeftShiftAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createShl(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator));
      });
}

llvm::Value* RightShiftAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createShr(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

// C: the result of &&, ||, ==, !=, <, <=, >, >= has type int. Without this
// override the base Expr::getExprTypeId() answers UNKNOWN, which fails
// typeUpgrade's integer test and makes `(a < b) * 3` throw "Mul with
// unsupported types!". genCode() widens the i1 to match (see boolToInt).
BuiltinType::TypeId LogicExpr::getExprTypeId(CodeGenerator& generator) {
  (void)generator;
  return BuiltinType::TypeId::INT;
}

llvm::Value* LogicExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
}

llvm::Value* LogicExpr::genBoolBinaryCode(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& combine) {
  // Both operands are evaluated here before combine() (a select-based
  // CreateLogicalAnd/Or), so && and || do NOT short-circuit as in C: the RHS
  // and its side effects always run.
  llvm::Value* lhs =
      convert::castToBool(generator.getBuilder(), lhs_->genCode(generator));
  llvm::Value* rhs =
      convert::castToBool(generator.getBuilder(), rhs_->genCode(generator));
  return boolToInt(generator.getBuilder(), combine(lhs, rhs));
}

llvm::Value* LogicExpr::genEqualityCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return boolToInt(generator.getBuilder(),
                   ops::createCmpEq(generator.getBuilder(), lhs, rhs,
                                    lhs_->getExprTypeId(generator),
                                    rhs_->getExprTypeId(generator)));
}

llvm::Value* LogicExpr::genOrderedCompare(CodeGenerator& generator,
                                          int intCmpPred, int floatCmpPred,
                                          const char* unsupportedOp) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  llvm::Value* cmp = compareOrdered(
      lhs_, rhs_, lhs, rhs, static_cast<ops::IntCmpPred>(intCmpPred),
      static_cast<llvm::CmpInst::Predicate>(floatCmpPred), generator);
  if (cmp != nullptr) {
    return boolToInt(generator.getBuilder(), cmp);
  }

  throw std::logic_error(std::string("Unsupported type for operator \"") +
                         unsupportedOp + "\"");
}

const char* LogicAnd::nonLValueErrorMessage() const {
  return "Logic AND operator \"&&\" can not return left value!";
}

const char* LogicOr::nonLValueErrorMessage() const {
  return "Logic OR operator \"||\" can not return left value!";
}

const char* LogicEq::nonLValueErrorMessage() const {
  return "Logic EQ operator \"==\" can not return left value!";
}

const char* LogicNotEq::nonLValueErrorMessage() const {
  return "Logic operator \"!=\" can not return left value!";
}

const char* LogicLessThan::nonLValueErrorMessage() const {
  return "Logic operator \"<\" can not return left value!";
}

const char* LogicLessEq::nonLValueErrorMessage() const {
  return "Logic operator \"<=\" can not return left value!";
}

const char* LogicGreaterThan::nonLValueErrorMessage() const {
  return "Logic operator \">\" can not return left value!";
}

const char* LogicGreaterEq::nonLValueErrorMessage() const {
  return "Logic operator \">=\" can not return left value!";
}

llvm::Value* LogicAnd::genCode(CodeGenerator& generator) {
  return genBoolBinaryCode(
      generator, [&generator](llvm::Value* lhs, llvm::Value* rhs) {
        return generator.getBuilder().CreateLogicalAnd(lhs, rhs);
      });
}

llvm::Value* LogicOr::genCode(CodeGenerator& generator) {
  return genBoolBinaryCode(
      generator, [&generator](llvm::Value* lhs, llvm::Value* rhs) {
        return generator.getBuilder().CreateLogicalOr(lhs, rhs);
      });
}

// C: `!x` has type int, like the binary logic operators above.
BuiltinType::TypeId LogicNot::getExprTypeId(CodeGenerator& generator) {
  (void)generator;
  return BuiltinType::TypeId::INT;
}

llvm::Value* LogicNot::genCode(CodeGenerator& generator) {
  return boolToInt(generator.getBuilder(),
                   generator.getBuilder().CreateICmpEQ(
                       convert::castToBool(generator.getBuilder(),
                                           operand_->genCode(generator)),
                       generator.getBuilder().getInt1(false)));
}

llvm::Value* LogicEq::genCode(CodeGenerator& generator) {
  return genEqualityCode(generator);
}

llvm::Value* LogicNotEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::NE),
                           static_cast<int>(llvm::CmpInst::FCMP_ONE), "!=");
}

llvm::Value* LogicLessThan::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::LT),
                           static_cast<int>(llvm::CmpInst::FCMP_OLT), "<");
}

llvm::Value* LogicLessEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::LE),
                           static_cast<int>(llvm::CmpInst::FCMP_OLE), "<=");
}

llvm::Value* LogicGreaterThan::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::GT),
                           static_cast<int>(llvm::CmpInst::FCMP_OGT), ">");
}

llvm::Value* LogicGreaterEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::GE),
                           static_cast<int>(llvm::CmpInst::FCMP_OGE), ">=");
}

llvm::Value* TernaryCondition::genTernarySelect(
    CodeGenerator& generator,
    const std::function<llvm::Value*(Expr*)>& evalBranch,
    const char* typeMismatchMessage) const {
  llvm::Value* condition = convert::castToBool(generator.getBuilder(),
                                               condition_->genCode(generator));
  if (condition == nullptr) {
    throw std::logic_error(
        "Condition is not a bool expression in ternary condition expression!");
  }

  // Both arms are evaluated before CreateSelect, so unlike C's ?: the untaken
  // branch's side effects still run. Result types are unified via typeUpgrade.
  llvm::Value* trueVal = evalBranch(trueExpr_);
  llvm::Value* falseVal = evalBranch(falseExpr_);
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (trueVal->getType() == falseVal->getType() ||
      convert::typeUpgrade(generator.getBuilder(), trueVal, falseVal,
                           trueExpr_->getExprTypeId(generator),
                           falseExpr_->getExprTypeId(generator), resultTypeId,
                           isUnsigned)) {
    return generator.getBuilder().CreateSelect(condition, trueVal, falseVal);
  }

  throw std::logic_error(typeMismatchMessage);
}

llvm::Value* TernaryCondition::genCode(CodeGenerator& generator) {
  return genTernarySelect(
      generator, [&generator](Expr* expr) { return expr->genCode(generator); },
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\"");
}

llvm::Value* TernaryCondition::genCodePtr(CodeGenerator& generator) {
  return genTernarySelect(
      generator,
      [&generator](Expr* expr) { return expr->genCodePtr(generator); },
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\" which returns left value!");
}

}  // namespace AST
