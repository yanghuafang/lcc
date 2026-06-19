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
  int err = 0;

  if (countSum(100) != 5050) err = 1;
  if (countSum2(100) != 5050) err = 1;
  if (countSum(0) != 0) err = 1;
  if (countSum2(0) != 0) err = 1;

  if (err == 0) {
    printf("20.do_while.c PASS\n");
  } else {
    printf("20.do_while.c FAIL\n");
  }
  return err;
}
