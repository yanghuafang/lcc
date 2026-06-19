int printf(char*, ...);

static int counter = 0;

static int helper(int value) {
  return value + counter;
}

int bump(void) {
  counter++;
  return counter;
}

int bump_with_helper(void) {
  counter++;
  return helper(counter);
}

int main(void) {
  int err = 0;

  if (helper(5) != 5) err = 1;
  if (bump() != 1) err = 1;
  if (bump() != 2) err = 1;
  if (helper(3) != 5) err = 1;
  if (bump_with_helper() != 6) err = 1;

  if (err == 0) {
    printf("37.static_file.c PASS\n");
  } else {
    printf("37.static_file.c FAIL\n");
  }
  return err;
}
