# `lcc`: Learn C Compiler

A teaching C compiler built with **flex**, **bison**, and **LLVM 20**. It uses **bottom-up LALR** parsing (not recursive descent) so the grammar stays small enough to study and modify.

`lcc` compiles a `.c` translation unit to a `.o` object file (required `-o`). Optionally emit assembly with `-S`. Link with `clang` or `gcc` to run the program.

## Quick start

```bash
git clone git@github.com:yanghuafang/lcc.git
cd lcc/scripts

# macOS: brew install flex bison llvm@20 argparse graphviz cmake
# Ubuntu 24.04: ./install-deps-ubuntu.sh

./build-lcc.sh
./compile-tests.sh 0.hello_world.c
./link-tests.sh 0.hello_world.c
./run-tests.sh 0.hello_world.c
```

Expected output: `0.hello_world.c PASS`

Full regression suite:

```bash
./compile-tests.sh && ./link-tests.sh && ./run-tests.sh
```

Build artifacts go to `../../lcc-build/` (sibling of the repo). Sample AST graphs and LLVM IR live under `lcc/debug/` (IR files use `.debug.ll` or `.release.ll` suffixes matching [compile modes](docs/Testing.md)).

## What it supports (summary)

Types (builtin, struct, union, enum), pointers, 1D/2D arrays and brace init, `typedef`, file/block `static`, functions, `sizeof`, casts, full expression/statement grammar (control flow, `break`/`continue`), and `-g` DWARF for debuggable builds.

**Not included:** preprocessor (`#include`, `#define`), 3D arrays, `extern` variables, block-scope `typedef`.

Details: [docs/Language.md](docs/Language.md)

## Documentation

Full index (grouped by learning path, how-to, and reference): [docs/README.md](docs/README.md).

| Guide | Topics |
|-------|--------|
| [docs/LearningPlan.md](docs/LearningPlan.md) | **Start here** — full learning path (M0–M18) |
| [docs/MiddleBackendRoadmap.md](docs/MiddleBackendRoadmap.md) | Middle/back-end implementation detail |
| [docs/Install.md](docs/Install.md) | Dependencies, build `lcc`, CMake options |
| [docs/Usage.md](docs/Usage.md) | CLI flags, link, debug compiled programs |
| [docs/Testing.md](docs/Testing.md) | Scripts, unit tests, compile modes |
| [docs/Development.md](docs/Development.md) | Debug `lcc` in VS Code / LLDB |
| [docs/Language.md](docs/Language.md) | Full feature list and limitations |
| [docs/Roadmap.md](docs/Roadmap.md) | Front-end language features (complete) |
| [docs/Pipeline.md](docs/Pipeline.md) | Pipeline overview, LLVM tools, classical opt study (M9) |
| [docs/Conflicts.md](docs/Conflicts.md) | Bison parser conflicts |

## Requirements

LLVM **20**, flex, bison, argparse, graphviz, CMake **3.22+**, **C++17**, and a system linker (`clang` or `gcc`). Supported platforms: **macOS** (Homebrew) and **Ubuntu 24.04 LTS**. See [docs/Install.md](docs/Install.md).

## Roadmap

Front-end language work (arrays through `-g` debug info) is **complete**; see [docs/Roadmap.md](docs/Roadmap.md). Next: middle-end IR, optimization, and backend — follow [docs/LearningPlan.md](docs/LearningPlan.md) milestone by milestone.
