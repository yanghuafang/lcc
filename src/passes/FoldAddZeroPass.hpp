#pragma once

#include <llvm/IR/PassManager.h>

namespace llvm {

class Function;

}  // namespace llvm

// New PM function pass: fold `add i<T> %x, 0` and `add i<T> 0, %x` to `%x`.
// Mutates IR (contrast IrInstructionStatsPass). Enabled with -fold-add-zero;
// IrOptimizer runs this before the default LLVM pipeline (see Pipeline.md M7).
class FoldAddZeroPass : public llvm::PassInfoMixin<FoldAddZeroPass> {
 public:
  llvm::PreservedAnalyses run(llvm::Function& function,
                              llvm::FunctionAnalysisManager&);
};
