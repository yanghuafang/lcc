# Compiler pipeline & LLVM tools

**Status:** M9 classical-optimization study notes live here; M18 may add CI recipes and more examples.

Middle/back-end implementation milestones: [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md). Full learning path: [LearningPlan.md](LearningPlan.md).

## Pipeline (summary)

```text
.c  →  Lexer / Parser  →  AST genCode  →  raw LLVM IR
     →  [-l-pre-opt]  →  IrOptimizer (-ir-stats?, -O pipeline)  →  [-g finalize]
     →  [-l-post-opt]  →  genObjectCode  →  .o  →  [-l in main]
```

`lcc` emits **`.o` only** today (M10 will add `-S`). Use external `llc` on dumped `.ll` files for assembly.

IR **generation** is lcc code (`AbstractSyntaxTree.cpp`, `Utils.cpp`). LLVM **passes** run inside `IrOptimizer` via `PassBuilder::buildPerModuleDefaultPipeline`.

---

## Quick tool recipes

Adjust paths for your checkout. Run from `lcc/scripts` (after `source ./build-env.sh` on macOS/Ubuntu):

```bash
# Compare committed reference IR (debug = -g -O0; release = -O2)
diff ../debug/25.quick_sort.debug.ll ../debug/25.quick_sort.release.ll | head

# Fresh pre/post dumps from lcc (matches IrOptimizer hook points)
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/q-pre.ll -l-post-opt /tmp/q-post.ll

# Same middle-end as lcc -O2 on a pre-opt module (no target metadata required)
opt -passes='default<O2>' /tmp/q-pre.ll -S -o /tmp/q-opt.ll

# Print the O2 pipeline string LLVM 20 uses (best-effort)
opt --print-pipeline-passes -passes='default<O2>' /tmp/q-pre.ll -disable-output

# IR to assembly (external tool)
llc /tmp/q-post.ll -o /tmp/out.s

# Disassemble object file
llvm-objdump -d ../../lcc-build/25.quick_sort.o
```

---

## Classical optimization study (M9)

`IrOptimizer` calls the same **default module pipelines** as `opt -passes='default<O0>'` … `'default<O3>'`. You do not reimplement these passes in lcc; you **observe** them on real programs.

### O2 pipeline (LLVM 20) — grouped view

`opt --print-pipeline-passes -passes='default<O2>'` on `25.quick_sort` pre-opt IR yields a long pipeline. These are the **high-signal** passes to recognize first:

| Phase | Representative passes | Effect |
|-------|-------------------------|--------|
| Early cleanup | `sroa`, `early-cse`, `simplifycfg` | Break aggregates, local redundancy, simplify CFG |
| SSA formation | **`mem2reg`** | Promote `alloca` locals to SSA registers (`phi`) |
| Peephole on SSA | **`instcombine`**, `aggressive-instcombine` | Fold constants, simplify ops, DCE trivial dead code |
| Interprocedural | `ipsccp`, `inline` (CGSCC) | Constants across functions, inline small helpers |
| Memory opts | **`gvn`**, `memcpyopt`, **`dse`**, `bdce`, **`adce`** | Redundant load/store elimination, dead code |
| Loops | **`licm`**, `loop-rotate`, `indvars`, `loop-unroll` | Hoist invariants, rotate/unroll loops |
| Late | `slp-vectorizer`, `loop-vectorizer` (may no-op) | Auto-vectorization when legal |

`lcc -O2` runs this pipeline **after** optional `IrInstructionStatsPass` (`-ir-stats`) and **before** `-l-post-opt`.

### Case study: `tests/25.quick_sort.c`

Generate fresh IR:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/q-pre.ll -l-post-opt /tmp/q-post.ll
```

Line counts on a typical host: pre ≈ 294, post ≈ 174 (same order as `debug/25.quick_sort.release.ll` modulo target metadata).

#### 1. SSA formation (`mem2reg`) — `@partition`

**Pre-opt** (`-l-pre-opt`): stack slots and load/store chains for locals:

```llvm
define i32 @partition(ptr %0, i32 %1, i32 %2) {
entry:
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pivot = alloca i32, align 4
  ...
for.cond:
  %10 = load i32, ptr %j, align 4
  %11 = load i32, ptr %high, align 4
  ...
```

**Post-opt** (`-l-post-opt`): parameters used directly; loop indices are SSA values with `phi`:

```llvm
define i32 @partition(ptr nocapture %0, i32 %1, i32 %2) local_unnamed_addr #1 {
for.loop:
  %j.018 = phi i32 [ %15, %for.update ], [ %1, %for.loop.preheader ]
  %i.017 = phi i32 [ %i.1, %for.update ], [ %7, %for.loop.preheader ]
  ...
```

`mem2reg` promoted `%i` and `%j` from memory to registers and inserted `phi` nodes at loop headers. Subsequent passes (`instcombine`, `simplifycfg`, GVN, etc.) simplified the control flow you see in post-opt IR.

#### 2. `instcombine` + DCE — `@swap`

**Pre-opt**: `swap` copies pointer parameters into `alloca` slots, then load/store through them (including a dead final load):

```llvm
define void @swap(ptr %0, ptr %1) {
entry:
  %t = alloca i32, align 4
  %a = alloca ptr, align 8
  %b = alloca ptr, align 8
  store ptr %0, ptr %a, align 8
  ...
  %10 = load i32, ptr %8, align 4   ; unused — candidate for DCE after mem2reg
  ret void
}
```

**Post-opt**: no `alloca`; direct memory operations on arguments; dead code removed:

```llvm
define void @swap(ptr nocapture %0, ptr nocapture %1) local_unnamed_addr #0 {
entry:
  %2 = load i32, ptr %0, align 4
  %3 = load i32, ptr %1, align 4
  store i32 %3, ptr %0, align 4
  store i32 %2, ptr %1, align 4
  ret void
}
```

This is a compact example of **mem2reg** (remove allocas), **instcombine** (simplify addressing), and **dead code elimination** working together.

### Verify M9 yourself

1. Run the pre/post dump commands above.
2. Run `opt --print-pipeline-passes -passes='default<O2>' /tmp/q-pre.ll -disable-output` and locate `mem2reg`, `instcombine`, `gvn`, and `licm`.
3. Diff `@partition` and `@swap` between `/tmp/q-pre.ll` and `/tmp/q-post.ll`.
4. Confirm `/tmp/q-post.ll` is very close to `opt -passes='default<O2>' /tmp/q-pre.ll` output (lcc’s `-O2` uses the same pipeline).

---

## Related docs

- [LearningPlan.md](LearningPlan.md) — full learning path (M0–M18)
- [Usage.md](Usage.md) — `lcc` CLI flags (`-l-pre-opt`, `-l-post-opt`, `-ir-stats`, `-O2`)
- [Testing.md](Testing.md) — compile modes and `debug/*.ll` artifacts
- [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md) — M9 acceptance criteria
