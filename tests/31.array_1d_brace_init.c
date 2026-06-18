int printf(char*, ...);

int test_errors = 0;
int ga[4] = {1, 2, 3};
int gb[2] = {10, 20};

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
  printf("**** 31.array_1d_brace_init.c ****\n");

  int la[4] = {1, 2, 3};
  int lb[3] = {4, 5, 6};
  int lc[2] = {};

  check_int("la[0]", la[0], 1);
  check_int("la[1]", la[1], 2);
  check_int("la[2]", la[2], 3);
  check_int("la[3]", la[3], 0);

  check_int("lb[0]", lb[0], 4);
  check_int("lb[1]", lb[1], 5);
  check_int("lb[2]", lb[2], 6);

  check_int("lc[0]", lc[0], 0);
  check_int("lc[1]", lc[1], 0);

  check_int("ga[0]", ga[0], 1);
  check_int("ga[1]", ga[1], 2);
  check_int("ga[2]", ga[2], 3);
  check_int("ga[3]", ga[3], 0);

  check_int("gb[0]", gb[0], 10);
  check_int("gb[1]", gb[1], 20);

  report_result();
  return test_errors;
}
