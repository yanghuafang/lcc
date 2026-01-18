\mainpage lcc API reference

This is the generated reference for `lcc`'s headers — a teaching C compiler
built with flex, bison, and LLVM 20. It documents what each type is for and how
the layers fit together. The narrative documentation is not here: it lives in
the repository, and
[docs/LearningPlan.md](https://github.com/yanghuafang/lcc/blob/main/docs/LearningPlan.md)
is where to start.

This page exists only as the landing page for the generated site; it is not one
of the guides.

## How the layers fit

`src/` is an acyclic dependency graph with `driver/` alone on top. Reading it
from the bottom up:

| Layer | Start at | Depends on |
| --- | --- | --- |
| `ast/` | AST::Node, AST::Expr, AST::VarType | nothing — not even the type rules |
| `types/` | TypeEnv, ::typerules, ::vartype | `ast/` |
| `irgen/` | CodeGenerator, SymbolTable, ControlFlowContext | `ast/`, `types/` |
| `opt/`, `backend/` | IrOptimizer, TargetBackend | LLVM only |
| `dot/` | ::dotfile | `ast/` |
| `driver/` | ::pipeline | all of the above |

The emission services the lowering shares — ::ops, ::convert, ::iridiom,
::arrays, ::staticlocal — sit inside `irgen/` and are named for the one file
that defines each.

## What this site adds

The prose here is the same prose as in the headers, so reading the sources
directly loses nothing. What is easier to see rendered is the class hierarchy:
AST::Node runs six levels deep, and the inheritance diagrams
show at a glance what the source shows one `: public` clause at a time.

For the stage-by-stage description of how a `.c` file becomes an object file,
see
[docs/Architecture.md](https://github.com/yanghuafang/lcc/blob/main/docs/Architecture.md).
