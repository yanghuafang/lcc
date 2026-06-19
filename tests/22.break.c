int printf(char*, ...);

int countNumber(int maxRange, int smallRange) {
  int count = 0;
  int recordi = 0;
  for (int i = 1; i <= maxRange; i += 1) {
    if (i > smallRange) {
      recordi = i;
      break;
    }
    count += 1;
  }
  return count;
}

int main() {
  int err = 0;

  if (countNumber(100, 37) != 37) err = 1;
  if (countNumber(10, 10) != 10) err = 1;
  if (countNumber(5, 0) != 0) err = 1;

  if (err == 0) {
    printf("22.break.c PASS\n");
  } else {
    printf("22.break.c FAIL\n");
  }
  return err;
}
