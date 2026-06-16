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
  printf("**** 16.ternary.c ****\n");

  int a = 3;
  int b = 3;
  int c = 7;

  int minVal = a < c ? a : c;
  int maxVal = a < c ? c : a;
  printf("minVal:%d\n", minVal);
  printf("maxVal:%d\n", maxVal);

  check_int("minVal", minVal, 3);
  check_int("maxVal", maxVal, 7);

  int d = -5;
  int e = 2;
  int minNeg = d < e ? d : e;
  int maxNeg = d < e ? e : d;
  check_int("minNeg boundary", minNeg, -5);
  check_int("maxNeg boundary", maxNeg, 2);

  int same = 42;
  int ternarySame = same < same ? 0 : 1;
  check_int("equal operands", ternarySame, 1);

  report_result();
  return test_errors;
}
