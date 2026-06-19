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
