#pragma once

// Shared C builtin type identifiers for lcc. LLVM integer types carry no
// signed/unsigned flag; BuiltinTypeId records C signedness for the type rules
// in types/TypeRules.hpp and the operator lowering in
// irgen/Operators.hpp.
//
// This header exists so those modules can name the enum without including
// ast/Nodes.hpp (1600+ lines, 185 classes). That is what keeps
// types/TypeRules.hpp a true leaf: this file is its only include. Keep it that
// way — declare nothing here but the enum, and forward-declare AST classes in
// the header that needs them.

namespace AST {

enum class BuiltinTypeId {
  UNKNOWN = 0,
  CHAR,
  SHORT,
  INT,
  LONG,
  UCHAR,
  USHORT,
  UINT,
  ULONG,
  FLOAT,
  DOUBLE,
  BOOL,
  VOID
};

}  // namespace AST
