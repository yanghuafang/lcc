int printf(char*, ...);

int gm[3][4];

struct Cell {
  int id;
  int val;
};

int main() {
  int err = 0;
  int m[2][3], scalar;
  Cell grid[2][2];
  int v;

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

  v = m[0][0];
  if (v != 1) err = 1;
  v = m[0][2];
  if (v != 3) err = 1;
  v = m[1][1];
  if (v != 5) err = 1;
  v = m[1][2];
  if (v != 6) err = 1;
  if (scalar != 99) err = 1;

  v = gm[0][0];
  if (v != 10) err = 1;
  v = gm[1][2];
  if (v != 20) err = 1;
  v = gm[2][3];
  if (v != 30) err = 1;
  v = gm[0][1];
  if (v != 0) err = 1;

  v = grid[0][1].id;
  if (v != 7) err = 1;
  v = grid[0][1].val;
  if (v != 70) err = 1;
  v = grid[1][0].id;
  if (v != 8) err = 1;

  if (err == 0) {
    printf("33.array_2d_decl.c PASS\n");
  } else {
    printf("33.array_2d_decl.c FAIL\n");
  }
  return err;
}
