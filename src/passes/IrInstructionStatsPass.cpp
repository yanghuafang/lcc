#include "passes/IrInstructionStatsPass.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instructions.h>

IrInstructionStatsPass::IrInstructionStatsPass(
    std::shared_ptr<IrInstructionStats> totals)
    : totals_(std::move(totals)) {}

llvm::PreservedAnalyses IrInstructionStatsPass::run(
    llvm::Function& function, llvm::FunctionAnalysisManager&) {
  // Declarations (e.g. printf) have no body to walk.
  if (function.isDeclaration()) {
    return llvm::PreservedAnalyses::all();
  }

  for (llvm::BasicBlock& block : function) {
    for (llvm::Instruction& inst : block) {
      if (llvm::isa<llvm::LoadInst>(inst)) {
        ++totals_->loads;
      } else if (llvm::isa<llvm::StoreInst>(inst)) {
        ++totals_->stores;
      } else if (llvm::isa<llvm::CallInst>(inst) ||
                 llvm::isa<llvm::InvokeInst>(inst)) {
        ++totals_->calls;
      }
    }
  }

  return llvm::PreservedAnalyses::all();
}
