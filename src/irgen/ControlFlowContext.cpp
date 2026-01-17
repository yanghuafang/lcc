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

void ControlFlowContext::enterSwitch(llvm::BasicBlock* breakBlock,
                                     llvm::BasicBlock* fallthroughBlock) {
  breakBlockStack_.push_back(breakBlock);
  fallthroughBlockStack_.push_back(fallthroughBlock);
}

void ControlFlowContext::leaveSwitch() {
  // Both stacks are pushed by enterSwitch; a loop pushes breakBlockStack_ only,
  // so do not assert size equality across the two.
  assert(!breakBlockStack_.empty() && !fallthroughBlockStack_.empty() &&
         "leaveSwitch without a matching enterSwitch");
  if (breakBlockStack_.empty() || fallthroughBlockStack_.empty()) {
    return;
  }

  breakBlockStack_.pop_back();
  fallthroughBlockStack_.pop_back();
}

llvm::BasicBlock* ControlFlowContext::getSwitchFallthroughBlock()
    const noexcept {
  if (fallthroughBlockStack_.empty()) {
    return nullptr;
  }

  return fallthroughBlockStack_.back();
}

llvm::BasicBlock* ControlFlowContext::getContinueBlock() const noexcept {
  if (continueBlockStack_.empty()) {
    return nullptr;
  }

  return continueBlockStack_.back();
}

llvm::BasicBlock* ControlFlowContext::getBreakBlock() const noexcept {
  if (breakBlockStack_.empty()) {
    return nullptr;
  }

  return breakBlockStack_.back();
}
