int printf(char*, ...);

typedef unsigned long size_t;
typedef int counter_t;
typedef int* IntPtr;

void helper(size_t nbytes, counter_t step, IntPtr p) {
  *p = (int)(nbytes + (unsigned long)step);
}

int main() {
  int err = 0;
  counter_t c = 7;
  int x = 10;
  IntPtr p = &x;

  helper(42, c, p);

  if (c != 7) err = 1;
  if (x != 49) err = 1;
  int result = *p;
  if (result != 49) err = 1;

  if (err == 0) {
    printf("35.typedef_builtin.c PASS\n");
  } else {
    printf("35.typedef_builtin.c FAIL\n");
  }
  return err;
}
