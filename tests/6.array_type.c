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

char gs[16];
char* gps = "hello world!";
int gi[4];

int main() {
  printf("**** 6.array_type.c ****\n");

  char* ps = "happy new year!";
  printf("%s\n", ps);

  printf("%s\n", gps);

  char s[16];
  s[0] = 'g';
  s[1] = 'o';
  s[2] = 'o';
  s[3] = 'd';
  s[4] = 0;
  printf("%s\n", s);

  gs[0] = 'l';
  gs[1] = 'u';
  gs[2] = 'c';
  gs[3] = 'k';
  gs[4] = 'y';
  gs[5] = 0;
  printf("%s\n", gs);

  int i[4];
  i[0] = 128;
  i[1] = 256;
  printf("i %d %d\n", i[0], i[1]);
  printf("i addr %p %p\n", &i[0], &i[1]);

  gi[0] = 1024;
  gi[1] = 2048;
  printf("gi %d %d\n", gi[0], gi[1]);
  printf("gi addr %p %p\n", &gi[0], &gi[1]);

  check_int("i[0]", i[0], 128);
  check_int("i[1]", i[1], 256);
  check_int("gi[0]", gi[0], 1024);
  check_int("gi[1]", gi[1], 2048);
  check_int("s[0]", s[0], 'g');
  check_int("gs[0]", gs[0], 'l');

  i[2] = 0;
  i[3] = -1;
  check_int("i[2] zero", i[2], 0);
  check_int("i[3] negative", i[3], -1);

  report_result();
  return test_errors;
}
