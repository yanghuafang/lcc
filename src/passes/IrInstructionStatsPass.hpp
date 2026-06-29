#pragma once

#include <cstdint>
#include <memory>

#include <llvm/IR/PassManager.h>

namespace llvm {

class Function;

}  // namespace llvm

struct IrInstructionStats {
  uint64_t loads = 0;
  uint64_t stores = 0;
  uint64_t calls = 0;
};

// New PM function pass: count memory and call instructions without changing IR.
// shared_ptr totals let each per-function run accumulate one module summary.
// IrOptimizer prints the summary after the pipeline (see -ir-stats).
class IrInstructionStatsPass
    : public llvm::PassInfoMixin<IrInstructionStatsPass> {
 public:
  explicit IrInstructionStatsPass(
      std::shared_ptr<IrInstructionStats> totals);

  llvm::PreservedAnalyses run(llvm::Function& function,
                              llvm::FunctionAnalysisManager&);

 private:
  std::shared_ptr<IrInstructionStats> totals_;
};
