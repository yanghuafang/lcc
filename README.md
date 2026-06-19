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
- Block-scope `static` (function-local static variables): not supported yet.

`lcc` compiles a translation unit (.c file) to an object file (.o), then the object file can be linked to an executable by `clang` or `gcc`.  

User must specify function declarations manually for linkage. Define `size_t` first when using it in declarations: `typedef unsigned long size_t;`
- `printf`, instead of `#include <stdio.h>`, add a declaration before using it: `int printf(char*, ...);`
- `malloc`, add declaration: `void* malloc(size_t size);`
- `free`, add declaration: `void free(void* ptr);`
- `strlen`, add declaration: `unsigned long strlen(const char* s);`

## Install dependencies

`brew install flex bison llvm@14 argparse graphviz cmake`

## Build `lcc`

`git clone git@github.com:yanghuafang/lcc.git`  
`cd lcc/scripts`  
`./build-lcc.sh`  

To build by cmake manually:  
`source build-env.sh`  
`cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Debug`  
`cmake --build ../../lcc-build`  

To generate lexical scanner manually:  
`flex Lexer.l`

To generate syntax parser manually:
- Generate Parser.cpp and Parser.hpp  
`bison -d Parser.y`
- Generate Parser.output to check shift-reduce, reduce-reduce conflicts  
`bison -d Parser.y -v`
- Generate conflict counterexamples  
`bison -d Parser.y -Wcounterexamples &> Parser.counterexamples`

Building `lcc` (or running `bison` on `Parser.y`) reports **45 shift/reduce** and **6 reduce/reduce** conflicts. That is expected for this compact grammar: Bison resolves them with default rules, and the unit tests still pass. For a learner-oriented breakdown of each conflict group (subscript precedence, dangling `else`, `sizeof`, typedef names, and more), see [`docs/Conflicts.md`](docs/Conflicts.md).

## Compile .c file

`lcc -i <input C source file> -o <object file> -v <AST graph file> -l <llvm IR file> -g -O<n>`

- `-i`: input C source file. It is required.
- `-o`: output object file. It is required.
- `-v`: output AST visualization file(GraphViz dot). It is optional.
- `-l`: output llvm IR code file. It is optional.
- `-g`: generate debug info within object file for debugging purpose. It is optional.
- `-O`: optimization level: `-O0`, `-O1`, `-O2`, `-O3`, `-Os`, `-Oz`. It is optional, default optimization level is `-O0`.

Such as `../../lcc-build/lcc -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o -v ../debug/0.hello_world.dot -l ../debug/0.hello_world.ll`

Generate AST image for debugging:  
`dot <dot file generated by lcc '-v' option> -T png -o <png file>`  
Such as `dot ../debug/0.hello_world.dot -T png -o ../debug/0.hello_world.png`

## Link .o file

The object file generated can be linked by clang to run:  
`clang <object file> -o <executable file>`  
Such as `clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world`

## Unit tests

`cd lcc/scripts`

To compile all tests, output object file(.o), AST dot graph(.dot), AST graph image(.png), IR code(.ll):  
`./compile-tests.sh`

To link all tests:  
`./link-tests.sh`

To run all tests:  
`./run-tests.sh`

To compile one test:  
`./compile-tests.sh <C file name>`  
Such as `./compile-tests.sh 0.hello_world.c`

To link one test:  
`./link-tests.sh <C file name>`  
Such as `./link-tests.sh 0.hello_world.c`

To run one test:  
`./run-tests.sh <C file name>`  
Such as `./run-tests.sh 0.hello_world.c`

All unit tests' AST files(.dot and .png) and IR files(.ll) were uploaded to `lcc/debug`.

## `lcc` Debugging

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

- Support block-scope `static` (function-local static variables).
- Implement `lcc` `-g` option to generate object file with debug info.