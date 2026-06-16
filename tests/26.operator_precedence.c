int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_ulong(const char* name, unsigned long actual, unsigned long expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %lu expected %lu\n", name, actual, expected);
    test_errors++;
  }
}

void report_result(void) {
  if (test_errors == 0) {
    printf("PASS\n");
  } else {
    printf("FAIL: %d error(s)\n", test_errors);
  }
}

void checkAmpersandPrec() {
  unsigned long a = 0x1234567812345678;
  unsigned long b = 0x9abcdef09abcdef0;
  unsigned long c = (unsigned long)&a;
  unsigned long d = (unsigned long)&c & a & b;
  printf("checkAmpersandPrec a:%lu, b:%lu, c(addr a):%lu, d:%lu\n", a, b, c, d);
  check_ulong("a", a, 0x1234567812345678);
  check_ulong("b", b, 0x9abcdef09abcdef0);
}

void checkPlusPrec() {
  printf("checkPlusPrec\n");

  int a = 13;
  int b = 3 + +a;
  printf("3 + +13: %d\n", b);
  check_int("3 + +13", b, 16);

  int c = 3 - +a;
  printf("3 - +13: %d\n", c);
  check_int("3 - +13", c, -10);

  b = 3 + +13;
  printf("3 + +13: %d\n", b);
  check_int("3 + +13 literal", b, 16);

  c = 3 - +13;
  printf("3 - +13: %d\n", c);
  check_int("3 - +13 literal", c, -10);
}

void checkMinusPrec() {
  printf("checkMinusPrec\n");

  int a = 13;
  int b = 3 - -a;
  printf("3 - -13: %d\n", b);
  check_int("3 - -13", b, 16);

  int c = 3 - -a;
  printf("3 - -13: %d\n", c);
  check_int("3 - -13 again", c, 16);

  b = 3 - -13;
  printf("3 - -13: %d\n", b);
  check_int("3 - -13 literal", b, 16);

  c = 3 - -13;
  printf("3 - -13: %d\n", c);
  check_int("3 - -13 literal again", c, 16);
}

void checkAsterisk() {
  printf("checkAsterisk\n");
  int a = 3;
  int b = 4;
  int* c = &b;
  int d = a * b * *c;

  printf("3 * 4 * 4: %d\n", d);
  check_int("3*4*4", d, 48);
}

void subFunc(int i) { printf("subFunc i: %d\n", i); }

void checkFuncCall() {
  long i = 1234;
  subFunc((int)i);
  check_int("cast call arg", (int)i, 1234);
}

void checkInc() {
  int a = 10;
  int b = (++a)++;
  printf("checkInc, a: %d, b: %d\n", a, b);
  check_int("(++a)++ a", a, 12);
  check_int("(++a)++ b", b, 11);
}

void checkDec() {
  int a = 10;
  int b = (--a)--;
  printf("checkDec, a: %d, b: %d\n", a, b);
  check_int("(--a)-- a", a, 8);
  check_int("(--a)-- b", b, 9);
}

int main() {
  printf("**** 26.operator_precedence.c ****\n");

  checkAmpersandPrec();
  checkPlusPrec();
  checkMinusPrec();
  checkAsterisk();
  checkFuncCall();
  checkInc();
  checkDec();

  report_result();
  return test_errors;
}
