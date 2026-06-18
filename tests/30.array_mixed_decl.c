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
  printf("**** 30.array_mixed_decl.c ****\n");

  int a[4], b;
  a[0] = 10;
  a[1] = 20;
  b = 30;

  check_int("a[0]", a[0], 10);
  check_int("a[1]", a[1], 20);
  check_int("b", b, 30);

  report_result();
  return test_errors;
}
