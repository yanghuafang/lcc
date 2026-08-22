# lcc compiler learning & implementation plan

The master plan for studying and extending **lcc** across the full compiler stack.

| Layer | lcc today | This plan |
| ------- | ----------- | ----------- |
| **Front-end** | flex/bison, AST, single-pass `genCode()` | Study track; language deferrals live in [Language.md](Language.md#not-supported-yet) |
| **Middle-end (IR)** | Raw IR via `IRBuilder`; `-O` via `IrOptimizer` | Observability, custom New PM passes, pipeline control |
| **Back-end** | `TargetBackend` → `.o` / `.s` on the host target | Asm via `-S`, target flags, MIR inspection |
| **Optimization** | LLVM default pipelines | Study classical opts and vectorization; optional benchmarks |

**How to use:** work through milestones **M0 → M18** in order; each has **Study**, **Implement**, and **Verify** steps. All milestones are **already implemented**, so the plan doubles as a guided tour of the code — follow it to learn, or skim a milestone to find out why something exists.

---

## Pipeline overview

[Architecture.md](Architecture.md#stages) carries the stage diagram and the map from stages to `src/` files — read it before M1 if you have not already.

**Key idea:** IR **generation** is `genCode()` + `IRBuilder`; LLVM only ever sees IR that lcc already built. `IrOptimizer` runs the custom passes first, then the LLVM pipeline. `-l-pre-opt` / `-l-post-opt` bracket the middle-end; `-l` dumps after `pipeline::emitObject()`, with target metadata attached.

The committed goldens make the `-g` branch concrete: at `-O2`, `25.quick_sort.release.pre.ll` → `.post.ll` drops 301 → 181 lines, while under `-g` the same file goes 413 → 414 — a single line of DWARF, because `-g` skips the LLVM pipeline entirely ([Usage.md](Usage.md#optimization-levels--o)).

Acceptance criteria for M4–M18: [MiddleBackendNotes.md](MiddleBackendNotes.md). Front-end language history: [FrontendNotes.md](FrontendNotes.md).

---

## Milestone checklist

If you are working through the plan yourself, do not start a milestone until the previous **Verify** step passes.

| ID | Milestone | Layer | Required? |
| ---- | ----------- | ------- | ----------- |
| **M0** | [Environment & full test run](#m0-environment--full-test-run) | — | Yes |
| **M1** | [Compiler tour (one program)](#m1-compiler-tour-one-program) | Front-end | Yes |
| **M2** | [Pipeline map & LLVM tools](#m2-pipeline-map--llvm-tools) | All | Yes |
| **M3** | [IR generation study](#m3-ir-generation-study) | Front-end / IR | Yes |
| **M4** | [Pre/post IR dumps in lcc](#m4-prepost-ir-dumps-in-lcc) | Middle-end | Yes |
| **M5** | [Extract `IrOptimizer`](#m5-extract-iroptimizer) | Middle-end | Yes |
| **M6** | [Custom New PM pass — instrumentation](#m6-custom-new-pm-pass--instrumentation) | Middle-end | Yes |
| **M7** | [Custom New PM pass — simple transform](#m7-custom-new-pm-pass--simple-transform-optional) | Optimization | Optional |
| **M8** | [Pipeline control & `-O-passes`](#m8-pipeline-control---o-passes-optional) | Optimization | Optional |
| **M9** | [Classical opts study (LLVM)](#m9-classical-opts-study-llvm) | Optimization | Yes |
| **M10** | [Extract `TargetBackend`; emit asm](#m10-extract-targetbackend-emit-asm) | Back-end | Yes |
| **M11** | [Target CLI flags](#m11-target-cli-flags) | Back-end | Yes |
| **M12** | [Codegen opt level & asm diff](#m12-codegen-opt-level--asm-diff) | Back-end | Yes |
| **M13** | [MIR inspection](#m13-mir-inspection-optional) | Back-end | Optional |
| **M14** | [Vectorization study (LLVM)](#m14-vectorization-study-llvm) | Optimization | Yes |
| **M15** | [Benchmark harness](#m15-benchmark-harness-optional) | Optimization | Optional |
| **M16** | [IR opt regression script](#m16-ir-opt-regression-script-optional) | Middle-end | Optional |
| **M17** | [Machine pass (advanced)](#m17-machine-pass-advanced-optional) | Back-end | Optional |
| **M18** | [Documentation & CI smoke](#m18-documentation--ci-smoke) | All | Yes |

**Pace, if you work through it:** roughly 1–2 weeks per required milestone part-time, with M0–M2 taking a few days.

---

## Global rules (every milestone)

1. **Correctness first** — after any lcc code change, run the full suite:

   ```bash
   cd scripts
   ./compile-tests.sh && ./link-tests.sh && ./run-tests.sh
   ```

2. **Freeze the front-end** while working the middle/back-end milestones — no grammar changes; add a small test file only if a milestone needs one.
3. **One idea per milestone**, in PR-sized commits.
4. **Artifacts** — commit IR/asm under `debug/` only when the change is intentional; avoid noisy bulk diffs.
5. **Host target only** — x86_64 or ARM64 on your machine; no new hardware required.

---

## M0: Environment & full test run

**Goal:** Confirm the build and the 45-test regression suite.

| Step | Action |
| ------ | -------- |
| Study | [Install.md](Install.md), [Testing.md](Testing.md) |
| Implement | `./build-lcc.sh`, then `./compile-tests.sh && ./link-tests.sh && ./run-tests.sh` |
| Verify | All tests `PASS`; `../../lcc-build/lcc` exists |

---

## M1: Compiler tour (one program)

**Goal:** Trace C → tokens → AST → IR for a single file.

| Step | Action |
| ------ | -------- |
| Study | Read `tests/0.hello_world.c` or `tests/12.arithmetic.c` |
| Study | `Lexer.l` (keywords), `Parser.y` (start symbol), `driver/main.cpp` (pipeline) |
| Study | Open `debug/0.hello_world.dot` and `debug/0.hello_world.debug.ll` |
| Implement | None (study only) |
| Verify | Can explain the path `yyparse` → `g_root` → `pipeline::genIr` → `pipeline::emitObject` |

**Deep-dive files:** `ast/Nodes.hpp` (header comment), `VarDecl::genCode`, `FuncDecl::genCode`.

---

## M2: Pipeline map & LLVM tools

**Goal:** Use external LLVM tools on lcc output, without changing lcc.

| Step | Action |
| ------ | -------- |
| Study | Compare `debug/25.quick_sort.debug.ll` vs `.release.ll` |
| Study | Compile modes in [Usage.md](Usage.md) |
| Implement | Run the commands below on the host |
| Verify | Can name three differences between debug and release IR |

Run from `lcc/scripts` (adjust paths for your checkout):

```bash
opt -passes='default<O2>' ../debug/25.quick_sort.debug.ll -S -o /tmp/opt.ll
llc ../debug/25.quick_sort.release.ll -o /tmp/out.s
llvm-objdump -d ../../lcc-build/25.quick_sort.o
```

---

## M3: IR generation study

**Goal:** Understand how lcc emits IR (not what LLVM passes do to it).

| Step | Action |
| ------ | -------- |
| Study | `irgen/TypeConversion.hpp` — conversions; `irgen/IrIdioms.hpp` — load/store, allocas; `irgen/Operators.hpp` — arithmetic, bitwise, comparison, GEP; `types/TypeRules.hpp` — the C type rules behind them |
| Study | Trace `ForStmt` / `IfStmt` in `irgen/StmtToIr.cpp` and `Subscript` in `irgen/ExprToIr.cpp` |
| Study | Opaque pointers: pointee types live on `VarType`, not on `llvm::Type*` — see `types/VarTypeQuery.hpp` |
| Implement | Hand-write LLVM IR for `0.hello_world.c` in a scratch file (e.g. `/tmp/hello.ll`), then diff it against `debug/0.hello_world.debug.ll` |
| Verify | Every instruction in `debug/0.hello_world.debug.ll` maps to an AST `genCode()` path |

**Key tests:** `12.arithmetic.c`, `25.quick_sort.c`, `33.array_2d_decl.c`.

Everything under `debug/` is lcc output written by `compile-tests.sh`, so your hand-written IR is a study baseline — nothing to commit.

---

## M4: Pre/post IR dumps in lcc

**Goal:** See exactly what lcc emits versus what LLVM optimizes.

| Step | Action |
| ------ | -------- |
| Implement | `-l-pre-opt <file>` and `-l-post-opt <file>` CLI flags |
| Implement | Dump raw IR **before** `IrOptimizer::run()`, and again **after** the optimizer and `-g` finalization |
| Verify | Suite PASS; `debug/<test>.<mode>.pre.ll` and `.post.ll` differ at `-O2` for `25.quick_sort.c` |

Details: [MiddleBackendNotes.md § M4](MiddleBackendNotes.md#m4-prepost-ir-dumps).

---

## M5: Extract `IrOptimizer`

**Goal:** Separate the middle-end from `CodeGenerator`.

| Step | Action |
| ------ | -------- |
| Implement | `src/opt/IrOptimizer.hpp` / `.cpp`; move `optimizeCode()` out of `CodeGenerator` |
| Implement | `pipeline::genIr` calls `IrOptimizer::run(...)` |
| Verify | IR behavior unchanged; suite PASS |

---

## M6: Custom New PM pass — instrumentation

**Goal:** Learn pass registration and the New Pass Manager.

| Step | Action |
| ------ | -------- |
| Study | LLVM docs: Writing an LLVM Pass (New PM) |
| Implement | `IrInstructionStatsPass` in `src/opt/passes/`; enable with `-ir-stats <file>` (`-` = stderr) |
| Implement | Register via `createModuleToFunctionPassAdaptor` **before** the default LLVM pipeline |
| Verify | Stats appear with the flag; suite PASS without it (no stderr noise) |

**Purpose:** a microscope, not a replacement optimizer.

---

## M7: Custom New PM pass — simple transform (optional)

**Goal:** Implement one classical idea on IR yourself.

| Step | Action |
| ------ | -------- |
| Implement | `FoldAddZeroPass` in `src/opt/passes/` — rewrites `add iN %x, 0` to `%x`; enable with `-fold-add-zero` |
| Implement | Run it before the default pipeline, like the M6 stats pass |
| Verify | Suite PASS; post-opt IR changes on `12.arithmetic.c` — see [LlvmTools.md § M7](LlvmTools.md#custom-transform-pass-m7) |

Skip if M6 already satisfies your learning goals.

---

## M8: Pipeline control & `-O-passes` (optional)

**Goal:** Compose LLVM passes explicitly instead of taking `default<O*>`.

| Step | Action |
| ------ | -------- |
| Implement | `-O-passes <pipeline>` in `opt -passes` syntax; preset `O2-peephole` = `mem2reg,instcombine,simplifycfg` |
| Implement | Reject `-O-passes` combined with `-O0`…`-Oz` (the custom pipeline replaces the default one) |
| Verify | The preset reproduces a subset of `-O2` on a small test — see [LlvmTools.md § M8](LlvmTools.md#explicit-pipeline-control-m8) |

---

## M9: Classical opts study (LLVM)

**Goal:** Know what `-O2` does, without reimplementing it.

| Step | Action |
| ------ | -------- |
| Study | `opt --print-pipeline-passes -passes='default<O2>'` on pre-opt IR |
| Study | Spot mem2reg, instcombine, GVN, and the loop passes on `25.quick_sort.c` |
| Implement | Write the notes up in [LlvmTools.md](LlvmTools.md); leave a pointer comment in `opt/IrOptimizer.cpp` |
| Verify | Explain SSA formation (`mem2reg`) on `@partition` across the pre/post dumps — see [LlvmTools.md § M9](LlvmTools.md#classical-optimization-study-m9) |

---

## M10: Extract `TargetBackend`; emit asm

**Goal:** Get machine code out of lcc itself.

| Step | Action |
| ------ | -------- |
| Implement | `src/backend/TargetBackend.hpp` / `.cpp`; move `pipeline::emitObject()` out of `CodeGenerator` |
| Implement | `-S <file>` / `--emit-assembly` — note it takes a **path**, unlike clang's boolean `-S` |
| Verify | Asm generated for `12.arithmetic.c`; suite PASS |

---

## M11: Target CLI flags

**Goal:** Control triple, CPU, and features on the host target.

| Step | Action |
|------|--------|
| Implement | `--target`, `-mcpu`, `-mattr` wired into `TargetMachine` |
| Verify | Asm changes when features change; suite PASS |

These flags reach **codegen only**. They do not steer the IR vectorizers inside `IrOptimizer` — see [M14](#m14-vectorization-study-llvm).

---

## M12: Codegen opt level & asm diff

**Goal:** Relate the IR `-O` level to backend output.

| Step | Action |
| ------ | -------- |
| Implement | Pass the optimization level through to `TargetMachine` codegen opt |
| Study | Diff asm at `-O0` vs `-O2` on a `25.quick_sort.c` hot function |
| Verify | `-O2` asm is shorter or picks better instructions — see [LlvmTools.md § M12](LlvmTools.md#codegen-opt-level--asm-diff-m12) |

---

## M13: MIR inspection (optional)

**Goal:** See machine IR and the register allocation stage.

| Step | Action |
| ------ | -------- |
| Study | `llc --print-before=greedy` and `--stop-before=greedy` on `.release.post.ll` (LLVM 20) |
| Study | Tell virtual (`%N:regbank`) from physical (`$w9`) registers, before and after regalloc |
| Implement | None required in lcc (`scripts/mir-study.sh` wraps the commands) |
| Verify | Can point to `greedy` in LLVM's codegen pipeline — see [LlvmTools.md § M13](LlvmTools.md#mir-inspection-m13) |

**Note:** MIR exists for **every** target (x86_64, ARM64), not only for new hardware ports.

---

## M14: Vectorization study (LLVM)

**Goal:** Study LLVM's **auto-vectorization** — the base plan writes no vector pass.

| Step | Action |
| ------ | -------- |
| Study | Compile `tests/40.array_sum.c` at `-O3` (a study fixture, deliberately outside the 45-test suite) |
| Study | Compare asm with and without SIMD features (`-mattr +avx2` on x86; NEON is default on ARM64) |
| Study | Optional: `llvm-mca` on the hot loop |
| Verify | Document whether LLVM vectorized and why — see [LlvmTools.md § M14](LlvmTools.md#auto-vectorization-study-m14) |

**Main finding:** `IrOptimizer` builds its pipeline without a `TargetMachine`, so the vectorizer's cost model is generic and lcc's own `-O3` usually leaves loops scalar. Feed the `-l-pre-opt` dump to `opt -mtriple=…` to see the same loops vectorize.

---

## M15: Benchmark harness (optional)

**Goal:** Compare opt levels and transforms where performance matters.

| Step | Action |
| ------ | -------- |
| Implement | `scripts/bench.sh` — compile time, IR instruction count, and runtime over `benchmarks/` workloads |
| Implement | Average wall time via `/usr/bin/time` (`--runs`, default 10) |
| Verify | Results recorded in [Benchmarks.md](Benchmarks.md); CI runs `./bench.sh --smoke` for correctness only |

Instrument-only passes (M6) need no benchmark.

---

## M16: IR opt regression script (optional)

**Goal:** Catch unintended IR changes.

| Step | Action |
|------|--------|
| Implement | `scripts/check-ir-opt.sh` — post-opt instruction counts (default), `--diff` for post-opt IR, `--release` to diff against golden `.release.ll` |
| Verify | A deliberate IR change is flagged and exits non-zero — see [Testing.md § M16](Testing.md#ir-optimization-regression-check-m16) |

---

## M17: Machine pass (advanced, optional)

**Goal:** Add one `MachineFunctionPass` on the host target — **not** a custom register allocator.

| Step | Action |
| ------ | -------- |
| Study | Backend pass registration: legacy PM + `TargetPassConfig`, separate from the IR New PM |
| Implement | `MachineInstrStatsPass` — counts machine instructions on final MIR; enable with `-machine-stats <file>` |
| Verify | Object and asm byte-identical with and without the flag (analysis-only); suite PASS |

Details: [MiddleBackendNotes.md § M17](MiddleBackendNotes.md#m17-machine-pass-advanced-optional), [LlvmTools.md § M17](LlvmTools.md#machine-function-pass-m17).

---

## M18: Documentation & CI smoke

**Goal:** Keep the repo teachable for the next reader.

| Step | Action |
| ------ | -------- |
| Implement | Document every new flag in [Usage.md](Usage.md) |
| Implement | Expand [LlvmTools.md](LlvmTools.md) with tool recipes (`opt`, `llc`, `llvm-objdump`, `llvm-mca`) |
| Implement | CI: smoke-check `-S` on one test in `.github/workflows/ci.yml` |
| Verify | [docs/README.md](README.md) links every plan doc |

---

## Front-end study track

The front-end is feature-complete ([FrontendNotes.md](FrontendNotes.md) records how it got there), but it is still worth studying:

| Topic | Where |
| ------- | -------- |
| LALR grammar | `Parser.y`, [ParserConflicts.md](ParserConflicts.md) |
| AST ownership | `ast/Nodes.hpp` header comment |
| Single-pass typing | `getExprTypeId`, `getExprVarType` during `genCode()` |
| Debug info | `irgen/DebugInfoBuilder.cpp`, the `-g` path |

Future **language** work (preprocessor, 3D arrays, `extern`) is listed in [Language.md § Not supported](Language.md#not-supported-yet) — it is not part of M0–M18.

---

## Tools reference

**lcc flags** added by this plan (full CLI reference in [Usage.md](Usage.md)):

| Flag | Milestone | Use |
| ------ | ----------- | ----- |
| `-l-pre-opt <file>` / `-l-post-opt <file>` | M4 | Raw vs middle-end IR |
| `-ir-stats <file>` | M6 | Load/store/call counts on raw IR (`-` = stderr) |
| `-fold-add-zero` | M7 | Fold `add iN %x, 0` before the LLVM pipeline |
| `-O-passes <pipeline>` | M8 | Explicit New PM pipeline (`opt -passes` syntax; preset `O2-peephole`) |
| `-S <file>` | M10 | Machine assembly via its own codegen pass |
| `--target`, `-mcpu`, `-mattr` | M11 | `TargetMachine` triple, CPU, features |
| `-machine-stats <file>` | M17 | Machine-instruction counts on final MIR (`-` = stderr) |

**External LLVM tools** — recipes in [LlvmTools.md § LLVM tool reference](LlvmTools.md#llvm-tool-reference): `opt` (pipelines, M9), `llc` (asm and MIR, M13), `llvm-objdump` (disassembly), `llvm-mca` (throughput, M14), `llvm-dwarfdump` (debug info, via [check-debug-info.sh](../scripts/check-debug-info.sh)), `dot` (AST graphs).

---

## Suggested reading

| Resource | Topic |
| ---------- | -------- |
| [LLVM Language Reference](https://llvm.org/docs/LangRef.html) | IR instructions |
| [Writing an LLVM Pass (New PM)](https://llvm.org/docs/NewPassManager.html) | Custom passes (M6–M8) |
| [LLVM Target Triple](https://llvm.org/docs/LangRef.html#target-triple) | Backend flags (M11) |
| `ast/Nodes.hpp` comment block | lcc's single-pass architecture |
| [ParserConflicts.md](ParserConflicts.md) | Parser ambiguities |

---

## Out of scope (all milestones)

This page is the index for scope questions. The table below is work lcc will **never** take on; [Future directions](#future-directions-no-milestones) links to everything that is merely unscheduled.

| Item | Why |
| ------ | ----- |
| New CPU or new LLVM backend target | A port, not a milestone |
| Custom greedy register allocator | Research-scale (see [M17](#m17-machine-pass-advanced-optional)) |
| Full loop vectorizer implementation | Use LLVM's (see [M14](#m14-vectorization-study-llvm)) |
| Preprocessor, 3D arrays | Front-end deferrals, listed in [Language.md § Not supported](Language.md#not-supported-yet) |
| Optimized debugging (`dbg.value` salvage) | Why `-g` skips IR opts instead of mixing them; see [Usage.md](Usage.md) |

---

## Future directions (no milestones)

M0–M18 cover lcc's teaching goals. Ideas beyond them are recorded but deliberately unscheduled — unlike the items above, which are never planned:

- [FrontendNotes.md § Future directions](FrontendNotes.md#future-directions-no-milestones) — real diagnostics and more C features (`goto`, function pointers, bit-fields, …).
- [MiddleBackendNotes.md § Future directions](MiddleBackendNotes.md#future-directions-no-milestones) — deeper IR/MIR passes, a vectorization-candidate reporter, opt remarks.

---

## Related docs

| Document | Role |
| ---------- | ------ |
| [MiddleBackendNotes.md](MiddleBackendNotes.md) | Acceptance criteria and API sketches for M4–M18 |
| [FrontendNotes.md](FrontendNotes.md) | Front-end language features (complete) |
| [LlvmTools.md](LlvmTools.md) | Tool cookbook and per-milestone case studies |
| [Usage.md](Usage.md) | Full CLI reference |
| [Testing.md](Testing.md) | Scripts, compile modes, CI |
| [DebuggingLcc.md](DebuggingLcc.md) | Debug lcc in VS Code / LLDB |
