int printf(char*, ...);

int test_errors = 0;
int ga[] = {10, 7, 8, 9, 1, 5};
char gs[] = "hi";
char gt[4] = "hey";

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_char(const char* name, int actual, int expected) {
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
  printf("**** 32.array_1d_inferred_string_init.c ****\n");

  int la[] = {1, 2, 3};
  char ls[] = "hello";
  char lb[6] = "hello";

  check_int("la[0]", la[0], 1);
  check_int("la[1]", la[1], 2);
  check_int("la[2]", la[2], 3);

  check_char("ls[0]", ls[0], 'h');
  check_char("ls[1]", ls[1], 'e');
  check_char("ls[2]", ls[2], 'l');
  check_char("ls[3]", ls[3], 'l');
  check_char("ls[4]", ls[4], 'o');
  check_char("ls[5]", ls[5], 0);

  check_char("lb[0]", lb[0], 'h');
  check_char("lb[5]", lb[5], 0);

  check_int("ga[0]", ga[0], 10);
  check_int("ga[1]", ga[1], 7);
  check_int("ga[2]", ga[2], 8);
  check_int("ga[3]", ga[3], 9);
  check_int("ga[4]", ga[4], 1);
  check_int("ga[5]", ga[5], 5);

  check_char("gs[0]", gs[0], 'h');
  check_char("gs[1]", gs[1], 'i');
  check_char("gs[2]", gs[2], 0);

  check_char("gt[0]", gt[0], 'h');
  check_char("gt[1]", gt[1], 'e');
  check_char("gt[2]", gt[2], 'y');
  check_char("gt[3]", gt[3], 0);

  report_result();
  return test_errors;
}
