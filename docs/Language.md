# Supported C subset and limitations

`lcc` compiles one translation unit (`.c` file) to an object file (`.o`). Link the `.o` with `clang` or `gcc` to produce an executable. See [Usage.md](Usage.md) for commands.

Unlike industrial compilers (clang, gcc) that use recursive-descent parsing, `lcc` uses **bottom-up LALR** parsing so the grammar stays small enough for self-study.

## Supported features

- Builtin types: `char`, `short`, `int`, `long`, `float`, `double`, corresponding `unsigned` types, `bool` and `void`.
- User defined types: struct, union and enum, corresponding reference (`structObj.member`) and dereference (`structPtr->member`) on struct and union objects.
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
- Explicit (`(Type)varObject`) and implicit type cast.
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

## Not supported (yet)

- Preprocessing: such as `#include`
- Macro definition `#define` and expansion
- Multidimensional array initialization beyond 2D: such as `int a[2][8][5] = {…};`
- Three dimensional arrays: such as `int a[2][8][5];` (deferred)
- Block-scope typedef: only file-scope `typedef` is supported.
- Struct tag typedefs before definition: `typedef struct Employee Employee;` requires the struct to be defined first, or use the combined form `typedef struct S { … } S;`.
- Expression/type disambiguation (State 133 in `Parser.output`; see [Conflicts.md](Conflicts.md)): typedef names in expression positions may still parse as types; lcc rejects typedef names used as variables in the same scope.
- `extern`: `lcc` requires function declaration for linkage; extern variables are not allowed.

For planned extensions and test coverage per feature, see [Roadmap.md](Roadmap.md).

## Manual linkage declarations

There is no preprocessor. Declare libc helpers yourself before use. Define `size_t` first when it appears in declarations:

```c
typedef unsigned long size_t;
```

Common declarations:

- `printf` — instead of `#include <stdio.h>`: `int printf(char*, ...);`
- `malloc`: `void* malloc(size_t size);`
- `free`: `void free(void* ptr);`
- `strlen`: `unsigned long strlen(const char* s);`
