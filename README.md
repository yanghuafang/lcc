# `lcc`: Learn C Compiler

[![CI](https://github.com/yanghuafang/lcc/actions/workflows/ci.yml/badge.svg)](https://github.com/yanghuafang/lcc/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A teaching C compiler built with **flex**, **bison**, and **LLVM 20**. It uses **bottom-up LALR** parsing (not recursive descent) so the grammar stays small enough to study and modify.

`lcc` compiles a `.c` translation unit to a `.o` object file (required `-o`). Optionally emit assembly with `-S`. Link with `clang` or `gcc` to run the program.

## Why this project

| | |
|---|---|
| **Small enough to read** | Bottom-up **LALR** grammar (flex/bison) instead of a hand-written recursive-descent parser — the whole front-end is small enough to study and modify. |
| **A real toolchain** | Emits genuine **LLVM 20** IR and native object files through `IRBuilder` and `TargetMachine` — not a toy backend. |
| **Cleanly layered** | Front-end, middle-end (`IrOptimizer`), and back-end (`TargetBackend`) are separated, so you can study or change one layer at a time. |
| **Guided curriculum** | An 18-milestone learning plan (**M0–M18**) takes you from a first build to custom LLVM passes and codegen — see [docs/LearningPlan.md](docs/LearningPlan.md). |
| **Inspectable** | Dump AST graphs (Graphviz), pre/post-optimization IR, assembly, and IR / machine-instruction stats straight from the CLI. |

## How it works

```
.c source
  │  [front-end]   flex (Lexer.l) + bison (Parser.y)
  ▼
AST  (namespace AST, rooted at g_root)
  │  [front-end]   CodeGenerator::genIrCode()  — single pass; types resolved on demand
  ▼
LLVM IR  (llvm::Module, built with IRBuilder)
  │  [middle-end]  IrOptimizer::run()  — LLVM New PM: -O0..-O3, custom passes
  ▼
Optimized IR  (+ DWARF when -g)
  │  [back-end]    TargetBackend  — llvm::TargetMachine
  ▼
.o object file  (-o)   ──optional──►   .s assembly (-S)
```

<p align="center">
  <img src="debug/0.hello_world.png" alt="AST for tests/0.hello_world.c, dumped with lcc -v and rendered by Graphviz" width="100%"><br>
  <sub>The front-end AST for <a href="tests/0.hello_world.c"><code>tests/0.hello_world.c</code></a>, dumped with <code>lcc -v out.dot</code> and rendered by Graphviz (<a href="debug/0.hello_world.png"><code>debug/0.hello_world.png</code></a>).</sub>
</p>

There is **no separate semantic-analysis pass**: C type information is resolved on demand during `genCode()`, using opaque pointers (pointee types live on the AST `VarType`, not on `llvm::Type*`). Link the resulting `.o` with `clang` or `gcc`. Full walkthrough: [docs/Pipeline.md](docs/Pipeline.md) and [docs/LearningPlan.md](docs/LearningPlan.md).

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

Build artifacts go to `../../lcc-build/` (sibling of the repo). Sample AST graphs and LLVM IR live under `lcc/debug/` — middle-end snapshots use `*.debug.pre.ll` / `*.post.ll` (or `.release.*`); final IR after object emission uses `*.debug.ll` / `*.release.ll` (see [compile modes](docs/Testing.md)).

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

# 2. Link the object with the system toolchain (on Linux, add -no-pie)
clang /tmp/sum.o -o /tmp/sum

# 3. Run it
/tmp/sum
# -> sum(1..10) = 55
```

`lcc` emits non-PIC objects, so on Linux the link step is `clang /tmp/sum.o -o /tmp/sum -no-pie`. Add `-O2` to optimize, `-S /tmp/sum.s` to also emit assembly, `-g` for a debuggable build, or `-v /tmp/sum.dot` to dump the AST graph. Full flag reference: [docs/Usage.md](docs/Usage.md).

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
│   ├── CodeGenerator.*          # LLVM context/module, scoped symbol tables
│   ├── IrOptimizer.*            # middle-end (LLVM New Pass Manager)
│   ├── TargetBackend.*          # back-end (.o / .s emission)
│   ├── DebugInfoBuilder.*       # DWARF debug info (-g)
│   ├── Visualizer.*             # Graphviz AST graphs (-v)
│   └── passes/                  # Custom LLVM passes (IR stats, fold-add-zero, machine stats)
├── tests/             # 40+ small C programs, each self-checks and prints "<name> PASS"
├── benchmarks/        # Larger workloads for bench.sh (M15)
├── scripts/           # build-lcc.sh, compile/link/run-tests.sh, smoke checks, bench
├── docs/              # Guides (start with LearningPlan.md)
├── debug/             # Committed AST / IR / asm goldens for the test suite
├── CMakeLists.txt     # flex/bison codegen + LLVM configuration
└── LICENSE            # MIT
```

## Documentation

Full index (grouped by learning path, how-to, and reference): [docs/README.md](docs/README.md).

| Guide | Topics |
|-------|--------|
| [docs/LearningPlan.md](docs/LearningPlan.md) | **Start here** — full learning path (M0–M18) |
| [docs/MiddleBackendRoadmap.md](docs/MiddleBackendRoadmap.md) | Middle/back-end implementation detail |
| [docs/Install.md](docs/Install.md) | Dependencies, build `lcc`, CMake options |
| [docs/Usage.md](docs/Usage.md) | CLI flags, link, debug compiled programs |
| [docs/Testing.md](docs/Testing.md) | Scripts, unit tests, compile modes |
| [docs/Benchmark.md](docs/Benchmark.md) | Benchmark harness, workloads, recording opt results (M15) |
| [docs/Development.md](docs/Development.md) | Debug `lcc` in VS Code / LLDB |
| [docs/Language.md](docs/Language.md) | Full feature list and limitations |
| [docs/Roadmap.md](docs/Roadmap.md) | Front-end language features (complete) |
| [docs/Pipeline.md](docs/Pipeline.md) | Pipeline overview, LLVM tool reference, opt/asm/vectorization study (M9, M12, M14) |
| [docs/Conflicts.md](docs/Conflicts.md) | Bison parser conflicts |

## Requirements

LLVM **20**, flex, bison, argparse, graphviz, CMake **3.22+**, **C++17**, and a system linker (`clang` or `gcc`). Supported platforms: **macOS** (Homebrew) and **Ubuntu 24.04 / 26.04 LTS**. See [docs/Install.md](docs/Install.md).

## Roadmap

Front-end language work (arrays through `-g` debug info) is **complete**; see [docs/Roadmap.md](docs/Roadmap.md). Middle/back-end milestones **M0–M18 are complete**, including the optional ones (M7, M8, M13, M15, M16, M17); see [docs/LearningPlan.md](docs/LearningPlan.md).

Exploratory ideas for later — real diagnostics, more C language features, and deeper optimization/back-end passes — are recorded as **unscheduled Future directions** (no milestones attached) in [docs/Roadmap.md](docs/Roadmap.md#future-directions-no-milestones) and [docs/MiddleBackendRoadmap.md](docs/MiddleBackendRoadmap.md#future-directions-no-milestones).

## Contributing

Contributions are welcome — bug fixes, new test programs, documentation, and milestone work. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for the build, test, and coding-style workflow, and run the full `compile → link → run` suite before opening a pull request.

## License

`lcc` is released under the **MIT License** — see [LICENSE](LICENSE).
