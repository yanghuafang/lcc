int printf(char*, ...);

int sum(int l, int r);

int sum2(int* l, int* r) { return sum(*l, *r); }
void sum3(int l, int r, int* result) { *result = l + r; }
int sum(int l, int r) { return l + r; }

int main() {
  int err = 0;
  int i;
  int l = 3;
  int r = 4;

  if (sum(1, 2) != 3) err = 1;
  if (sum(3, 4) != 7) err = 1;
  if (sum(l, r) != 7) err = 1;
  if (sum2(&l, &r) != 7) err = 1;

  sum3(3, 4, &i);
  if (i != 7) err = 1;
  sum3(l, r, &i);
  if (i != 7) err = 1;

  if (sum(1000000, 2000000) != 3000000) err = 1;

  if (err == 0) {
    printf("8.function.c PASS\n");
  } else {
    printf("8.function.c FAIL\n");
  }
  return err;
}
