int printf(char*, ...);

int ga[4] = {1, 2, 3};
int gb[2] = {10, 20};

int main() {
  int err = 0;
  int la[4] = {1, 2, 3};
  int lb[3] = {4, 5, 6};
  int lc[2] = {};

  if (la[0] != 1) err = 1;
  if (la[1] != 2) err = 1;
  if (la[2] != 3) err = 1;
  if (la[3] != 0) err = 1;

  if (lb[0] != 4) err = 1;
  if (lb[1] != 5) err = 1;
  if (lb[2] != 6) err = 1;

  if (lc[0] != 0) err = 1;
  if (lc[1] != 0) err = 1;

  if (ga[0] != 1) err = 1;
  if (ga[1] != 2) err = 1;
  if (ga[2] != 3) err = 1;
  if (ga[3] != 0) err = 1;

  if (gb[0] != 10) err = 1;
  if (gb[1] != 20) err = 1;

  if (err == 0) {
    printf("31.array_1d_brace_init.c PASS\n");
  } else {
    printf("31.array_1d_brace_init.c FAIL\n");
  }
  return err;
}
