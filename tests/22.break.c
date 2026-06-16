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

int countNumber(int maxRange, int smallRange) {
  int count = 0;
  int recordi = 0;
  for (int i = 1; i <= maxRange; i += 1) {
    if (i > smallRange) {
      recordi = i;
      break;
    }
    count += 1;
  }

  printf("i:%d\n", recordi);
  return count;
}

int main() {
  printf("**** 22.break.c ****\n");

  int count = countNumber(100, 37);
  printf("count 1 to 37: %d\n", count);

  check_int("count to 37", count, 37);
  check_int("break at boundary", countNumber(10, 10), 10);
  check_int("break immediately", countNumber(5, 0), 0);

  report_result();
  return test_errors;
}
