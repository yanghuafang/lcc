int printf(char*, ...);

typedef unsigned long size_t;
typedef int counter_t;
typedef int* IntPtr;

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_ulong(const char* name, unsigned long actual, unsigned long expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %lu expected %lu\n", name, actual, expected);
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

void helper(size_t nbytes, counter_t step, IntPtr p) {
  *p = (int)(nbytes + (unsigned long)step);
}

int main() {
  printf("**** 35.typedef_builtin.c ****\n");

  size_t n;
  counter_t c;
  int x;
  IntPtr p;

  n = 42;
  c = 7;
  x = 10;
  p = &x;

  helper(n, c, p);

  check_ulong("sizeof(size_t)", sizeof(size_t), 8);
  check_int("sizeof(counter_t)", sizeof(counter_t), 4);
  check_int("sizeof(IntPtr)", sizeof(IntPtr), 8);

  check_ulong("n", n, 42);
  check_int("c", c, 7);
  check_int("x after helper", x, 49);
  check_int("*p", *p, 49);

  report_result();
  return test_errors;
}
