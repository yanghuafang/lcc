#pragma once

#include <vector>

namespace llvm {

class BasicBlock;

}  // namespace llvm

// Where `break` and `continue` go.
//
// Neither statement carries a target of its own — `break;` is the same three
// tokens whether it leaves a for loop or a switch — so the target has to come
// from context. That context is these two stacks: a loop pushes both, a switch
// pushes only the break target, and each statement reads the innermost entry.
//
// Nesting therefore needs no special handling anywhere in StmtToIr.cpp. A loop
// inside a switch inside a loop works because `continue` reads the continue
// stack, which the switch never touched, while `break` reads the break stack,
// which it did.
//
// The fall-through block is a stack for the same reason, though it took a bug
// to see it. C's fall-through is a property of the case body currently being
// lowered — and case bodies nest, because a `switch` inside a `case` is
// ordinary C. A single slot got that wrong: the inner switch cleared the outer
// case's target on its way out, and the outer body was left with nowhere to
// fall through to.
//
// Split out of CodeGenerator, where it sat beside an LLVMContext and a Module.
// Like SymbolTable, this emits no IR — it only records which llvm::BasicBlock a
// jump should land in — which is what makes it readable, and testable, on its
// own.
class ControlFlowContext {
 public:
  // Push a loop's continue and break targets.
  void enterLoop(llvm::BasicBlock* continueBlock, llvm::BasicBlock* breakBlock);

  void leaveLoop();

  // Push a switch's break target, and the fall-through target of the one case
  // body about to be lowered. Both are popped together, so a case body cannot
  // outlive the successor it falls into.
  void enterSwitch(llvm::BasicBlock* breakBlock,
                   llvm::BasicBlock* fallthroughBlock);

  void leaveSwitch();

  // Successor of the case body currently being lowered — the innermost one, so
  // a switch nested inside a case does not disturb the case that contains it.
  llvm::BasicBlock* getSwitchFallthroughBlock() const;

  // Innermost enclosing targets, or null outside any loop / switch.
  llvm::BasicBlock* getContinueBlock() const;

  llvm::BasicBlock* getBreakBlock() const;

 private:
  std::vector<llvm::BasicBlock*> continueBlockStack_;
  std::vector<llvm::BasicBlock*> breakBlockStack_;

  std::vector<llvm::BasicBlock*> fallthroughBlockStack_;
};

// RAII guards for the two stacks above, and the way StmtToIr.cpp is meant to
// reach them: nothing calls enterLoop / leaveLoop or enterSwitch / leaveSwitch
// by hand. They live here rather than at the call sites for the reason
// ScopedSymbolTable lives beside its stack in irgen/SymbolTable.hpp — the
// pairing is visible next to what it balances, and a body that throws partway
// through cannot leave a target pushed behind it.
//
// Two guards rather than one because the constructs push different things: a
// loop pushes continue and break, a switch pushes only break. That asymmetry is
// the whole reason `continue` inside a switch reaches the enclosing loop, so it
// is worth two types that cannot be confused for each other.
class ScopedLoop {
 public:
  ScopedLoop(ControlFlowContext& controlFlow, llvm::BasicBlock* continueBlock,
             llvm::BasicBlock* breakBlock)
      : controlFlow_(controlFlow) {
    controlFlow_.enterLoop(continueBlock, breakBlock);
  }
  ~ScopedLoop() { controlFlow_.leaveLoop(); }

  ScopedLoop(const ScopedLoop&) = delete;
  ScopedLoop& operator=(const ScopedLoop&) = delete;

 private:
  ControlFlowContext& controlFlow_;
};

// Scoped to one case body, not to the whole switch. Every case pushes the same
// break target, but the fall-through target is that body's own successor —
// which is exactly what makes a switch nested inside a case work, since the
// inner one pushes and pops above the outer one rather than over it.
class ScopedSwitch {
 public:
  ScopedSwitch(ControlFlowContext& controlFlow, llvm::BasicBlock* breakBlock,
               llvm::BasicBlock* fallthroughBlock)
      : controlFlow_(controlFlow) {
    controlFlow_.enterSwitch(breakBlock, fallthroughBlock);
  }
  ~ScopedSwitch() { controlFlow_.leaveSwitch(); }

  ScopedSwitch(const ScopedSwitch&) = delete;
  ScopedSwitch& operator=(const ScopedSwitch&) = delete;

 private:
  ControlFlowContext& controlFlow_;
};
