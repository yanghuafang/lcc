#pragma once

#include <string>

#include "backend/TargetBackend.hpp"

namespace AST {

class Program;

}  // namespace AST

namespace llvm {

class Module;

}  // namespace llvm

class CodeGenerator;

// The compiler's phase ordering — the executable form of the stage diagram in
// docs/Architecture.md, and the only place the phases meet.
//
// Keeping the sequence here rather than on CodeGenerator is what lets irgen/
// depend on nothing but ast/ and types/. CodeGenerator is the context an AST
// walk calls back into; it has no business knowing that a middle end or a
// target backend exist. Only this file includes irgen/, opt/, and backend/ at
// once.
//
// Note the asymmetry in what each phase asks for: genIr() needs the whole
// CodeGenerator, because building IR means walking the AST against its symbol
// tables. Everything after it needs only an llvm::Module — once the module
// exists, nothing downstream cares where it came from.
namespace pipeline {

struct IrCodeGenOptions {
  // CLI -O0..-Oz for the middle-end; blanked when generateDebugInfo is set.
  std::string optimizationLevel;
  // -g: emit DWARF metadata and skip middle-end opts.
  bool generateDebugInfo = false;
  // C source file recorded in the DWARF compile unit (only used with -g).
  std::string sourcePath;
  // When non-empty, dump IR right after the AST walk, before the middle-end.
  std::string preOptIrPath;
  // When non-empty, dump IR after the middle-end and debug finalization.
  std::string postOptIrPath;
  // Forwarded to IrOptimizerOptions; see opt/IrOptimizer.hpp.
  std::string irStatsPath;
  bool foldAddZero = false;
  // Blanked when generateDebugInfo is set.
  std::string customPipeline;
};

// Front end + middle end: walk the AST into a module (CodeGenerator), then run
// IrOptimizer over it, dumping IR before and after if asked.
void genIr(CodeGenerator& generator, AST::Program* root,
           const IrCodeGenOptions& options);

// Back end. Also stamps triple, data layout, and PIC/PIE level onto the module,
// which is why a -l dump belongs between emitObject and emitAssembly: legacy-PM
// codegen mutates the module in place.
void emitObject(llvm::Module& module, const std::string& fileName,
                const TargetBackendOptions& options);

void emitAssembly(llvm::Module& module, const std::string& fileName,
                  const TargetBackendOptions& options);

// Write textual IR to fileName (no-op when empty), verifying the module.
void dumpIr(llvm::Module& module, const std::string& fileName);

}  // namespace pipeline
