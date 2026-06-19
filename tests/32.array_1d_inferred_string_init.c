int printf(char*, ...);

int ga[] = {10, 7, 8, 9, 1, 5};
char gs[] = "hi";
char gt[4] = "hey";

int main() {
  int err = 0;
  int la[] = {1, 2, 3};
  char ls[] = "hello";
  char lb[6] = "hello";

  if (la[0] != 1) err = 1;
  if (la[1] != 2) err = 1;
  if (la[2] != 3) err = 1;

  if (ls[0] != 'h') err = 1;
  if (ls[1] != 'e') err = 1;
  if (ls[2] != 'l') err = 1;
  if (ls[3] != 'l') err = 1;
  if (ls[4] != 'o') err = 1;
  if (ls[5] != 0) err = 1;

  if (lb[0] != 'h') err = 1;
  if (lb[5] != 0) err = 1;

  if (ga[0] != 10) err = 1;
  if (ga[1] != 7) err = 1;
  if (ga[2] != 8) err = 1;
  if (ga[3] != 9) err = 1;
  if (ga[4] != 1) err = 1;
  if (ga[5] != 5) err = 1;

  if (gs[0] != 'h') err = 1;
  if (gs[1] != 'i') err = 1;
  if (gs[2] != 0) err = 1;

  if (gt[0] != 'h') err = 1;
  if (gt[1] != 'e') err = 1;
  if (gt[2] != 'y') err = 1;
  if (gt[3] != 0) err = 1;

  if (err == 0) {
    printf("32.array_1d_inferred_string_init.c PASS\n");
  } else {
    printf("32.array_1d_inferred_string_init.c FAIL\n");
  }
  return err;
}
