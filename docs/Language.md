# Supported C subset and limitations

`lcc` compiles one translation unit (`.c` file) to an object file (`.o`). Link the `.o` with `clang` or `gcc` to produce an executable. See [Usage.md](Usage.md) for commands.

Unlike industrial compilers (clang, gcc) that use recursive-descent parsing, `lcc` uses **bottom-up LALR** parsing so the grammar stays small enough for self-study.

## Supported features

### Types

- Builtin types: `char`, `short`, `int`, `long`, `float`, `double`, the corresponding `unsigned` types, `bool` and `void`
- User-defined types: `struct`, `union` and `enum`, with member reference (`structObj.member`) and dereference (`structPtr->member`) on struct and union objects
- Pointers and address-of: `Type* objectPtr`, `objectPtr = &object`, dereference `*objectPtr`
- `const` qualifier: `const int limit = 5;`, `const char* s`. Parsed and recorded on the type (file-scope `const` objects become LLVM constants), but **not enforced** — assigning to a `const` object is not diagnosed
- `typedef`: builtin and pointer aliases (`typedef unsigned long size_t;`, `typedef int* IntPtr;`); struct and union aliases for an **already-defined** type (`typedef struct Employee Employee;`, `typedef struct Employee* EmployeePtr;`) and combined define-and-alias forms (`typedef struct Point { int x; int y; } Point;`, `typedef union U { int a; float b; } U;`)

### Declarations and initialization

- Functions: declaration, definition and call, including variadic parameters (`...`)
- Variable lists: `a = 1, b, c = 3`
- One-dimensional arrays: `Type arrayName[INTEGER];`, including mixed lists such as `int a[4], b;` (bounds on each name via `VarInit`)
- One-dimensional brace initialization: `int a[4] = {1, 2, 3};` and empty `{}` (zero-fill), global and local
- Inferred 1D array size: `int arr[] = {10, 7, 8, 9, 1, 5};`
- Char array string initialization: `char s[] = "hello";`, `char s[6] = "hello";` (length includes `'\0'`)
- Two-dimensional arrays: `int matrix[8][5];`, subscript `matrix[i][j]`, including mixed lists such as `int a[2][3], b;`
- Two-dimensional brace initialization: `int a[8][5] = {{0,1,2},{3,4,5}};`, flat `{0,1,2,3,4,5}`, and `int a[][5] = {{1},{2,3}};`
- File-scope `static`: file-local variables and functions (`static int counter = 0;`, `static int helper(int x) { … }`)
- Block-scope `static`: function-local persistent variables (`static int count;`, `static int count = 10;`)

### Expressions and operators

- Integer literals: decimal and `0x` hex, with optional `u`, `l`, or `ul` suffixes. Unsuffixed hex picks the narrowest fitting type (`int` through `unsigned long`)
- Boolean literals: `true`, `false`
- Assignment: `=`
- Arithmetic: `+`, `-`, `*`, `/`, `%`, and the compound forms `+=`, `-=`, `*=`, `/=`, `%=`
- Prefix and postfix increment / decrement: `++`, `--`
- Bitwise: `&`, `|`, `^`, `~`, and the compound forms `&=`, `|=`, `^=`
- Shift: `<<`, `>>`, and the compound forms `<<=`, `>>=`
- Logical: `&&`, `||`, `!` — none of them short-circuit; see [Not supported](#not-supported-yet)
- Comparison: `==`, `!=`, `<`, `<=`, `>`, `>=`
- Ternary: `condition ? trueExpr : falseExpr` — both arms evaluate; see [Not supported](#not-supported-yet)
- Pointer arithmetic over arrays of builtin and user-defined types, via `++`, `--`, `+=` and `-=`
- `sizeof`
- Explicit (`(Type)varObject`) and implicit type casts
- [C operator precedence](https://en.cppreference.com/w/c/language/operator_precedence), with `(Expr)` overriding it — `(a + b) * c`

### Statements

- Branch: `if` / `else`
- Branch: `switch` / `case` / `default`
- Loop: `for`, `do`, `while`
- In a loop: `continue`, `break`, `return`
- In a `switch`: `break`, `return`
- In a function: `return`

## Not supported (yet)

- Preprocessing: such as `#include`, and macro definition `#define` and expansion. A separate pipeline stage, and a large one.
- `goto` and labels
- Function pointers: declaring one (`int (*p)(int);`) and calling through it
- Struct bit-fields: `struct S { int a : 3; };`
- Designated initializers: `{ .x = 1, [2] = 3 }`
- Scalar types beyond the builtin set: `signed`, `long long`, `long double`
- Three dimensional and higher arrays, and their initialization: such as `int a[2][8][5];` (deferred — 2D already covers the multidimensional case, and the complexity climbs steeply from there)
- Block-scope typedef: only file-scope `typedef` is supported.
- Struct tag typedefs before definition: `typedef struct Employee Employee;` requires the struct to be defined first, or use the combined form `typedef struct S { … } S;`.
- **Parentheses starting with a bare identifier followed by `)` or `*`.** In that position the parser reduces `IDENTIFIER` to a type name and reads the parentheses as a cast, so these are syntax errors:

  ```c
  r = (a);            /* error — redundant parentheses around a variable */
  r = (a * 7) + 1;    /* error — identifier immediately followed by `*` */
  ```

  Any other operator after the identifier parses fine (`(a + 7)`, `(a == 3)`, `(a > 3)`), as does a parenthesized expression that does not begin with a bare identifier (`(7 * a)`, `(*p * 7)`, `(arr[0] * 7)`). Work around it by reordering the operands, dropping the parentheses, or assigning to a temporary. Root cause: state 133 in `Parser.output` — see [ParserConflicts.md](ParserConflicts.md#4-identifier-type-name-or-expression-4-reducereduce).
- Typedef names used as variables in the same scope (rejected; same root cause as above).
- `extern`: `lcc` requires function declaration for linkage; extern variables are not allowed. Supporting them means a linkage and multi-translation-unit model, and manual declarations cover what the tests need.

For front-end feature history and test coverage per language item, see [FrontendNotes.md](FrontendNotes.md). For the active middle-end, optimization, and back-end track, see [LearningPlan.md](LearningPlan.md).

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
