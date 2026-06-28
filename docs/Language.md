# Supported C subset and limitations

`lcc` compiles one translation unit (`.c` file) to an object file (`.o`). Link the `.o` with `clang` or `gcc` to produce an executable. See [Usage.md](Usage.md) for commands.

Unlike industrial compilers (clang, gcc) that use recursive-descent parsing, `lcc` uses **bottom-up LALR** parsing so the grammar stays small enough for self-study.

## Supported features

### Types

- Builtin types: `char`, `short`, `int`, `long`, `float`, `double`, the corresponding `unsigned` types, `bool` and `void`
- User-defined types: `struct`, `union` and `enum`, with member reference (`structObj.member`) and dereference (`structPtr->member`) on struct and union objects
- Pointers and address-of: `Type* objectPtr`, `objectPtr = &object`, dereference `*objectPtr`
- `const` qualifier: `const int limit = 5;`, `const char* s`. Parsed and recorded on the type (file-scope `const` objects become LLVM constants), but **not enforced** — assigning to a `const` object is not diagnosed
- `typedef`: builtin and pointer aliases (`typedef unsigned long size_t;`, `typedef int* IntPtr;`); struct and union aliases for an **already-defined** type (`typedef struct Employee Employee;`, `typedef struct Employee* EmployeePtr;`) and combined define-and-alias forms (`typedef struct Point { int x; int y; } Point;`, `typedef union U { int a; float b; } U;`). Valid at file scope and inside a block; a block-scope alias shadows an outer one of the same name and goes out of scope with the block

### Declarations and initialization

- Functions: declaration, definition and call, including variadic parameters (`...`)
- Function pointers: `int (*p)(int);` at file or block scope, assigned from a function name (`p = f` and `p = &f` are the same value), called through (`p(3)`), and passed as a parameter so a callback works (`int apply(int (*fn)(int), int n)`). Also spelled through a typedef, which is how C usually names a callback type: `typedef int (*Op)(int);` then `Op p;` or `int apply(Op fn, int n)`. The alias is an ordinary type name, so it also works as a struct or union member, an array element, and a function's return type
- Variable lists: `a = 1, b, c = 3`
- One-dimensional arrays: `Type arrayName[INTEGER];`, including mixed lists such as `int a[4], b;` (bounds on each name via `VarInit`)
- One-dimensional brace initialization: `int a[4] = {1, 2, 3};` and empty `{}` (zero-fill), global and local
- Inferred 1D array size: `int arr[] = {10, 7, 8, 9, 1, 5};`
- Char array string initialization: `char s[] = "hello";`, `char s[6] = "hello";` (length includes `'\0'`)
- Two-dimensional arrays: `int matrix[8][5];`, subscript `matrix[i][j]`, including mixed lists such as `int a[2][3], b;`
- Two-dimensional brace initialization: `int a[8][5] = {{0,1,2},{3,4,5}};`, flat `{0,1,2,3,4,5}`, empty `{}` (zero-fill), and `int a[][5] = {{1},{2,3}};`
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
- Logical: `&&`, `||`, `!`, all short-circuiting as C requires
- Comparison: `==`, `!=`, `<`, `<=`, `>`, `>=`
- Ternary: `condition ? trueExpr : falseExpr`, evaluating only the arm it selects
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
- `goto` and labels: `goto name;` and `name: stmt`, jumping forward or backward anywhere in the same function — including out of nested loops, which `break` cannot do

## Not supported (yet)

- Preprocessing: such as `#include`, and macro definition `#define` and expansion. A separate pipeline stage, and a large one.
- Struct bit-fields: `struct S { int a : 3; };`
- Designated initializers: `{ .x = 1, [2] = 3 }`
- Scalar types beyond the builtin set: `signed`, `long long`, `long double`
- Brace initialization of arrays with three or more dimensions: `int a[2][2][2] = {{{1,2},{3,4}},{{5,6},{7,8}}};` (deferred — 2D already covers the multidimensional case, and the complexity climbs steeply from there). Declaring, subscripting and `sizeof` work at any depth — `int a[2][8][5];` compiles, and so does `a[1][2][3] = 7`; only the initializer list stops at two dimensions
- Struct tag typedefs before definition: `typedef struct Employee Employee;` requires the struct to be defined first, or use the combined form `typedef struct S { … } S;`.
- **A parenthesized name followed by `*`, `&`, `+`, `-`, `++` or `--`.** `(a)` on its own is an expression, but before one of those six tokens the parser reads it as a cast, because each of them can also begin a unary expression:

  ```c
  r = (a);            /* fine */
  if ((a) > 0) { }    /* fine */
  f((a));             /* fine */
  r = (a) + 1;        /* rejected — read as a cast to type `a` */
  r = (a * 7) + 1;    /* rejected — read as a cast to `a*` */
  ```

  Drop the parentheses, reorder the operands, or assign to a temporary. This is C's own ambiguity: telling `(a) + 1` from `(T) + 1` requires knowing whether `a` names a type, and `lcc` has no symbol table while parsing. See [ParserConflicts.md](ParserConflicts.md#4-identifier-type-name-or-expression).
- Mixing nested and flat forms inside one array initializer: `int a[2][3] = {{1,2,3},4,5,6};` and `int a[2][3] = {1,{2,3}};` are valid C but rejected — use all-nested or all-flat. Excess elements are rejected too (`int a[2][3] = {1,2,3,4,5,6,7};`), where C drops them with a warning
- **`goto` into a compound statement.** Jumping to a label nested inside an `if`, loop or block that follows a terminated statement does not reach it: the walk resumes at a label only when it is the next statement at the same level, so `goto deep; return 1; if (x) { deep: … }` is rejected as an undefined label. Jumping out of a block, or between labels at one level, is fine.
- **The `(*name)` declarator outside a variable, parameter, or `typedef`.** Written directly, `struct S { int (*op)(int); };`, `int (*a[2])(int);` and `int (*pick(void))(int)` are all syntax errors, because each declarator position in `Parser.y` spells its own form and only those three have the function-pointer one. Naming the type first lifts it: after `typedef int (*Op)(int);`, `Op` works in every one of those positions.
- **Calling through anything but a name.** The only call production is `IDENTIFIER ( … )`, and `FuncCall` stores a name rather than an expression, so `s.op(3)`, `a[0](3)` and `pick(0)(3)` are syntax errors even where the pointer itself is fine. Copy it out first — `Op fn = s.op; fn(3);`
- **A function-pointer declarator whose return type is a typedef name.** `int (*p)(int);` parses, but `MyInt (*p)(int);` does not: at `MyInt •` with `(` ahead, the parser cannot tell the declarator from a call to `MyInt`, and resolves it as a call. Same root cause as the entry below — lcc has no symbol table while parsing. Spell the return type with a builtin keyword.
- Typedef names used as variables in the same scope: after `typedef unsigned long Foo;`, a file-scope `int Foo;` is rejected. This is a deliberate check rather than a parser limitation — `lcc` reports it during IR generation, naming the alias. Only the same scope is affected: under a file-scope alias, `int Foo;` inside a function compiles, while a `typedef` and a variable of one name in a single block do not.
- `extern`: `lcc` requires function declaration for linkage; extern variables are not allowed. Supporting them means a linkage and multi-translation-unit model, and manual declarations cover what the tests need.
- **Unsuffixed decimal literals wider than `int`.** Unsuffixed *hex* promotes to
  the narrowest type that fits, but decimal does not: `3000000000` and
  `-2147483648` are both rejected as out of range. Add an `l` suffix
  (`3000000000L`), use hex, or write `INT_MIN` as `-2147483647 - 1`.

- A parenthesized expression whose first token is a bare identifier, when the
  next token is `)` or `*`:

  ```c
  r = (a);            /* error — redundant parentheses around a variable */
  r = (a * 7) + 1;    /* error — identifier immediately followed by `*` */
  ```

  Any other operator after the identifier parses fine (`(a + 7)`, `(a == 3)`),
  as does a parenthesis that does not begin with a bare identifier (`(7 * a)`,
  `(*p * 7)`, `(arr[0] * 7)`). Reorder the operands, drop the parentheses, or
  assign to a temporary. Root cause: [ParserConflicts.md](ParserConflicts.md#4-identifier-type-name-or-expression).

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
