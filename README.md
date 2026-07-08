# `lcc`: Learn C Compiler

[![CI](https://github.com/yanghuafang/lcc/actions/workflows/ci.yml/badge.svg)](https://github.com/yanghuafang/lcc/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A teaching C compiler built with **flex**, **bison**, and **LLVM 20**. It uses **bottom-up LALR** parsing (not recursive descent) so the grammar stays small enough to study and modify.

`lcc` compiles a `.c` translation unit to a `.o` object file (required `-o`). Link with `clang` or `gcc` to run the program.

## Why this project

| | |
|---|---|
| **Small enough to read** | Bottom-up **LALR** grammar (flex/bison) instead of a hand-written recursive-descent parser — the whole front-end is small enough to study and modify. |
| **A real toolchain** | Emits genuine **LLVM 20** IR and native object files through `IRBuilder` and `llvm::TargetMachine` — not a toy backend. |
| **Single-pass design** | No separate semantic-analysis pass — C type information is resolved on demand while `genCode()` emits IR. |
| **Inspectable** | Dump the AST as a Graphviz graph (`-v`) and the LLVM IR (`-l`) straight from the CLI. |
| **Debuggable output** | `-g` emits DWARF so you can single-step the **generated** C program in LLDB. |

## How it works

```
.c source
  │  [front-end]   flex (Lexer.l) + bison (Parser.y)
  ▼
AST  (namespace AST, rooted at g_root)   ──optional──►   AST graph (-v, Graphviz)
  │  [codegen]     CodeGenerator::genIrCode()  — single pass; types resolved on
  │                demand; LLVM -O0..-O3 optimization; DWARF when -g
  ▼
LLVM IR  (llvm::Module, built with IRBuilder)
  │  [backend]     CodeGenerator::genObjectCode()  — llvm::TargetMachine
  ▼
.o object file  (-o)   ──optional──►   .ll IR dump (-l)
```

<p align="center">
  <img src="debug/0.hello_world.png" alt="AST for tests/0.hello_world.c, dumped with lcc -v and rendered by Graphviz" width="100%"><br>
  <sub>The front-end AST for <a href="tests/0.hello_world.c"><code>tests/0.hello_world.c</code></a>, dumped with <code>lcc -v out.dot</code> and rendered by Graphviz (<a href="debug/0.hello_world.png"><code>debug/0.hello_world.png</code></a>).</sub>
</p>

There is **no separate semantic-analysis pass**: C type information is resolved on demand during `genCode()`, using opaque pointers (pointee types live on the AST `VarType`, not on `llvm::Type*`). Link the resulting `.o` with `clang` or `gcc`.

## Quick start

```bash
git clone git@github.com:yanghuafang/lcc.git
cd lcc/scripts

# macOS: ./install-deps-macos.sh
# Ubuntu 24.04 / 26.04: ./install-deps-ubuntu.sh

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

## Compile and run your own program

The Quick start above uses the test harness; under the hood it is a plain `compile → link → run` flow that works on any C file in the [supported subset](docs/Language.md). Since there is **no preprocessor**, declare the libc functions you use.

```c
// sum.c
int printf(char*, ...);

int main() {
  int total = 0;
  for (int i = 1; i <= 10; i++) {
    total += i;
  }
  printf("sum(1..10) = %d\n", total);
  return 0;
}
```

Save it as `/tmp/sum.c`, then from `lcc/scripts` (after `./build-lcc.sh`):

```bash
# 1. Compile C -> object with lcc (-i and -o are both required)
../../lcc-build/lcc -i /tmp/sum.c -o /tmp/sum.o

# 2. Link the object with the system toolchain
clang /tmp/sum.o -o /tmp/sum

# 3. Run it
/tmp/sum
# -> sum(1..10) = 55
```

`lcc` emits position-independent objects, so the same link step works on macOS and Linux without `-no-pie`. Add `-O2` to optimize, `-g` for a debuggable build, or `-v /tmp/sum.dot` to dump the AST graph. Full flag reference: [docs/Usage.md](docs/Usage.md).

## What it supports (summary)

Types (builtin, struct, union, enum), pointers, 1D/2D arrays and brace init, `typedef`, file/block `static`, functions, `sizeof`, casts, full expression/statement grammar (control flow, `break`/`continue`), and `-g` DWARF for debuggable builds.

**Not included:** preprocessor (`#include`, `#define`), 3D arrays, `extern` variables, block-scope `typedef`.

Details: [docs/Language.md](docs/Language.md)

## Repository layout

```
lcc/
├── src/               # Compiler sources
│   ├── Lexer.l                  # flex lexer
│   ├── Parser.y                 # bison LALR grammar
│   ├── AbstractSyntaxTree.*     # AST nodes + genCode() IR emission
│   ├── CodeGenerator.*          # LLVM context/module, IR + object emission, symbol tables
│   ├── DebugInfoBuilder.*       # DWARF debug info (-g)
│   ├── Utils.*                  # IR helpers (casts, load/store, GEP)
│   ├── Visualizer.*             # Graphviz AST graphs (-v)
│   └── Types.hpp                # shared type ids
├── tests/             # 40+ small C programs, each self-checks and prints "<name> PASS"
├── scripts/           # build-lcc.sh, compile/link/run-tests.sh, check-debug-info.sh
├── docs/              # Guides (start with Install.md and Usage.md)
├── debug/             # Committed AST / IR goldens for the test suite
├── CMakeLists.txt     # flex/bison codegen + LLVM configuration
└── LICENSE            # MIT
```

## Documentation

Full index: [docs/README.md](docs/README.md).

| Guide | Topics |
|-------|--------|
| [docs/Install.md](docs/Install.md) | Dependencies, build `lcc`, CMake options |
| [docs/Usage.md](docs/Usage.md) | CLI flags, link, debug compiled programs |
| [docs/Language.md](docs/Language.md) | Full feature list and limitations |
| [docs/Testing.md](docs/Testing.md) | Scripts, unit tests, compile modes |
| [docs/Development.md](docs/Development.md) | Debug `lcc` in VS Code / LLDB |
| [docs/Roadmap.md](docs/Roadmap.md) | Extension plan and future work |
| [docs/Conflicts.md](docs/Conflicts.md) | Bison parser conflicts |

## Requirements

LLVM **20**, flex, bison, argparse, graphviz, CMake **3.22+**, **C++17**, and a system linker (`clang` or `gcc`). Supported platforms: **macOS** (Homebrew) and **Ubuntu 24.04 / 26.04 LTS**. See [docs/Install.md](docs/Install.md).

## Roadmap

Array work through 2D and typedef are done; 3D arrays are deferred. `-g` debug info is complete for `-g`/`-O0`-style builds. See [docs/Roadmap.md](docs/Roadmap.md) for the prioritized extension plan.

## Contributing

Contributions are welcome — bug fixes, new test programs, documentation, and language features. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for the build, test, and coding-style workflow, and run the full `compile → link → run` suite before opening a pull request.

## License

`lcc` is released under the **MIT License** — see [LICENSE](LICENSE).
