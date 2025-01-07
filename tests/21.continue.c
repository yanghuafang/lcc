int printf(char*, ...);

int countEvenNumber(int n) {
  int count = 0;
  for (int i = 1; i <= n; i += 1) {
    if (i % 2 != 0) {
      continue;
    }

    count += 1;
  }
  return count;
}

int countEvenNumber2(int n) {
  int count = 0;
  int i = 1;
  while (i <= n) {
    if (i % 2 != 0) {
      i += 1;
      continue;
    }

    count += 1;
    i += 1;
  }

  return count;
}

int countEvenNumber3(int n) {
  int count = 0;
  int i = 1;
  do {
    if (i % 2 != 0) {
      i += 1;
      continue;
    }

    count += 1;
    i += 1;
  } while (i <= n);

  return count;
}

int main() {
  int eventNumberIn32 = countEvenNumber(32);
  printf("even number in 32: %d\n", eventNumberIn32);
  eventNumberIn32 = countEvenNumber2(32);
  printf("even number in 32: %d\n", eventNumberIn32);
  eventNumberIn32 = countEvenNumber3(32);
  printf("even number in 32: %d\n", eventNumberIn32);
  return 0;
}