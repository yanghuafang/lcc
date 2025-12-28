#include "irgen/ControlFlowContext.hpp"

#include <cassert>

// See irgen/ControlFlowContext.hpp for why break and continue read their
// targets from a stack rather than carrying them.

void ControlFlowContext::enterLoop(llvm::BasicBlock* continueBlock,
                                   llvm::BasicBlock* breakBlock) {
  continueBlockStack_.push_back(continueBlock);
  breakBlockStack_.push_back(breakBlock);
}

void ControlFlowContext::leaveLoop() {
  // Both stacks are pushed by enterLoop; switch uses breakBlockStack_ only, so
  // do not assert size equality across the two stacks.
  assert(!continueBlockStack_.empty() && !breakBlockStack_.empty() &&
         "leaveLoop without a matching enterLoop");
  if (continueBlockStack_.empty() || breakBlockStack_.empty()) {
    return;
  }

  continueBlockStack_.pop_back();
  breakBlockStack_.pop_back();
}

void ControlFlowContext::enterSwitch(llvm::BasicBlock* breakBlock) {
  breakBlockStack_.push_back(breakBlock);
}

void ControlFlowContext::leaveSwitch() {
  assert(!breakBlockStack_.empty() &&
         "leaveSwitch without a matching enterSwitch");
  if (breakBlockStack_.empty()) {
    return;
  }

  breakBlockStack_.pop_back();
  switchFallthroughBlock_ = nullptr;
}

void ControlFlowContext::setSwitchFallthroughBlock(
    llvm::BasicBlock* fallthroughBlock) {
  switchFallthroughBlock_ = fallthroughBlock;
}

llvm::BasicBlock* ControlFlowContext::getSwitchFallthroughBlock() const {
  return switchFallthroughBlock_;
}

llvm::BasicBlock* ControlFlowContext::getContinueBlock() const {
  if (continueBlockStack_.empty()) {
    return nullptr;
  }

  return continueBlockStack_.back();
}

llvm::BasicBlock* ControlFlowContext::getBreakBlock() const {
  if (breakBlockStack_.empty()) {
    return nullptr;
  }

  return breakBlockStack_.back();
}
