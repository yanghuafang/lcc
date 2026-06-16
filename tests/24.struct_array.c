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

struct Data {
  int id;
  int data;
};

int main() {
  printf("**** 24.struct_array.c ****\n");

  Data da[2];
  da[0].id = 0;
  da[0].data = 0;
  da[1].id = 10;
  da[1].data = 80;
  printf("da[1].id:%d da[1].data:%d\n", da[1].id, da[1].data);

  check_int("da[1].id", da[1].id, 10);
  check_int("da[1].data", da[1].data, 80);
  check_int("da[0].id default", da[0].id, 0);
  check_int("da[0].data default", da[0].data, 0);

  report_result();
  return test_errors;
}
