int printf(char*, ...);

int ga[2][3] = {{1, 2, 3}, {4, 5, 6}};
int gb[2][3] = {0, 1, 2, 3, 4, 5};
int gc[][2] = {{10, 11}, {20}};

int main() {
  int err = 0;
  int la[2][3] = {{1, 2}, {3}};
  int lb[2][3] = {7, 8, 9, 10, 11, 12};
  int lc[][3] = {{1, 2, 3}, {4}};

  if (la[0][0] != 1) err = 1;
  if (la[0][2] != 0) err = 1;
  if (la[1][0] != 3) err = 1;
  if (la[1][2] != 0) err = 1;

  if (lb[0][0] != 7) err = 1;
  if (lb[1][2] != 12) err = 1;

  if (lc[0][2] != 3) err = 1;
  if (lc[1][0] != 4) err = 1;
  if (lc[1][2] != 0) err = 1;

  if (ga[0][0] != 1) err = 1;
  if (ga[1][2] != 6) err = 1;

  if (gb[0][1] != 1) err = 1;
  if (gb[1][0] != 3) err = 1;

  if (gc[0][1] != 11) err = 1;
  if (gc[1][0] != 20) err = 1;
  if (gc[1][1] != 0) err = 1;

  if (err == 0) {
    printf("34.array_2d_brace_init.c PASS\n");
  } else {
    printf("34.array_2d_brace_init.c FAIL\n");
  }
  return err;
}
