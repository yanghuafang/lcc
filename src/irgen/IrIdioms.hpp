#pragma once

#include <llvm/IR/IRBuilder.h>

#include <cstddef>
#include <string>

#include "ast/BuiltinTypeId.hpp"

namespace AST {

class VarType;

}  // namespace AST

class TypeEnv;

namespace llvm {

class AllocaInst;
class BasicBlock;
class BranchInst;
class Function;
class Type;
class Value;

}  // namespace llvm

/// \file
/// The handful of LLVM IR shapes lcc builds over and over, each stated once so
/// the walkers under irgen/ read as intent rather than boilerplate:
/// the entry-block alloca every local variable needs, the "branch only if this
/// block is not already terminated" guard every control-flow node needs, and
/// load/store through an lvalue pointer.
///
/// Nothing here is about C's type rules — that is irgen/TypeConversion.hpp
/// (which createAssign calls to coerce the stored value) and
/// types/TypeRules.hpp. The load and store helpers do take a TypeEnv, because
/// LLVM 20+ opaque pointers mean the pointee type has to be recovered from the
/// AST rather than read off the llvm::Value; see types/VarTypeQuery.hpp.

/// \namespace iridiom
/// The LLVM IR shapes lcc builds over and over, each stated once.
namespace iridiom {

/// C locals go in the entry block so mem2reg can promote them to registers.
[[nodiscard]] llvm::AllocaInst* createEntryBlockAlloca(
    llvm::Function* func, const std::string& varName, llvm::Type* varType);

/// Branch to basicBlock unless the current block already ends in a terminator
/// (e.g. a return or break already closed it). Returns nullptr in that case.
llvm::BranchInst* terminateBlockByBr(llvm::IRBuilder<>& builder,
                                     llvm::BasicBlock* basicBlock);

/// ptr is from genCodePtr(); lvalueVarType is the C type of that location. An
/// array rvalue decays to a pointer instead of being loaded.
[[nodiscard]] llvm::Value* createLoad(llvm::IRBuilder<>& builder,
                                      llvm::Value* ptr,
                                      AST::VarType* lvalueVarType,
                                      TypeEnv& env);

/// Store rhs through lhs, converting to the lvalue's type first.
[[nodiscard]] llvm::Value* createAssign(
    llvm::IRBuilder<>& builder, llvm::Value* lhs, llvm::Value* rhs,
    AST::VarType* lhsVarType, TypeEnv& env,
    AST::BuiltinTypeId srcTypeId = AST::BuiltinTypeId::UNKNOWN,
    AST::BuiltinTypeId dstTypeId = AST::BuiltinTypeId::UNKNOWN);

/// The constant 1 at a given width, for ++ and --.
[[nodiscard]] llvm::Value* getOneValue(llvm::IRBuilder<>& builder,
                                       size_t valueBitWidth);

}  // namespace iridiom
