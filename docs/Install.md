# Install and build

## Requirements

On both macOS and Ubuntu:

- **LLVM 20** (libraries and tools such as `llvm-dwarfdump`)
- **flex**, **bison**
- **argparse** (CMake `find_package` or FetchContent fallback)
- **graphviz** (`dot` for AST images)
- A system C/C++ linker (**`clang`** or **`gcc`**) to link `.o` files produced by `lcc`
- **CMake 3.22+** (`cmake_minimum_required` in the project)
- **C++17** (`CMAKE_CXX_STANDARD` in `CMakeLists.txt`; required by LLVM 20 headers)

Build output lives in `../../lcc-build/` relative to `lcc/scripts/` (sibling of the repo checkout).

## Install dependencies

### macOS

```bash
brew install flex bison llvm@20 argparse graphviz cmake
```

### Ubuntu 24.04 LTS

`llvm-20` and `libargparse-dev` are available from Ubuntu apt on **24.04 LTS**. Other releases (e.g. 22.04, 26.04) are not supported.

From `lcc/scripts`:

```bash
./install-deps-ubuntu.sh
```

Or manually:

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake flex bison graphviz clang git \
  llvm-20 llvm-20-dev llvm-20-tools libargparse-dev
```

On Ubuntu, **g++** (from `build-essential`) builds `lcc` by default; **clang** at `/usr/bin/clang` links test executables (`LCC_LINKER`). See [Testing.md](Testing.md).

## Build `lcc`

```bash
git clone git@github.com:yanghuafang/lcc.git
cd lcc/scripts
./build-lcc.sh
```

The compiler binary is `../../lcc-build/lcc`. `build-lcc.sh` sources `build-env.sh`, which configures `PATH` for flex, bison, and LLVM 20 tools on macOS (Homebrew) and Ubuntu (`/usr/lib/llvm-20`).

### `build-lcc.sh` options

Build mode (optional, at most one):

| Flag | Effect |
|------|--------|
| *(none)* | `CMAKE_BUILD_TYPE=Release` |
| `--debug` | Debug symbols, no optimization (`Debug`) |
| `--release` | Optimized, no debug info (`Release`) |
| `--relwithdebinfo` | Optimized with debug symbols (`RelWithDebInfo`) |

Other flags:

| Flag | Effect |
|------|--------|
| `--parse` | Regenerate `src/Parser.counterexamples` (Bison `-Wcounterexamples`) before building; combinable with a build mode, e.g. `./build-lcc.sh --debug --parse` |

### Manual build (optional)

```bash
cd lcc/scripts
source build-env.sh
cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Debug
cmake --build ../../lcc-build
```

To build `lcc` with Clang instead of the platform default:

```bash
CXX=clang++ ./build-lcc.sh
```

### Generate lexer/parser by hand

From `lcc/src`:

```bash
flex Lexer.l
bison -d Parser.y                              # Parser.cpp / Parser.hpp
bison -d Parser.y -v                           # Parser.output (conflicts)
bison -d Parser.y -v -Wcounterexamples &> Parser.counterexamples
```

Building `lcc` (or running `bison` on `Parser.y`) reports **48 shift/reduce** and **6 reduce/reduce** conflicts. That is expected for this compact grammar: Bison resolves them with default rules, and the unit tests still pass. For a learner-oriented breakdown, see [Conflicts.md](Conflicts.md).
