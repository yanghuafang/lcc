# Middle-end & back-end roadmap

Implementation details for [LearningPlan.md](LearningPlan.md) milestones **M4–M17**. The front-end language roadmap lives in [Roadmap.md](Roadmap.md) and is **complete**.

---

## Current baseline

| Component | File | Behavior |
|-----------|------|----------|
| IR emission | `CodeGenerator::genIrCode`, `AbstractSyntaxTree.cpp`, `Utils.cpp` | AST walk → raw `llvm::Module` |
| IR optimization | `IrOptimizer::run` | `PassBuilder::buildPerModuleDefaultPipeline` |
| IR instrumentation | `IrInstructionStatsPass` (`-ir-stats`) | New PM function pass; no IR change |
| IR transform (optional) | `FoldAddZeroPass` (`-fold-add-zero`) | New PM function pass; M7 teaching peephole |
| Object emission | `TargetBackend::emitObject` via `CodeGenerator::genObjectCode` | Host triple (or `--target`), `-mcpu`/`-mattr`, CLI `-O` → `CodeGenOptLevel`, legacy PM → `.o` |
| Assembly emission | `TargetBackend::emitAssembly` via `-S` | Same `TargetBackendOptions` as object emission |
| Debug info | `DebugInfoBuilder` | `-g` skips IR opts |
| Reference IR | `debug/*.{debug,release}.{pre,post}.ll`, `*.debug.ll`, `*.release.ll` | 40 tests × 2 modes |

Target refactor layout (introduce incrementally):

```
src/
  IrOptimizer.hpp / IrOptimizer.cpp      ← M5 (done)
  TargetBackend.hpp / TargetBackend.cpp   ← M10 (done)
  passes/
    IrInstructionStatsPass.cpp              ← M6 (done)
    FoldAddZeroPass.cpp                     ← M7 (done)
```

---

## Layer map

| Layer | Built by | Custom pass? | Manager |
|-------|----------|--------------|---------|
| IR generation | lcc `genCode()` | No | — |
| IR optimization | LLVM + optional yours | Yes (New PM) | `PassBuilder` / New PM |
| Codegen | LLVM `TargetMachine` | Optional MachineFunctionPass | Legacy PM in lcc today |
| Regalloc / machine opts | LLVM backend | Observe; don’t rewrite | Inside codegen PM |

---

## M4: Pre/post IR dumps

**Status:** done

**Acceptance criteria**

- [x] New flags documented in [Usage.md](Usage.md)
- [x] Pre-opt dump equals former raw module output (after codegen, before opts)
- [x] Post-opt dump matches current `-O2` behavior when opts run
- [x] `-g` still skips optimization; pre/post dumps reflect finalize-only path
- [x] `-l` unchanged (dumps after object emission for test script compatibility)
- [x] Full `./compile-tests.sh && ./link-tests.sh && ./run-tests.sh` PASS

**Suggested CLI** (test scripts use `debug/<test>.<mode>.pre.ll` / `.post.ll`)

| Flag | Content |
|------|---------|
| `-l-pre-opt <file>` | IR immediately after `root->genCode()` |
| `-l-post-opt <file>` | IR after `IrOptimizer::run()` and debug finalization (`-g`) |
| `-l <file>` | After `genObjectCode()` in `main` (before optional `-S`; includes target metadata; test goldens) |

**Hook in `genIrCode`** (after AST walk; reflects M5/M6):

```cpp
if (!preOptIrPath.empty()) {
  dumpIrCode(preOptIrPath);
}

const std::string optLevel =
    generateDebugInfo ? std::string{} : optimizationLevel;
IrOptimizer{}.run(*module_, optLevel, {.irStatsPath = irStatsPath});
if (generateDebugInfo) {
  debugInfo_->finalize();
}

if (!postOptIrPath.empty()) {
  dumpIrCode(postOptIrPath);
}
```

`genIrCode` always calls `IrOptimizer::run`; it no-ops unless `-O` or `-ir-stats` is set. With `-g`, `optLevel` is empty (LLVM opts skipped) but `-ir-stats` still runs. `-l` is dumped from `main` right after `genObjectCode()` (before optional `-S`), not here.

**Verify**

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/pre.ll -l-post-opt /tmp/post.ll
diff -u /tmp/pre.ll /tmp/post.ll | head
```

---

## M5: Extract `IrOptimizer`

**Status:** done

**Acceptance criteria**

- [x] No behavior change vs former `optimizeCode()`
- [x] `CodeGenerator.cpp` shrinks; IR opt logic in `IrOptimizer.cpp`
- [x] Full test suite PASS

**API** (current):

```cpp
struct IrOptimizerOptions {
  std::string irStatsPath;     // non-empty enables IrInstructionStatsPass; "-" = stderr
  bool foldAddZero = false;    // M7
  std::string customPipeline;  // M8: PassBuilder pipeline text or preset (e.g. O2-peephole)
};

class IrOptimizer {
 public:
  void run(llvm::Module& module, const std::string& optimizationLevel,
           const IrOptimizerOptions& options = {});
};
```

---

## M6: Custom New PM pass — instrumentation

**Status:** done

**Acceptance criteria**

- [x] Pass linked into `lcc` binary
- [x] Stats via `-ir-stats <file>` (`-` = stderr)
- [x] No change to program semantics — all 40 tests PASS
- [x] Pass behind `-ir-stats` (disabled by default for compile-tests.sh)

**Implementation:** `IrInstructionStatsPass` (`src/passes/`)

- Counts `load`, `store`, `call`/`invoke` per function; aggregates module totals
- Enabled only when `-ir-stats <file>` is passed (`-` writes to stderr)
- Inserted **before** `buildPerModuleDefaultPipeline` via `createModuleToFunctionPassAdaptor`

**Learning goals**

- `PassInfoMixin`, `PreservedAnalyses`
- Composing a custom pass with LLVM’s default pipeline in `ModulePassManager`

**Not in scope:** changing IR.

---

## M7: Custom New PM pass — simple transform (optional)

**Status:** done

**Acceptance criteria**

- [x] Pass removes or folds a narrow class of redundant IR (`FoldAddZeroPass`: `add iN %x, 0` → `%x`)
- [x] All tests PASS (behavior preserved; flag disabled by default in `compile-tests.sh`)
- [x] Post-opt IR diff documented for `12.arithmetic.c` ([Pipeline.md § M7](Pipeline.md#custom-transform-pass-m7))
- [ ] Optional: M15 benchmark shows no regression (or improvement)

**Implementation:** `FoldAddZeroPass` (`src/passes/`), enabled with `-fold-add-zero` before the default LLVM pipeline.

---

## M8: Pipeline control (optional)

**Status:** done

**Acceptance criteria**

- [x] `-O-passes mem2reg,instcombine,simplifycfg` runs named pipeline via `PassBuilder::parsePassPipeline`
- [x] Preset `O2-peephole` maps to the same three passes
- [x] Invalid pass name → clear error (`Invalid -O-passes pipeline "…": unknown pass name …`)
- [x] Documented interaction with `-O0`…`-O3` (mutually exclusive; `-g` skips both)

**Implementation:** `IrOptimizerOptions::customPipeline`; `-O-passes` / `--optimization-passes` in `main.cpp`.

---

## M9: Classical opts study

**Status:** done

**No lcc code required** beyond notes. Acceptance:

- [x] Listed passes that run at `-O2` on `25.quick_sort.c` ([Pipeline.md](Pipeline.md))
- [x] Identified mem2reg / SSA on `@partition` in pre/post dumps
- [x] Explained instcombine + DCE on `@swap` with IR snippets

**Commands** (LLVM 20; see [Pipeline.md](Pipeline.md) for full recipes):

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/q-pre.ll -l-post-opt /tmp/q-post.ll
opt --print-pipeline-passes -passes='default<O2>' /tmp/q-pre.ll -disable-output
```

---

## M10: Extract `TargetBackend`; emit asm

**Status:** done

**Acceptance criteria**

- [x] `-S <file>` writes assembly
- [x] `-o` still writes object (existing behavior)
- [x] Full test suite PASS

**API sketch** (current; M11 wires CLI into `TargetBackendOptions`):

```cpp
struct TargetBackendOptions {
  std::string triple;  // empty = host default
  std::string cpu = "generic";
  std::string features;
};

class TargetBackend {
 public:
  void emitObject(llvm::Module& module, const std::string& path,
                  const TargetBackendOptions& options = {});
  void emitAssembly(llvm::Module& module, const std::string& path,
                    const TargetBackendOptions& options = {});
};
```

Use `llvm::CodeGenFileType::AssemblyFile` in `addPassesToEmitFile`.

---

## M11: Target CLI flags

**Status:** done

**Acceptance criteria**

- [x] `--target <triple>` (default: host)
- [x] `-mcpu <cpu>` (default: `generic`)
- [x] `-mattr <features>` passed to `TargetMachine` (e.g. `+avx2,-sse4.1`)
- [x] Documented in Usage.md; suite PASS on host target

**Verify asm change**

```bash
# x86 example — adjust for your platform
../../lcc-build/lcc -O2 -i ../tests/12.arithmetic.c -o /tmp/a.o -S /tmp/a.s -mattr +avx2
```

---

## M12: Codegen opt level & asm diff

**Status:** done

**Acceptance criteria**

- [x] `TargetMachine` codegen opt level matches CLI `-O` (see `CodeGenOptLevel` in `TargetBackend.cpp`)
- [x] Saved asm for `25.quick_sort.c` at `-O0` and `-O2` under `debug/` (`*.debug.s` / `*.release.s` from `compile-tests.sh`)
- [x] Written comparison: instruction count and loop structure in hot function ([Pipeline.md § M12](Pipeline.md#codegen-opt-level--asm-diff-m12))

**Mapping** (LLVM 20 `CodeGenOptLevel`):

| CLI | Codegen opt |
|-----|-------------|
| *(none)* / `-O0` | `None` |
| `-O1` | `Less` |
| `-O2`, `-Os`, `-Oz` | `Default` |
| `-O3` | `Aggressive` |

**Verify asm diff**

```bash
# From lcc/scripts after compile-tests.sh (--debug = -g -O0, --release = -O2)
wc -l ../debug/25.quick_sort.debug.s ../debug/25.quick_sort.release.s
diff -u ../debug/25.quick_sort.debug.s ../debug/25.quick_sort.release.s | head
```

---

## M13: MIR inspection (optional)

**No lcc code required.**

```bash
llc -stop-before=registerizer -print-machineinstrs post.ll -o /dev/null 2>&1 | less
```

**Acceptance**

- [ ] Screenshot or notes: virtual registers before regalloc
- [ ] Can name where MIR sits in pipeline (after ISel, before asm)

---

## M14: Vectorization study

**Status:** done

**Acceptance criteria**

- [x] Loop-heavy test compiled at `-O3` (`tests/40.array_sum.c`; study-only, not in compile-tests.sh)
- [x] Asm inspected for SIMD ops (platform-dependent; see [Pipeline.md § M14](Pipeline.md#auto-vectorization-study-m14))
- [x] Short write-up: vectorized or not, and LLVM reason (cost model without TM in IrOptimizer; quick_sort control flow)
- [x] Optional: `llvm-mca` recipe on scalar loop asm in Pipeline.md

**Not required:** custom vectorization pass. LLVM `LoopVectorizer` / `SLPVectorizer` run via `-O3` pipeline.

**Optional stretch:** M6-style pass that **reports** loops that are candidates for vectorization (analysis only).

---

## M15: Benchmark harness (optional)

**Script:** `scripts/bench-opt.sh`

| Variant | Purpose |
|---------|---------|
| `-O0` vs `-O2` | LLVM opt impact |
| With vs without M7 pass | Custom transform impact |
| `-mcpu native` vs `generic` | Backend impact |

**Metrics**

- Wall time (`hyperfine --min-runs 10`)
- Optional: IR instruction count from `opt -O2` output

**CI:** do not gate on timing; gate on PASS only.

---

## M16: IR opt regression script (optional)

**Script:** `scripts/check-ir-opt.sh`

- Count instructions in post-opt IR per test
- Or diff against committed `debug/*.release.ll` when `--release` mode used

---

## M17: Machine pass (advanced, optional)

**Acceptance**

- [ ] One pass at machine layer on host target
- [ ] Does not break object correctness on chosen test
- [ ] Documented separately from IR New PM (different registration)

**Out of scope:** custom register allocator.

---

## Suggested workflow per milestone

1. Create a branch / tag `milestone-MN`.
2. Implement minimal diff.
3. Run full test suite.
4. Update [Usage.md](Usage.md) if CLI changed.
5. Check off milestone in [LearningPlan.md](LearningPlan.md) table.
6. Merge when verify checklist complete.

---

## Dependency graph

```mermaid
flowchart TD
  M4[M4 IR dumps]
  M5[M5 IrOptimizer]
  M6[M6 instrument pass]
  M7[M7 transform pass]
  M10[M10 TargetBackend]
  M11[M11 target flags]
  M14[M14 vectorization study]
  M15[M15 benchmarks]

  M4 --> M5 --> M6
  M6 --> M7
  M5 --> M8[M8 pipeline control]
  M5 --> M9[M9 classical study]
  M4 --> M10 --> M11 --> M12[M12 asm diff]
  M10 --> M13[M13 MIR]
  M11 --> M14
  M7 --> M15
  M12 --> M18[M18 docs CI]
```

M10 can start after M4 (parallel with M5–M9 if IR dumps exist).

---

## M18: Documentation & CI smoke

**Status:** done

**Acceptance criteria**

- [x] [Usage.md](Usage.md) documents all CLI flags (IR dumps, `-ir-stats`, `-S`, target flags, `-O` middle/back-end split)
- [x] [Pipeline.md](Pipeline.md) — LLVM tool reference (`opt`, `llc`, `llvm-objdump`, `llvm-mca`, `llvm-dwarfdump`)
- [x] CI: `check-asm-smoke.sh` in `.github/workflows/linux.yml`
- [x] [docs/README.md](README.md) links all plan docs and milestone index

---

## Related docs

- [LearningPlan.md](LearningPlan.md) — master milestone list
- [Roadmap.md](Roadmap.md) — front-end language features (done)
- [Pipeline.md](Pipeline.md) — pipeline & LLVM tools (M9 classical opt study; M18 may add CI recipes)
- [Testing.md](Testing.md) — regression scripts
- [Usage.md](Usage.md) — CLI reference
