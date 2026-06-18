int printf(char*, ...);

int test_errors = 0;
int ga[2][3] = {{1, 2, 3}, {4, 5, 6}};
int gb[2][3] = {0, 1, 2, 3, 4, 5};
int gc[][2] = {{10, 11}, {20}};

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
  printf("**** 34.array_2d_brace_init.c ****\n");

  int la[2][3] = {{1, 2}, {3}};
  int lb[2][3] = {7, 8, 9, 10, 11, 12};
  int lc[][3] = {{1, 2, 3}, {4}};

  check_int("la[0][0]", la[0][0], 1);
  check_int("la[0][2]", la[0][2], 0);
  check_int("la[1][0]", la[1][0], 3);
  check_int("la[1][2]", la[1][2], 0);

  check_int("lb[0][0]", lb[0][0], 7);
  check_int("lb[1][2]", lb[1][2], 12);

  check_int("lc[0][2]", lc[0][2], 3);
  check_int("lc[1][0]", lc[1][0], 4);
  check_int("lc[1][2]", lc[1][2], 0);

  check_int("ga[0][0]", ga[0][0], 1);
  check_int("ga[1][2]", ga[1][2], 6);

  check_int("gb[0][1]", gb[0][1], 1);
  check_int("gb[1][0]", gb[1][0], 3);

  check_int("gc[0][1]", gc[0][1], 11);
  check_int("gc[1][0]", gc[1][0], 20);
  check_int("gc[1][1]", gc[1][1], 0);

  report_result();
  return test_errors;
}
