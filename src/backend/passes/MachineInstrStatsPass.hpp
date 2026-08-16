#pragma once

#include <llvm/ADT/StringRef.h>
#include <llvm/CodeGen/MachineFunctionPass.h>

#include <cstdint>
#include <string>

namespace llvm {

class AnalysisUsage;
class MachineFunction;
class Module;

}  // namespace llvm

// Legacy MachineFunctionPass that operates on fully lowered MIR (after register
// allocation and prologue/epilogue insertion), NOT on LLVM IR. It counts real
// machine instructions per function and writes a summary; it never mutates MIR,
// so the emitted object/assembly is byte-for-byte unchanged.
//
// Operating on MIR is why this pass lives under backend/ rather than beside the
// New PM IR passes in opt/passes/: a machine pass registers through the legacy
// codegen PassManager and TargetPassConfig in backend/TargetBackend.cpp, not
// through PassBuilder. Enabled with -machine-stats; see docs/LlvmTools.md
// (M17).
class MachineInstrStatsPass : public llvm::MachineFunctionPass {
 public:
  // LLVM identifies a legacy pass by this member's address; the value is
  // unused. New PM passes (FoldAddZeroPass, IrInstructionStatsPass) need no
  // such ID.
  static char ID;

  explicit MachineInstrStatsPass(std::string outputPath = "-");

  llvm::StringRef getPassName() const override;
  void getAnalysisUsage(llvm::AnalysisUsage& usage) const override;
  bool runOnMachineFunction(llvm::MachineFunction& function) override;
  bool doFinalization(llvm::Module& module) override;

 private:
  std::string outputPath_;  // "-" writes to stderr
  std::string report_;      // accumulated per-function lines
  uint64_t functionCount_ = 0;
  uint64_t instructionCount_ = 0;
};
