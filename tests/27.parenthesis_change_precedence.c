int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
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

void checkArithmetic() {
  int a = 2;
  int b = 4;
  int c = 5;

  int d = a + b * c;
  printf("2 + 4 * 5 = %d\n", d);
  check_int("mul before add", d, 22);

  d = (a + b) * c;
  printf("(2 + 4) * 5 = %d\n", d);
  check_int("parens override", d, 30);

  d = c * (a - b);
  printf("5 * (2 - 4) = %d\n", d);
  check_int("negative product", d, -10);

  d = a - b % c;
  printf("2 - 4 mod 5 = %d\n", d);
  check_int("mod before sub", d, -2);

  d = (a + b) / c;
  printf("(2 + 4) / 5 = %d\n", d);
  check_int("int div", d, 1);
}

int main() {
  printf("**** 27.parenthesis_change_precedence.c ****\n");

  checkArithmetic();

  int x = 1;
  int y = 2;
  int z = 3;
  int r = x + y << z;
  printf("1 + 2 << 3 = %d\n", r);
  check_int("lcc evaluates (1+2) then shift", r, 24);

  int s = (x + y) << z;
  check_int("parens shift", s, 24);

  report_result();
  return test_errors;
}
