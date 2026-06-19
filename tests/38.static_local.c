int printf(char*, ...);

int get_seed(void) {
  return 7;
}

int counter_calls(void) {
  static int count;
  count++;
  return count;
}

int counter_with_init(void) {
  static int count = 10;
  count++;
  return count;
}

int bump_runtime_static_decl(void) {
  static int value = get_seed();
  value++;
  return value;
}

int main(void) {
  int err = 0;

  if (counter_calls() != 1) err = 1;
  if (counter_calls() != 2) err = 1;
  if (counter_calls() != 3) err = 1;

  if (counter_with_init() != 11) err = 1;
  if (counter_with_init() != 12) err = 1;

  if (bump_runtime_static_decl() != 8) err = 1;
  if (bump_runtime_static_decl() != 9) err = 1;

  if (err == 0) {
    printf("38.static_local.c PASS\n");
  } else {
    printf("38.static_local.c FAIL\n");
  }
  return err;
}
