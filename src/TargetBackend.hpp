#pragma once

#include <string>

namespace llvm {

class Module;

}  // namespace llvm

struct TargetBackendOptions {
  std::string triple;  // empty = host default
  std::string cpu = "generic";
  std::string features;
};

// LLVM backend: TargetMachine setup and object/asm emission via legacy PM.
class TargetBackend {
 public:
  void emitObject(llvm::Module& module, const std::string& path,
                  const TargetBackendOptions& options = {});
  void emitAssembly(llvm::Module& module, const std::string& path,
                    const TargetBackendOptions& options = {});
};
