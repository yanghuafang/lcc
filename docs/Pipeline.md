# Compiler pipeline & LLVM tools

**Status:** M9 classical-optimization study notes, M12 codegen/asm diff, and M14 vectorization study live here; M18 may add CI recipes and more examples.

Middle/back-end implementation milestones: [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md). Full learning path: [LearningPlan.md](LearningPlan.md).

## Pipeline (summary)

```text
.c  →  Lexer / Parser  →  AST genCode  →  raw LLVM IR
     →  [-l-pre-opt]  →  IrOptimizer (-ir-stats?, -O pipeline)  →  [-g finalize]
     →  [-l-post-opt]  →  genObjectCode  →  .o  →  [-l in main]  →  [-S optional]
```

`lcc` can emit **`.o`** (always via `-o`) and **`.s`** (optional `-S`). External `llc` on dumped `.ll` still works for study.

IR **generation** is lcc code (`AbstractSyntaxTree.cpp`, `Utils.cpp`). LLVM **passes** run inside `IrOptimizer` via `PassBuilder::buildPerModuleDefaultPipeline`.

---

## Quick tool recipes

Adjust paths for your checkout. Run from `lcc/scripts` (after `source ./build-env.sh` on macOS/Ubuntu):

```bash
# Compare committed reference IR (debug = -g -O0; release = -O2)
diff ../debug/25.quick_sort.debug.ll ../debug/25.quick_sort.release.ll | head

# Middle-end pre/post (no target metadata) vs final IR (after object emission)
diff ../debug/25.quick_sort.release.pre.ll ../debug/25.quick_sort.release.post.ll | head
diff ../debug/25.quick_sort.release.post.ll ../debug/25.quick_sort.release.ll | head

# Fresh pre/post dumps from lcc (matches IrOptimizer hook points)
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt ../debug/25.quick_sort.release.pre.ll \
  -l-post-opt ../debug/25.quick_sort.release.post.ll \
  -l ../debug/25.quick_sort.release.ll

# Same middle-end as lcc -O2 on a pre-opt module (no target metadata required)
# Note: opt -S emits LLVM IR text, not machine asm; lcc -S is machine assembly.
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
  -l-pre-opt ../debug/25.quick_sort.release.pre.ll \
  -l-post-opt ../debug/25.quick_sort.release.post.ll
```

Line counts on a typical host: pre ≈ 294, post ≈ 174 (same order as `debug/25.quick_sort.release.post.ll` modulo target metadata on the final `-l` file).

#### 1. SSA formation (`mem2reg`) — `@partition`

**Pre-opt** (`debug/25.quick_sort.release.pre.ll`): stack slots and load/store chains for locals:

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

**Post-opt** (`debug/25.quick_sort.release.post.ll`): parameters used directly; loop indices are SSA values with `phi`:

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
3. Diff `@partition` and `@swap` between `25.quick_sort.release.pre.ll` and `.post.ll`.
4. Confirm `.post.ll` is very close to `opt -passes='default<O2>'` on `.pre.ll` output (lcc’s `-O2` uses the same pipeline).

---

## Codegen opt level & asm diff (M12)

IR `-O` runs in `IrOptimizer` (middle-end). The same CLI level is forwarded to `TargetBackend` as LLVM **`CodeGenOptLevel`** for `-o` and `-S` emission. Middle-end and backend opt are independent layers: even with `-O0` IR you can request `-O2` codegen (unusual), and `-O2` IR with `-O0` codegen is also possible — `compile-tests.sh` uses matching pairs (`--debug` = `-g -O0`, `--release` = `-O2`).

### Mapping (LLVM 20)

| CLI | `CodeGenOptLevel` | Backend effect (summary) |
|-----|-------------------|--------------------------|
| *(none)* / `-O0` | `None` | Minimal machine peepholes; stack spills for all locals |
| `-O1` | `Less` | Light machine opts |
| `-O2`, `-Os`, `-Oz` | `Default` | Standard regalloc, peepholes, branch folding |
| `-O3` | `Aggressive` | More aggressive machine passes |

Implementation: `resolveCodeGenOptLevel()` in `src/TargetBackend.cpp`, wired from `main` via `TargetBackendOptions::optimizationLevel`.

### Case study: `25.quick_sort.c` asm (`-O0` vs `-O2`)

`compile-tests.sh` writes `debug/25.quick_sort.debug.s` (`-g -O0`) and `debug/25.quick_sort.release.s` (`-O2`). On a typical ARM64 host:

```bash
wc -l ../debug/25.quick_sort.debug.s ../debug/25.quick_sort.release.s
# 890 debug.s  vs  149 release.s  (whole file)
```

**`-O0` `@partition`** (`debug/25.quick_sort.debug.s`): parameters and locals live on the stack; each use is a `str`/`ldr` pair; `@swap` is called from the loop:

```asm
_partition:
    sub sp, sp, #48
    str x0, [sp]          ; spill array pointer
    str w1, [sp, #12]     ; spill low
    ...
    bl _swap              ; call helper every swap
```

**`-O2` `@partition`** (`debug/25.quick_sort.release.s`): SSA-style values in registers; pivot in `w9`, indices in `w1`/`w11`; swaps inlined with `ldr`/`str` (no `@swap` call in the hot loop):

```asm
_partition:
    sub w10, w2, #1
    ldr w9, [x0, w2, sxtw #2]    ; pivot in register
    ...
    ldr w13, [x8, w1, sxtw #2]
    cmp w13, w9
    ...
    str w13, [x8, w11, sxtw #2]  ; inline swap
    str w14, [x8, x12, lsl #2]
```

The release build combines **IR opts** (mem2reg, instcombine, inlining) with **backend opts** (better regalloc, dead block elimination, tail-call / call elimination). Compare with:

```bash
diff -u ../debug/25.quick_sort.debug.s ../debug/25.quick_sort.release.s | less
llvm-objdump -d ../../lcc-build/25.quick_sort.o   # after --release compile
```

### Verify M12 yourself

1. Run `./compile-tests.sh --debug 25.quick_sort.c && ./compile-tests.sh --release 25.quick_sort.c`.
2. Confirm `@partition` in `.release.s` is shorter and avoids stack spills / `@swap` calls in the loop.
3. Full suite: `./compile-tests.sh && ./link-tests.sh && ./run-tests.sh`.

---

## Auto-vectorization study (M14)

LLVM **`loop-vectorizer`** and **`slp-vectorizer`** run at `-O3` inside `IrOptimizer` (same as `opt -passes='default<O3>'`). lcc does **not** implement a custom vector pass — you observe LLVM’s on real loops.

### Study fixture

`tests/40.array_sum.c` — a simple `sum_array` reduction. **Not** in `compile-tests.sh` (study-only; avoids expanding the 40-test suite). For element-wise loops (often easier to vectorize), use the `add_arrays` snippet in the commands below.

### How lcc runs the vectorizers today

`IrOptimizer` builds a `PassBuilder` **without** a `TargetMachine`. The loop vectorizer’s **cost model** therefore uses generic defaults during `-l-post-opt` emission. CLI **`-mcpu` / `-mattr` / `--target`** apply only in `TargetBackend` (codegen), **after** IR opts — they do **not** steer `loop-vectorizer` inside lcc.

Practical effect on this host: `lcc -O3` often leaves loops **scalar in IR and asm**, even with `-mcpu native` or `-mattr +avx2`.

### Case study A: `sum_array` — lcc `-O3` (scalar)

From `lcc/scripts`:

```bash
../../lcc-build/lcc -O3 -i ../tests/40.array_sum.c -o /tmp/sum.o \
  -l-pre-opt /tmp/sum.pre.ll -l-post-opt /tmp/sum.post.ll -S /tmp/sum.s

# Post-opt IR: plain i32 phi/add loop — no <N x i32>
grep '<.* x ' /tmp/sum.post.ll || echo "no vector types"

# Asm (ARM64 example): scalar ldr/add reduction
grep -E 'ldr|add' /tmp/sum.s | head
```

**Post-opt IR** (abbreviated): a counted loop with `load i32` / `add i32` / `phi` — no `<4 x i32>`.

**Why no vector IR from lcc:** `opt` pass remarks on the same pre-opt module report *“the cost-model indicates that vectorization is not beneficial”* when no target triple is supplied (matching lcc’s `IrOptimizer` setup).

### Case study B: same IR, target-aware `opt` (vectorized)

Feed lcc’s **pre-opt** IR to `opt` with an explicit triple — vectorizers use a real cost model:

```bash
# ARM64: 4-wide i32 vectors
opt -passes='default<O3>' -mtriple=arm64-apple-darwin /tmp/sum.pre.ll -S -o /tmp/sum.arm.ll
grep '<4 x i32>' /tmp/sum.arm.ll | head

# x86_64 + AVX2: 8-wide i32 vectors (study on any host)
opt -passes='default<O3>' -mtriple=x86_64-apple-darwin -mcpu=core-avx2 \
  /tmp/sum.pre.ll -S -o /tmp/sum.avx.ll
grep '<8 x i32>' /tmp/sum.avx.ll | head
```

Then lower to asm with `llc` and look for SIMD opcodes:

```bash
llc -O3 -mtriple=arm64-apple-darwin /tmp/sum.arm.ll -o /tmp/sum.arm.s
grep -E 'add\.4s|ld1|st1' /tmp/sum.arm.s | head

llc -O3 -mtriple=x86_64-apple-darwin -mattr=+avx2 /tmp/sum.avx.ll -o /tmp/sum.avx.s
grep -E 'vpaddd|ymm|vmovdqu' /tmp/sum.avx.s | head
```

On ARM64, vectorized `@sum_array` uses **`add.4s`** (NEON 4×i32). On x86 with AVX2, **`vpaddd`** on **`ymm`** registers (8×i32).

### Case study C: element-wise `add_arrays` (1024 elements)

Copy to `/tmp/add_arrays.c` (or paste into a scratch file):

```c
int add_arrays(int* c, int* a, int* b, int n) {
  for (int i = 0; i < n; i += 1) c[i] = a[i] + b[i];
  return 0;
}
/* main initializes a[1024], b[1024] and calls add_arrays(c,a,b,1024) */
```

| Step | `lcc -O3` | `opt -O3 -mtriple=…` on `-l-pre-opt` |
|------|-----------|----------------------------------------|
| Post-opt IR | scalar load/store/add | `<4 x i32>` (ARM) or `<8 x i32>` (AVX2) |
| Asm | scalar `ldr`/`str` loop | `add.4s` / `vpaddd` |

### Case study D: `25.quick_sort.c` — not vectorizable

Even at `-O3`, quicksort’s `@partition` / `@quickSort` have **irregular control flow**, **in-loop calls** (`@swap`), and **data-dependent branches**. The vectorizers correctly no-op:

```bash
../../lcc-build/lcc -O3 -i ../tests/25.quick_sort.c -o /tmp/q.o -l-post-opt /tmp/q.post.ll
grep '<.* x ' /tmp/q.post.ll || echo "no vectors (expected)"
```

This contrasts with regular stride-1 array loops in case studies A–C.

### Pass remarks (why vectorize or not)

```bash
opt -passes='default<O3>' /tmp/sum.pre.ll -disable-output \
  -pass-remarks-missed=loop-vectorize 2>&1 | head

opt -passes='default<O3>' -mtriple=arm64-apple-darwin /tmp/sum.pre.ll -disable-output \
  -pass-remarks-analysis=loop-vectorize 2>&1 | head
```

Common reasons LLVM skips vectorization: **cost model** (generic TM), **small trip count** (constant-folded in `main`), **reduction** profitability, **control flow**, **calls in loop**, **possible aliasing**.

### Optional: `llvm-mca` on scalar asm

Isolate a loop body in a `.s` snippet and profile throughput (teaching-only; not wired into lcc):

```bash
llvm-mca -mtriple=arm64-apple-darwin -mcpu=apple-m1 -iterations=100 /tmp/sum_scalar_mca.s
```

Use vectorized asm from case study B for a before/after comparison.

### Verify M14 yourself

1. Compile `tests/40.array_sum.c` at `-O3`; confirm post-opt IR and `-S` asm are **scalar**.
2. Run `opt -passes='default<O3>' -mtriple=<host>` on `-l-pre-opt` IR; confirm **`<N x i32>`** appears.
3. Inspect asm for **NEON** (`add.4s`, …) or **AVX2** (`vpaddd`, `ymm`, …) per platform.
4. Confirm `25.quick_sort.c` at `-O3` has **no** vector IR.
5. Read pass remarks for at least one loop.

**Out of scope:** custom loop vectorizer in lcc; wiring `TargetMachine` into `IrOptimizer` (future enhancement, not required for M14).

---

## Related docs

- [LearningPlan.md](LearningPlan.md) — full learning path (M0–M18)
- [Usage.md](Usage.md) — `lcc` CLI flags (`-l-pre-opt`, `-l-post-opt`, `-ir-stats`, `-S`, `--target`, `-mcpu`, `-mattr`, `-O2`)
- [Testing.md](Testing.md) — compile modes and `debug/*.ll` artifacts
- [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md) — M9 acceptance criteria
