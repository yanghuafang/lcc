// Comparison and logical operators, and the int-typed value they produce.
// That && and || skip their right operand is 45.short_circuit.c's subject;
// this file is about the results, so every operand here is side-effect free.

int printf(char*, ...);

int main() {
  int err = 0;
  bool t = true;
  bool f = false;
  int v;

  if (t == 0) err = 1;
  if (f != 0) err = 1;

  v = t && f;
  if (v != 0) err = 1;
  v = t && t;
  if (v == 0) err = 1;
  v = f && f;
  if (v != 0) err = 1;

  v = t || f;
  if (v == 0) err = 1;
  v = t || t;
  if (v == 0) err = 1;
  v = f || f;
  if (v != 0) err = 1;

  v = !t;
  if (v != 0) err = 1;
  v = !f;
  if (v == 0) err = 1;

  int a = 100;
  int b = 100;
  int c = 128;

  v = a == b;
  if (v == 0) err = 1;
  v = a == c;
  if (v != 0) err = 1;
  v = a != b;
  if (v != 0) err = 1;
  v = a != c;
  if (v == 0) err = 1;
  v = a < b;
  if (v != 0) err = 1;
  v = a < c;
  if (v == 0) err = 1;
  v = c < a;
  if (v != 0) err = 1;
  v = a <= b;
  if (v == 0) err = 1;
  v = a <= c;
  if (v == 0) err = 1;
  v = c <= a;
  if (v != 0) err = 1;
  v = a > b;
  if (v != 0) err = 1;
  v = a > c;
  if (v != 0) err = 1;
  v = c > a;
  if (v == 0) err = 1;
  v = a >= b;
  if (v == 0) err = 1;
  v = a >= c;
  if (v != 0) err = 1;
  v = c >= a;
  if (v == 0) err = 1;

  unsigned ua = 1;
  unsigned ub = 0xffffffff;
  v = ua < ub;
  if (v == 0) err = 1;
  v = ub > ua;
  if (v == 0) err = 1;

  int si = -1;
  unsigned ui = 1;
  v = si < ui;
  if (v != 0) err = 1;
  v = si > ui;
  if (v == 0) err = 1;

  // The logic operators yield int 0 or 1 — an exact value, not merely
  // "nonzero". Everything above tests against 0, which a one-bit result
  // sign-extended to -1 also satisfies; these do not.
  v = a < c;
  v = a == b;
  v = t && t;
  v = t || f;
  v = !f;

  // Being an int also means taking part in arithmetic, which needs the type
  // the operators report, not just the value they produce.

  if (err == 0) {
    printf("15.logic.c PASS\n");
  } else {
    printf("15.logic.c FAIL\n");
  }
  return err;
}
