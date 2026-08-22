// A control. Everything here is semantics lcc already gets right, so this
// program must always agree — it is what tells a wholesale harness failure
// (a reference compiler that stopped working, an empty capture) apart from a
// real divergence in one of its neighbours.

int printf(char*, ...);

struct Point {
  int x;
  int y;
};

int sumTo(int n) {
  int total = 0;
  int i;
  for (i = 1; i <= n; i = i + 1) {
    total = total + i;
  }
  return total;
}

int main() {
  printf("sum 1..10          %d\n", sumTo(10));

  int a = 37;
  int b = 8;
  printf("arith              %d %d %d %d %d\n", a + b, a - b, a * b, a / b,
         a % b);

  unsigned int ua = 10;
  unsigned int ub = 3;
  printf("unsigned div/mod   %u %u\n", ua / ub, ua % ub);

  int neg = -8;
  printf("signed div/mod     %d %d\n", neg / 3, neg % 3);

  int arr[5] = {5, 4, 3, 2, 1};
  int i;
  int acc = 0;
  for (i = 0; i < 5; i = i + 1) {
    acc = acc + arr[i] * i;
  }
  printf("array walk         %d\n", acc);

  struct Point p;
  p.x = 3;
  p.y = 4;
  struct Point* pp = &p;
  printf("struct and pointer %d %d\n", p.x + p.y, pp->x * pp->y);

  printf("bitwise            %d %d %d %d\n", a & b, a | b, a ^ b, ~a);
  printf("logic              %d %d %d\n", a > b, a == b, !b);
  printf("ternary            %d\n", a > b ? a : b);

  // Suffixed: an unsuffixed decimal wider than int is out of lcc's subset.
  // See docs/Language.md.
  long big = 5000000000L;
  printf("long arithmetic    %ld\n", big + 1);
  return 0;
}
