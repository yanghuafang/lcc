int printf(char*, ...);

int test_errors = 0;
int gm[3][4];

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

struct Cell {
  int id;
  int val;
};

int main() {
  printf("**** 33.array_2d_decl.c ****\n");

  int m[2][3], scalar;
  Cell grid[2][2];

  m[0][0] = 1;
  m[0][1] = 2;
  m[0][2] = 3;
  m[1][0] = 4;
  m[1][1] = 5;
  m[1][2] = 6;
  scalar = 99;

  gm[0][0] = 10;
  gm[1][2] = 20;
  gm[2][3] = 30;

  grid[0][1].id = 7;
  grid[0][1].val = 70;
  grid[1][0].id = 8;

  check_int("m[0][0]", m[0][0], 1);
  check_int("m[0][2]", m[0][2], 3);
  check_int("m[1][1]", m[1][1], 5);
  check_int("m[1][2]", m[1][2], 6);
  check_int("scalar", scalar, 99);

  check_int("gm[0][0]", gm[0][0], 10);
  check_int("gm[1][2]", gm[1][2], 20);
  check_int("gm[2][3]", gm[2][3], 30);
  check_int("gm[0][1] default", gm[0][1], 0);

  check_int("grid[0][1].id", grid[0][1].id, 7);
  check_int("grid[0][1].val", grid[0][1].val, 70);
  check_int("grid[1][0].id", grid[1][0].id, 8);

  report_result();
  return test_errors;
}
