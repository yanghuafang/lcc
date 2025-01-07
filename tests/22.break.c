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

  printf("i:%d\n", recordi);
  return count;
}

int main() {
  int count = countNumber(100, 37);
  printf("count 1 to 37: %d\n", count);
  return 0;
}