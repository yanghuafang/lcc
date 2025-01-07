int printf(char*, ...);

// & Bitwise AND, precedence 8
// & Address Of, precedence 2

void checkAmpersandPrec() {
  unsigned long a = 0x1234567812345678;
  unsigned long b = 0x9abcdef09abcdef0;
  unsigned long c = (unsigned long)&a;
  // `unsigned long d = a & b & &c;` is invalid, as &c is type of pointer, not
  // type of integer.
  unsigned long d = (unsigned long)&c & a & b;
  printf("checkAmpersandPrec a:%lu, b:%lu, c(addr a):%lu, d:%lu\n", a, b, c, d);
}

// +/- Add/Sub, precedence 4
// +/- Unary Plus/Minus, precedence 2
void checkPlusPrec() {
  printf("checkPlusPrec\n");

  int a = 13;
  int b = 3 + +a;
  printf("3 + +13: %d\n", b);

  int c = 3 - +a;
  printf("3 - +13: %d\n", c);

  b = 3 + +13;
  printf("3 + +13: %d\n", b);

  c = 3 - +13;
  printf("3 - +13: %d\n", c);
}

void checkMinusPrec() {
  printf("checkMinusPrec\n");

  int a = 13;
  int b = 3 - -a;
  printf("3 - -13: %d\n", b);

  int c = 3 - -a;
  printf("3 - -13: %d\n", c);

  b = 3 - -13;
  printf("3 - -13: %d\n", b);

  c = 3 - -13;
  printf("3 - -13: %d\n", c);
}

// * Mul, precedence 3
// * Dereference, precedence 2

void checkAsterisk() {
  printf("checkAsterisk\n");
  int a = 3;
  int b = 4;
  int* c = &b;
  int d = a * b * *c;

  printf("3 * 4 * 4: %d\n", d);
}

// (type) Type Cast, precedence 2
// () Function Call, precedence 1
void subFunc(int i) { printf("subFunc i: %d\n", i); }

void checkFuncCall() {
  long i = 1234;
  subFunc((int)i);
}

// ++/-- Prefix, precedence 2
// ++/-- Postfix, precedence 1
void checkInc() {
  int a = 10;
  int b = (++a)++;
  printf("checkInc, a: %d, b: %d\n", a, b);
}

void checkDec() {
  int a = 10;
  int b = (--a)--;
  printf("checkDec, a: %d, b: %d\n", a, b);
}

int main() {
  checkAmpersandPrec();
  checkPlusPrec();
  checkMinusPrec();
  checkAsterisk();
  checkFuncCall();
  checkInc();
  checkDec();
  return 0;
}