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
  int err = 0;

  if (countSum(100) != 5050) err = 1;
  if (countSum2(100) != 5050) err = 1;
  if (countSum3(100) != 5050) err = 1;
  if (countSum(0) != 0) err = 1;
  if (countSum(1) != 1) err = 1;

  if (err == 0) {
    printf("19.for_loop.c PASS\n");
  } else {
    printf("19.for_loop.c FAIL\n");
  }
  return err;
}
