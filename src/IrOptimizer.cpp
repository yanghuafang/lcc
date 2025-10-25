#include "IrOptimizer.hpp"

#include <llvm/Analysis/LoopAnalysisManager.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/Error.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <memory>
#include <stdexcept>

#include "passes/FoldAddZeroPass.hpp"
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

// Map lcc preset names to PassBuilder pipeline text (same syntax as opt
// -passes).
std::string resolveCustomPipeline(const std::string& userPipeline) {
  if (userPipeline == "O2-peephole") {
    return "mem2reg,instcombine,simplifycfg";
  }
  return userPipeline;
}

void addCustomPipeline(llvm::PassBuilder& pb, llvm::ModulePassManager& mpm,
                       const std::string& userPipeline) {
  const std::string pipelineText = resolveCustomPipeline(userPipeline);
  if (auto err = pb.parsePassPipeline(mpm, pipelineText)) {
    std::string message = llvm::toString(std::move(err));
    throw std::runtime_error("Invalid -O-passes pipeline \"" + userPipeline +
                             "\": " + message);
  }
}

}  // namespace

void IrOptimizer::run(llvm::Module& module,
                      const std::string& optimizationLevel,
                      const IrOptimizerOptions& options) {
  const bool wantStats = !options.irStatsPath.empty();
  const bool wantFoldAddZero = options.foldAddZero;
  const bool wantCustomPipeline = !options.customPipeline.empty();
  const bool wantDefaultOpts =
      !optimizationLevel.empty() && !wantCustomPipeline;
  if (!wantStats && !wantFoldAddZero && !wantCustomPipeline &&
      !wantDefaultOpts) {
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
  // Custom transform: narrow peephole before the default pipeline.
  if (wantFoldAddZero) {
    mpm.addPass(llvm::createModuleToFunctionPassAdaptor(FoldAddZeroPass{}));
  }
  if (wantCustomPipeline) {
    // User pipeline (opt -passes syntax) replaces default<O*>; see
    // docs/LlvmTools.md.
    addCustomPipeline(pb, mpm, options.customPipeline);
  } else if (wantDefaultOpts) {
    const llvm::OptimizationLevel* level =
        resolveOptimizationLevel(optimizationLevel);
    // Same default pipelines as `opt -passes='default<O*>'`; see
    // docs/LlvmTools.md.
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
