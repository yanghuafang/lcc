#include "AbstractSyntaxTree.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>

#include <exception>

#include "CodeGenerator.hpp"
#include "Utils.hpp"

namespace {

struct Array1DInfo {
  AST::VarType* elemVarType;
  size_t length;
};

bool isInferredArrayBound(size_t bound) {
  return bound == AST::kInferredArrayBound;
}

bool isCharElementType(AST::VarType* baseType) {
  return Utils::varTypeToTypeId(baseType) == AST::BuiltinTypeId::CHAR;
}

AST::ConstStr* asConstStr(AST::Expr* expr) {
  return dynamic_cast<AST::ConstStr*>(expr);
}

size_t stringInitializerLength(const std::string& str) { return str.size() + 1; }

void validateStringFitsArray(const std::string& str, size_t length) {
  if (stringInitializerLength(str) > length) {
    throw std::logic_error("String initializer is too long for array.");
  }
}

std::vector<size_t> resolveArrayBounds(const AST::VarInit* var,
                                       AST::VarType* baseType) {
  std::vector<size_t> bounds = var->arrayBounds_;
  if (bounds.empty()) {
    return bounds;
  }

  for (size_t& bound : bounds) {
    if (!isInferredArrayBound(bound)) {
      continue;
    }

    if (bounds.size() != 1) {
      throw std::logic_error(
          "Inferred array size is only supported for 1D arrays.");
    }

    if (var->hasBraceInit()) {
      if (var->initList_->empty()) {
        throw std::logic_error(
            "Cannot infer array size from empty initializer.");
      }
      bound = var->initList_->size();
      continue;
    }

    AST::ConstStr* strInit = asConstStr(var->initialExpr_);
    if (strInit != nullptr && isCharElementType(baseType)) {
      bound = stringInitializerLength(strInit->str_);
      continue;
    }

    throw std::logic_error(
        "Array with inferred size requires an initializer.");
  }

  return bounds;
}

Array1DInfo get1DArrayInfo(AST::VarType* varType) {
  if (!varType->isArrayType()) {
    throw std::logic_error("Brace initialization requires an array type!");
  }

  AST::ArrayType* outer = static_cast<AST::ArrayType*>(varType);
  if (outer->baseType_->isArrayType()) {
    throw std::logic_error(
        "Multidimensional array brace initialization is not supported yet.");
  }

  return {outer->baseType_, outer->length_};
}

llvm::Constant* asConstant(llvm::Value* value, const std::string& context) {
  llvm::Constant* constant = llvm::dyn_cast<llvm::Constant>(value);
  if (constant == nullptr) {
    throw std::logic_error(context + " requires a compile-time constant.");
  }
  return constant;
}

llvm::Constant* buildGlobalArrayInitializer(
    CodeGenerator& generator, AST::VarType* elemVarType,
    llvm::Type* elemLlvmType, size_t length, const AST::InitList& initList) {
  if (initList.size() > length) {
    throw std::logic_error("Too many elements in array initializer.");
  }

  std::vector<llvm::Constant*> elements;
  elements.reserve(length);
  for (AST::Expr* expr : initList) {
    llvm::Value* value = Utils::typeCast(
        generator.getBuilder(), expr->genCode(generator), elemLlvmType,
        expr->getExprTypeId(generator), Utils::varTypeToTypeId(elemVarType));
    if (value == nullptr) {
      throw std::logic_error("Array initializer element type mismatch.");
    }
    elements.push_back(
        asConstant(value, "Global array initializer element"));
  }
  while (elements.size() < length) {
    elements.push_back(llvm::Constant::getNullValue(elemLlvmType));
  }

  return llvm::ConstantArray::get(
      llvm::ArrayType::get(elemLlvmType, length), elements);
}

void storeLocalArrayInitializer(CodeGenerator& generator,
                                llvm::AllocaInst* allocaInst,
                                llvm::Type* llvmArrayType,
                                AST::VarType* elemVarType,
                                llvm::Type* elemLlvmType, size_t length,
                                const AST::InitList& initList) {
  if (initList.size() > length) {
    throw std::logic_error("Too many elements in array initializer.");
  }

  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::IntegerType* indexType = builder.getInt32Ty();
  llvm::Value* zeroIndex = llvm::ConstantInt::get(indexType, 0);
  llvm::Value* zeroValue = llvm::Constant::getNullValue(elemLlvmType);

  for (size_t i = 0; i < initList.size(); ++i) {
    llvm::Value* value = Utils::typeCast(
        builder, initList[i]->genCode(generator), elemLlvmType,
        initList[i]->getExprTypeId(generator),
        Utils::varTypeToTypeId(elemVarType));
    if (value == nullptr) {
      throw std::logic_error("Array initializer element type mismatch.");
    }
    llvm::Value* index = llvm::ConstantInt::get(indexType, i);
    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, allocaInst, {zeroIndex, index});
    builder.CreateStore(value, elementPtr);
  }

  for (size_t i = initList.size(); i < length; ++i) {
    llvm::Value* index = llvm::ConstantInt::get(indexType, i);
    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, allocaInst, {zeroIndex, index});
    builder.CreateStore(zeroValue, elementPtr);
  }
}

llvm::Constant* buildGlobalStringArrayInitializer(llvm::Type* charLlvmType,
                                                  size_t length,
                                                  const std::string& str) {
  validateStringFitsArray(str, length);

  std::vector<llvm::Constant*> elements;
  elements.reserve(length);
  for (unsigned char ch : str) {
    elements.push_back(llvm::ConstantInt::get(charLlvmType, ch));
  }
  elements.push_back(llvm::ConstantInt::get(charLlvmType, 0));
  while (elements.size() < length) {
    elements.push_back(llvm::ConstantInt::get(charLlvmType, 0));
  }

  return llvm::ConstantArray::get(
      llvm::ArrayType::get(charLlvmType, length), elements);
}

void storeLocalStringArrayInitializer(CodeGenerator& generator,
                                      llvm::AllocaInst* allocaInst,
                                      llvm::Type* llvmArrayType,
                                      llvm::Type* charLlvmType, size_t length,
                                      const std::string& str) {
  validateStringFitsArray(str, length);

  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::IntegerType* indexType = builder.getInt32Ty();
  llvm::Value* zeroIndex = llvm::ConstantInt::get(indexType, 0);
  llvm::Value* zeroValue = llvm::ConstantInt::get(charLlvmType, 0);

  size_t i = 0;
  for (; i < str.size(); ++i) {
    llvm::Value* index = llvm::ConstantInt::get(indexType, i);
    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, allocaInst, {zeroIndex, index});
    llvm::Value* value =
        llvm::ConstantInt::get(charLlvmType, static_cast<unsigned char>(str[i]));
    builder.CreateStore(value, elementPtr);
  }

  llvm::Value* nullIndex = llvm::ConstantInt::get(indexType, i);
  llvm::Value* nullPtr =
      builder.CreateGEP(llvmArrayType, allocaInst, {zeroIndex, nullIndex});
  builder.CreateStore(zeroValue, nullPtr);
  ++i;

  for (; i < length; ++i) {
    llvm::Value* index = llvm::ConstantInt::get(indexType, i);
    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, allocaInst, {zeroIndex, index});
    builder.CreateStore(zeroValue, elementPtr);
  }
}

}  // namespace

namespace AST {

VarType* VarType::getMemberVarType(const std::string& memberName) {
  (void)memberName;
  return nullptr;
}

VarType* StructType::getMemberVarType(const std::string& memberName) {
  for (FieldDecl* decl : *structBody_) {
    for (const std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return decl->varType_;
      }
    }
  }

  return nullptr;
}

VarType* UnionType::getMemberVarType(const std::string& memberName) {
  for (FieldDecl* decl : *unionBody_) {
    for (const std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return decl->varType_;
      }
    }
  }

  return nullptr;
}

VarType* Expr::getExprVarType(CodeGenerator& generator) { return nullptr; }

VarType* Expr::getLValueVarType(CodeGenerator& generator) { return nullptr; }

BuiltinType::TypeId Expr::getExprTypeId(CodeGenerator& generator) {
  VarType* varType = getExprVarType(generator);
  if (varType != nullptr) {
    return Utils::varTypeToTypeId(varType);
  }

  return BuiltinType::TypeId::UNKNOWN;
}

BuiltinType::TypeId Expr::getLValueTypeId(CodeGenerator& generator) {
  VarType* varType = getLValueVarType(generator);
  if (varType != nullptr) {
    return Utils::varTypeToTypeId(varType);
  }

  return BuiltinType::TypeId::UNKNOWN;
}

BuiltinType::TypeId Expr::binaryExprTypeId(Expr* lhs, Expr* rhs,
                                           CodeGenerator& generator) {
  bool isUnsigned = false;
  return Utils::usualArithmeticConversion(lhs->getExprTypeId(generator),
                                          rhs->getExprTypeId(generator),
                                          isUnsigned);
}

bool Expr::binaryIsUnsigned(Expr* lhs, Expr* rhs, CodeGenerator& generator) {
  bool isUnsigned = false;
  Utils::usualArithmeticConversion(lhs->getExprTypeId(generator),
                                   rhs->getExprTypeId(generator), isUnsigned);
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
  llvm::Value* value = generator.getBuilder().CreateLoad(
      operand->getType()->getNonOpaquePointerElementType(), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    llvm::Value* oneValue =
        Utils::getOneValue(generator.getBuilder(), valueBitWidth);
    llvm::Value* updated = increment
                               ? Utils::createAdd(generator.getBuilder(), value,
                                                  oneValue,
                                                  operand_->getLValueTypeId(
                                                      generator),
                                                  BuiltinType::TypeId::INT)
                               : Utils::createSub(generator.getBuilder(), value,
                                                  oneValue,
                                                  operand_->getLValueTypeId(
                                                      generator),
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
  VarType* structVarType = struct_->getExprVarType(generator);
  if (structVarType == nullptr) {
    return nullptr;
  }

  return structVarType->getMemberVarType(memberName_);
}

VarType* StructDeref::getExprVarType(CodeGenerator& generator) {
  return getLValueVarType(generator);
}

VarType* StructDeref::getLValueVarType(CodeGenerator& generator) {
  VarType* pointerVarType = structPtr_->getExprVarType(generator);
  if (pointerVarType == nullptr) {
    return nullptr;
  }

  VarType* pointeeType = pointerVarType->getElementVarType();
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

namespace {

// Rvalue form of an lvalue expression: evaluate address, then load.
llvm::Value* loadFromLValuePtr(CodeGenerator& generator, Expr* expr) {
  return Utils::createLoad(generator.getBuilder(), expr->genCodePtr(generator));
}

// Ordered comparison (<, >, <=, >=) after usual arithmetic conversion, with
// extra rules for pointer-vs-pointer and pointer-vs-integer operands.
llvm::Value* compareOrdered(Expr* lhsExpr, Expr* rhsExpr, llvm::Value* lhs,
                            llvm::Value* rhs, Utils::IntCmpPred intPred,
                            llvm::CmpInst::Predicate floatPred,
                            CodeGenerator& generator) {
  BuiltinType::TypeId lhsTypeId = lhsExpr->getExprTypeId(generator);
  BuiltinType::TypeId rhsTypeId = rhsExpr->getExprTypeId(generator);
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (Utils::typeUpgrade(generator.getBuilder(), lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                         isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return Utils::createIntegerCmp(generator.getBuilder(), intPred, lhs, rhs, isUnsigned);
    } else {
      return generator.getBuilder().CreateFCmp(floatPred, lhs, rhs);
    }
  }

  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    llvm::Value* lhsInt =
        generator.getBuilder().CreatePtrToInt(lhs, generator.getBuilder().getInt64Ty());
    llvm::Value* rhsInt =
        generator.getBuilder().CreatePtrToInt(rhs, generator.getBuilder().getInt64Ty());
    return Utils::createIntegerCmp(generator.getBuilder(), intPred, lhsInt, rhsInt, true);
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return Utils::createIntegerCmp(generator.getBuilder(), intPred, generator.getBuilder().CreatePtrToInt(lhs, generator.getBuilder().getInt64Ty()),
        Utils::typeUpgrade(generator.getBuilder(), rhs, generator.getBuilder().getInt64Ty(), rhsTypeId,
                           BuiltinType::TypeId::ULONG),
        true);
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return Utils::createIntegerCmp(generator.getBuilder(), intPred,
        Utils::typeUpgrade(generator.getBuilder(), lhs, generator.getBuilder().getInt64Ty(), lhsTypeId,
                           BuiltinType::TypeId::ULONG),
        generator.getBuilder().CreatePtrToInt(rhs, generator.getBuilder().getInt64Ty()), true);
  }

  return nullptr;
}

// Shared struct/union member address logic for StructRef (.) and StructDeref (->).
llvm::Value* genStructMemberPtr(CodeGenerator& generator, llvm::Value* structPtr,
                                const std::string& memberName,
                                const char* unknownTypeMessage) {
  // Handle direct access of struct type.
  AST::StructType* structType =
      generator.findStructType((llvm::StructType*)structPtr->getType()
                                   ->getNonOpaquePointerElementType());
  if (structType != nullptr) {
    size_t memberIndex = structType->getMemberIndex(memberName);
    if (memberIndex == -1) {
      throw std::logic_error("The struct does not have a member named " +
                             memberName);
    }

    std::vector<llvm::Value*> indices;
    // GEP into a struct pointer requires a leading zero index.
    indices.push_back(generator.getBuilder().getInt32(0));
    indices.push_back(generator.getBuilder().getInt32(memberIndex));
    return generator.getBuilder().CreateGEP(
        structPtr->getType()->getNonOpaquePointerElementType(), structPtr,
        indices);
  }

  // Handle direct access of union type.
  AST::UnionType* unionType =
      generator.findUnionType((llvm::StructType*)structPtr->getType()
                                  ->getNonOpaquePointerElementType());
  if (unionType != nullptr) {
    llvm::Type* memberType = unionType->getMemberType(memberName, generator);
    if (memberType == nullptr) {
      throw std::logic_error("The union does not have a member named " +
                             memberName);
    }

    return generator.getBuilder().CreatePointerCast(
        structPtr, memberType->getPointerTo());
  }

  throw std::logic_error(unknownTypeMessage);
}

}  // namespace
llvm::Value* Program::genCode(CodeGenerator& generator) {
  for (Decl* decl : *decls_) {
    if (decl != nullptr) {
      decl->genCode(generator);
    }
  }
  return nullptr;
}

// Declarations

llvm::Value* FuncDecl::genCode(CodeGenerator& generator) {
  std::vector<llvm::Type*> paramTypes;
  bool hasVoidParamType = false;
  for (Param* param : *paramList_) {
    llvm::Type* type = param->varType_->getType(generator);
    if (type == nullptr) {
      throw std::logic_error("Define function " + funcName_ +
                             " with known type!");
    }

    if (type->isVoidTy()) {
      hasVoidParamType = true;
    }

    // When argument type is array type, only pointer is passed, size attribute
    // disappears.
    if (type->isArrayTy()) {
      type = type->getArrayElementType()->getPointerTo();
    }

    paramTypes.push_back(type);
  }

  // Only funcName(void) is allowed.
  if (paramTypes.size() >= 2 && hasVoidParamType) {
    throw std::logic_error("Function " + funcName_ +
                           " has invalid void param!");
  }

  // funcName(void) is funcName(), no parameter.
  if (paramTypes.size() == 1 && hasVoidParamType) {
    paramTypes.clear();
  }

  llvm::Type* retType = retType_->getType(generator);
  if (retType->isArrayTy()) {
    throw std::logic_error("Function " + funcName_ +
                           " should not return array type!");
  }

  llvm::FunctionType* funcType =
      llvm::FunctionType::get(retType, paramTypes, paramList_->isVariant_);
  llvm::Function* func =
      llvm::Function::Create(funcType, llvm::GlobalValue::ExternalLinkage,
                             funcName_, &generator.getModule());

  std::vector<VarType*> paramVarTypes;
  for (Param* param : *paramList_) {
    paramVarTypes.push_back(param->varType_);
  }
  generator.setFuncSignature(funcName_, retType_, paramVarTypes);
  generator.addFunction(funcName_, func);

  // LLVM merges symbols with the same name in one module. A prior declaration
  // and a later definition therefore share one llvm::Function; we detect that
  // here to implement C-style prototype + body linking.
  if (func->getName() != funcName_) {
    // Remove the function just made, use the exiting function.
    func->eraseFromParent();
    func = generator.getModule().getFunction(funcName_);

    if (func->getFunctionType() != funcType) {
      throw std::logic_error("Redefine function " + funcName_ +
                             " with different params!");
    }

    // Function declaration conflict.
    // Previous function declaration must be declaration without function body.
    // Current function declaration must be definition with function body.
    if (!func->empty() || funcBody_ == nullptr) {
      throw std::logic_error("Function " + funcName_ +
                             " declarations conflict!");
    }
  }

  // Generate code if function body exists.
  if (funcBody_ != nullptr) {
    // Create and insert the entry block.
    llvm::BasicBlock* funcBlock =
        llvm::BasicBlock::Create(generator.getContext(), "entry", func);
    generator.getBuilder().SetInsertPoint(funcBlock);

    // Allocate symbol table for function parameters.
    generator.pushSymbolTable();

    size_t index = 0;
    for (auto paramIter = func->arg_begin(); paramIter < func->arg_end();
         ++paramIter, ++index) {
      // alloca on stack for parameter.
      llvm::AllocaInst* allocaInst = Utils::createEntryBlockAlloca(
          func, paramList_->at(index)->varName_, paramTypes[index]);
      generator.getBuilder().CreateStore(paramIter, allocaInst);
      // Add parameter to symbol table.
      generator.addVariable(paramList_->at(index)->varName_, allocaInst,
                              paramList_->at(index)->varType_);
    }

    // Generate code of the function body.
    generator.enterFunction(func);
    generator.pushSymbolTable();
    funcBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveFunction();
    generator.popSymbolTable();
  }

  return nullptr;
}

llvm::Value* FuncBody::genCode(CodeGenerator& generator) {
  // Generate the statements one by one in FuncBody.
  for (AST::Stmt* stmt : *content_) {
    // If current block already has a terminator instruction, such as "return",
    // stop generating.
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr) {
      break;
    } else {
      stmt->genCode(generator);
    }
  }

  // C allows falling off the end of a non-void function; emit ret undef as a
  // simple fallback (not strict undefined-behavior checking).
  if (generator.getBuilder().GetInsertBlock()->getTerminator() == nullptr) {
    llvm::Type* retType = generator.getCurrentFunction()->getReturnType();
    if (retType->isVoidTy()) {
      generator.getBuilder().CreateRetVoid();
    } else {
      generator.getBuilder().CreateRet(llvm::UndefValue::get(retType));
    }
  }

  return nullptr;
}

VarType* VarInit::buildVarType(VarType* baseType) const {
  return buildVarType(baseType, arrayBounds_);
}

VarType* VarInit::buildVarType(VarType* baseType,
                               const std::vector<size_t>& bounds) const {
  VarType* type = baseType;
  for (size_t bound : bounds) {
    if (isInferredArrayBound(bound)) {
      throw std::logic_error("Unresolved inferred array bound.");
    }
    type = new ArrayType(type, bound);
  }
  return type;
}

llvm::Value* VarDecl::genCode(CodeGenerator& generator) {
  llvm::Type* baseLlvmType = varType_->getType(generator);
  if (baseLlvmType == nullptr) {
    throw std::logic_error("Define variable with unknown type!");
  }
  if (baseLlvmType->isVoidTy()) {
    throw std::logic_error("It is not allowed to define void variable!");
  }

  // Create variables one by one.
  for (VarInit* var : *varList_) {
    std::vector<size_t> resolvedBounds = resolveArrayBounds(var, varType_);
    bool isArray = !resolvedBounds.empty();
    AST::ConstStr* strInit = asConstStr(var->initialExpr_);

    if (var->hasBraceInit()) {
      if (!isArray) {
        throw std::logic_error(
            "Brace initialization is only supported for arrays.");
      }
    } else if (isArray && var->initialExpr_ != nullptr) {
      if (strInit == nullptr || !isCharElementType(varType_)) {
        throw std::logic_error(
            "Array variable " + var->varName_ +
            " cannot be initialized with a single expression; use brace "
            "initialization or a string literal for char arrays.");
      }
    }

    VarType* varType = var->buildVarType(varType_, resolvedBounds);
    llvm::Type* llvmVarType = varType->getType(generator);
    if (llvmVarType == nullptr) {
      throw std::logic_error("Define variable with unknown type!");
    }

    if (generator.getCurrentFunction() != nullptr) {
      llvm::AllocaInst* allocaInst = Utils::createEntryBlockAlloca(
          generator.getCurrentFunction(), var->varName_, llvmVarType);
      if (!generator.addVariable(var->varName_, allocaInst, varType)) {
        allocaInst->eraseFromParent();
        throw std::logic_error(
            "It is not allowed to redefine the same local variable " +
            var->varName_ + " in the same scope!");
      }

      if (var->hasBraceInit()) {
        Array1DInfo arrayInfo = get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        storeLocalArrayInitializer(generator, allocaInst, llvmVarType,
                                   arrayInfo.elemVarType, elemLlvmType,
                                   arrayInfo.length, *var->initList_);
      } else if (strInit != nullptr && isArray) {
        Array1DInfo arrayInfo = get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        storeLocalStringArrayInitializer(generator, allocaInst, llvmVarType,
                                         elemLlvmType, arrayInfo.length,
                                         strInit->str_);
      } else if (var->initialExpr_ != nullptr) {
        llvm::Value* initializer = Utils::typeCast(
            generator.getBuilder(), var->initialExpr_->genCode(generator),
            llvmVarType, var->initialExpr_->getExprTypeId(generator),
            Utils::varTypeToTypeId(varType));
        if (initializer == nullptr) {
          allocaInst->eraseFromParent();
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        generator.getBuilder().CreateStore(initializer, allocaInst);
      }
    } else {
      llvm::Constant* initializer = nullptr;
      if (var->hasBraceInit()) {
        Array1DInfo arrayInfo = get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        if (elemLlvmType == nullptr) {
          throw std::logic_error("Define variable with unknown type!");
        }
        initializer = buildGlobalArrayInitializer(
            generator, arrayInfo.elemVarType, elemLlvmType, arrayInfo.length,
            *var->initList_);
      } else if (strInit != nullptr && isArray) {
        Array1DInfo arrayInfo = get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        if (elemLlvmType == nullptr) {
          throw std::logic_error("Define variable with unknown type!");
        }
        initializer = buildGlobalStringArrayInitializer(
            elemLlvmType, arrayInfo.length, strInit->str_);
      } else if (var->initialExpr_ != nullptr) {
        generator.switchInsertPointToGlobalBlock();
        llvm::Value* initialExpr = Utils::typeCast(
            generator.getBuilder(), var->initialExpr_->genCode(generator),
            llvmVarType, var->initialExpr_->getExprTypeId(generator),
            Utils::varTypeToTypeId(varType));
        if (initialExpr == nullptr) {
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        generator.switchInsertPointToCurrentBlock();
        initializer = asConstant(initialExpr, "Global variable initializer");
      } else {
        initializer = llvm::UndefValue::get(llvmVarType);
      }

      llvm::GlobalVariable* globalVar = new llvm::GlobalVariable(
          generator.getModule(), llvmVarType, varType_->isConst_,
          llvm::Function::ExternalLinkage, initializer, var->varName_);
      if (!generator.addVariable(var->varName_, globalVar, varType)) {
        throw std::logic_error(
            "It is not allowed to redefine global variable " + var->varName_);
      }
    }
  }

  return nullptr;
}

llvm::Value* TypeDecl::genCode(CodeGenerator& generator) {
  llvm::Type* type;
  if (varType_->isStructType()) {
    type = ((StructType*)varType_)->genTypeHead(generator, varType_->typeName_);
  } else if (varType_->isUnionType()) {
    type = ((UnionType*)varType_)->genTypeHead(generator, varType_->typeName_);
  } else {
    type = varType_->getType(generator);
  }

  if (type == nullptr) {
    throw std::logic_error("Failed to define type " + varType_->typeName_);
  }

  if (!generator.addType(varType_->typeName_, type)) {
    throw std::logic_error("It is not allowed to redefine type " +
                           varType_->typeName_);
  }

  if (varType_->isStructType()) {
    ((StructType*)varType_)->genTypeBody(generator);
  } else if (varType_->isUnionType()) {
    ((UnionType*)varType_)->genTypeBody(generator);
  }

  return nullptr;
}

// Variable Types

llvm::Type* BuiltinType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  switch (typeId_) {
    case TypeId::CHAR:
    case TypeId::UCHAR:
      llvmType_ = generator.getBuilder().getInt8Ty();
      break;
    case TypeId::SHORT:
    case TypeId::USHORT:
      llvmType_ = generator.getBuilder().getInt16Ty();
      break;
    case TypeId::INT:
    case TypeId::UINT:
      llvmType_ = generator.getBuilder().getInt32Ty();
      break;
    case TypeId::LONG:
    case TypeId::ULONG:
      llvmType_ = generator.getBuilder().getInt64Ty();
      break;
    case TypeId::FLOAT:
      llvmType_ = generator.getBuilder().getFloatTy();
      break;
    case TypeId::DOUBLE:
      llvmType_ = generator.getBuilder().getDoubleTy();
      break;
    case TypeId::BOOL:
      llvmType_ = generator.getBuilder().getInt1Ty();
      break;
    case TypeId::VOID:
      llvmType_ = generator.getBuilder().getVoidTy();
      break;
    default:
      llvmType_ = nullptr;
      break;
  }

  return llvmType_;
}

llvm::Type* PointerType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvm::Type* baseType = baseType_->getType(generator);
  llvmType_ = llvm::PointerType::get(baseType, 0);
  return llvmType_;
}

llvm::Type* ArrayType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvm::Type* baseType = baseType_->getType(generator);
  if (baseType->isVoidTy()) {
    throw std::logic_error("Array of void is not allowed!");
  }
  llvmType_ = llvm::ArrayType::get(baseType, length_);
  return llvmType_;
}

llvm::Type* DefinedType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvmType_ = generator.findType(typeName_);
  if (llvmType_ == nullptr) {
    throw std::logic_error(typeName_ + " is undefined!");
  }
  return llvmType_;
}

llvm::Type* StructType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Generate anonymous named struct type.
  genTypeHead(generator);
  return genTypeBody(generator);
}

llvm::Type* StructType::genTypeHead(CodeGenerator& generator,
                                    const std::string& typeName) {
  llvm::StructType* type =
      llvm::StructType::create(generator.getContext(), "struct." + typeName);
  // Add to struct type table, it is useful for struct ref/deref in future.
  generator.addStructType(type, this);
  llvmType_ = type;
  return llvmType_;
}

llvm::Type* StructType::genTypeBody(CodeGenerator& generator) {
  std::vector<llvm::Type*> members;
  for (FieldDecl* field : *structBody_) {
    if (field->varType_->getType(generator)->isVoidTy()) {
      throw std::logic_error("Struct member type cannot be void!");
    } else {
      members.insert(members.end(), field->memberList_->size(),
                     field->varType_->getType(generator));
    }
  }

  ((llvm::StructType*)llvmType_)->setBody(members);
  return llvmType_;
}

size_t StructType::getMemberIndex(const std::string& memberName) {
  size_t index = 0;
  for (FieldDecl* decl : *structBody_) {
    for (std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return index;
      }

      ++index;
    }
  }

  return -1;
}

llvm::Type* UnionType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Generate anonymous named union type.
  genTypeHead(generator);
  return genTypeBody(generator);
}

llvm::Type* UnionType::genTypeHead(CodeGenerator& generator,
                                   const std::string& typeName) {
  llvm::StructType* type =
      llvm::StructType::create(generator.getContext(), "union." + typeName);
  // Add to union type table, it is useful for union ref/deref in future.
  generator.addUnionType(type, this);
  llvmType_ = type;
  return llvmType_;
}

llvm::Type* UnionType::genTypeBody(CodeGenerator& generator) {
  if (unionBody_->size() == 0) {
    return llvmType_;
  }

  // Find the max size member.
  size_t maxSize = 0;
  llvm::Type* maxSizeMemberType = nullptr;
  for (FieldDecl* member : *unionBody_) {
    if (member->varType_->getType(generator)->isVoidTy()) {
      throw std::logic_error("Union member type cannot be void!");
    } else if (generator.getTypeSize(member->varType_->getType(generator)) >
               maxSize) {
      maxSizeMemberType = member->varType_->getType(generator);
      maxSize = generator.getTypeSize(maxSizeMemberType);
    }
  }

  ((llvm::StructType*)llvmType_)
      ->setBody(std::vector<llvm::Type*>({maxSizeMemberType}));
  return llvmType_;
}

llvm::Type* UnionType::getMemberType(const std::string& memberName,
                                     CodeGenerator& generator) {
  for (FieldDecl* member : *unionBody_) {
    for (const std::string& name : *member->memberList_) {
      if (name == memberName) {
        return member->varType_->getType(generator);
      }
    }
  }

  return nullptr;
}

llvm::Type* EnumType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Calc value for every member.
  int lastDefValue = -1;
  for (Enum* member : *enumList_) {
    if (member->hasValue_) {
      lastDefValue = member->value_;
    } else {
      member->value_ = ++lastDefValue;
    }
  }

  for (Enum* member : *enumList_) {
    if (!generator.addConstant(member->name_,
                               generator.getBuilder().getInt32(member->value_))) {
      throw std::logic_error("It is not allowed to redefine enum member " +
                             member->name_);
    }
  }

  return llvm::IntegerType::getInt32Ty(generator.getContext());
}

// Statements

// Lower if/else to a three-block CFG: then, else, if.end. Each branch gets its
// own symbol table scope so block-local declarations do not leak.
llvm::Value* IfStmt::genCode(CodeGenerator& generator) {
  llvm::Value* condition = condition_->genCode(generator);
  condition = Utils::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "IfStmt condition must be either int, or float, or pointer.");
  }

  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* thenBlock = llvm::BasicBlock::Create(generator.getContext(), "then");
  llvm::BasicBlock* elseBlock = llvm::BasicBlock::Create(generator.getContext(), "else");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(generator.getContext(), "if.end");

  // Generate code in "then" block.
  generator.getBuilder().CreateCondBr(condition, thenBlock, elseBlock);
  func->getBasicBlockList().push_back(thenBlock);
  generator.getBuilder().SetInsertPoint(thenBlock);
  if (thenStmt_ != nullptr) {
    generator.pushSymbolTable();
    thenStmt_->genCode(generator);
    generator.popSymbolTable();
  }
  Utils::terminateBlockByBr(generator.getBuilder(), endBlock);

  // Generate code in "else" block.
  func->getBasicBlockList().push_back(elseBlock);
  generator.getBuilder().SetInsertPoint(elseBlock);
  if (elseStmt_ != nullptr) {
    generator.pushSymbolTable();
    elseStmt_->genCode(generator);
    generator.popSymbolTable();
  }
  Utils::terminateBlockByBr(generator.getBuilder(), endBlock);

  // Set point for end block.
  if (endBlock->hasNPredecessorsOrMore(1)) {
    func->getBasicBlockList().push_back(endBlock);
    generator.getBuilder().SetInsertPoint(endBlock);
  }

  return nullptr;
}

// Lower switch as a chain of compare blocks (not the LLVM switch instruction).
// Each case gets a basic block; fall-through is modeled by shared block layout.
llvm::Value* SwitchStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::Value* matcher = matcher_->genCode(generator);

  // Create one block for each case statement.
  std::vector<llvm::BasicBlock*> caseBlocks;
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    caseBlocks.push_back(
        llvm::BasicBlock::Create(generator.getContext(), "case." + std::to_string(i)));
  }

  // Create one block after switch statement.
  caseBlocks.push_back(llvm::BasicBlock::Create(generator.getContext(), "switch.end"));

  // Create one block for each comparision.
  std::vector<llvm::BasicBlock*> comparisionBlocks;
  // The first comparision code should be in current insertion block.
  comparisionBlocks.push_back(generator.getBuilder().GetInsertBlock());
  // Add block for switch expression evaluation.
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    comparisionBlocks.push_back(llvm::BasicBlock::Create(
        generator.getContext(), "switch.compare." + std::to_string(i)));
  }

  // comparisionBlocks and caseBlocks hold the same block after switch
  // statement.
  comparisionBlocks.push_back(caseBlocks.back());

  // Generate branches for comparision and cases.
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    if (i > 0) {
      // The first comparision is already in current insertion block.
      // So only set insertion block and insertion point since the second
      // comparision.
      func->getBasicBlockList().push_back(comparisionBlocks[i]);
      generator.getBuilder().SetInsertPoint(comparisionBlocks[i]);
    }

    if (caseStmtList_->at(i)->condition_ != nullptr) {
      generator.getBuilder().CreateCondBr(
          Utils::createCmpEq(generator.getBuilder(), matcher, caseStmtList_->at(i)->condition_->genCode(generator),
              matcher_->getExprTypeId(generator),
              caseStmtList_->at(i)->condition_->getExprTypeId(generator)),
          caseBlocks[i], comparisionBlocks[i + 1]);
    } else {
      // Unconditional branch for default statement.
      generator.getBuilder().CreateBr(caseBlocks[i]);
    }
  }

  // Generate code for each case statement.
  generator.pushSymbolTable();
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    func->getBasicBlockList().push_back(caseBlocks[i]);
    generator.getBuilder().SetInsertPoint(caseBlocks[i]);

    // TODO: What behavior if continue in a case statement and the whole switch
    // statement is in an outer loop.
    generator.enterLoop(caseBlocks[i + 1], caseBlocks.back());
    caseStmtList_->at(i)->genCode(generator);
    generator.leaveLoop();
  }
  generator.popSymbolTable();

  // Handle the block after switch statement.
  if (caseBlocks.back()->hasNPredecessorsOrMore(1)) {
    func->getBasicBlockList().push_back(caseBlocks.back());
    generator.getBuilder().SetInsertPoint(caseBlocks.back());
  }

  return nullptr;
}

llvm::Value* CaseStmt::genCode(CodeGenerator& generator) {
  // Generate case statements one by one.
  for (Stmt* stmt : *content_) {
    if (generator.getBuilder().GetInsertBlock()->getTerminator()) {
      // Stop code generation if encounter a terminator, such as "break".
      break;
    } else if (stmt != nullptr) {
      stmt->genCode(generator);
    }
  }

  // No break, jump to the next case block.
  Utils::terminateBlockByBr(generator.getBuilder(), generator.getContinueBlock());
  return nullptr;
}

// CFG: init -> for.cond -> for.loop / for.end; for.loop -> for.update -> for.cond.
// enterLoop wires continue to for.update and break to for.end.
llvm::Value* ForStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(generator.getContext(), "for.cond");
  llvm::BasicBlock* updateBlock =
      llvm::BasicBlock::Create(generator.getContext(), "for.update");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(generator.getContext(), "for.end");
  llvm::BasicBlock* loopBlock = llvm::BasicBlock::Create(generator.getContext(), "for.loop");

  if (initial_ != nullptr) {
    generator.pushSymbolTable();
    initial_->genCode(generator);
  }

  // Create unconditional branch to condition block.
  Utils::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  // Generate code for condition block.
  func->getBasicBlockList().push_back(conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  if (condition_ != nullptr) {
    llvm::Value* condition = condition_->genCode(generator);
    condition = Utils::castToBool(generator.getBuilder(), condition);
    if (condition == nullptr) {
      throw std::logic_error(
          "ForStmt condition must be either int, or float, or pointer.");
    }

    generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);
  } else {
    generator.getBuilder().CreateBr(loopBlock);
  }

  // Generate code for the loop block.
  func->getBasicBlockList().push_back(loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(updateBlock, endBlock);
    generator.pushSymbolTable();
    loopBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveLoop();
  }

  // Jump to update block if no break.
  Utils::terminateBlockByBr(generator.getBuilder(), updateBlock);

  // Generate code for update block.
  func->getBasicBlockList().push_back(updateBlock);
  generator.getBuilder().SetInsertPoint(updateBlock);
  if (update_ != nullptr) {
    update_->genCode(generator);
  }

  // After update, jump to condition block.
  generator.getBuilder().CreateBr(conditionBlock);

  // Handle end block.
  func->getBasicBlockList().push_back(endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  if (initial_ != nullptr) {
    generator.popSymbolTable();
  }

  return nullptr;
}

llvm::Value* DoStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(generator.getContext(), "do.cond");
  llvm::BasicBlock* loopBlock = llvm::BasicBlock::Create(generator.getContext(), "do.loop");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(generator.getContext(), "do.end");

  // Unconditional branch to loop block.
  generator.getBuilder().CreateBr(loopBlock);

  // Generate code for loop block.
  func->getBasicBlockList().push_back(loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(conditionBlock, endBlock);
    generator.pushSymbolTable();
    loopBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveLoop();
  }

  // Jump to condition block if no break.
  Utils::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  // Generate code for condition block.
  func->getBasicBlockList().push_back(conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = Utils::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "DoStmt condition must be either int, or float, or pointer.");
  }

  generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);

  // Handle end block.
  func->getBasicBlockList().push_back(endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

// enterLoop wires continue to the condition block and break to while.end.
llvm::Value* WhileStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(generator.getContext(), "while.cond");
  llvm::BasicBlock* loopBlock =
      llvm::BasicBlock::Create(generator.getContext(), "while.loop");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(generator.getContext(), "while.end");

  // Unconditional branch to condition block.
  generator.getBuilder().CreateBr(conditionBlock);

  func->getBasicBlockList().push_back(conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = Utils::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "WhileStmt condition must be either int, or float, or pointer.");
  }

  generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);

  // Generate code for loop block.
  func->getBasicBlockList().push_back(loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(conditionBlock, endBlock);
    generator.pushSymbolTable();
    loopBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveLoop();
  }

  // Jump to condition block if no break
  Utils::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  // Handle end block.
  func->getBasicBlockList().push_back(endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

llvm::Value* ContinueStmt::genCode(CodeGenerator& generator) {
  llvm::BasicBlock* continueToBlock = generator.getContinueBlock();
  if (continueToBlock == nullptr) {
    throw std::logic_error("Continue must be in switch or loop!");
  }

  generator.getBuilder().CreateBr(continueToBlock);
  return nullptr;
}

llvm::Value* BreakStmt::genCode(CodeGenerator& generator) {
  llvm::BasicBlock* breakToBlock = generator.getBreakBlock();
  if (breakToBlock == nullptr) {
    throw std::logic_error("Break must be in switch or loop!");
  }

  generator.getBuilder().CreateBr(breakToBlock);
  return nullptr;
}

llvm::Value* ReturnStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  if (func == nullptr) {
    throw std::logic_error("Return should be in a function body!");
  }

  if (retVal_ != nullptr) {
    llvm::Value* retVal = Utils::typeCast(generator.getBuilder(), retVal_->genCode(generator), func->getReturnType(),
        retVal_->getExprTypeId(generator),
        Utils::varTypeToTypeId(generator.findFuncRetType(func->getName().str())));
    if (retVal == nullptr) {
      throw std::logic_error(
          "The type of return value does not match, and can not be casted to "
          "return type!");
    }
    generator.getBuilder().CreateRet(retVal);
  } else {
    if (func->getReturnType()->isVoidTy()) {
      generator.getBuilder().CreateRetVoid();
    } else {
      throw std::logic_error("Return value is expected, but not found!");
    }
  }

  return nullptr;
}

llvm::Value* Block::genCode(CodeGenerator& generator) {
  generator.pushSymbolTable();
  // Generate code for statements one by one in block.
  for (Stmt* stmt : *content_) {
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr) {
      // Stop code generation if encounter a terminator, such as "break".
      break;
    } else if (stmt != nullptr) {
      stmt->genCode(generator);
    }
  }
  generator.popSymbolTable();
  return nullptr;
}

// Expressions

llvm::Value* Variable::genCode(CodeGenerator& generator) {
  llvm::Value* var = generator.findVariable(varName_);
  if (var != nullptr) {
    return Utils::createLoad(generator.getBuilder(), var);
  }

  var = generator.findConstant(varName_);
  if (var != nullptr) {
    return var;
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
      llvm::IntegerType* int32Type = llvm::Type::getInt32Ty(generator.getContext());
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int32Type, uintValue_);
      return constInt;
    }
    case BuiltinType::TypeId::LONG:
      return generator.getBuilder().getInt64(longValue_);
    case BuiltinType::TypeId::ULONG: {
      llvm::IntegerType* int64Type = llvm::Type::getInt64Ty(generator.getContext());
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int64Type, ulongValue_);
      return constInt;
    }
    case BuiltinType::TypeId::FLOAT:
      return llvm::ConstantFP::get(generator.getBuilder().getFloatTy(), floatValue_);
    case BuiltinType::TypeId::DOUBLE:
      return llvm::ConstantFP::get(generator.getBuilder().getDoubleTy(), doubleValue_);
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
  return generator.getBuilder().CreateGlobalStringPtr(str_.c_str());
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
    throw std::domain_error("Function " + funcName_ + " is not defined!");
  }

  // Check number of arguments.
  if (func->isVarArg() && argList_->size() < func->arg_size() ||
      !func->isVarArg() && argList_->size() != func->arg_size()) {
    throw std::invalid_argument("Wrong argument number for function call!");
  }

  // Check types of arguments and collect valid arguments.
  std::vector<llvm::Value*> args;
  size_t index = 0;
  for (auto argIter = func->arg_begin(); argIter < func->arg_end();
       ++argIter, ++index) {
    llvm::Value* arg = argList_->at(index)->genCode(generator);
    AST::VarType* paramVarType = generator.findFuncParamType(funcName_, index);
    arg = Utils::typeCast(generator.getBuilder(), arg, argIter->getType(),
                          argList_->at(index)->getExprTypeId(generator),
                          Utils::varTypeToTypeId(paramVarType));
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

      // Extend char/short/bool to int, float to double.
      if (arg->getType()->isIntegerTy()) {
        arg = Utils::typeUpgrade(generator.getBuilder(), arg, generator.getBuilder().getInt32Ty(),
                                 argList_->at(index)->getExprTypeId(generator),
                                 BuiltinType::TypeId::INT);
      } else if (arg->getType()->isFloatingPointTy()) {
        arg = Utils::typeUpgrade(generator.getBuilder(), arg, generator.getBuilder().getDoubleTy(),
                                 argList_->at(index)->getExprTypeId(generator),
                                 BuiltinType::TypeId::DOUBLE);
      }

      args.push_back(arg);
    }
  }

  // Create a function call.
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
  if (!structPtr->getType()->isPointerTy() ||
      !structPtr->getType()->getNonOpaquePointerElementType()->isStructTy()) {
    throw std::logic_error(
        "Struct ref operator \".\" must apply on struct or union!");
  }

  return genStructMemberPtr(generator, structPtr, memberName_,
                            "Can not direct access to a variable of unknown type!");
}

llvm::Value* StructDeref::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator, this);
}

llvm::Value* StructDeref::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = structPtr_->genCode(generator);
  if (!structPtr->getType()->isPointerTy() ||
      !structPtr->getType()->getNonOpaquePointerElementType()->isStructTy()) {
    throw std::logic_error(
        "Struct deref operator \"->\" is not applied on struct or union!");
  }

  return genStructMemberPtr(
      generator, structPtr, memberName_,
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
  return Utils::createAdd(generator.getBuilder(), arrayPtr, idx, array_->getExprTypeId(generator),
                          index_->getExprTypeId(generator));
}

llvm::Value* TypeCast::genCode(CodeGenerator& generator) {
  llvm::Value* ret = Utils::typeCast(generator.getBuilder(), operand_->genCode(generator), varType_->getType(generator),
      operand_->getExprTypeId(generator), Utils::varTypeToTypeId(varType_));
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
  } else if (expr_ != nullptr) {
    return generator.getBuilder().getInt64(
        generator.getTypeSize(expr_->genCode(generator)->getType()));
  } else if (!identifier_.empty()) {
    llvm::Type* type = generator.findType(identifier_);
    if (type != nullptr) {
      varType_ = new DefinedType(identifier_);
      return generator.getBuilder().getInt64(generator.getTypeSize(type));
    }

    llvm::Value* var = generator.findVariable(identifier_);
    if (var != nullptr) {
      expr_ = new Variable(identifier_);
      return generator.getBuilder().getInt64(generator.getTypeSize(
          var->getType()->getNonOpaquePointerElementType()));
    }

    throw std::logic_error(identifier_ + " is neither a type nor a variable!");
  } else {
    throw std::invalid_argument("Invalid type or var in sizeof()!");
  }
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
  } else if (operand->getType()->isFloatingPointTy()) {
    return generator.getBuilder().CreateFNeg(operand);
  } else {
    throw std::logic_error(
        "Unary minus must be applied to variables of integer or floating "
        "point!");
  }
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

llvm::Value* LhsRhsAssign::genSimpleAssignPtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(generator.getBuilder(), lhs, rhs, rhs_->getExprTypeId(generator),
                             lhs_->getLValueTypeId(generator));
}

llvm::Value* LhsRhsAssign::genCompoundAssignPtr(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  llvm::Value* loaded = generator.getBuilder().CreateLoad(
      lhs->getType()->getNonOpaquePointerElementType(), lhs);
  return Utils::createAssign(generator.getBuilder(), lhs, applyOp(loaded, rhs), rhs_->getExprTypeId(generator),
      lhs_->getLValueTypeId(generator));
}

llvm::Value* Add::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createAdd(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}


llvm::Value* Sub::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createSub(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}


llvm::Value* Mul::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createMul(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}


llvm::Value* Div::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createDiv(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                rhs_->getExprTypeId(generator),
                                Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}


llvm::Value* Mod::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createMod(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
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
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createAdd(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}

llvm::Value* SubAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createSub(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}

llvm::Value* MulAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createMul(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}

llvm::Value* DivAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createDiv(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator),
                                Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* ModAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createMod(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator),
                                Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* BitwiseAnd::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createBitwiseAnd(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                       rhs_->getExprTypeId(generator));
      });
}


llvm::Value* BitwiseOr::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createBitwiseOr(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                      rhs_->getExprTypeId(generator));
      });
}


llvm::Value* BitwiseXor::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createBitwiseXor(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
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
        return Utils::createBitwiseAnd(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
            rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseOrAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createBitwiseOr(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
            rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseXorAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createBitwiseXor(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
            rhs_->getExprTypeId(generator));
      });
}

llvm::Value* LeftShift::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createShl(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}


llvm::Value* RightShift::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return Utils::createShr(generator.getBuilder(), lhs, rhs, lhs_->getExprTypeId(generator),
                                rhs_->getExprTypeId(generator),
                                Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}


llvm::Value* LeftShiftAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createShl(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator));
      });
}

llvm::Value* RightShiftAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return Utils::createShr(generator.getBuilder(), loaded, rhs, lhs_->getLValueTypeId(generator),
                                rhs_->getExprTypeId(generator),
                                Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}


llvm::Value* LogicExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
}

llvm::Value* LogicExpr::genBoolBinaryCode(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& combine) {
  llvm::Value* lhs = Utils::castToBool(generator.getBuilder(), lhs_->genCode(generator));
  llvm::Value* rhs = Utils::castToBool(generator.getBuilder(), rhs_->genCode(generator));
  return combine(lhs, rhs);
}

llvm::Value* LogicExpr::genEqualityCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createCmpEq(generator.getBuilder(), lhs, rhs,
                            lhs_->getExprTypeId(generator),
                            rhs_->getExprTypeId(generator));
}

llvm::Value* LogicExpr::genOrderedCompare(CodeGenerator& generator, int intCmpPred,
                                          int floatCmpPred,
                                          const char* unsupportedOp) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  llvm::Value* cmp = compareOrdered(
      lhs_, rhs_, lhs, rhs, static_cast<Utils::IntCmpPred>(intCmpPred),
      static_cast<llvm::CmpInst::Predicate>(floatCmpPred), generator);
  if (cmp != nullptr) {
    return cmp;
  }

  throw std::domain_error(std::string("Unsupported type for operator \"") +
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
  return genBoolBinaryCode(generator,
      [&generator](llvm::Value* lhs, llvm::Value* rhs) {
        return generator.getBuilder().CreateLogicalAnd(lhs, rhs);
      });
}

llvm::Value* LogicOr::genCode(CodeGenerator& generator) {
  return genBoolBinaryCode(generator,
      [&generator](llvm::Value* lhs, llvm::Value* rhs) {
        return generator.getBuilder().CreateLogicalOr(lhs, rhs);
      });
}

llvm::Value* LogicNot::genCode(CodeGenerator& generator) {
  return generator.getBuilder().CreateICmpEQ(
      Utils::castToBool(generator.getBuilder(), operand_->genCode(generator)),
      generator.getBuilder().getInt1(false));
}

llvm::Value* LogicEq::genCode(CodeGenerator& generator) {
  return genEqualityCode(generator);
}

llvm::Value* LogicNotEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(Utils::IntCmpPred::NE),
                           static_cast<int>(llvm::CmpInst::FCMP_ONE), "!=");
}

llvm::Value* LogicLessThan::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(Utils::IntCmpPred::LT),
                           static_cast<int>(llvm::CmpInst::FCMP_OLT), "<");
}

llvm::Value* LogicLessEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(Utils::IntCmpPred::LE),
                           static_cast<int>(llvm::CmpInst::FCMP_OLE), "<=");
}

llvm::Value* LogicGreaterThan::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(Utils::IntCmpPred::GT),
                           static_cast<int>(llvm::CmpInst::FCMP_OGT), ">");
}

llvm::Value* LogicGreaterEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(Utils::IntCmpPred::GE),
                           static_cast<int>(llvm::CmpInst::FCMP_OGE), ">=");
}

llvm::Value* TernaryCondition::genTernarySelect(
    CodeGenerator& generator,
    const std::function<llvm::Value*(Expr*)>& evalBranch,
    const char* typeMismatchMessage) {
  llvm::Value* condition =
      Utils::castToBool(generator.getBuilder(), condition_->genCode(generator));
  if (condition == nullptr) {
    throw std::logic_error(
        "Condition is not a bool expression in ternary condition expression!");
  }

  llvm::Value* trueVal = evalBranch(trueExpr_);
  llvm::Value* falseVal = evalBranch(falseExpr_);
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (trueVal->getType() == falseVal->getType() ||
      Utils::typeUpgrade(generator.getBuilder(), trueVal, falseVal,
                         trueExpr_->getExprTypeId(generator),
                         falseExpr_->getExprTypeId(generator), resultTypeId,
                         isUnsigned)) {
    return generator.getBuilder().CreateSelect(condition, trueVal, falseVal);
  }

  throw std::domain_error(typeMismatchMessage);
}

llvm::Value* TernaryCondition::genCode(CodeGenerator& generator) {
  return genTernarySelect(
      generator,
      [&generator](Expr* expr) { return expr->genCode(generator); },
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