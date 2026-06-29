# Compiler pipeline & LLVM tools

**Status:** stub — expanded in [LearningPlan.md](LearningPlan.md) milestone **M18**.

Until M18 lands, use the **Tools reference** and milestone study steps in [LearningPlan.md](LearningPlan.md) (M2, M9, M13, M14). Implementation details for middle/back-end work: [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md).

## Pipeline (summary)

```text
.c  →  Lexer / Parser  →  AST genCode  →  raw LLVM IR
     →  [-l-pre-opt]  →  IrOptimizer (-ir-stats?, -O pipeline)  →  [-g finalize]
     →  [-l-post-opt]  →  genObjectCode  →  .o  →  [-l in main]
```

`lcc` emits **`.o` only** today (M10 will add `-S`). Use external `llc` on dumped `.ll` files for assembly.

IR **generation** is lcc code (`AbstractSyntaxTree.cpp`, `Utils.cpp`). LLVM **passes** run inside `IrOptimizer` after the module is built.

## Quick tool recipes

Adjust paths for your checkout. Run from `lcc/` after compiling a test:

```bash
# Compare raw vs optimized IR (reference files under debug/)
diff debug/25.quick_sort.debug.ll debug/25.quick_sort.release.ll | head

# Optimize IR with LLVM opt
opt -passes='default<O2>' debug/25.quick_sort.debug.ll -S -o /tmp/opt.ll

# IR to assembly
llc debug/25.quick_sort.release.ll -o /tmp/out.s

# Disassemble object file
llvm-objdump -d ../../lcc-build/25.quick_sort.o
```

## Related docs

- [LearningPlan.md](LearningPlan.md) — full learning path (M0–M18)
- [Usage.md](Usage.md) — `lcc` CLI flags
- [Testing.md](Testing.md) — compile modes and `debug/*.ll` artifacts
