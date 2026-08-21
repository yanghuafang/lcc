#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>

#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/IrIdioms.hpp"
#include "irgen/Operators.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

// Expressions -> LLVM IR. C's expression grammar is the largest part of the
// language, so the Expr walk is four files rather than one:
//
//   irgen/ExprToIr.cpp        this file — expressions that name or produce a
//                             value directly: variables, literals, calls,
//                             member access, subscript, cast, sizeof, unary
//   irgen/OperatorToIr.cpp    assignment, arithmetic, inc/dec, bitwise, shift
//   irgen/LogicToIr.cpp       &&, ||, !, the six comparisons, ?:
//   irgen/ExprTypeQuery.cpp   what type an expression *has*, for all of the
//                             above — lcc's stand-in for semantic analysis
//
// The split is by node category, not by size: the first three emit
// instructions, the fourth answers questions and emits nothing.
//
// == The one contract to understand before reading any of them ==
//
// Every Expr implements two lowerings, and picking the wrong one is the most
// common way to break this walk:
//
//   genCode()     the *value* of the expression   — usually a load
//   genCodePtr()  the *address* it designates     — an alloca, GEP, or global
//
// This is C's lvalue/rvalue distinction made concrete. `x = y` lowers the left
// side with genCodePtr() and the right with genCode(); `&x` is genCodePtr()
// with no load; `*p` is a genCode() that loads through what p evaluates to.
// Nodes that designate no storage — a literal, a call, an arithmetic result —
// implement genCodePtr() by throwing, which is what makes `1 = x` a compile
// error rather than silently wrong IR. ThrowingUnaryExpr::genCodePtr below is
// that throw, shared by every unary operator that has no address.

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
    const size_t memberIndex = structType->getMemberIndex(memberName);
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

llvm::Value* Expr::loadFromLValuePtr(CodeGenerator& generator) {
  return iridiom::createLoad(generator.getBuilder(), genCodePtr(generator),
                             getLValueVarType(generator), generator);
}

llvm::Value* ThrowingUnaryExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
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

llvm::Value* Variable::genCode(CodeGenerator& generator) {
  llvm::Value* var = generator.symbols().findVariable(varName_);
  if (var != nullptr) {
    return iridiom::createLoad(generator.getBuilder(), var,
                               generator.symbols().findVariableType(varName_),
                               generator);
  }

  var = generator.symbols().findConstant(varName_);
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
  llvm::Value* var = generator.symbols().findVariable(varName_);
  if (var != nullptr) {
    return var;
  }

  var = generator.symbols().findConstant(varName_);
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
    case BuiltinTypeId::CHAR:
      return generator.getBuilder().getInt8(charValue_);
    case BuiltinTypeId::INT:
      return generator.getBuilder().getInt32(intValue_);
    case BuiltinTypeId::UINT: {
      llvm::IntegerType* int32Type =
          llvm::Type::getInt32Ty(generator.getContext());
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int32Type, uintValue_);
      return constInt;
    }
    case BuiltinTypeId::LONG:
      return generator.getBuilder().getInt64(longValue_);
    case BuiltinTypeId::ULONG: {
      llvm::IntegerType* int64Type =
          llvm::Type::getInt64Ty(generator.getContext());
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int64Type, ulongValue_);
      return constInt;
    }
    case BuiltinTypeId::FLOAT:
      return llvm::ConstantFP::get(generator.getBuilder().getFloatTy(),
                                   floatValue_);
    case BuiltinTypeId::DOUBLE:
      return llvm::ConstantFP::get(generator.getBuilder().getDoubleTy(),
                                   doubleValue_);
    case BuiltinTypeId::BOOL:
      return generator.getBuilder().getInt1(boolValue_);
    default:
      throw std::logic_error("const type " +
                             std::to_string(static_cast<int>(typeId_)) +
                             " is not supported!");
  }
}

llvm::Value* Constant::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error("constant is not left value!");
}

llvm::Value* ConstStr::genCode(CodeGenerator& generator) {
  return generator.getBuilder().CreateGlobalString(str_);
}

llvm::Value* ConstStr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
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
  llvm::Function* func = generator.symbols().findFunction(funcName_);
  if (func == nullptr) {
    throw std::logic_error("Function " + funcName_ + " is not defined!");
  }

  // Check number of arguments.
  // Parenthesized because && binds tighter than ||: a variadic function needs
  // at least its named parameters, a fixed one needs exactly them.
  if ((func->isVarArg() && argList_->size() < func->arg_size()) ||
      (!func->isVarArg() && argList_->size() != func->arg_size())) {
    throw std::logic_error("Wrong argument number for function call!");
  }

  // Check types of arguments and collect valid arguments.
  std::vector<llvm::Value*> args;
  size_t index = 0;
  for (auto* argIter = func->arg_begin(); argIter < func->arg_end();
       ++argIter, ++index) {
    llvm::Value* arg = argList_->at(index)->genCode(generator);
    VarType* paramVarType =
        generator.symbols().findFuncParamType(funcName_, index);
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
            argList_->at(index)->getExprTypeId(generator), BuiltinTypeId::INT);
      } else if (arg->getType()->isFloatingPointTy()) {
        arg = convert::typeUpgrade(
            generator.getBuilder(), arg, generator.getBuilder().getDoubleTy(),
            argList_->at(index)->getExprTypeId(generator),
            BuiltinTypeId::DOUBLE);
      }

      args.push_back(arg);
    }
  }

  return generator.getBuilder().CreateCall(func, args);
}

llvm::Value* FuncCall::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error("Function call can not return left value!");
}

llvm::Value* StructRef::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator);
}

llvm::Value* StructRef::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = struct_->genCodePtr(generator);
  VarType* structVarType = vartype::resolveAggregateVarType(
      struct_->getExprVarType(generator), generator);
  if (!structPtr->getType()->isPointerTy() || structVarType == nullptr) {
    throw std::logic_error(
        "Struct ref operator \".\" must apply on struct or union!");
  }

  return genStructMemberPtr(
      generator, structPtr, structVarType, memberName_,
      "Can not direct access to a variable of unknown type!");
}

llvm::Value* StructDeref::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator);
}

llvm::Value* StructDeref::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = structPtr_->genCode(generator);
  VarType* pointerVarType = vartype::resolveTypedefVarType(
      structPtr_->getExprVarType(generator), generator);
  if (pointerVarType == nullptr || !pointerVarType->isPointerType()) {
    throw std::logic_error(
        "Struct deref operator \"->\" is not applied on struct or union!");
  }

  VarType* pointeeVarType = vartype::resolveAggregateVarType(
      pointerVarType->getElementVarType(), generator);
  if (!structPtr->getType()->isPointerTy() || pointeeVarType == nullptr) {
    throw std::logic_error(
        "Struct deref operator \"->\" is not applied on struct or union!");
  }

  return genStructMemberPtr(
      generator, structPtr, pointeeVarType, memberName_,
      "Can not dereference a variable pointer of unknown type!");
}

llvm::Value* Subscript::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator);
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
  (void)generator;
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

    if (generator.symbols().findVariable(identifier_) != nullptr) {
      VarType* varType = generator.symbols().findVariableType(identifier_);
      return generator.getBuilder().getInt64(
          generator.getTypeSize(vartype::memoryAccessType(varType, generator)));
    }

    throw std::logic_error(identifier_ + " is neither a type nor a variable!");
  }
  throw std::logic_error("Invalid type or var in sizeof()!");
}

llvm::Value* SizeOf::genCodePtr(CodeGenerator& generator) {
  (void)generator;
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
  return loadFromLValuePtr(generator);
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

}  // namespace AST
