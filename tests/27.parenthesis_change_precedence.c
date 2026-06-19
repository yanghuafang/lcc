int printf(char*, ...);

int main() {
  int err = 0;
  int a = 2;
  int b = 4;
  int c = 5;

  if (a + b * c != 22) err = 1;
  if ((a + b) * c != 30) err = 1;
  if (c * (a - b) != -10) err = 1;
  if (a - b % c != -2) err = 1;
  if ((a + b) / c != 1) err = 1;

  int x = 1;
  int y = 2;
  int z = 3;
  int r = x + y << z;
  if (r != 24) err = 1;

  int s = (x + y) << z;
  if (s != 24) err = 1;

  if (err == 0) {
    printf("27.parenthesis_change_precedence.c PASS\n");
  } else {
    printf("27.parenthesis_change_precedence.c FAIL\n");
  }
  return err;
}
