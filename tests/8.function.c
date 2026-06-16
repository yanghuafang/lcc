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

int sum(int l, int r);

int sum2(int* l, int* r) { return sum(*l, *r); }
void sum3(int l, int r, int* result) { *result = l + r; }
int sum(int l, int r) { return l + r; }

int main() {
  printf("**** 8.function.c ****\n");

  int i = sum(1, 2);
  printf("i addr: %p\n", &i);
  printf("1+2=%d\n", i);
  printf("1+2=%d\n", sum(1, 2));

  int l = 3;
  int r = 4;
  i = sum(l, r);
  printf("3+4=%d\n", i);
  printf("3+4=%d\n", sum(l, r));

  i = sum2(&l, &r);
  printf("3+4=%d\n", i);
  printf("3+4=%d\n", sum2(&l, &r));

  sum3(3, 4, &i);
  printf("3+4=%d\n", i);

  sum3(l, r, &i);
  printf("3+4=%d\n", i);

  check_int("1+2", sum(1, 2), 3);
  check_int("3+4 direct", sum(3, 4), 7);
  check_int("3+4 vars", sum(l, r), 7);
  check_int("3+4 ptr", sum2(&l, &r), 7);
  check_int("3+4 out param", i, 7);

  int bigA = 1000000;
  int bigB = 2000000;
  check_int("large sum", sum(bigA, bigB), 3000000);

  report_result();
  return test_errors;
}
