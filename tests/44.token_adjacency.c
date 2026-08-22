// Operators written with no space before their operand, across all six
// numeric lexer rules.
//
// flex takes the longest match at each position. While the numeric rules
// carried a [+-]? or \+? prefix, `-1` was a single INTEGER token wherever an
// operator abutted a digit, so `a-1` lexed as IDENTIFIER INTEGER and failed to
// parse. `a-1.5` failed worse: the integer rule won "-1" away from the float
// rule and left a stray `.5` behind.
//
// Every other program in this suite spaces its operators, which is exactly how
// the defect survived to be found by reading rather than by testing. The
// spacing below is the whole point of the file, so the assertions sit inside
// clang-format off/on: scripts/format.sh would otherwise put the spaces back
// and quietly turn this into a duplicate of 12.arithmetic.c.
//
// The sign now reaches Parser.y's UnaryMinus / UnaryPlus productions instead,
// which is also what `enum { NEG = -1 }` and `3 + +13` exercise here.

int printf(char*, ...);

// The Enum rule takes a literal rather than an Expr, so the grammar spells the
// sign itself instead of relying on the lexer to fold it in.
enum SIGN { NEG = -1, ZERO = 0, POS = 1 };

int main() {
  int err = 0;

  // clang-format off

  // Decimal: the rule every `a-1` in ordinary C goes through.
  int a = 5;
  if (a-1 != 4) err = 1;
  if (a+1 != 6) err = 1;
  if (10-4 != 6) err = 1;
  if (10+4 != 14) err = 1;

  // Subscript. arr[n-1] is the idiom that made this worth fixing.
  int arr[4] = {10, 20, 30, 40};
  int n = 3;
  if (arr[n-1] != 30) err = 1;
  if (arr[n-3] != 10) err = 1;

  // Hex, unsuffixed and long-suffixed.
  int h = 32;
  if (h-0x10 != 16) err = 1;
  long hl = 32;
  if (hl-0x10L != 16) err = 1;

  // The three suffixed integer rules: u, l, ul.
  unsigned int ui = 5;
  if (ui+1u != 6) err = 1;
  long lv = 5;
  if (lv-1L != 4) err = 1;
  unsigned long ulv = 5;
  if (ulv+1ul != 6) err = 1;

  // Float and double. These two rules never carried a sign prefix; it was the
  // integer rule reaching across the `.` that broke them.
  double d = 5.0;
  if (d-1.5 != 3.5) err = 1;
  if (d+1.5 != 6.5) err = 1;
  float f = 5.0f;
  if (f-1.5f != 3.5f) err = 1;

  // A unary sign beside a binary operator. These stay spaced on purpose:
  // `2--1` and `3++13` lex as `--` and `++` by the same longest-match rule,
  // which is what C requires.
  if (2 - -1 != 3) err = 1;
  if (3 + +13 != 16) err = 1;
  if (3 - -13 != 16) err = 1;

  // Unary minus binds tighter than `*`, so this is (-a) * 2.
  if (-a*2 != -10) err = 1;

  // clang-format on

  // Negative enumerator, and its neighbours for contrast. Read into an int
  // first, the way 4.enum_type.c does: an enumerator used directly as an
  // operand carries no recorded type, which is a separate limitation from
  // anything this file is about.
  int neg = NEG;
  int zero = ZERO;
  int pos = POS;
  if (neg != -1) err = 1;
  if (zero != 0) err = 1;
  if (pos != 1) err = 1;

  if (err == 0) {
    printf("44.token_adjacency.c PASS\n");
  } else {
    printf("44.token_adjacency.c FAIL\n");
  }
  return err;
}
