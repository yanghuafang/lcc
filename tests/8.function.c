int printf(char*, ...);

int sum(int l, int r);

int sum2(int* l, int* r) { return sum(*l, *r); }
void sum3(int l, int r, int* result) { *result = l + r; }
int sum(int l, int r) { return l + r; }

int main() {
  int i = sum(1, 2);
  printf("i addr: %p\n", &i);
  printf("1+2=%d\n", i);
  printf("1+2=%d\n", sum(1, 2));

  int l = 3;
  int r = 4;
  i = sum(l, r);
  printf("3+4=%d\n", i);
  printf("3+4=%d\n", sum(l, r));

  i = sum2(&l, &r);
  printf("3+4=%d\n", i);
  printf("3+4=%d\n", sum2(&l, &r));

  sum3(3, 4, &i);
  printf("3+4=%d\n", i);

  sum3(l, r, &i);
  printf("3+4=%d\n", i);
  return 0;
}