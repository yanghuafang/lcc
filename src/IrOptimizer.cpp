#include "IrOptimizer.hpp"

#include <iostream>
#include <memory>
#include <stdexcept>

#include <llvm/Analysis/LoopAnalysisManager.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>

#include "passes/IrInstructionStatsPass.hpp"

namespace {

const llvm::OptimizationLevel* resolveOptimizationLevel(
    const std::string& optimizationLevel) {
  if (optimizationLevel == "O0") {
    return &llvm::OptimizationLevel::O0;
  }
  if (optimizationLevel == "O1") {
    return &llvm::OptimizationLevel::O1;
  }
  if (optimizationLevel == "O2") {
    return &llvm::OptimizationLevel::O2;
  }
  if (optimizationLevel == "O3") {
    return &llvm::OptimizationLevel::O3;
  }
  if (optimizationLevel == "Os") {
    return &llvm::OptimizationLevel::Os;
  }
  if (optimizationLevel == "Oz") {
    return &llvm::OptimizationLevel::Oz;
  }
  std::cout << "Default optimization level -O0." << std::endl;
  return &llvm::OptimizationLevel::O0;
}

void writeIrInstructionStats(const IrInstructionStats& stats,
                             llvm::raw_ostream& out) {
  out << "IR instruction stats (pre-optimization pipeline):\n";
  out << "  loads:  " << stats.loads << '\n';
  out << "  stores: " << stats.stores << '\n';
  out << "  calls:  " << stats.calls << '\n';
}

}  // namespace

void IrOptimizer::run(llvm::Module& module,
                      const std::string& optimizationLevel,
                      const IrOptimizerOptions& options) {
  const bool wantStats = !options.irStatsPath.empty();
  const bool wantOpts = !optimizationLevel.empty();
  if (!wantStats && !wantOpts) {
    return;
  }

  // New PM requires analysis managers before any ModulePassManager run.
  llvm::LoopAnalysisManager lam;
  llvm::FunctionAnalysisManager fam;
  llvm::CGSCCAnalysisManager cgam;
  llvm::ModuleAnalysisManager mam;

  llvm::PassBuilder pb;
  pb.registerModuleAnalyses(mam);
  pb.registerCGSCCAnalyses(cgam);
  pb.registerFunctionAnalyses(fam);
  pb.registerLoopAnalyses(lam);
  pb.crossRegisterProxies(lam, fam, cgam, mam);

  llvm::ModulePassManager mpm;
  auto stats = std::make_shared<IrInstructionStats>();

  // Instrumentation runs before LLVM opts so counts match -l-pre-opt IR.
  if (wantStats) {
    mpm.addPass(
        llvm::createModuleToFunctionPassAdaptor(IrInstructionStatsPass(stats)));
  }
  if (wantOpts) {
    const llvm::OptimizationLevel* level =
        resolveOptimizationLevel(optimizationLevel);
    // Same default pipelines as `opt -passes='default<O*>'`; see docs/Pipeline.md (M9).
    mpm.addPass(pb.buildPerModuleDefaultPipeline(*level));
  }

  mpm.run(module, mam);

  if (!wantStats) {
    return;
  }

  if (options.irStatsPath == "-") {
    writeIrInstructionStats(*stats, llvm::errs());
    return;
  }

  std::error_code errCode;
  llvm::raw_fd_ostream statsStream(options.irStatsPath, errCode,
                                   llvm::sys::fs::OF_Text);
  if (errCode) {
    throw std::runtime_error("Failed to open IR stats file " +
                             options.irStatsPath + ": " + errCode.message());
  }
  writeIrInstructionStats(*stats, statsStream);
}
