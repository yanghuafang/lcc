# lcc documentation

Guides for using and extending the **lcc** teaching compiler. The [root README](../README.md) has the clone-and-run path; this page indexes everything else.

## Learning path

| Document | Contents |
|----------|----------|
| [LearningPlan.md](LearningPlan.md) | **Start here** — milestones M0–M18 (front-end study, IR, opts, backend, docs/CI) |
| [Architecture.md](Architecture.md) | Canonical stage diagram, map from `src/` files to responsibilities, and where to make a given change |
| [LlvmTools.md](LlvmTools.md) | LLVM tool reference (`opt`, `llc`, `llvm-objdump`, `llvm-mca`) and case studies (M7–M9, M12–M15, M17) |

## How-to

| Document | Contents |
|----------|----------|
| [Install.md](Install.md) | Dependencies (macOS, Ubuntu), build `lcc`, `build-lcc.sh` options, manual CMake |
| [Usage.md](Usage.md) | Full `lcc` CLI reference — IR dumps, optimization levels, target flags, linking, debugging |
| [Testing.md](Testing.md) | Scripts in `lcc/scripts`, regression suite, compile modes, CI smoke checks |
| [Benchmarks.md](Benchmarks.md) | **Benchmark harness** — `bench.sh`, `benchmarks/`, opt variants, results log (M15) |
| [DebuggingLcc.md](DebuggingLcc.md) | Debug `lcc` itself in VS Code / LLDB |

## Reference

| Document | Contents |
|----------|----------|
| [Language.md](Language.md) | Supported C subset, limitations, manual linkage declarations |
| [ParserConflicts.md](ParserConflicts.md) | Parser shift/reduce and reduce/reduce conflicts (Bison) |

## Generated API reference

The headers under `src/` carry Doxygen comments, and `scripts/docs.sh` renders them to `../../lcc-build/docs/html/index.html` — beside the build tree, for the same reason object files go there.

The prose is the same either way: the comments in the headers are the source, and reading them in place is often quicker. What the generated site adds is the two things a header cannot show — inheritance and collaboration diagrams for the `Node` hierarchy, which runs six levels deep, and a link from every declaration to the places that use it.

Configuration is [Doxyfile](doxygen/Doxyfile), which lists only the settings that differ from Doxygen's defaults, each with its reason.

## Implementation notes

How each half of the compiler was built, and what was deliberately left out. Both are closed records — the work they describe is complete.

| Document | Contents |
|----------|----------|
| [FrontendNotes.md](FrontendNotes.md) | How the front-end reached its current C feature set, priority by priority |
| [MiddleBackendNotes.md](MiddleBackendNotes.md) | What each middle/back-end milestone (M4–M18) built, with acceptance criteria and how to verify it |

## Milestone map (quick index)

Milestones are defined in [LearningPlan.md](LearningPlan.md), with acceptance criteria for M4–M18 in [MiddleBackendNotes.md](MiddleBackendNotes.md). This table points instead at the doc that shows the work in practice.

| Milestone | Topic | Where to look |
|-----------|-------|---------------|
| M0–M1 | Build, full test run, first compiler tour | [Install.md](Install.md), [Testing.md](Testing.md), [Architecture.md](Architecture.md) |
| M2–M3 | LLVM tools on lcc output, IR generation study | [LlvmTools.md](LlvmTools.md#where-the-flags-hook-in), [Architecture.md](Architecture.md) |
| M4–M5 | Pre/post IR dumps, `IrOptimizer` | [Usage.md](Usage.md#ir-dump-flags), [MiddleBackendNotes.md](MiddleBackendNotes.md#m5-extract-iroptimizer) |
| M6–M8 | `-ir-stats`, `-fold-add-zero`, `-O-passes` | [LlvmTools.md M7](LlvmTools.md#custom-transform-pass-m7) / [M8](LlvmTools.md#explicit-pipeline-control-m8) |
| M9 | Classical LLVM opts at `-O2` | [LlvmTools.md](LlvmTools.md#classical-optimization-study-m9) |
| M10–M12 | `TargetBackend`, `-S`, codegen opt level | [LlvmTools.md](LlvmTools.md#codegen-opt-level--asm-diff-m12) |
| M13 | MIR inspection (`llc`, `mir-study.sh`) | [LlvmTools.md](LlvmTools.md#mir-inspection-m13) |
| M14 | Auto-vectorization study | [LlvmTools.md](LlvmTools.md#auto-vectorization-study-m14) |
| M15 | Benchmark harness (`bench.sh`, `benchmarks/`) | [Benchmarks.md](Benchmarks.md) |
| M16 | IR opt regression (`check-ir-opt.sh`) | [Testing.md](Testing.md#ir-optimization-regression-check-m16) |
| M17 | Machine pass (`-machine-stats`, `MachineInstrStatsPass`) | [LlvmTools.md](LlvmTools.md#machine-function-pass-m17) |
| M18 | Flag docs, tool recipes, CI smoke | [LlvmTools.md](LlvmTools.md#llvm-tool-reference), [Testing.md](Testing.md#ci) |
