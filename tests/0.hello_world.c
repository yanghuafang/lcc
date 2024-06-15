// Smallest program lcc accepts: a libc declaration, main, and a call.
// There is no preprocessor, so printf must be declared by hand — every test
// starts this way.

int printf(char*, ...);

int main() {
  int err = 0;
  if (1 != 1) err = 1;
  if (err == 0) {
    printf("0.hello_world.c PASS\n");
  } else {
    printf("0.hello_world.c FAIL\n");
  }
  return err;
}
