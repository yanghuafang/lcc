#include "types/BuiltinTypeMap.hpp"

// DerivedTypes.h, not Type.h: getIntNTy returns llvm::IntegerType*, and
// converting that to the llvm::Type* this returns needs the derived type
// complete.
#include <llvm/IR/DerivedTypes.h>

// See types/BuiltinTypeMap.hpp. Signedness is not expressed here: LLVM integer
// types carry no signed/unsigned flag, so CHAR and UCHAR both map to i8 and the
// distinction is carried by AST::BuiltinTypeId itself, which
// types/TypeRules.hpp reads to decide sdiv vs udiv and the rest.

using AST::BuiltinTypeId;

namespace builtinmap {

llvm::Type* toLlvmType(BuiltinTypeId typeId, llvm::LLVMContext& context) {
  switch (typeId) {
    case BuiltinTypeId::CHAR:
    case BuiltinTypeId::UCHAR:
      return llvm::Type::getInt8Ty(context);
    case BuiltinTypeId::SHORT:
    case BuiltinTypeId::USHORT:
      return llvm::Type::getInt16Ty(context);
    case BuiltinTypeId::INT:
    case BuiltinTypeId::UINT:
      return llvm::Type::getInt32Ty(context);
    case BuiltinTypeId::LONG:
    case BuiltinTypeId::ULONG:
      return llvm::Type::getInt64Ty(context);
    case BuiltinTypeId::FLOAT:
      return llvm::Type::getFloatTy(context);
    case BuiltinTypeId::DOUBLE:
      return llvm::Type::getDoubleTy(context);
    case BuiltinTypeId::BOOL:
      return llvm::Type::getInt1Ty(context);
    case BuiltinTypeId::VOID:
      return llvm::Type::getVoidTy(context);
    case BuiltinTypeId::UNKNOWN:
      return nullptr;
  }

  return nullptr;
}

}  // namespace builtinmap
