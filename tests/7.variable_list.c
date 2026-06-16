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
  printf("**** 7.variable_list.c ****\n");

  int a, b = 1, c = 2;
  int d = 3, e;
  int f;
  a = 0;
  e = 4;
  f = 5;
  int g, h;
  g = 6;
  h = 7;

  printf("%d %d %d %d %d %d\n", a, b, c, d, e, f);
  printf("%d %d\n", g, h);

  check_int("a", a, 0);
  check_int("b", b, 1);
  check_int("c", c, 2);
  check_int("d", d, 3);
  check_int("e", e, 4);
  check_int("f", f, 5);
  check_int("g", g, 6);
  check_int("h", h, 7);

  report_result();
  return test_errors;
}
