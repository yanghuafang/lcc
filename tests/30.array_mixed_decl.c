int printf(char*, ...);

int main() {
  int err = 0;
  int a[4], b;
  a[0] = 10;
  a[1] = 20;
  b = 30;

  if (a[0] != 10) err = 1;
  if (a[1] != 20) err = 1;
  if (b != 30) err = 1;

  if (err == 0) {
    printf("30.array_mixed_decl.c PASS\n");
  } else {
    printf("30.array_mixed_decl.c FAIL\n");
  }
  return err;
}
