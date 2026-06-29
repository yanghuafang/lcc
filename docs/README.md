# lcc documentation

Guides for using, extending, and hacking on the **lcc** teaching compiler.

Start with the [README](../README.md) for a quick clone-and-run path.

## Learning path

| Document | Contents |
|----------|----------|
| [LearningPlan.md](LearningPlan.md) | **Start here** — milestones M0–M18 (front-end study, IR, opts, backend) |
| [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md) | Implementation details for middle-end & back-end milestones |
| [Roadmap.md](Roadmap.md) | Front-end & language extension plan (complete; deferrals listed) |
| [Pipeline.md](Pipeline.md) | Compiler pipeline, LLVM tools, classical opt study (M9) |

## How-to

| Document | Contents |
|----------|----------|
| [Install.md](Install.md) | Dependencies (macOS, Ubuntu), build `lcc`, `build-lcc.sh` options, manual CMake |
| [Usage.md](Usage.md) | `lcc` CLI flags, compile/link workflow, debug programs built by `lcc` |
| [Testing.md](Testing.md) | Scripts in `lcc/scripts`, unit tests, `compile-tests.sh` modes |
| [Development.md](Development.md) | Debug `lcc` itself in VS Code / LLDB |

## Reference

| Document | Contents |
|----------|----------|
| [Language.md](Language.md) | Supported C subset, limitations, manual linkage declarations |
| [Conflicts.md](Conflicts.md) | Parser shift/reduce and reduce/reduce conflicts (Bison) |
