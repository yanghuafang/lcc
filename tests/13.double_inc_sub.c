int printf(char*, ...);

int main() {
  int a = 13;
  printf("a: %d\n", a);
  int b = a++;
  printf("after a++, a: %d b: %d\n", a, b);
  a = 13;
  printf("a: %d\n", a);
  int c = ++a;
  printf("after ++a, a: %d c: %d\n", a, c);

  a = 13;
  printf("a: %d\n", a);
  int d = a--;
  printf("after a--, a: %d d: %d\n", a, d);
  a = 13;
  printf("a: %d\n", a);
  int e = --a;
  printf("after --a, a: %d e: %d\n", a, e);

  return 0;
}