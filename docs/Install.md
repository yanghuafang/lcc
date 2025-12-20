# Install and build

## Requirements

On both macOS and Ubuntu:

- **LLVM 20** (libraries and tools such as `llvm-dwarfdump`)
- **flex**, **bison** — CMake runs both in `src/` on every configure, so they are required even though the generated sources are committed
- **argparse** (CMake `find_package` or FetchContent fallback)
- **graphviz** (`dot` for AST images)
- A system C/C++ linker (**`clang`** or **`gcc`**) to link `.o` files produced by `lcc`
- **CMake 3.22+** (`cmake_minimum_required` in the project)
- **C++17** (`CMAKE_CXX_STANDARD` in `CMakeLists.txt`; required by LLVM 20 headers)

Build output lives in `../../lcc-build/` relative to `lcc/scripts/` (sibling of the repo checkout).

## Install dependencies

### macOS

From `lcc/scripts` (installs Homebrew first if it is not already present):

```bash
./install-deps-macos.sh
```

Or manually — install [Homebrew](https://brew.sh) if needed, then the packages:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install flex bison llvm@20 argparse graphviz cmake
```

### Ubuntu LTS

`llvm-20`, `clang-format-20`, `clang-tidy-20`, and `libargparse-dev` are available from Ubuntu apt on current LTS releases.

From `lcc/scripts`:

```bash
./install-deps-ubuntu.sh
```

Or manually:

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake flex bison graphviz clang git \
  llvm-20 llvm-20-dev llvm-20-tools clang-format-20 clang-tidy-20 libargparse-dev
```

`clang-format-20` and `clang-tidy-20` are separate apt packages, unlike macOS where Homebrew's `llvm@20` ships both. They install into `/usr/lib/llvm-20/bin`, which `build-env.sh` already puts on `PATH`, so `scripts/format.sh` and `scripts/tidy.sh` find them unqualified.

On Ubuntu, **g++** (from `build-essential`) builds `lcc` by default; **clang** at `/usr/bin/clang` links test executables (`LCC_LINKER`). See [Testing.md](Testing.md).

## Build `lcc`

```bash
git clone git@github.com:yanghuafang/lcc.git
cd lcc/scripts
./build-lcc.sh
```

The compiler binary is `../../lcc-build/lcc`. `build-lcc.sh` sources `build-env.sh`, which configures `PATH` for flex, bison, and LLVM 20 tools on macOS (Homebrew) and Ubuntu (`/usr/lib/llvm-20`).

The build also writes `../../lcc-build/compile_commands.json`. `scripts/tidy.sh` needs it, and pointing an editor's clangd at it gives working completion and jump-to-definition across `src/`.

### `build-lcc.sh` options

Build mode (optional, at most one):

| Flag | Effect |
| ------ | -------- |
| *(none)* | `CMAKE_BUILD_TYPE=Release` |
| `--debug` | Debug symbols, no optimization (`Debug`) |
| `--release` | Optimized, no debug info (`Release`) |
| `--relwithdebinfo` | Optimized with debug symbols (`RelWithDebInfo`) |

Other flags:

| Flag | Effect |
|------|--------|
| `--parse` | Regenerate `src/generated/Parser.counterexamples` (Bison `-Wcounterexamples`) before building; combinable with a build mode, e.g. `./build-lcc.sh --debug --parse` |
| `--asan` | Build `lcc` with AddressSanitizer (`-DLCC_ASAN=ON`) |
| `--werror` | Fail the build on any compiler warning (`-DLCC_WERROR=ON`) |

### Warnings and sanitizers

`lcc` always builds with `-Wall -Wextra`. LLVM's headers are included as system
headers so their warnings stay out of the way, and the generated
`src/generated/Lexer.cpp` / `Parser.cpp` are compiled with warnings off, since
they are regenerated on every configure and must not be hand-edited.

`-Wunused-parameter` is disabled deliberately. Every AST node overrides
`genCode(CodeGenerator&)` whether or not it uses the generator, so around
eighty of these are unavoidable and the parameter name documents the slot.

`--werror` is opt-in rather than the default: a compiler upgrade can add a new
warning at any time, and cloning the repo should give you a build rather than a
wall of errors. CI does not use it — the warning sets differ between GCC and
Clang, and only Clang is verified here.

`--asan` builds `lcc` itself under AddressSanitizer, which catches
use-after-free and buffer overflows while it compiles a program:

```bash
./build-lcc.sh --asan
./compile-tests.sh
```

CI runs exactly this on Ubuntu. Note that it sets `ASAN_OPTIONS=detect_leaks=0`:
LeakSanitizer comes along with ASan on Linux, and `lcc` has two known leaks it
would stop on — an orphaned `llvm::BasicBlock` in `SwitchStmt::genCode`, and the
AST nodes a partial `AST::Decls` holds when a parse fails.

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

All outputs land in `src/generated/` (set by `%option outfile` in `Lexer.l` and `%output` in `Parser.y`):

```bash
flex frontend/Lexer.l                          # generated/Lexer.cpp
bison -d frontend/Parser.y                     # generated/Parser.cpp / Parser.hpp
bison -d frontend/Parser.y -v                  # generated/Parser.output (conflicts)
bison -d frontend/Parser.y -v -Wcounterexamples &> generated/Parser.counterexamples
```

Building `lcc` (or running `bison` on `Parser.y`) reports grammar conflicts. That is expected for this compact grammar: Bison resolves them with default rules, and the test suite still passes. For a learner-oriented breakdown, see [ParserConflicts.md](ParserConflicts.md).
