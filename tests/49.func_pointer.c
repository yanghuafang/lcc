/* Function pointers: `int (*p)(int);`, assigning a function to one, calling
 * through it, and passing one as a parameter.
 *
 * The declarator wraps its own name, which the flat `VarType VarList` shape of
 * an ordinary declaration cannot express, so it has its own production in
 * Parser.y. FuncPointerType carries the signature because an opaque `ptr` no
 * longer records what it points at -- the call site rebuilds the llvm
 * FunctionType from the AST.
 *
 * Both spellings of taking a function's address are checked: C converts a
 * function name to its address implicitly, so `p = f` and `p = &f` have to
 * produce the same value. Callbacks get most of the attention here because a
 * function pointer you cannot pass to a function has little use. */

int printf(char*, ...);

int addOne(int x) { return x + 1; }
int square(int x) { return x * x; }
int addTwo(int a, int b) { return a + b; }

int apply(int (*fn)(int), int n) { return fn(n); }

int sumWith(int (*fn)(int), int from, int to) {
  int total = 0;
  int i = from;

  while (i <= to) {
    total = total + fn(i);
    i = i + 1;
  }
  return total;
}

/* At file scope, so the global path is covered too. */
int (*chosen)(int);

int main() {
  int failed = 0;
  int (*p)(int);
  int (*q)(int, int);
  int r;

  /* A bare function name is its address. */
  p = addOne;
  if (p(10) != 11) {
    failed = 1;
  }

  /* &f is the same value, not a pointer to it. */
  p = &square;
  if (p(6) != 36) {
    failed = 1;
  }

  /* More than one parameter. */
  q = addTwo;
  if (q(3, 4) != 7) {
    failed = 1;
  }

  /* The result has the pointer's return type, so it composes. */
  r = p(5) + 1;
  if (r != 26) {
    failed = 1;
  }

  /* As a parameter: the reason the feature is worth having. */
  if (apply(addOne, 41) != 42) {
    failed = 1;
  }
  if (apply(square, 7) != 49) {
    failed = 1;
  }

  /* Called repeatedly from inside a loop. */
  if (sumWith(square, 1, 4) != 30) {
    failed = 1;
  }

  /* File-scope pointer. */
  chosen = addOne;
  if (chosen(99) != 100) {
    failed = 1;
  }

  /* The same pointer aimed at something else. */
  p = addOne;
  if (p(7) != 8) {
    failed = 1;
  }

  if (failed == 0) {
    printf("49.func_pointer.c PASS\n");
    return 0;
  }
  printf("49.func_pointer.c FAIL\n");
  return 1;
}
