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

int countSum(int n) {
  int sum = 0;
  int i = 1;
  while (i <= n) {
    sum += i;
    i += 1;
  }

  return sum;
}

int countSum2(int n) {
  int sum = 0;
  int i = 0;
  do {
    sum += i;
    i += 1;
  } while (i <= n);

  return sum;
}

int main() {
  printf("**** 20.do_while.c ****\n");

  int sum100 = countSum(100);
  printf("1+2+...+100 = %d\n", sum100);
  sum100 = countSum2(100);
  printf("1+2+...+100 = %d\n", sum100);

  check_int("while sum 100", countSum(100), 5050);
  check_int("do-while sum 100", countSum2(100), 5050);
  check_int("while sum 0", countSum(0), 0);
  check_int("do-while sum 0", countSum2(0), 0);

  report_result();
  return test_errors;
}
