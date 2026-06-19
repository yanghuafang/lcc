int printf(char*, ...);

// Pattern 1: sequential if statements (including if-else)
int accumulateFlags(int n) {
  int flags = 0;
  if (n < 0) {
    flags = flags + 1;
  }
  if (n == 0) {
    flags = flags + 2;
  } else {
    flags = flags + 4;
  }
  if (n > 10) {
    flags = flags + 8;
  }
  return flags;
}

// Pattern 2: if / else if / else chain
int signBucket(int n) {
  int bucket;
  if (n < 0) {
    bucket = 1;
  } else if (n == 0) {
    bucket = 2;
  } else {
    bucket = 3;
  }
  return bucket;
}

// Pattern 3: multi-branch else-if chain
int decadeBucket(int n) {
  int bucket;
  if (n <= 9) {
    bucket = 0;
  } else if (n <= 19) {
    bucket = 1;
  } else if (n <= 29) {
    bucket = 2;
  } else {
    bucket = 3;
  }
  return bucket;
}

int main() {
  int err = 0;

  if (accumulateFlags(-5) != 5) err = 1;
  if (accumulateFlags(0) != 2) err = 1;
  if (accumulateFlags(5) != 4) err = 1;
  if (accumulateFlags(15) != 12) err = 1;

  if (signBucket(-1) != 1) err = 1;
  if (signBucket(0) != 2) err = 1;
  if (signBucket(7) != 3) err = 1;

  if (decadeBucket(5) != 0) err = 1;
  if (decadeBucket(15) != 1) err = 1;
  if (decadeBucket(25) != 2) err = 1;
  if (decadeBucket(35) != 3) err = 1;

  if (err == 0) {
    printf("17.if_else.c PASS\n");
  } else {
    printf("17.if_else.c FAIL\n");
  }
  return err;
}
