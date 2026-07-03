#include "passes/FoldAddZeroPass.hpp"

#include <vector>

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>

namespace {

bool isZeroIntConstant(const llvm::Value* value) {
  const auto* constant = llvm::dyn_cast<llvm::ConstantInt>(value);
  return constant != nullptr && constant->isZero();
}

}  // namespace

llvm::PreservedAnalyses FoldAddZeroPass::run(
    llvm::Function& function, llvm::FunctionAnalysisManager&) {
  if (function.isDeclaration()) {
    return llvm::PreservedAnalyses::all();
  }

  bool changed = false;
  for (llvm::BasicBlock& block : function) {
    // Collect then erase: replaceAllUsesWith during the inst walk is safe, but
    // eraseFromParent would invalidate the range-for over the basic block.
    std::vector<llvm::Instruction*> toErase;

    for (llvm::Instruction& inst : block) {
      auto* binary = llvm::dyn_cast<llvm::BinaryOperator>(&inst);
      if (binary == nullptr || binary->getOpcode() != llvm::Instruction::Add) {
        continue;
      }
      if (!binary->getType()->isIntegerTy()) {
        continue;
      }

      llvm::Value* lhs = binary->getOperand(0);
      llvm::Value* rhs = binary->getOperand(1);
      if (isZeroIntConstant(rhs)) {
        binary->replaceAllUsesWith(lhs);
        toErase.push_back(binary);
      } else if (isZeroIntConstant(lhs)) {
        binary->replaceAllUsesWith(rhs);
        toErase.push_back(binary);
      }
    }

    for (llvm::Instruction* inst : toErase) {
      inst->eraseFromParent();
      changed = true;
    }
  }

  return changed ? llvm::PreservedAnalyses::none()
                 : llvm::PreservedAnalyses::all();
}
