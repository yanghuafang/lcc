#include "backend/passes/MachineInstrStatsPass.hpp"

#include <llvm/CodeGen/MachineBasicBlock.h>
#include <llvm/CodeGen/MachineFunction.h>
#include <llvm/CodeGen/MachineInstr.h>
#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>

#include <system_error>
#include <utility>

char MachineInstrStatsPass::ID = 0;

MachineInstrStatsPass::MachineInstrStatsPass(std::string outputPath)
    : llvm::MachineFunctionPass(ID), outputPath_(std::move(outputPath)) {}

llvm::StringRef MachineInstrStatsPass::getPassName() const {
  return "lcc machine instruction stats";
}

void MachineInstrStatsPass::getAnalysisUsage(llvm::AnalysisUsage& usage) const {
  // Analysis only: preserve every analysis so we never perturb codegen.
  usage.setPreservesAll();
  llvm::MachineFunctionPass::getAnalysisUsage(usage);
}

bool MachineInstrStatsPass::runOnMachineFunction(
    llvm::MachineFunction& function) {
  // Unlike the New PM passes here, no isDeclaration() guard is needed: the
  // legacy pass manager only runs machine passes over defined functions, which
  // have MIR.
  uint64_t count = 0;
  for (const llvm::MachineBasicBlock& block : function) {
    for (const llvm::MachineInstr& instr : block) {
      // Skip debug/CFI/kill/etc. so the count reflects real target machine
      // instructions rather than codegen bookkeeping.
      if (instr.isMetaInstruction()) {
        continue;
      }
      ++count;
    }
  }

  ++functionCount_;
  instructionCount_ += count;
  report_ += "  " + function.getName().str() + ": " + std::to_string(count) +
             " machine instructions\n";
  return false;
}

bool MachineInstrStatsPass::doFinalization(llvm::Module& /*unused*/) {
  // Runs once after the final runOnMachineFunction: emit the module-level
  // summary accumulated across all functions.
  const std::string text =
      "lcc machine-instr-stats (final MIR, host target):\n" + report_ +
      "  total: functions=" + std::to_string(functionCount_) +
      " machine_instructions=" + std::to_string(instructionCount_) + "\n";

  if (outputPath_ == "-") {
    llvm::errs() << text;
    return false;
  }

  std::error_code errCode;
  llvm::raw_fd_ostream out(outputPath_, errCode, llvm::sys::fs::OF_Text);
  if (errCode) {
    llvm::errs() << "machine-instr-stats: cannot open " << outputPath_ << ": "
                 << errCode.message() << "\n";
    return false;
  }
  out << text;
  return false;
}
