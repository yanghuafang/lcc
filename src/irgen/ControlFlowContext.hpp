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
// The one piece that is not a stack is the switch fall-through block: C's
// fall-through is a property of the case body currently being lowered, not of
// an enclosing construct, so there is only ever one, and leaveSwitch clears it.
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

  // Push a switch's break target. Fall-through uses setSwitchFallthroughBlock
  // rather than a stack; see above.
  void enterSwitch(llvm::BasicBlock* breakBlock);

  void leaveSwitch();

  // Target for the case body currently being lowered.
  void setSwitchFallthroughBlock(llvm::BasicBlock* fallthroughBlock);

  llvm::BasicBlock* getSwitchFallthroughBlock() const;

  // Innermost enclosing targets, or null outside any loop / switch.
  llvm::BasicBlock* getContinueBlock() const;

  llvm::BasicBlock* getBreakBlock() const;

 private:
  std::vector<llvm::BasicBlock*> continueBlockStack_;
  std::vector<llvm::BasicBlock*> breakBlockStack_;

  llvm::BasicBlock* switchFallthroughBlock_ = nullptr;
};
