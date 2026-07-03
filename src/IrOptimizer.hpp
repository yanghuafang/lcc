#pragma once

#include <string>

namespace llvm {

class Module;
class raw_ostream;

}  // namespace llvm

struct IrOptimizerOptions {
  // When non-empty, run IrInstructionStatsPass before LLVM opts. Use "-" for stderr.
  std::string irStatsPath;
  // Run FoldAddZeroPass before LLVM opts (M7 teaching transform).
  bool foldAddZero = false;
  // When non-empty, run this New PM pipeline instead of default<O*> (M8).
  // Mutually exclusive with optimizationLevel in main; presets: O2-peephole.
  std::string customPipeline;
};

// LLVM New Pass Manager middle-end for lcc. Runs on a completed Module after
// CodeGenerator emission; instrumentation and custom passes hook in here.
class IrOptimizer {
 public:
  void run(llvm::Module& module, const std::string& optimizationLevel,
           const IrOptimizerOptions& options = {});
};
