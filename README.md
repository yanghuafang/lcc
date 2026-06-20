# `lcc`: Learn C Compiler

This project is a simple C compiler for learning purpose. It is based on flex, bison and LLVM.

Not like the most popular industrial C compilers, such as clang and gcc which adopt top-down recursive descendant parsing, `lcc` adopts bottom-up LALR parsing to make sure it is simple enough for self-study.

`lcc` supports the most common C grammars used in engineering practice:
- Builtin types: `char`, `short`, `int`, `long`, `float`, `double`, corresponding `unsigned` types, `bool` and `void`.
- User defined types: struct, union and enum, corresponding reference(`structObj.member`) and dereference(`structPtr->member`) on struct and union objects.
- Pointer and address of: `Type* objectPtr`, `objectPtr = &object`; dereference: `*objectPtr`.
- Pointer move on array of builtin types and user defined types by using operators `++`, `--`, `+=` and `-=`.
- One dimensional array: `Type arrayName[INTEGER];`, including mixed lists such as `int a[4], b;` (bounds on each name via `VarInit`)
- One dimensional array brace initialization: `int a[4] = {1, 2, 3};` and empty `{}` (zero-fill), global and local
- Inferred 1D array size: `int arr[] = {10, 7, 8, 9, 1, 5};`
- Char array string initialization: `char s[] = "hello";`, `char s[6] = "hello";` (length includes `'\0'`)
- Two dimensional array: `int matrix[8][5];`, subscript `matrix[i][j]`, including mixed lists such as `int a[2][3], b;`
- Two dimensional array brace initialization: `int a[8][5] = {{0,1,2},{3,4,5}};`, flat `{0,1,2,3,4,5}`, and `int a[][5] = {{1},{2,3}};`
- Typedef: builtin and pointer aliases (`typedef unsigned long size_t;`, `typedef int* IntPtr;`); struct and union aliases (`typedef struct Employee Employee;`, `typedef struct Employee* EmployeePtr;`, `typedef struct Point { int x; int y; } Point;`, `typedef union U { int a; float b; } U;`)
- File-scope `static`: file-local variables and functions (`static int counter = 0;`, `static int helper(int x) { … }`)
- Block-scope `static`: function-local persistent variables (`static int count;`, `static int count = 10;`)
- Variable list: such as `a = 1, b, c = 3`
- Variant parameters: `...`
- Function declaration, definition and call.
- `sizeof` operator.
- Explicit(`(Type)varObject`) and implicit type cast.
- C operator precedence: https://en.cppreference.com/w/c/language/operator_precedence
- `(Expr)` modifies precedence in expression, such as `(a + b) * c`.
- Assign: `=`
- Arithmetic: `+`, `-`, `*`, `/`, `%`
- Arithmetic Assign: `+=`, `-=`, `*=`, `/=`, `%=`
- Prefix and postfix inc/dec operators: `++`, `--`
- Bitwise: `&`, `|`, `^`, `~`
- Bitwise Assign: `&=`, `|=`, `^=`
- Shift: `<<`, `>>`
- Shift Assign: `<<=`, `>>=`
- Logic: `&&`, `||`, `!`
- Comparison: `==`, `!=`, `<`, `<=`, `>`, `>=`
- Ternary expression: `condition ? trueExpr : falseExpr`
- Branch: `if`, `else`
- Branch: `switch`, `case`, `default`
- Loop: `for`, `do`, `while`
- In loop: `continue`, `break`, `return`
- In switch statement: `break`, `return`
- In function: `return`

Except the following features:
- Preprocessing: such as `#include`
- Macro definition `#define` and expansion
- Multidimensional array initialization beyond 2D: such as `int a[2][8][5] = {…};`
- Three dimensional arrays: such as `int a[2][8][5];` (deferred)
- Block-scope typedef: only file-scope `typedef` is supported.
- Struct tag typedefs before definition: `typedef struct Employee Employee;` requires the struct to be defined first, or use the combined form `typedef struct S { … } S;`.
- Expression/type disambiguation (State 96): typedef names in expression positions may still parse as types; lcc rejects typedef names used as variables in the same scope.
- `extern`: `lcc` requires function declaration for linkage, extern variable is not allowed.

`lcc` compiles a translation unit (.c file) to an object file (.o), then the object file can be linked to an executable by `clang` or `gcc`.  

User must specify function declarations manually for linkage. Define `size_t` first when using it in declarations: `typedef unsigned long size_t;`
- `printf`, instead of `#include <stdio.h>`, add a declaration before using it: `int printf(char*, ...);`
- `malloc`, add declaration: `void* malloc(size_t size);`
- `free`, add declaration: `void free(void* ptr);`
- `strlen`, add declaration: `unsigned long strlen(const char* s);`

## Install dependencies

`brew install flex bison llvm@14 argparse graphviz cmake`

## Build `lcc`

From the repo:

```bash
git clone git@github.com:yanghuafang/lcc.git
cd lcc/scripts
./build-lcc.sh
```

The compiler binary is written to `../../lcc-build/lcc` (relative to `scripts/`). `build-lcc.sh` sources `build-env.sh`, which puts Homebrew `flex`, `bison`, and LLVM 14 on `PATH`.

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

Generate lexer/parser by hand (from `lcc/src`):

```bash
flex Lexer.l
bison -d Parser.y                              # Parser.cpp / Parser.hpp
bison -d Parser.y -v                           # Parser.output (conflicts)
bison -d Parser.y -v -Wcounterexamples &> Parser.counterexamples
```

Building `lcc` (or running `bison` on `Parser.y`) reports **48 shift/reduce** and **6 reduce/reduce** conflicts. That is expected for this compact grammar: Bison resolves them with default rules, and the unit tests still pass. For a learner-oriented breakdown of each conflict group (subscript precedence, dangling `else`, `sizeof`, typedef names, and more), see [`docs/Conflicts.md`](docs/Conflicts.md).

## Compile a `.c` file with `lcc`

```text
lcc -i <input.c> -o <output.o> [-v <ast.dot>] [-l <ir.ll>] [-g] [-O0|-O1|-O2|-O3|-Os|-Oz]
```

| Flag | Required | Description |
|------|----------|-------------|
| `-i` | yes | Input C source file |
| `-o` | yes | Output object file (`.o`) |
| `-v` | no | AST graph (GraphViz `.dot`) |
| `-l` | no | LLVM IR (`.ll`) |
| `-g` | no | Embed DWARF in the object file (use without `-O` for reliable stepping and variables) |
| `-O0` … `-Oz` | no | LLVM optimization level (mutually exclusive) |

**Defaults when flags are omitted**

| Flags passed | Debug info in `.o` | LLVM optimization |
|--------------|-------------------|-------------------|
| *(none)* | No | No passes (raw codegen IR) |
| `-O0` only | No | O0 pipeline |
| `-g` only | Yes | Skipped (`-g` disables LLVM opts to keep dbg.declare allocas) |
| `-g -O0` | Yes | Skipped |
| `-g -O2` (etc.) | Yes | Skipped; warning printed |

Example (AST + IR + object):

```bash
../../lcc-build/lcc -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o \
  -v ../debug/0.hello_world.dot -l ../debug/0.hello_world.ll
```

### Debug a program built by `lcc`

`-g` embeds debug info for the **generated** C program (the `-i` file), not for debugging `lcc` itself:

```bash
../../lcc-build/lcc -g -O0 -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o
clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world
lldb ../../lcc-build/0.hello_world
```

AST image from `-v` output:

```bash
dot ../debug/0.hello_world.dot -T png -o ../debug/0.hello_world.png
```

## Link `.o` to an executable

```bash
clang <object.o> -o <executable>
```

Example:

```bash
clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world
```

## Scripts (`lcc/scripts`)

| Script | Purpose |
|--------|---------|
| `build-env.sh` | Export `PATH`, `CPPFLAGS`, `LDFLAGS` for Homebrew flex, bison, LLVM 14 (sourced by other scripts) |
| `build-lcc.sh` | Configure and build the `lcc` compiler (see [Build `lcc`](#build-lcc)) |
| `compile-tests.sh` | Compile unit tests to `../../lcc-build/*.o`; also writes AST/IR under `../debug/` |
| `link-tests.sh` | Link `../../lcc-build/*.o` to executables with `clang` |
| `run-tests.sh` | Run linked test binaries |
| `check-debug-info.sh` | Temporary smoke test: compile `0.hello_world.c` with `-g -O0`, check `llvm-dwarfdump` for `DW_TAG_subprogram` |

`tests-compile-link-run.sh` is not run directly; it defines the test list and shared `compile` / `link` / `run` helpers used by the three `*-tests.sh` scripts.

## Unit tests

```bash
cd lcc/scripts
```

Typical full run:

```bash
./compile-tests.sh
./link-tests.sh
./run-tests.sh
```

Single test:

```bash
./compile-tests.sh 0.hello_world.c
./link-tests.sh 0.hello_world.c
./run-tests.sh 0.hello_world.c
```

### `compile-tests.sh` modes

Optional compile mode (at most one; applies to all tests or the single named test):

| Flag | `lcc` flags | Use |
|------|-------------|-----|
| *(none)* | *(none)* | Default regression run (no DWARF, no LLVM opts) |
| `--debug` | `-g -O0` | Debuggable test binaries |
| `--release` | `-O2` | Optimized, no debug info |
| `--relwithdebinfo` | `-g -O2` | DWARF emitted; LLVM opts still skipped under `-g` (see flags table above) |

Examples:

```bash
./compile-tests.sh --debug
./compile-tests.sh --release 25.quick_sort.c
./compile-tests.sh --relwithdebinfo
```

`compile-tests.sh` always passes `-v` and `-l` so AST (`.dot`, `.png`) and IR (`.ll`) land in `lcc/debug/`. Checked-in copies of those artifacts live under `lcc/debug` in the repo.

Debug-info smoke test (until removed after debug PRs land):

```bash
./check-debug-info.sh
```

## Debug `lcc` itself

Use Visual Studio Code to code and debug `lcc`.  

Two LLDB debugger plugins can be used:
- `LLDB DAP`: identifier `llvm-vs-code-extensions.lldb-dap`
- `CodeLLDB`: identifier `vadimcn.vscode-lldb`

Config `lcc/.vscode/launch.json` to use one of above debugger plugins:
- `"type": "lldb-dap"` for `LLDB DAP`
- `"type": "lldb"` for `CodeLLDB`

Maybe LLDB is unable to step into `yyparse` as it tries to locate `Parser.cpp`, `Parser.hpp` (generated from `Parser.y`) and `Lexer.cpp` (generated from `Lexer.l`) from `lcc/../lcc-build` instead of `lcc/src`  

Run command in LLDB to fix the source file not found issue:  
`settings set target.source-map <build path> <src path>`  

Such as `settings set target.source-map /Users/yanghuafang/study-projects/lcc-build /Users/yanghuafang/study-projects/lcc/src`

## TODO

For step-by-step detail (dependencies, tests, and legal/illegal forms), see [`docs/Roadmap.md`](docs/Roadmap.md). Array work through 2D and typedef (builtin and struct/union) are done; 3D arrays are deferred.

- `-g` debug info is complete for `-g`/`-O0`-style builds: subprograms, line stepping, locals/params, struct members, and lexical blocks. Optimized debugging (`dbg.value` salvage) remains out of scope.