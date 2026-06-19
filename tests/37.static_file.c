int printf(char*, ...);

static int counter = 0;

static int helper(int value) {
  return value + counter;
}

int bump(void) {
  counter++;
  return counter;
}

int bump_with_helper(void) {
  counter++;
  return helper(counter);
}

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

int main(void) {
  printf("**** 37.static_file.c ****\n");

  check_int("helper before bumps", helper(5), 5);
  check_int("first bump", bump(), 1);
  check_int("second bump", bump(), 2);
  check_int("helper after two bumps", helper(3), 5);
  check_int("bump with helper", bump_with_helper(), 6);

  report_result();
  return test_errors;
}
