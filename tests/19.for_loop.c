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
  for (int i = 1; i <= n; i += 1) {
    sum += i;
  }
  return sum;
}

int countSum2(int n) {
  int sum = 0;
  int i = 1;
  for (; i <= n; i += 1) {
    sum += i;
  }
  return sum;
}

int countSum3(int n) {
  int sum = 0;
  int i;
  for (i = 1; i <= n; i += 1) {
    sum += i;
  }
  return sum;
}

int main() {
  printf("**** 19.for_loop.c ****\n");

  int sum100 = countSum(100);
  printf("1+2+...+100 = %d\n", sum100);
  sum100 = countSum2(100);
  printf("1+2+...+100 = %d\n", sum100);
  sum100 = countSum3(100);
  printf("1+2+...+100 = %d\n", sum100);

  check_int("countSum(100)", countSum(100), 5050);
  check_int("countSum2(100)", countSum2(100), 5050);
  check_int("countSum3(100)", countSum3(100), 5050);
  check_int("countSum(0) boundary", countSum(0), 0);
  check_int("countSum(1) boundary", countSum(1), 1);

  report_result();
  return test_errors;
}
