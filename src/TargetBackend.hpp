#pragma once

#include <string>

namespace llvm {

class Module;

}  // namespace llvm

struct TargetBackendOptions {
  std::string triple;  // empty = host default
  std::string cpu = "generic";
  std::string features;
  // CLI -O for backend codegen (see TargetBackend::resolveCodeGenOptLevel).
  std::string optimizationLevel;
  // When non-empty, splice MachineInstrStatsPass into the codegen pipeline and
  // write machine-instruction counts here ("-" = stderr). M17 machine pass;
  // empty keeps the stock addPassesToEmitFile path (goldens unchanged).
  std::string machineStatsPath;
};

// LLVM backend: TargetMachine setup and object/asm emission via legacy PM.
class TargetBackend {
 public:
  void emitObject(llvm::Module& module, const std::string& path,
                  const TargetBackendOptions& options = {});
  void emitAssembly(llvm::Module& module, const std::string& path,
                    const TargetBackendOptions& options = {});
};
