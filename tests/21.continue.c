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

int countEvenNumber(int n) {
  int count = 0;
  for (int i = 1; i <= n; i += 1) {
    if (i % 2 != 0) {
      continue;
    }

    count += 1;
  }
  return count;
}

int countEvenNumber2(int n) {
  int count = 0;
  int i = 1;
  while (i <= n) {
    if (i % 2 != 0) {
      i += 1;
      continue;
    }

    count += 1;
    i += 1;
  }

  return count;
}

int countEvenNumber3(int n) {
  int count = 0;
  int i = 1;
  do {
    if (i % 2 != 0) {
      i += 1;
      continue;
    }

    count += 1;
    i += 1;
  } while (i <= n);

  return count;
}

int main() {
  printf("**** 21.continue.c ****\n");

  int eventNumberIn32 = countEvenNumber(32);
  printf("even number in 32: %d\n", eventNumberIn32);
  eventNumberIn32 = countEvenNumber2(32);
  printf("even number in 32: %d\n", eventNumberIn32);
  eventNumberIn32 = countEvenNumber3(32);
  printf("even number in 32: %d\n", eventNumberIn32);

  check_int("for continue", countEvenNumber(32), 16);
  check_int("while continue", countEvenNumber2(32), 16);
  check_int("do-while continue", countEvenNumber3(32), 16);
  check_int("boundary n=0", countEvenNumber(0), 0);
  check_int("boundary n=1", countEvenNumber(1), 0);

  report_result();
  return test_errors;
}
