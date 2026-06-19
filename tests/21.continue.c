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
  int err = 0;

  if (countEvenNumber(32) != 16) err = 1;
  if (countEvenNumber2(32) != 16) err = 1;
  if (countEvenNumber3(32) != 16) err = 1;
  if (countEvenNumber(0) != 0) err = 1;
  if (countEvenNumber(1) != 0) err = 1;

  if (err == 0) {
    printf("21.continue.c PASS\n");
  } else {
    printf("21.continue.c FAIL\n");
  }
  return err;
}
