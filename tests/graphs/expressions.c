// One instance of every expression form lcc parses.
//
// A graph fixture: no assertions, so each subtree is the operator itself. The
// numbered tests in tests/ are what check the values these produce.

int main() {
  int a = 6;
  int b = 3;
  int r;
  double d = 1.5;

  r = a + b;
  r = a - b;
  r = a * b;
  r = a / b;
  r = a % b;

  r += b;
  r -= b;
  r *= b;
  r /= b;
  r %= b;

  r = a++;
  r = a--;
  r = ++a;
  r = --a;

  r = a & b;
  r = a | b;
  r = a ^ b;
  r = ~a;
  r = a << 1;
  r = a >> 1;

  r = a && b;
  r = a || b;
  r = !a;

  r = a == b;
  r = a != b;
  r = a < b;
  r = a > b;

  r = a > b ? a : b;
  r = (int)d;
  r = sizeof(int);
  r = (a + b) * 2;
  // Comma operator. Written without enclosing parentheses because lcc rejects
  // `(a, b)`: a parenthesized IDENTIFIER reduces as a type name, not an
  // expression. See docs/ParserConflicts.md.
  r = a, b;
  return r;
}
