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
// - **Emission mutates the module.** The legacy pass manager rewrites the
//   module as it lowers, so a module is not pristine after emitObject. That is
//   why driver/Pipeline.cpp dumps -l between the object and assembly calls
//   rather than after both — the IR you would dump last is not the IR the
//   object was built from.
//
// lcc emits position-independent code unconditionally, so the resulting .o
// links with a stock PIE toolchain on both macOS and Linux without -no-pie.
class TargetBackend {
 public:
  // Describe the target on the module: data layout, triple, and PIC/PIE level.
  //
  // Call this before generating any IR. The data layout is what decides how
  // wide a struct is and where its members sit, and lcc reads those back off
  // the module for sizeof (irgen/CodeGenerator.cpp) and for DWARF type
  // metadata (irgen/DebugInfoBuilder.cpp). A module with no layout does not
  // fail — it silently answers from LLVM's default, a big-endian machine with
  // 4-byte-aligned i64 — so leaving this until emission does not break the
  // build, it just computes every aggregate size for the wrong target.
  //
  // Throws on an unknown triple.
  static void configureModule(llvm::Module& module,
                              const TargetBackendOptions& options = {});

  // Emit a relocatable object file. Throws on an unknown triple or an
  // unwritable path.
  static void emitObject(llvm::Module& module, const std::string& path,
                         const TargetBackendOptions& options = {});

  // Emit textual assembly for the same target. Pass the same options as
  // emitObject, or the .s will describe a different machine than the .o.
  static void emitAssembly(llvm::Module& module, const std::string& path,
                           const TargetBackendOptions& options = {});
};
