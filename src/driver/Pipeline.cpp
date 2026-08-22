#include "driver/Pipeline.hpp"

#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <stdexcept>
#include <string>
#include <system_error>

#include "backend/TargetBackend.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/DebugInfoBuilder.hpp"
#include "opt/IrOptimizer.hpp"

namespace pipeline {

void genIr(CodeGenerator& generator, AST::Program* root,
           const IrCodeGenOptions& options,
           const TargetBackendOptions& targetOptions) {
  if (root == nullptr) {
    std::cerr << "AST root is nullptr!" << '\n';
    return;
  }

  // Describe the target before anything reads the module. sizeof, struct
  // member offsets, and DWARF type sizes are all answered from the data
  // layout, and the middle end below optimizes against it too; an unconfigured
  // module answers from LLVM's default instead, silently and for a machine
  // that does not exist. The back end re-applies this at emission, so the two
  // can never disagree about what is being compiled.
  TargetBackend::configureModule(generator.getModule(), targetOptions);

  // Front end: AST -> raw module. Everything from here down is irgen/'s job,
  // and it is the only step that needs the CodeGenerator.
  generator.buildModule(root, options.generateDebugInfo, options.sourcePath);

  // Middle-end snapshots: raw frontend IR, then the module after IrOptimizer
  // and debug finalization (-g). main's -l dumps later (post-emitObject) with
  // target triple/data layout for compile-tests.sh golden files.
  if (!options.preOptIrPath.empty()) {
    dumpIr(generator.getModule(), options.preOptIrPath);
  }

  // -g skips middle-end opts (-O and -O-passes) so dbg.declare allocas survive;
  // dbg.value salvage for -O1+ is out of scope for this teaching compiler.
  const std::string optLevel =
      options.generateDebugInfo ? std::string{} : options.optimizationLevel;
  const std::string customPipeline =
      options.generateDebugInfo ? std::string{} : options.customPipeline;
  IrOptimizer::run(generator.getModule(), optLevel,
                   {.irStatsPath = options.irStatsPath,
                    .foldAddZero = options.foldAddZero,
                    .customPipeline = customPipeline});

  if (options.generateDebugInfo) {
    if (!options.optimizationLevel.empty() &&
        options.optimizationLevel != "O0") {
      std::cerr << "Warning: -g disables LLVM optimizations (ignoring -"
                << options.optimizationLevel
                << "); use -g without -O for debuggable output." << '\n';
    }
    if (!options.customPipeline.empty()) {
      std::cerr << "Warning: -g disables -O-passes (ignoring \""
                << options.customPipeline
                << "\"); use -g without -O-passes for debuggable output."
                << '\n';
    }
    generator.debugInfo()->finalize();
  }

  if (!options.postOptIrPath.empty()) {
    dumpIr(generator.getModule(), options.postOptIrPath);
  }

  // The module the back end is about to receive, checked before it gets there.
  // This used to live in dumpIr, which meant it ran only when an IR dump had
  // been asked for: a plain `lcc -i f.c -o f.o` never verified anything, so
  // the one thing standing between a lowering bug and TargetMachine was off
  // for the ordinary invocation. It also wrote its findings into the .ll being
  // dumped and let the compile succeed regardless.
  //
  // lcc has no semantic-analysis pass — each node emits its own IR and reports
  // what it cannot lower by throwing — so this is the only check that the
  // instructions those nodes produced fit together.
  //
  // After the dumps above rather than before, deliberately: when this fires,
  // the .ll files are what you read to find out why, so they need to be on
  // disk already.
  std::string verifierReport;
  llvm::raw_string_ostream verifierStream(verifierReport);
  if (llvm::verifyModule(generator.getModule(), &verifierStream)) {
    // logic_error, not runtime_error: nothing about the environment failed.
    // The IR lcc built does not hold together, which is a defect in lcc.
    throw std::logic_error("Generated IR failed verification:\n" +
                           verifierReport);
  }
}

void emitObject(llvm::Module& module, const std::string& fileName,
                const TargetBackendOptions& options) {
  TargetBackend::emitObject(module, fileName, options);
}

void emitAssembly(llvm::Module& module, const std::string& fileName,
                  const TargetBackendOptions& options) {
  TargetBackend::emitAssembly(module, fileName, options);
}

void dumpIr(llvm::Module& module, const std::string& fileName) {
  if (fileName.empty()) {
    return;
  }

  std::error_code errCode;
  llvm::raw_fd_ostream irFileStream(fileName, errCode);
  if (errCode.value() != 0) {
    throw std::runtime_error("Failed to create file " + fileName + " errCode " +
                             errCode.message());
  }

  module.print(irFileStream, nullptr);
}

}  // namespace pipeline
