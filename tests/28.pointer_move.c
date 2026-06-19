int printf(char*, ...);

int main() {
  int err = 0;
  char c[4];
  c[0] = 'A';
  c[1] = 'B';
  c[2] = 'C';
  c[3] = 'D';

  char* pc = c;
  if (*pc != 'A') err = 1;
  pc += 1;
  if (*pc != 'B') err = 1;
  ++pc;
  if (*pc != 'C') err = 1;
  pc++;
  if (*pc != 'D') err = 1;

  pc = &c[3];
  if (*pc != 'D') err = 1;
  pc -= 1;
  if (*pc != 'C') err = 1;
  --pc;
  if (*pc != 'B') err = 1;
  pc--;
  if (*pc != 'A') err = 1;

  if (err == 0) {
    printf("28.pointer_move.c PASS\n");
  } else {
    printf("28.pointer_move.c FAIL\n");
  }
  return err;
}
