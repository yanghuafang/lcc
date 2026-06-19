int printf(char*, ...);

int get_seed(void) {
  return 7;
}

int counter_calls(void) {
  static int count;
  count++;
  return count;
}

int counter_with_init(void) {
  static int count = 10;
  count++;
  return count;
}

int bump_runtime_static_decl(void) {
  static int value = get_seed();
  value++;
  return value;
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
  printf("**** 38.static_local.c ****\n");

  check_int("counter_calls 1", counter_calls(), 1);
  check_int("counter_calls 2", counter_calls(), 2);
  check_int("counter_calls 3", counter_calls(), 3);

  check_int("counter_with_init 1", counter_with_init(), 11);
  check_int("counter_with_init 2", counter_with_init(), 12);

  check_int("runtime_static_decl 1", bump_runtime_static_decl(), 8);
  check_int("runtime_static_decl 2", bump_runtime_static_decl(), 9);

  report_result();
  return test_errors;
}
