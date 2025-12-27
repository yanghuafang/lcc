#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Value.h>

#include <memory>
#include <stdexcept>

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
llvm::Value* generateStmt(CodeGenerator& generator, Stmt* stmt) {
  if (stmt == nullptr) {
    return nullptr;
  }
  generator.setDebugLocation(stmt->loc());
  return stmt->genCode(generator);
}

}  // namespace

llvm::Value* FuncBody::genCode(CodeGenerator& generator) {
  for (Stmt* stmt : *content_) {
    // If current block already has a terminator instruction, such as "return",
    // stop generating.
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr) {
      break;
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

  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* thenBlock =
      llvm::BasicBlock::Create(generator.getContext(), "then");
  llvm::BasicBlock* elseBlock =
      llvm::BasicBlock::Create(generator.getContext(), "else");
  llvm::BasicBlock* endBlock =
      llvm::BasicBlock::Create(generator.getContext(), "if.end");

  // Detached blocks are attached with Function::insert (LLVM 20+); same pattern
  // in switch/loop lowering below.
  generator.getBuilder().CreateCondBr(condition, thenBlock, elseBlock);
  func->insert(func->end(), thenBlock);
  generator.getBuilder().SetInsertPoint(thenBlock);
  if (thenStmt_ != nullptr) {
    ScopedSymbolTable thenScope(generator);
    generateStmt(generator, thenStmt_);
  }
  iridiom::terminateBlockByBr(generator.getBuilder(), endBlock);

  func->insert(func->end(), elseBlock);
  generator.getBuilder().SetInsertPoint(elseBlock);
  if (elseStmt_ != nullptr) {
    ScopedSymbolTable elseScope(generator);
    generateStmt(generator, elseStmt_);
  }
  iridiom::terminateBlockByBr(generator.getBuilder(), endBlock);

  if (endBlock->hasNPredecessorsOrMore(1)) {
    func->insert(func->end(), endBlock);
    generator.getBuilder().SetInsertPoint(endBlock);
  } else {
    // Both arms returned, so nothing branches here. Same ownership rule as the
    // switch.end block below: detached means unowned, so drop it.
    delete endBlock;
  }

  return nullptr;
}

llvm::Value* SwitchStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::Function* func = generator.getCurrentFunction();
  llvm::Value* matcher = matcher_->genCode(generator);

  // Lowered as an if/else-if chain, not LLVM's `switch` instruction. That
  // instruction requires every case label to be a compile-time integer
  // constant; a comparison chain accepts any expression, which keeps this
  // uniform with the other conditionals and costs nothing at -O1 and above,
  // where LLVM recognizes the chain and rebuilds a real switch.
  //
  // Two parallel block arrays, both with one extra slot at the end:
  //
  //   comparisionBlocks[i]  evaluate case i's test    (slot 0 is the current
  //                         block, so the first test needs no branch into it)
  //   caseBlocks[i]         case i's body
  //   ...[n]                both end at "switch.end"
  //
  // Test i branches to caseBlocks[i] on match, else to comparisionBlocks[i+1] —
  // walking the chain. `default` emits an unconditional branch instead, so any
  // test after it is unreachable, matching C's rule that default is tried last
  // only in the sense that its label never matches a value.
  //
  // Fallthrough is why bodies do not branch to switch.end when they finish:
  // each body is told its *successor* body (caseBlocks[i + 1]) via
  // setSwitchFallthroughBlock, and running off the end of a case falls into the
  // next one. `break` is what jumps to switch.end, which it finds on the
  // generator's switch stack — that is the whole difference between the two.

  std::vector<llvm::BasicBlock*> caseBlocks;
  caseBlocks.reserve(caseStmtList_->size());
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    caseBlocks.push_back(llvm::BasicBlock::Create(generator.getContext(),
                                                  "case." + std::to_string(i)));
  }

  caseBlocks.push_back(
      llvm::BasicBlock::Create(generator.getContext(), "switch.end"));

  std::vector<llvm::BasicBlock*> comparisionBlocks;
  // The first comparison code should be in current insertion block.
  comparisionBlocks.push_back(generator.getBuilder().GetInsertBlock());
  // One block short of the case count: slot 0 above already holds test 0, and
  // the slot past the last test is switch.end, appended below. Creating a block
  // per case instead would leave the final test branching to a block that is
  // never inserted into the function.
  for (size_t i = 1; i < caseStmtList_->size(); ++i) {
    comparisionBlocks.push_back(llvm::BasicBlock::Create(
        generator.getContext(), "switch.compare." + std::to_string(i - 1)));
  }

  // comparisionBlocks and caseBlocks hold the same block after switch
  // statement.
  comparisionBlocks.push_back(caseBlocks.back());

  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    if (i > 0) {
      // The first comparison is already in current insertion block.
      // So only set insertion block and insertion point since the second
      // comparison.
      func->insert(func->end(), comparisionBlocks[i]);
      generator.getBuilder().SetInsertPoint(comparisionBlocks[i]);
    }

    if (caseStmtList_->at(i)->condition_ != nullptr) {
      generator.getBuilder().CreateCondBr(
          ops::createCmpEq(
              generator.getBuilder(), matcher,
              caseStmtList_->at(i)->condition_->genCode(generator),
              matcher_->getExprTypeId(generator),
              caseStmtList_->at(i)->condition_->getExprTypeId(generator)),
          caseBlocks[i], comparisionBlocks[i + 1]);
    } else {
      // Unconditional branch for default statement.
      generator.getBuilder().CreateBr(caseBlocks[i]);
    }
  }

  ScopedSymbolTable switchScope(generator);
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    func->insert(func->end(), caseBlocks[i]);
    generator.getBuilder().SetInsertPoint(caseBlocks[i]);

    generator.enterSwitch(caseBlocks.back());
    generator.setSwitchFallthroughBlock(caseBlocks[i + 1]);
    caseStmtList_->at(i)->genCode(generator);
    generator.leaveSwitch();
  }

  if (caseBlocks.back()->hasNPredecessorsOrMore(1)) {
    func->insert(func->end(), caseBlocks.back());
    generator.getBuilder().SetInsertPoint(caseBlocks.back());
  } else {
    // Every case returned, so nothing branches here. A detached block belongs
    // to no Function and is therefore owned by nobody; drop it rather than leak
    // it. Having no predecessors also means nothing refers to it, so this is
    // safe.
    delete caseBlocks.back();
  }

  return nullptr;
}

llvm::Value* CaseStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  for (Stmt* stmt : *content_) {
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr) {
      // Stop code generation if encounter a terminator, such as "break".
      break;
    }
    if (stmt != nullptr) {
      generateStmt(generator, stmt);
    }
  }

  // No break: fall through to the next case (or switch.end on the last case).
  llvm::BasicBlock* fallthroughBlock = generator.getSwitchFallthroughBlock();
  if (fallthroughBlock == nullptr) {
    throw std::logic_error("Case fall-through outside switch!");
  }
  iridiom::terminateBlockByBr(generator.getBuilder(), fallthroughBlock);
  return nullptr;
}

// CFG: init -> for.cond -> for.loop / for.end; for.loop -> for.update ->
// for.cond. enterLoop wires continue to for.update and break to for.end.
llvm::Value* ForStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(generator.getContext(), "for.cond");
  llvm::BasicBlock* updateBlock =
      llvm::BasicBlock::Create(generator.getContext(), "for.update");
  llvm::BasicBlock* endBlock =
      llvm::BasicBlock::Create(generator.getContext(), "for.end");
  llvm::BasicBlock* loopBlock =
      llvm::BasicBlock::Create(generator.getContext(), "for.loop");

  std::unique_ptr<ScopedSymbolTable> initScope;
  if (initial_ != nullptr) {
    initScope = std::make_unique<ScopedSymbolTable>(generator);
    generateStmt(generator, initial_);
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  func->insert(func->end(), conditionBlock);
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

  func->insert(func->end(), loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(updateBlock, endBlock);
    ScopedSymbolTable loopScope(generator);
    generateStmt(generator, loopBody_);
    generator.leaveLoop();
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), updateBlock);

  func->insert(func->end(), updateBlock);
  generator.getBuilder().SetInsertPoint(updateBlock);
  if (update_ != nullptr) {
    update_->genCode(generator);
  }

  generator.getBuilder().CreateBr(conditionBlock);

  func->insert(func->end(), endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

// CFG: do.loop -> do.cond -> do.loop / do.end. The only structural difference
// from while is which block the entry branch targets — the body, not the test —
// which is exactly what makes the body run at least once. enterLoop wires
// continue to do.cond and break to do.end.
llvm::Value* DoStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(generator.getContext(), "do.cond");
  llvm::BasicBlock* loopBlock =
      llvm::BasicBlock::Create(generator.getContext(), "do.loop");
  llvm::BasicBlock* endBlock =
      llvm::BasicBlock::Create(generator.getContext(), "do.end");

  // Unconditional branch to loop block.
  generator.getBuilder().CreateBr(loopBlock);

  func->insert(func->end(), loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(conditionBlock, endBlock);
    ScopedSymbolTable loopScope(generator);
    generateStmt(generator, loopBody_);
    generator.leaveLoop();
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  func->insert(func->end(), conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = convert::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "DoStmt condition must be either int, or float, or pointer.");
  }

  generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);

  func->insert(func->end(), endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

// enterLoop wires continue to the condition block and break to while.end.
llvm::Value* WhileStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(generator.getContext(), "while.cond");
  llvm::BasicBlock* loopBlock =
      llvm::BasicBlock::Create(generator.getContext(), "while.loop");
  llvm::BasicBlock* endBlock =
      llvm::BasicBlock::Create(generator.getContext(), "while.end");

  // Unconditional branch to condition block.
  generator.getBuilder().CreateBr(conditionBlock);

  func->insert(func->end(), conditionBlock);
  generator.getBuilder().SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = convert::castToBool(generator.getBuilder(), condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "WhileStmt condition must be either int, or float, or pointer.");
  }

  generator.getBuilder().CreateCondBr(condition, loopBlock, endBlock);

  func->insert(func->end(), loopBlock);
  generator.getBuilder().SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(conditionBlock, endBlock);
    ScopedSymbolTable loopScope(generator);
    generateStmt(generator, loopBody_);
    generator.leaveLoop();
  }

  iridiom::terminateBlockByBr(generator.getBuilder(), conditionBlock);

  func->insert(func->end(), endBlock);
  generator.getBuilder().SetInsertPoint(endBlock);

  return nullptr;
}

llvm::Value* ContinueStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::BasicBlock* continueToBlock = generator.getContinueBlock();
  if (continueToBlock == nullptr) {
    throw std::logic_error("Continue must be in a loop!");
  }

  generator.getBuilder().CreateBr(continueToBlock);
  return nullptr;
}

llvm::Value* BreakStmt::genCode(CodeGenerator& generator) {
  generator.setDebugLocation(loc());
  llvm::BasicBlock* breakToBlock = generator.getBreakBlock();
  if (breakToBlock == nullptr) {
    throw std::logic_error("Break must be in switch or loop!");
  }

  generator.getBuilder().CreateBr(breakToBlock);
  return nullptr;
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
            generator.findFuncRetType(func->getName().str()), generator));
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
  ScopedSymbolTable symScope(generator);
  for (Stmt* stmt : *content_) {
    if (generator.getBuilder().GetInsertBlock()->getTerminator() != nullptr) {
      // Stop code generation if encounter a terminator, such as "break".
      break;
    }
    if (stmt != nullptr) {
      generateStmt(generator, stmt);
    }
  }
  return nullptr;
}

}  // namespace AST
