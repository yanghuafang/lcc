#pragma once

#include <string>

namespace llvm {

class Module;

}  // namespace llvm

// LLVM New Pass Manager middle-end for lcc. Runs on a completed Module after
// CodeGenerator emission; instrumentation and custom passes hook in here.
class IrOptimizer {
 public:
  void run(llvm::Module& module, const std::string& optimizationLevel);
};
