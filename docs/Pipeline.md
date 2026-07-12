# Compiler pipeline & LLVM tools

**Status:** Complete tool reference and study notes (M9, M12, M14); CI smoke recipes below.

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

## LLVM tool reference

Run from `lcc/scripts` after `source ./build-env.sh` (LLVM 20 on `PATH`). Use committed `debug/*.ll` artifacts or fresh dumps from `lcc -l-pre-opt` / `-l-post-opt` / `-l`.

| Tool | Role | Typical input | Example |
|------|------|---------------|---------|
| **`lcc`** | Full pipeline: C → IR → opt → `.o` / `.s` | `.c` | `../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -S /tmp/q.s` |
| **`opt`** | IR passes (same pipelines as `IrOptimizer`) | `.ll` | `opt -passes='default<O2>' ../debug/25.quick_sort.release.pre.ll -S -o /tmp/q-opt.ll` |
| **`llc`** | IR → machine asm (external backend) | `.ll` | `llc -O2 ../debug/25.quick_sort.release.post.ll -o /tmp/out.s` |
| **`llvm-objdump`** | Disassemble `.o` / inspect sections | `.o` | `llvm-objdump -d ../../lcc-build/25.quick_sort.o` |
| **`llvm-mca`** | Throughput / port analysis on asm snippets | `.s` | `llvm-mca -mtriple=arm64-apple-darwin -iterations=100 loop.s` |
| **`llvm-dwarfdump`** | Inspect DWARF in objects | `.o` | `llvm-dwarfdump --name=main ../../lcc-build/0.hello_world.o` |
| **`dot`** | Render AST graphs | `.dot` | `dot ../debug/0.hello_world.dot -T png -o /tmp/ast.png` |

### `opt` — middle-end IR

```bash
# List passes in the O2 default pipeline (LLVM 20)
opt --print-pipeline-passes -passes='default<O2>' \
  ../debug/25.quick_sort.release.pre.ll -disable-output

# Run O3 with target triple (vectorizer cost model) on lcc pre-opt IR
../../lcc-build/lcc -O3 -i ../tests/40.array_sum.c -o /tmp/s.o -l-pre-opt /tmp/s.pre.ll
opt -passes='default<O3>' -mtriple=arm64-apple-darwin /tmp/s.pre.ll -S -o /tmp/s.vec.ll

# Pass remarks (why loop-vectorizer skipped or ran)
opt -passes='default<O3>' /tmp/s.pre.ll -disable-output \
  -pass-remarks-missed=loop-vectorize 2>&1 | head
```

`-S` on `opt` writes **LLVM IR text**, not machine assembly. For machine asm from IR, use **`lcc -S`** or **`llc`**.

### `llc` — IR to assembly (study)

```bash
# Lower post-opt IR to asm (host default triple)
llc -O2 ../debug/25.quick_sort.release.post.ll -o /tmp/q.s

# Cross-target / feature study (x86 AVX2 example)
llc -O3 -mtriple=x86_64-unknown-linux-gnu -mattr=+avx2 /tmp/s.vec.ll -o /tmp/s.avx.s

# MIR inspection (LLVM 20): stop before regalloc or print around greedy
llc -O2 --stop-before=greedy ../debug/25.quick_sort.release.post.ll -o /tmp/q.pre-regalloc.mir

llc -O2 --filter-print-funcs=partition \
  --print-before=greedy --print-after=greedy \
  ../debug/25.quick_sort.release.post.ll -o /dev/null 2>&1 | less
```

### `llvm-objdump` — object files

```bash
# Full disassembly of a test object
llvm-objdump -d ../../lcc-build/12.arithmetic.o

# Compare with lcc -S output for the same test
../../lcc-build/lcc -O2 -i ../tests/12.arithmetic.c -o /tmp/a.o -S /tmp/a.s
diff -u <(grep -v '^\s*\.' /tmp/a.s | head -40) \
        <(llvm-objdump -d --no-show-raw-insn /tmp/a.o | head -40) || true
```

### `llvm-mca` — asm throughput (optional)

Extract a hot loop from `lcc -S` or `llc` output into a standalone `.s` snippet, then:

```bash
llvm-mca -mtriple=arm64-apple-darwin -mcpu=generic -iterations=200 loop.s
```

See [M14 vectorization study](#auto-vectorization-study-m14) for scalar vs vector loop examples.

### CI smoke checks

CI (`.github/workflows/ci.yml`, matrix over Ubuntu 24.04 / 26.04 and macOS) runs, in order: build → full compile/link/run suite → `check-debug-info.sh` → **`check-asm-smoke.sh`** → `check-machine-pass-smoke.sh` → `bench.sh --smoke`.

Local equivalents:

```bash
./compile-tests.sh && ./link-tests.sh && ./run-tests.sh
./check-debug-info.sh
./check-asm-smoke.sh
```

`check-asm-smoke.sh` compiles `12.arithmetic.c` with `-O2 -S` and verifies non-empty asm containing `main`. `compile-tests.sh` already emits `debug/*.s` for all 41 tests; the smoke script is a fast explicit `-S` gate.

---

## Custom transform pass (M7)

`FoldAddZeroPass` is a **New PM function pass** that rewrites integer `add` with a zero constant:

| Before | After |
|--------|-------|
| `%t = add i32 %x, 0` | uses `%x` directly; `add` erased |
| `%t = add i32 0, %x` | same |

Enable with **`-fold-add-zero`** (disabled by default so `compile-tests.sh` goldens stay unchanged). Runs in `IrOptimizer` **before** optional `-ir-stats` output and before the LLVM default pipeline.

### Case study: `tests/12.arithmetic.c`

The test includes `if (a + 0 != 37) err = 1;` so raw IR contains a foldable `add`.

```bash
../../lcc-build/lcc -fold-add-zero -i ../tests/12.arithmetic.c -o /tmp/a.o \
  -l-pre-opt /tmp/a.pre.ll -l-post-opt /tmp/a.post.ll
```

**Pre-opt** (`@main`):

```llvm
  %55 = load i32, ptr %a, align 4
  %56 = add i32 %55, 0
  %57 = icmp ne i32 %56, 37
```

**Post-opt** (after `FoldAddZeroPass` only — no `-O`):

```llvm
  %55 = load i32, ptr %a, align 4
  %56 = icmp ne i32 %55, 37
```

With **`-O2 -fold-add-zero`**, LLVM’s `instcombine` would also fold this; use **`-fold-add-zero` alone** (no `-O`) to see only the custom pass effect. Semantics unchanged — full suite PASS.

### Verify M7 yourself

1. Run the commands above; confirm `add …, 0` disappears from post-opt IR.
2. `./compile-tests.sh && ./link-tests.sh && ./run-tests.sh` (pass runs **off** by default).
3. Read `src/passes/FoldAddZeroPass.cpp` — compare with `IrInstructionStatsPass` (M6).

---

## Explicit pipeline control (M8)

`-O-passes` uses LLVM **`PassBuilder::parsePassPipeline`** — the same pass names and comma syntax as `opt -passes='…'`. It replaces `default<O*>` for the middle-end; it does **not** change backend codegen unless you also pass a separate `-O` level (but `-O-passes` and `-O0`…`-Oz` cannot appear on the same command line).

| Flag | Middle-end | Backend |
|------|------------|---------|
| `-O2` | `default<O2>` pipeline | `CodeGenOptLevel::Default` |
| `-O-passes O2-peephole` | `mem2reg,instcombine,simplifycfg` only | `CodeGenOptLevel::None` (no `-O` on CLI) |
| `-O-passes …` + `-O2` | **Error** (mutually exclusive) | — |

Preset **`O2-peephole`** is a teaching subset of `-O2`: SSA formation (`mem2reg`), peephole cleanup (`instcombine`), and CFG cleanup (`simplifycfg`). It omits interprocedural, loop, and vector passes that full `-O2` runs afterward.

### Case study: `25.quick_sort.c`

From `lcc/scripts`:

```bash
# Explicit pass list
../../lcc-build/lcc -O-passes mem2reg,instcombine,simplifycfg -i ../tests/25.quick_sort.c -o /tmp/q.o

# Preset (same three passes)
../../lcc-build/lcc -O-passes O2-peephole -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/q.pre.ll -l-post-opt /tmp/q.peephole.ll

# Compare with full -O2
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q2.o -l-post-opt /tmp/q.o2.ll
```

Typical line counts: pre ≈ 294, **peephole ≈ 146**, full **O2 ≈ 174**. The preset removes most stack `alloca`s (mem2reg) and simplifies `@swap` / `@partition`, but does not run loop opts or inlining — so peephole IR can be **smaller** than full O2 on some tests while still doing less work.

Verify SSA on `@partition`: peephole post-opt IR should show `phi` nodes for loop indices (same family of change as M9, but without later GVN/licm).

### Verify M8 yourself

1. `-O-passes mem2reg,instcombine,simplifycfg` on `25.quick_sort.c` — post-opt IR differs from pre-opt; program still runs correctly.
2. `-O-passes O2-peephole` vs `-O2` — compare `-l-post-opt` line counts and `@partition` shape.
3. `-O-passes not-a-real-pass` — expect clear error.
4. `-O2 -O-passes mem2reg` — expect mutual-exclusivity error.
5. Full suite without `-O-passes`: `./compile-tests.sh && ./link-tests.sh && ./run-tests.sh`.

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

## MIR inspection (M13)

**No lcc code required.** MIR (Machine IR) is LLVM’s target-specific representation **after** instruction selection and **before** final assembly text. Every backend (x86_64, ARM64, …) lowers through MIR; register names differ by target (`$w9` on ARM64, `$eax` on x86_64) but the concepts are the same.

### Where MIR sits

```text
LLVM IR (.ll)          lcc IrOptimizer / opt
       ↓
   llc (codegen)
       ↓
Instruction selection  →  MIR basic blocks (bb.N), virtual regs (%0, %15, …)
       ↓
Machine SSA opts       →  peephole, scheduling, CFI, …
       ↓
Greedy regalloc        →  map virtual regs to physical ($x0, $w9, …)
       ↓
Prolog/epilog, asm     →  .s / .o
```

`TargetBackend` in lcc calls the same legacy codegen path as **`llc`**: `addPassesToEmitFile` runs the full machine pipeline. Use **`llc`** on committed `-l-post-opt` IR (or `debug/*.release.post.ll`) to inspect MIR without changing lcc. To run lcc's *own* machine pass inside that pipeline, see [Machine function pass (M17)](#machine-function-pass-m17).

### LLVM 20 commands

Older recipes used `-print-machineinstrs` and `-stop-before=registerizer`; those flags are **gone** in LLVM 20. Use `--print-before` / `--print-after` with pass name **`greedy`** (Greedy Register Allocator), or `--stop-before=greedy` to write a YAML `.mir` file.

From `lcc/scripts` (requires `llc` on `PATH` via `build-env.sh`):

```bash
source ./build-env.sh

# Write MIR stopped before register allocation
llc -O2 --stop-before=greedy ../debug/25.quick_sort.release.post.ll -o /tmp/q.pre-regalloc.mir

# Print MIR before/after regalloc for one function (stderr)
llc -O2 --filter-print-funcs=partition \
  --print-before=greedy --print-after=greedy \
  ../debug/25.quick_sort.release.post.ll -o /dev/null 2>&1 | less

# Right after instruction selection (@swap is small)
llc -O2 --filter-print-funcs=swap --print-after-isel \
  ../debug/25.quick_sort.release.post.ll -o /dev/null 2>&1 | less

# Convenience wrapper (same dumps, truncated)
./mir-study.sh
./mir-study.sh ../debug/25.quick_sort.release.post.ll swap
```

### Virtual vs physical registers

| Stage | What to look for | `@partition` example (ARM64 host) |
|-------|------------------|-----------------------------------|
| After isel | Virtual regs `%N:regbank`; args copied from `$phys` | `%15:gpr64common = COPY $x0` |
| Before `greedy` | Most operands still `%28:gpr32`, `%15:gpr64common` | `%28:gpr32 = LDRWroW %15:gpr64common, …` |
| After `greedy` | Live-in mapping updated; some `$phys` for returns | `$w0 = COPY %25.sub_32:gpr64common` (return) |
| After `prologepilog` | Operand names are physical | `renamable $w9 = LDRWroW $x0, renamable $w2, …` |

**Virtual register:** `%15:gpr64common` — numbered `%` operand, unlimited SSA names, no fixed hardware slot yet.

**Physical register:** `$x0`, `$w9` — real machine register from the target’s ABI / allocator.

MIR also keeps **`:: (load … from %ir.4)`** annotations linking machine ops back to LLVM IR values — useful when diffing against `-l-post-opt`.

### Case study: `@partition` loop body

**Before greedy** (excerpt):

```text
%28:gpr32 = LDRWroW %15:gpr64common, %25.sub_32:gpr64common, 1, 1 :: (load (s32) from %ir.9)
dead $wzr = SUBSWrr %28:gpr32, %43:gpr32, implicit-def $nzcv
Bcc 13, %bb.3, implicit killed $nzcv
```

**After prolog/epilog** (same logic, physical names):

```text
renamable $w9 = LDRWroW $x0, renamable $w2, 1, 1 :: (load (s32) from %ir.9)
dead $wzr = SUBSWrr renamable $w9, renamable $w10, implicit-def $nzcv
Bcc 13, %bb.3, implicit killed $nzcv
```

Compare with **M12 asm** (`debug/25.quick_sort.release.s`): the release `@partition` loop uses `$w9`/`$w10` directly — the end state of this pipeline.

### Verify M13 yourself

1. Run `./mir-study.sh` — confirm virtual `%…` before `greedy`, physical `$…` after `prologepilog`.
2. Open `/tmp/q.pre-regalloc.mir` — find `body:` for `@partition`; locate `bb.N` blocks and `successors:` edges (MIR CFG).
3. Sketch the codegen pipeline on paper: IR → isel → MIR → regalloc → asm (regalloc = **`greedy`** pass in LLVM 20).
4. On x86_64 Linux, repeat with the same IR; register names change but MIR structure is the same.

---

## Machine function pass (M17)

Where M13 only *inspected* MIR with `llc`, M17 adds lcc's own **`MachineFunctionPass`** to the codegen pipeline. `MachineInstrStatsPass` (`src/passes/MachineInstrStatsPass.cpp`) walks fully lowered MIR — after register allocation and prologue/epilogue insertion — and reports machine-instruction counts per function. It is **analysis only** (`runOnMachineFunction` returns `false`, `getAnalysisUsage` sets `setPreservesAll`), so the emitted `.o`/`.s` is byte-for-byte identical whether or not the pass runs.

Enable it with `-machine-stats <file>` (`-` = stderr):

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -machine-stats -
# lcc machine-instr-stats (final MIR, host target):
#   swap: 5 machine instructions
#   partition: 26 machine instructions
#   quickSort: 40 machine instructions
#   main: 36 machine instructions
#   total: functions=4 machine_instructions=107   (ARM64 host; x86_64 differs)
```

Each emitted file runs its own codegen pipeline, so passing both `-o` and `-S` reports the stats **twice** (identical counts); a `<file>` target is overwritten by the last emission. `-g` is unaffected — the object stays byte-identical with or without the flag.

### Registration: machine pass vs New PM IR pass

This is the key learning point — a machine pass registers **completely differently** from the New PM IR passes (`IrInstructionStatsPass`, `FoldAddZeroPass`) that live in the same directory:

| | IR pass (M6/M7) | Machine pass (M17) |
|--|-----------------|--------------------|
| Base class | `PassInfoMixin<T>` (New PM) | `MachineFunctionPass` (legacy PM) |
| Unit | `llvm::Function` / `Module` IR | `llvm::MachineFunction` (MIR) |
| Manager | `PassBuilder` / `ModulePassManager` in `IrOptimizer` | `legacy::PassManager` + `TargetPassConfig` in `TargetBackend` |
| Where it runs | Before object emission (middle-end) | Inside codegen, after regalloc, before AsmPrinter |
| Identity | none needed | `static char ID;` |

### How lcc splices it in

`TargetBackend` normally calls `TargetMachine::addPassesToEmitFile`, which builds the whole codegen pipeline internally with no injection point. When `-machine-stats` is set, lcc instead drives that pipeline by hand (`addEmitPassesWithMachineStats` in `TargetBackend.cpp`), mirroring LLVM's own `addPassesToEmitFile`:

```text
createPassConfig(PM)          # target's TargetPassConfig
  → addISelPasses()           # IR → MIR (instruction selection)
  → addMachinePasses()        # machine SSA opts, greedy regalloc, prolog/epilog
  → PM.add(MachineInstrStatsPass)   # ← our pass, on final MIR
  → addAsmPrinter(...)        # MIR → .s / .o
  → createFreeMachineFunctionPass()
```

The default path (no `-machine-stats`) still uses the stock `addPassesToEmitFile`, so committed `debug/*.s` and `.o` goldens are untouched.

### Verify M17 yourself

```bash
# 1. Stats print on final MIR
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -machine-stats -

# 2. The pass cannot change codegen (analysis only): object is byte-identical
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/with.o -machine-stats /tmp/m.txt
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/without.o
cmp /tmp/with.o /tmp/without.o && echo "object byte-identical"

# 3. Machine counts are target-specific — compare with the IR-layer counts
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -ir-stats -
```

**Out of scope:** custom register allocator or a transforming machine pass — M17 is one small, safe analysis pass to learn the codegen-layer registration path.

---

## Benchmark harness (M15)

**No lcc code required.** See **[Benchmark.md](Benchmark.md)** for workloads, `bench.sh` usage, variants, CI smoke, and a results log for future optimization comparisons.

Quick commands from `lcc/scripts`:

```bash
./bench.sh --smoke          # CI: compile/link/run all benchmarks × variants
./bench.sh                  # compile time + IR count + runtime tables
./bench.sh --runs 5 matrix_mul_large.c
```

---

## Auto-vectorization study (M14)

LLVM **`loop-vectorizer`** and **`slp-vectorizer`** run at `-O3` inside `IrOptimizer` (same as `opt -passes='default<O3>'`). lcc does **not** implement a custom vector pass — you observe LLVM’s on real loops.

### Study fixture

`tests/40.array_sum.c` — a simple `sum_array` reduction. **Not** in `compile-tests.sh` (study-only; avoids expanding the 41-test suite). For element-wise loops (often easier to vectorize), use the `add_arrays` snippet in the commands below.

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
- [Usage.md](Usage.md) — `lcc` CLI flags (`-l-pre-opt`, `-l-post-opt`, `-ir-stats`, `-S`, `--target`, `-mcpu`, `-mattr`, `-O0`…`-O3`)
- [Testing.md](Testing.md) — compile modes, `debug/*.ll` artifacts, CI smoke scripts
- [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md) — middle/back-end milestone acceptance criteria
- [Development.md](Development.md) — debug `lcc` in LLDB
