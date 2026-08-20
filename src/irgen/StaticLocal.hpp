#pragma once

namespace AST {

class ConstStr;
class VarInit;
class VarType;

}  // namespace AST

namespace llvm {

class Type;

}  // namespace llvm

class CodeGenerator;

/// \file
/// Block-scope `static`: the one declaration in C whose storage and whose scope
/// disagree.
///
/// `static int n = f();` inside a function is visible only in that block, but
/// lives for the whole program — so it cannot be an alloca. It becomes a module
/// global instead, named `<function>.<var>` so two functions may each declare
/// `n`, with InternalLinkage so the name never escapes the translation unit.
///
/// That much is just a global. What makes this its own file is the second half:
/// C says the initializer runs on first execution, not at load time. When the
/// initializer is a constant that costs nothing — the global carries it. When
/// it is not, the lowering has to emit a guard:
///
/// `if (!<var>.inited) { <initializer>; <var>.inited = true; }`
///
/// which means splitting the current basic block in two mid-declaration. That
/// is the only place in irgen/ where a *declaration* creates control flow, and
/// the reason this does not simply live beside the alloca path in DeclToIr.cpp.
///
/// Depends on irgen/Arrays.hpp — a block-scope static array needs the
/// same four initializer shapes as any other array. The dependency runs one way
/// only.
namespace staticlocal {

/// Define var as a block-scope static and bind it in the current scope.
/// Requires an enclosing function; throws std::logic_error otherwise.
void defineBlockStaticVar(CodeGenerator& generator, AST::VarInit* var,
                          AST::VarType* varType, llvm::Type* llvmVarType,
                          AST::VarType* baseVarType, bool isArray,
                          AST::ConstStr* strInit);

}  // namespace staticlocal
