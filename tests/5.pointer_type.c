int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_char(const char* name, char actual, char expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %c expected %c\n", name, actual, expected);
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

char gc = 'a';
int gi = 1024;

int main() {
  printf("**** 5.pointer_type.c ****\n");

  char c = 'A';
  int i = 128;

  char* pc = &c;
  int* pi = &i;

  printf("c: %c %c\n", c, *pc);
  printf("i: %i %i\n", i, *pi);

  *pc = 'B';
  *pi = 256;

  printf("new c: %c %c\n", c, *pc);
  printf("new i: %i %i\n", i, *pi);

  char* pgc = &gc;
  int* pgi = &gi;

  printf("gc: %c %c\n", gc, *pgc);
  printf("gi: %i %i\n", gi, *pgi);

  *pgc = 'b';
  *pgi = 2048;

  printf("new gc: %c %c\n", gc, *pgc);
  printf("new gi: %i %i\n", gi, *pgi);

  check_char("c initial", c, 'B');
  check_char("deref c", *pc, 'B');
  check_int("i local", i, 256);
  check_int("deref i", *pi, 256);
  check_char("gc global", gc, 'b');
  check_int("gi global", gi, 2048);

  *pi = 0;
  check_int("i zero boundary", i, 0);

  report_result();
  return test_errors;
}
