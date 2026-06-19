int printf(char*, ...);

int main() {
  int err = 0;
  int a, b = 1, c = 2;
  int d = 3, e;
  int f;
  a = 0;
  e = 4;
  f = 5;
  int g, h;
  g = 6;
  h = 7;

  if (a != 0) err = 1;
  if (b != 1) err = 1;
  if (c != 2) err = 1;
  if (d != 3) err = 1;
  if (e != 4) err = 1;
  if (f != 5) err = 1;
  if (g != 6) err = 1;
  if (h != 7) err = 1;

  if (err == 0) {
    printf("7.variable_list.c PASS\n");
  } else {
    printf("7.variable_list.c FAIL\n");
  }
  return err;
}
