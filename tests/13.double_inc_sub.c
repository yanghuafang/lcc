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

int main() {
  printf("**** 13.double_inc_sub.c ****\n");

  int a = 13;
  printf("a: %d\n", a);
  int b = a++;
  printf("after a++, a: %d b: %d\n", a, b);
  check_int("postfix inc a", a, 14);
  check_int("postfix inc b", b, 13);

  a = 13;
  printf("a: %d\n", a);
  int c = ++a;
  printf("after ++a, a: %d c: %d\n", a, c);
  check_int("prefix inc a", a, 14);
  check_int("prefix inc c", c, 14);

  a = 13;
  printf("a: %d\n", a);
  int d = a--;
  printf("after a--, a: %d d: %d\n", a, d);
  check_int("postfix dec a", a, 12);
  check_int("postfix dec d", d, 13);

  a = 13;
  printf("a: %d\n", a);
  int e = --a;
  printf("after --a, a: %d e: %d\n", a, e);
  check_int("prefix dec a", a, 12);
  check_int("prefix dec e", e, 12);

  a = 0;
  a++;
  check_int("inc from zero", a, 1);
  a--;
  check_int("dec to zero", a, 0);

  report_result();
  return test_errors;
}
