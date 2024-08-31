#pragma once

// Shared C builtin type identifiers for lcc. LLVM integer types carry no
// signed/unsigned flag; BuiltinTypeId records C signedness for casts, icmp,
// promotions, and arithmetic lowering in Utils.

namespace AST {

class VarType;

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
