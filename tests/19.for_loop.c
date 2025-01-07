int printf(char*, ...);

int countSum(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i += 1) {
    sum += i;
  }
  return sum;
}

int countSum2(int n) {
  int sum = 0;
  int i = 1;
  for (; i <= n; i += 1) {
    sum += i;
  }
  return sum;
}

int countSum3(int n) {
  int sum = 0;
  int i;
  for (i = 1; i <= n; i += 1) {
    sum += i;
  }
  return sum;
}

int main() {
  int sum100 = countSum(100);
  printf("1+2+...+100 = %d\n", sum100);
  sum100 = countSum2(100);
  printf("1+2+...+100 = %d\n", sum100);
  sum100 = countSum3(100);
  printf("1+2+...+100 = %d\n", sum100);
  return 0;
}