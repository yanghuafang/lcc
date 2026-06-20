# `lcc`: Learn C Compiler

A teaching C compiler built with **flex**, **bison**, and **LLVM 20**. It uses **bottom-up LALR** parsing (not recursive descent) so the grammar stays small enough to study and modify.

`lcc` compiles a `.c` translation unit to a `.o` object file. Link with `clang` or `gcc` to run the program.

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

Build artifacts go to `../../lcc-build/` (sibling of the repo). Sample AST graphs and LLVM IR live under `lcc/debug/` (IR files use `.debug.ll`, `.release.ll`, or `.relwithdebinfo.ll` suffixes matching [compile modes](docs/Testing.md)).

## What it supports (summary)

Types (builtin, struct, union, enum), pointers, 1D/2D arrays and brace init, `typedef`, file/block `static`, functions, `sizeof`, casts, full expression/statement grammar (control flow, `break`/`continue`), and `-g` DWARF for debuggable builds.

**Not included:** preprocessor (`#include`, `#define`), 3D arrays, `extern` variables, block-scope `typedef`.

Details: [docs/Language.md](docs/Language.md)

## Documentation

| Guide | Topics |
|-------|--------|
| [docs/README.md](docs/README.md) | Documentation index |
| [docs/Install.md](docs/Install.md) | Dependencies, build `lcc`, CMake options |
| [docs/Usage.md](docs/Usage.md) | CLI flags, link, debug compiled programs |
| [docs/Language.md](docs/Language.md) | Full feature list and limitations |
| [docs/Testing.md](docs/Testing.md) | Scripts, unit tests, compile modes |
| [docs/Development.md](docs/Development.md) | Debug `lcc` in VS Code / LLDB |
| [docs/Roadmap.md](docs/Roadmap.md) | Extension plan and future work |
| [docs/Conflicts.md](docs/Conflicts.md) | Bison parser conflicts |

## Requirements

LLVM **20**, flex, bison, argparse, graphviz, CMake **3.22+**, **C++17**, and a system linker (`clang` or `gcc`). Supported platforms: **macOS** (Homebrew) and **Ubuntu 24.04 LTS**. See [docs/Install.md](docs/Install.md).

## Roadmap

Array work through 2D and typedef are done; 3D arrays are deferred. `-g` debug info is complete for `-g`/`-O0`-style builds. See [docs/Roadmap.md](docs/Roadmap.md) for the prioritized extension plan.
