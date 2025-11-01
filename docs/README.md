# lcc documentation

Guides for using, extending, and hacking on the **lcc** teaching compiler.

Start with the [README](../README.md) for a quick clone-and-run path, then [LearningPlan.md](LearningPlan.md) for the full milestone path **M0–M18**.

## Learning path

| Document | Contents |
|----------|----------|
| [LearningPlan.md](LearningPlan.md) | **Start here** — milestones M0–M18 (front-end study, IR, opts, backend, docs/CI) |
| [MiddleBackendNotes.md](MiddleBackendNotes.md) | Implementation details & acceptance criteria for middle/back-end milestones (M4–M17) |
| [FrontendNotes.md](FrontendNotes.md) | Front-end language extension plan (complete; deferrals listed) |
| [LlvmTools.md](LlvmTools.md) | Compiler pipeline, LLVM tool reference (`opt`, `llc`, `objdump`, `mca`), study notes (M9, M12–M15, M17) |

## How-to

| Document | Contents |
|----------|----------|
| [Install.md](Install.md) | Dependencies (macOS, Ubuntu), build `lcc`, `build-lcc.sh` options, manual CMake |
| [Usage.md](Usage.md) | `lcc` CLI flags (`-l-pre-opt`, `-l-post-opt`, `-ir-stats`, `-machine-stats`, `-S`, target flags, `-O0`…`-O3`) |
| [Testing.md](Testing.md) | Scripts in `lcc/scripts`, unit tests, compile modes, CI smoke checks |
| [Benchmarks.md](Benchmarks.md) | **Benchmark harness** — `bench.sh`, `benchmarks/`, opt variants, results log (M15) |
| [DebuggingLcc.md](DebuggingLcc.md) | Debug `lcc` itself in VS Code / LLDB |

## Reference

| Document | Contents |
|----------|----------|
| [Language.md](Language.md) | Supported C subset, limitations, manual linkage declarations |
| [ParserConflicts.md](ParserConflicts.md) | Parser shift/reduce and reduce/reduce conflicts (Bison) |

## Milestone map (quick index)

| Milestone | Topic | Primary doc |
|-----------|-------|-------------|
| M0–M3 | Build, tour, IR generation study | [LearningPlan.md](LearningPlan.md), [Testing.md](Testing.md) |
| M4–M5 | IR dumps, `IrOptimizer` | [MiddleBackendNotes.md](MiddleBackendNotes.md), [Usage.md](Usage.md) |
| M6–M8 | `-ir-stats`, `-fold-add-zero`, `-O-passes` | [MiddleBackendNotes.md](MiddleBackendNotes.md), [LlvmTools.md](LlvmTools.md#explicit-pipeline-control-m8) |
| M9 | Classical LLVM opts on `-O2` | [LlvmTools.md](LlvmTools.md#classical-optimization-study-m9) |
| M10–M12 | `TargetBackend`, `-S`, codegen opt level | [MiddleBackendNotes.md](MiddleBackendNotes.md), [LlvmTools.md](LlvmTools.md#codegen-opt-level--asm-diff-m12) |
| M13 | MIR inspection (`llc`, `mir-study.sh`) | [LlvmTools.md](LlvmTools.md#mir-inspection-m13) |
| M14 | Auto-vectorization study | [LlvmTools.md](LlvmTools.md#auto-vectorization-study-m14) |
| M15 | Benchmark harness (`bench.sh`, `benchmarks/`) | [Benchmarks.md](Benchmarks.md) |
| M16 | IR opt regression (`check-ir-opt.sh`) | [Testing.md](Testing.md#ir-optimization-regression-check-m16) |
| M17 | Machine pass (`-machine-stats`, `MachineInstrStatsPass`) | [LlvmTools.md](LlvmTools.md#machine-function-pass-m17) |
| M18 | Tool recipes & CI smoke | [LlvmTools.md](LlvmTools.md#llvm-tool-reference), [Testing.md](Testing.md) |

All milestones **M0–M18 are complete**, including the optional ones (M7, M8, M13, M15, M16, M17). Implementation detail for M4–M17 lives in [MiddleBackendNotes.md](MiddleBackendNotes.md).
