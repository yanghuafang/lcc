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

int g_data = 0;

void getAddress(int** p) { *p = &g_data; }

int main() {
  printf("**** 10.double_pointer_type.c ****\n");

  int* p = &g_data;
  *p = 1234;
  printf("p: %p, *p: %d, &g_data: %p, g_data: %d\n", p, *p, &g_data, g_data);

  int* p2;
  getAddress(&p2);
  *p2 = 5678;
  printf("p2: %p, *p2: %d, &g_data: %p, g_data: %d\n", p2, *p2, &g_data,
         g_data);

  check_int("g_data after p", g_data, 5678);
  check_int("*p2", *p2, 5678);
  check_int("*p", *p, 5678);

  *p = 0;
  check_int("zero boundary", g_data, 0);

  *p2 = -42;
  check_int("negative boundary", g_data, -42);

  report_result();
  return test_errors;
}
