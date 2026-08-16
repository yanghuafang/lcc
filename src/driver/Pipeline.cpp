#include "driver/Pipeline.hpp"

#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <stdexcept>
#include <system_error>

#include "backend/TargetBackend.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/DebugInfoBuilder.hpp"
#include "opt/IrOptimizer.hpp"

namespace pipeline {

void genIr(CodeGenerator& generator, AST::Program* root,
           const IrCodeGenOptions& options) {
  if (root == nullptr) {
    std::cerr << "AST root is nullptr!" << '\n';
    return;
  }

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
  if (static_cast<int>(llvm::verifyModule(module, &irFileStream)) != 0) {
    std::cout << "Errors in IR code!" << '\n';
  }
}

}  // namespace pipeline
