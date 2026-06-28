#include <llvm/ADT/Twine.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Value.h>

#include <algorithm>
#include <cassert>
#include <memory>
#include <stdexcept>
#include <vector>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/IrIdioms.hpp"
#include "irgen/Operators.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

// Statements -> LLVM IR: genCode() for every Stmt node in ast/Nodes.hpp, plus
// FuncBody, which is a statement list.
//
// This is where lcc's basic-block structure is built: if/else join blocks, loop
// header/body/latch blocks, switch dispatch, and the break/continue target
// stack on CodeGenerator that ties them together.

namespace AST {

namespace {

// -g: stamp the statement's parser line on the IRBuilder before lowering it.
// True when stmt is a label, which is the one thing that can be reached after
// the current block was closed by a return, break, continue or goto.
//
// The insert point is left on a fresh block in that case, so the label has an
// unterminated block to fall out of and LabelStmt's own branch is a no-op. Only
// a label at this level is caught: one nested inside a compound statement that
// follows a terminator stays unreachable, which is the `goto` into a block that
// docs/Language.md records as unsupported.
bool openBlockForLabel(CodeGenerator& generator, Stmt* stmt) {
  if (dynamic_cast<LabelStmt*>(stmt) == nullptr) {
    return false;
  }

  llvm::BasicBlock* deadBlock = llvm::BasicBlock::Create(
      generator.getContext(), "label.pred", generator.getCurrentFunction());
  generator.getBuilder().SetInsertPoint(deadBlock);
  return true;
}

llvm::Value* generateStmt(CodeGenerator& generator, Stmt* stmt) {
  if (stmt == nullptr) {
    return nullptr;
  }
  generator.setDebugLocation(stmt->loc());
  return stmt->genCode(generator);
}

// Owns the basic blocks a lowering has created but not yet attached to its
// function.
//
// llvm::BasicBlock::Create with no parent argument returns a *detached* block:
// it belongs to no Function, so nothing in LLVM owns it and only an explicit
// delete frees it. Every lowering below opens a window on that state, because
// each builds its whole CFG skeleton up front and only then walks the
// sub-statements that fill the blocks in — and everything inside that window
// throws: a non-scalar condition, an unknown identifier, an operand pair no
// operator accepts. Bare pointers leaked every block not yet inserted, and
// because driver/main.cpp catches what pipeline::genIr throws and returns 6,
// the process unwinds and exits normally, so that leak is a real one rather
// than memory an abort would have left to the OS.
//
// The blocks therefore live here instead of in bare pointers, and the call
// sites read as they did before: create() hands back the same raw pointer to
// wire branches with, attach() gives one block to the function, which owns it
// from then on, and drop() deletes one that turned out to have no
// predecessors. Whatever is left at scope exit — the throwing path, and only
// the throwing path — is deleted here.
//
// Scope-local by design, like ScopedSymbolTable: neither copyable nor movable.
class DetachedBlocks final {
 public:
  explicit DetachedBlocks(CodeGenerator& generator) noexcept
      : context_(generator.getContext()),
        func_(generator.getCurrentFunction()) {}

  DetachedBlocks(const DetachedBlocks&) = delete;
  DetachedBlocks& operator=(const DetachedBlocks&) = delete;
  DetachedBlocks(DetachedBlocks&&) = delete;
  DetachedBlocks& operator=(DetachedBlocks&&) = delete;

  // A new block with no parent. Ownership stays here until attach() or drop().
  // Takes a Twine because that is how LLVM names a value without materializing
  // the concatenation its callers pass.
  llvm::BasicBlock* create(const llvm::Twine& name) {
    blocks_.push_back(std::unique_ptr<llvm::BasicBlock>(
        llvm::BasicBlock::Create(context_, name)));
    return blocks_.back().get();
  }

  // Append the block to the function, which owns it from here on. release()
  // runs before the insert only because ilist splicing does not allocate and
  // so cannot throw; there is no window between the two.
  void attach(llvm::BasicBlock* block) {
    if (func_ == nullptr) {
      throw std::logic_error("Basic block emitted outside a function body!");
    }
    func_->insert(func_->end(), take(block).release());
  }

  // Delete a block nothing branches to. Every caller checks
  // hasNPredecessorsOrMore(1) first, so no instruction can still refer to it.
  void drop(llvm::BasicBlock* block) { take(block); }

 private:
  // Lift one block out of the pool. A linear scan over at most 2n entries for
  // an n-case switch, and three or four for every other lowering, which is
  // cheaper than the map that would index them.
  std::unique_ptr<llvm::BasicBlock> take(llvm::BasicBlock* block) {
    const auto it =
        std::find_if(blocks_.begin(), blocks_.end(),
                     [block](const std::unique_ptr<llvm::BasicBlock>& owned) {
                       return owned.get() == block;
                     });
    assert(it != blocks_.end() && "block was not created by this pool");
    std::unique_ptr<llvm::BasicBlock> owned = std::move(*it);
    blocks_.erase(it);
    return owned;
  }

  llvm::LLVMContext& context_;
  llvm::Function* func_;
  std::vector<std::unique_ptr<llvm::BasicBlock>> blocks_;
};

}  // namespace

llvm::Value* FuncBody::genCode(CodeGenerator& generator) {
  for (Stmt* stmt : *content_) {
    // A terminated block used to end generation here, because nothing could
    // reach what followed. A label can, so the walk continues and only skips
    // what is genuinely unreachable -- see openBlockForLabel.
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr &&
        !openBlockForLabel(generator, stmt)) {
      continue;
    }
    generateStmt(generator, stmt);
  }

  // C allows falling off the end of a non-void function; emit ret undef as a
  // simple fallback (not strict undefined-behavior checking).
  if (generator.getBuilder().GetInsertBlock()->getTerminator() == nullptr) {
    llvm::Type* retType = generator.getCurrentFunction()->getReturnType();
    if (retType->isVoidTy()) {
      generator.getBuilder().CreateRetVoid();
    } else {
      generator.getBuilder().CreateRet(llvm::UndefValue::get(retType));
    }
  }

  return nullptr;
}

// Lower if/else to a three-block CFG: then, else, if.end. Each branch gets its
// own symbol table scope so block-local declarations do not leak.
llvm::Value* IfStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::Value* condition = condition_->genCode(generator);
  condition = convert::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "IfStmt condition must be either int, or float, or pointer.");
  }

  DetachedBlocks blocks(generator);
  llvm::BasicBlock* thenBlock = blocks.create("then");
  llvm::BasicBlock* elseBlock = blocks.create("else");
  llvm::BasicBlock* endBlock = blocks.create("if.end");

  // Detached blocks are attached through the pool above, which hands them to
  // Function::insert (LLVM 20+); same pattern in switch/loop lowering below.
  generator.getBuilder().CreateCondBr(condition, thenBlock, elseBlock);
  blocks.attach(thenBlock);
  generator.getBuilder().SetInsertPoint(thenBlock);
  if (thenStmt_ != nullptr) {
    ScopedSymbolTable thenScope(generator.symbols());
    generateStmt(generator, thenStmt_);
  }
  iridiom::terminateBlockByBr(generator.getBuilder(), endBlock);

  blocks.attach(elseBlock);
  generator.getBuilder().SetInsertPoint(elseBlock);
  if (elseStmt_ != nullptr) {
    ScopedSymbolTable elseScope(generator.symbols());
    generateStmt(generator, elseStmt_);
  }
  iridiom::terminateBlockByBr(generator.getBuilder(), endBlock);

  if (endBlock->hasNPredecessorsOrMore(1)) {
    blocks.attach(endBlock);
    generator.getBuilder().SetInsertPoint(endBlock);
  } else {
    // Both arms returned, so nothing branches here, and no instruction refers
    // to it either — so it is dropped rather than attached.
    blocks.drop(endBlock);
  }

  return nullptr;
}

llvm::Value* SwitchStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  DetachedBlocks blocks(generator);
  llvm::Value* matcher = matcher_->genCode(generator);

  // Lowered as an if/else-if chain, not LLVM's `switch` instruction. That
  // instruction requires every case label to be a compile-time integer
  // constant; a comparison chain accepts any expression, which keeps this
  // uniform with the other conditionals and costs nothing at -O1 and above,
  // where LLVM recognizes the chain and rebuilds a real switch.
  //
  // The blocks involved:
  //
  //   caseBlocks[i]         case i's body, in source order
  //   caseBlocks[n]         "switch.end"
  //   comparisionBlocks[k]  the k'th test (slot 0 is the current block, so the
  //                         first test needs no branch into it)
  //
  // Dispatch order is not body order, which is the whole subtlety here. C
  // tries every `case` label before it settles for `default`, wherever default
  // happens to be written (C11 6.8.4.2p5), so the chain walks the cases in
  // source order and leaves default out of it; what the last test falls
  // through to is default's body, or switch.end when there is none. Bodies
  // stay in source order regardless, because that is what fall-through means —
  // `switch (2) { default: a; case 2: b; }` dispatches straight to b and then
  // runs nothing else, while `switch (9)` on the same statement runs a and
  // falls into b.
  //
  // Fallthrough is why bodies do not branch to switch.end when they finish:
  // each body is told its *successor* body (caseBlocks[i + 1]) by the
  // ScopedSwitch that wraps it, and running off the end of a case falls into
  // the next one. `break` is what jumps to switch.end, which it finds on the
  // generator's switch stack — that is the whole difference between the two.

  std::vector<llvm::BasicBlock*> caseBlocks;
  caseBlocks.reserve(caseStmtList_->size() + 1);
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    caseBlocks.push_back(blocks.create("case." + std::to_string(i)));
  }

  caseBlocks.push_back(blocks.create("switch.end"));

  // The labels the chain tests, in source order, and the default it leaves
  // out. Two defaults are not legal C; the first wins rather than the last.
  std::vector<size_t> testedCases;
  size_t defaultCase = caseStmtList_->size();
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    if (caseStmtList_->at(i)->condition_ != nullptr) {
      testedCases.push_back(i);
    } else if (defaultCase == caseStmtList_->size()) {
      defaultCase = i;
    }
  }

  // Where dispatch lands once every test has failed.
  llvm::BasicBlock* noMatchBlock = defaultCase < caseStmtList_->size()
                                       ? caseBlocks[defaultCase]
                                       : caseBlocks.back();

  std::vector<llvm::BasicBlock*> comparisionBlocks;
  // The first comparison code should be in current insertion block.
  comparisionBlocks.push_back(generator.getBuilder().GetInsertBlock());
  // One block short of the test count: slot 0 above already holds test 0, and
  // the slot past the last test is noMatchBlock, appended below. Creating a
  // block per test instead would leave the final one branching to a block that
  // is never inserted into the function.
  for (size_t k = 1; k < testedCases.size(); ++k) {
    comparisionBlocks.push_back(
        blocks.create("switch.compare." + std::to_string(k - 1)));
  }

  comparisionBlocks.push_back(noMatchBlock);

  if (testedCases.empty()) {
    // Nothing to compare against: an empty switch, or one whose only label is
    // default. The loop below would leave the current block unterminated.
    generator.getBuilder().CreateBr(noMatchBlock);
  }

  for (size_t k = 0; k < testedCases.size(); ++k) {
    if (k > 0) {
      // The first comparison is already in current insertion block.
      // So only set insertion block and insertion point since the second
      // comparison.
      blocks.attach(comparisionBlocks[k]);
      generator.getBuilder().SetInsertPoint(comparisionBlocks[k]);
    }

    CaseStmt* tested = caseStmtList_->at(testedCases[k]);
    generator.getBuilder().CreateCondBr(
        ops::createCmpEq(generator.getBuilder(), matcher,
                         tested->condition_->genCode(generator),
                         matcher_->getExprTypeId(generator),
                         tested->condition_->getExprTypeId(generator)),
        caseBlocks[testedCases[k]], comparisionBlocks[k + 1]);
  }

  ScopedSymbolTable switchScope(generator.symbols());
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    blocks.attach(caseBlocks[i]);
    generator.getBuilder().SetInsertPoint(caseBlocks[i]);

    ScopedSwitch switchTargets(generator.controlFlow(), caseBlocks.back(),
                               caseBlocks[i + 1]);
    caseStmtList_->at(i)->genCode(generator);
  }

  if (caseBlocks.back()->hasNPredecessorsOrMore(1)) {
    blocks.attach(caseBlocks.back());
    generator.getBuilder().SetInsertPoint(caseBlocks.back());
  } else {
    // Every case returned, so nothing branches here. Having no predecessors
    // also means no instruction refers to it, so dropping it is safe.
    blocks.drop(caseBlocks.back());
  }

  return nullptr;
}

llvm::Value* CaseStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  for (Stmt* stmt : *content_) {
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr &&
        !openBlockForLabel(generator, stmt)) {
      // Unreachable and unlabelled: nothing can branch back into it.
      continue;
    }
    if (stmt != nullptr) {
      generateStmt(generator, stmt);
    }
  }

  // No break: fall through to the next case (or switch.end on the last case).
  llvm::BasicBlock* fallthroughBlock =
      generator.controlFlow().getSwitchFallthroughBlock();
  if (fallthroughBlock == nullptr) {
    throw std::logic_error("Case fall-through outside switch!");
  }
  iridiom::terminateBlockByBr(generator.getBuilder(), fallthroughBlock);
  return nullptr;
}

// CFG: init -> for.cond -> for.loop / for.end; for.loop -> for.update ->
// for.cond. ScopedLoop wires continue to for.update and break to for.end.
llvm::Value* ForStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  DetachedBlocks blocks(generator);
  llvm::BasicBlock* conditionBlock = blocks.create("for.cond");
  llvm::BasicBlock* updateBlock = blocks.create("for.update");
  llvm::BasicBlock* endBlock = blocks.create("for.end");
  llvm::BasicBlock* loopBlock = blocks.create("for.loop");

  std::unique_ptr<ScopedSymbolTable> initScope;
  if (initial_ != nullptr) {
    initScope = std::make_unique<ScopedSymbolTable>(generator.symbols());
    generateStmt(generator, initial_);
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  blocks.attach(conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  if (condition_ != nullptr) {
    llvm::Value* condition = condition_->genCode(generator);
    condition = convert::castToBool(generator.getBuilder(), condition);
    if (condition == nullptr) {
      throw std::logic_error(
          "ForStmt condition must be either int, or float, or pointer.");
    }

    generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);
  } else {
    generator.getBuilder().CreateBr(loopBlock);
  }

  blocks.attach(loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    ScopedLoop loopTargets(generator.controlFlow(), updateBlock, endBlock);
    ScopedSymbolTable loopScope(generator.symbols());
    generateStmt(generator, loopBody_);
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), updateBlock);

  blocks.attach(updateBlock);
  generator.getBuilder().SetInsertPoint(updateBlock);
  if (update_ != nullptr) {
    update_->genCode(generator);
  }

  generator.getBuilder().CreateBr(conditionBlock);

  blocks.attach(endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

// CFG: do.loop -> do.cond -> do.loop / do.end. The only structural difference
// from while is which block the entry branch targets — the body, not the test —
// which is exactly what makes the body run at least once. ScopedLoop wires
// continue to do.cond and break to do.end.
llvm::Value* DoStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  DetachedBlocks blocks(generator);
  llvm::BasicBlock* conditionBlock = blocks.create("do.cond");
  llvm::BasicBlock* loopBlock = blocks.create("do.loop");
  llvm::BasicBlock* endBlock = blocks.create("do.end");

  // Unconditional branch to loop block.
  generator.getBuilder().CreateBr(loopBlock);

  blocks.attach(loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    ScopedLoop loopTargets(generator.controlFlow(), conditionBlock, endBlock);
    ScopedSymbolTable loopScope(generator.symbols());
    generateStmt(generator, loopBody_);
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  blocks.attach(conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = convert::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "DoStmt condition must be either int, or float, or pointer.");
  }

  generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);

  blocks.attach(endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

// ScopedLoop wires continue to the condition block and break to while.end.
llvm::Value* WhileStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  DetachedBlocks blocks(generator);
  llvm::BasicBlock* conditionBlock = blocks.create("while.cond");
  llvm::BasicBlock* loopBlock = blocks.create("while.loop");
  llvm::BasicBlock* endBlock = blocks.create("while.end");

  // Unconditional branch to condition block.
  generator.getBuilder().CreateBr(conditionBlock);

  blocks.attach(conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = convert::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "WhileStmt condition must be either int, or float, or pointer.");
  }

  generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);

  blocks.attach(loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    ScopedLoop loopTargets(generator.controlFlow(), conditionBlock, endBlock);
    ScopedSymbolTable loopScope(generator.symbols());
    generateStmt(generator, loopBody_);
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  blocks.attach(endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

llvm::Value* ContinueStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::BasicBlock* continueToBlock =
      generator.controlFlow().getContinueBlock();
  if (continueToBlock == nullptr) {
    throw std::logic_error("Continue must be in a loop!");
  }

  generator.getBuilder().CreateBr(continueToBlock);
  return nullptr;
}

llvm::Value* BreakStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::BasicBlock* breakToBlock = generator.controlFlow().getBreakBlock();
  if (breakToBlock == nullptr) {
    throw std::logic_error("Break must be in switch or loop!");
  }

  generator.getBuilder().CreateBr(breakToBlock);
  return nullptr;
}

llvm::Value* GotoStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  generator.getBuilder().CreateBr(generator.labelBlock(labelName_));

  // Whatever follows the goto needs somewhere to go: a block holds one
  // terminator, and the block this just closed has it. The new one is
  // unreachable until a label makes it live again, which is the case a goto
  // exists to create.
  llvm::BasicBlock* afterGoto = llvm::BasicBlock::Create(
      generator.getContext(), "goto.cont", generator.getCurrentFunction());
  generator.getBuilder().SetInsertPoint(afterGoto);
  return nullptr;
}

llvm::Value* LabelStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  if (!generator.defineLabelBlock(labelName_)) {
    throw std::logic_error("Label " + labelName_ +
                           " is defined more than once in this function!");
  }

  // Fall in from the statement above, unless that already returned or branched.
  llvm::BasicBlock* block = generator.labelBlock(labelName_);
  iridiom::terminateBlockByBr(generator.getBuilder(), block);
  generator.getBuilder().SetInsertPoint(block);

  return generateStmt(generator, stmt_);
}

llvm::Value* ReturnStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::Function* func = generator.getCurrentFunction();
  if (func == nullptr) {
    throw std::logic_error("Return should be in a function body!");
  }

  if (retVal_ != nullptr) {
    llvm::Value* retVal = convert::typeCast(
        generator.getBuilder(), retVal_->genCode(generator),
        func->getReturnType(), retVal_->getExprTypeId(generator),
        vartype::resolvedVarTypeToTypeId(
            generator.symbols().findFuncRetType(func->getName()), generator));
    if (retVal == nullptr) {
      throw std::logic_error(
          "The type of return value does not match, and can not be casted to "
          "return type!");
    }
    generator.getBuilder().CreateRet(retVal);
  } else {
    if (func->getReturnType()->isVoidTy()) {
      generator.getBuilder().CreateRetVoid();
    } else {
      throw std::logic_error("Return value is expected, but not found!");
    }
  }

  return nullptr;
}

llvm::Value* Block::genCode(CodeGenerator& generator) {
  ScopedDebugLexicalBlock debugScope(generator, loc());
  ScopedSymbolTable symScope(generator.symbols());
  for (Stmt* stmt : *content_) {
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr &&
        !openBlockForLabel(generator, stmt)) {
      // Unreachable and unlabelled: nothing can branch back into it.
      continue;
    }
    if (stmt != nullptr) {
      generateStmt(generator, stmt);
    }
  }
  return nullptr;
}

}  // namespace AST
