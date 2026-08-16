#pragma once

#include <string>

namespace llvm {

class Module;

}  // namespace llvm

struct IrOptimizerOptions {
  // When non-empty, run IrInstructionStatsPass before LLVM opts. Use "-" for
  // stderr.
  std::string irStatsPath;
  // Run FoldAddZeroPass before LLVM opts (M7 teaching transform).
  bool foldAddZero = false;
  // When non-empty, run this New PM pipeline instead of default<O*> (M8).
  // Mutually exclusive with optimizationLevel in main; presets: O2-peephole.
  std::string customPipeline;
};

// The middle end: optimize a finished module in place, using LLVM's New Pass
// Manager.
//
// run() is always called, and does nothing unless asked — no -O, no -O-passes,
// no -ir-stats, no -fold-add-zero means the module comes back untouched. So the
// driver never has to decide whether optimization applies.
//
// Ordering inside run(), which matters for the teaching passes:
//
//   1. lcc's own passes (opt/passes/) — IrInstructionStatsPass counts the raw
//      frontend IR, FoldAddZeroPass rewrites it. These run first so the stats
//      describe what the front end actually produced, before LLVM canonicalizes
//      it out of recognition.
//   2. LLVM's pipeline — either default<O*> from optimizationLevel, or the
//      explicit pass list in options.customPipeline. The two are mutually
//      exclusive; the driver rejects the combination rather than picking one.
//
// Under -g the driver blanks both LLVM inputs before calling, so step 1 still
// runs and step 2 does not — mem2reg would otherwise promote away the allocas
// that lcc's dbg.declare debug info is attached to.
class IrOptimizer {
 public:
  // Runs the passes above over module, in place. Throws if customPipeline does
  // not parse.
  static void run(llvm::Module& module, const std::string& optimizationLevel,
                  const IrOptimizerOptions& options = {});
};
