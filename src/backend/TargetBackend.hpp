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

// The back end: turn a finished llvm::Module into machine code.
//
// This is the one stage that is not lcc's own logic — LLVM's TargetMachine does
// instruction selection, register allocation, and encoding. What lives here is
// the setup: resolve the triple to a registered target, build a TargetMachine
// from the CPU and feature string, and run LLVM's codegen pipeline into a file.
//
// Two things about it surprise people:
//
// - **Each call emits independently.** Assembly is not derived from the object;
//   emitAssembly runs a second, complete codegen over the same module. So
//   calling both does the back-end work twice, by design.
//
// - **Emission mutates the module.** Codegen stamps the target triple, data
//   layout, and PIC level onto it, and the legacy pass manager rewrites as it
//   lowers. A module is therefore not pristine after emitObject, which is why
//   driver/Pipeline.cpp dumps -l between the object and assembly calls rather
//   than after both — the IR you would dump last is not the IR the object was
//   built from.
//
// lcc emits position-independent code unconditionally, so the resulting .o
// links with a stock PIE toolchain on both macOS and Linux without -no-pie.
class TargetBackend {
 public:
  // Emit a relocatable object file. Throws on an unknown triple or an
  // unwritable path.
  static void emitObject(llvm::Module& module, const std::string& path,
                         const TargetBackendOptions& options = {});

  // Emit textual assembly for the same target. Pass the same options as
  // emitObject, or the .s will describe a different machine than the .o.
  static void emitAssembly(llvm::Module& module, const std::string& path,
                           const TargetBackendOptions& options = {});
};
