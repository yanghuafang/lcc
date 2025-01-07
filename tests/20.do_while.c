int printf(char*, ...);

int countSum(int n) {
  int sum = 0;
  int i = 1;
  while (i <= n) {
    sum += i;
    i += 1;
  }

  return sum;
}

int countSum2(int n) {
  int sum = 0;
  int i = 0;
  do {
    sum += i;
    i += 1;
  } while (i <= n);

  return sum;
}

int main() {
  int sum100 = countSum(100);
  printf("1+2+...+100 = %d\n", sum100);
  sum100 = countSum2(100);
  printf("1+2+...+100 = %d\n", sum100);
  return 0;
}