/* Parenthesized expressions that begin with a bare identifier.
 *
 * `(a)` used to be a syntax error. On lookahead `)` the parser reduced
 * IDENTIFIER to a type name and committed to reading a cast, so `r = (a);`,
 * `if ((a) > 0)` and `f((a))` all failed to parse. See docs/ParserConflicts.md
 * section 4.
 *
 * The boundary this pins: `(a)` is an expression before any token that cannot
 * start a unary expression. Before `+`, `-`, `*` or `&` it is still read as a
 * cast, which is the ambiguity C itself has — those need to know whether `a`
 * names a type, and lcc has no symbol table while parsing.
 *
 * Casts are checked too. The same productions carry `(TypedefName)value`, so a
 * regression there shows up as a wrong value rather than a parse error. */

int printf(char*, ...);

typedef unsigned long size_t;

int identity(int x) { return x; }

int addTwo(int x, int y) { return x + y; }

int main() {
  int a = 7;
  int b = 3;
  int i = 2;
  int r = 0;
  int failed = 0;
  int arr[3];
  double d = 3.9;
  size_t s = 0;

  arr[0] = 11;
  arr[1] = 22;
  arr[2] = 33;

  /* The shape that used to fail outright: nothing but a name in parentheses. */
  r = (a);
  if (r != 7) {
    failed = 1;
  }

  /* Before a comparison. */
  if ((a) > 0) {
    r = 1;
  } else {
    r = 0;
  }
  if (r != 1) {
    failed = 1;
  }
  if ((a) == 7) {
    r = 2;
  } else {
    r = 0;
  }
  if (r != 2) {
    failed = 1;
  }

  /* As a call argument, alone and beside another. */
  if (identity((a)) != 7) {
    failed = 1;
  }
  if (addTwo((a), (b)) != 10) {
    failed = 1;
  }

  /* Nested, and as a subscript. */
  if (((a)) != 7) {
    failed = 1;
  }
  if (arr[(i)] != 33) {
    failed = 1;
  }

  /* Before operators that have no unary form. */
  if ((a) / 7 != 1) {
    failed = 1;
  }
  if ((a) % 4 != 3) {
    failed = 1;
  }
  if ((b) << 1 != 6) {
    failed = 1;
  }

  /* To the right of an operator, where it always worked. */
  r = b + (a);
  if (r != 10) {
    failed = 1;
  }

  /* Casts must keep working — same productions. */
  if ((int)d != 3) {
    failed = 1;
  }
  s = (size_t)a;
  if ((int)s != 7) {
    failed = 1;
  }
  if ((int)(size_t)b != 3) {
    failed = 1;
  }

  if (failed == 0) {
    printf("47.paren_expr.c PASS\n");
    return 0;
  }
  printf("47.paren_expr.c FAIL\n");
  return 1;
}
