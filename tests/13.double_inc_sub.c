int printf(char*, ...);

int main() {
  int err = 0;
  int a = 13;

  int b = a++;
  if (a != 14) err = 1;
  if (b != 13) err = 1;

  a = 13;
  int c = ++a;
  if (a != 14) err = 1;
  if (c != 14) err = 1;

  a = 13;
  int d = a--;
  if (a != 12) err = 1;
  if (d != 13) err = 1;

  a = 13;
  int e = --a;
  if (a != 12) err = 1;
  if (e != 12) err = 1;

  a = 0;
  a++;
  if (a != 1) err = 1;
  a--;
  if (a != 0) err = 1;

  if (err == 0) {
    printf("13.double_inc_sub.c PASS\n");
  } else {
    printf("13.double_inc_sub.c FAIL\n");
  }
  return err;
}
