int printf(char*, ...);

void checkArithmetic() {
  int a = 2;
  int b = 4;
  int c = 5;

  int d = a + b * c;
  printf("2 + 4 * 5 = %d\n", d);

  d = (a + b) * c;
  printf("(2 + 4) * 5 = %d\n", d);

  d = c * (a - b);
  printf("5 * (2 - 4) = %d\n", d);

  d = a - b % c;
  printf("2 - 4 mod 5 = %d\n", d);

  d = (a + b) / c;
  printf("(2 + 4) / 5 = %d\n", d);
}

int main() {
  checkArithmetic();
  return 0;
}
