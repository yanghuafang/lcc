#include "IrOptimizer.hpp"

#include <iostream>

#include <llvm/Analysis/LoopAnalysisManager.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>

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

}  // namespace

void IrOptimizer::run(llvm::Module& module,
                      const std::string& optimizationLevel) {
  // main passes "" when no -O flag; leave raw codegen IR untouched.
  if (optimizationLevel.empty()) {
    return;
  }

  // New PM requires analysis managers before buildPerModuleDefaultPipeline.
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

  const llvm::OptimizationLevel* level =
      resolveOptimizationLevel(optimizationLevel);
  llvm::ModulePassManager mpm = pb.buildPerModuleDefaultPipeline(*level);
  mpm.run(module, mam);
}
