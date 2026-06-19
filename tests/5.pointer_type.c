int printf(char*, ...);

char gc = 'a';
int gi = 1024;

int main() {
  int err = 0;
  char c = 'A';
  int i = 128;
  char* pc = &c;
  int* pi = &i;

  *pc = 'B';
  *pi = 256;

  char* pgc = &gc;
  int* pgi = &gi;
  *pgc = 'b';
  *pgi = 2048;

  if (c != 'B') err = 1;
  if (*pc != 'B') err = 1;
  if (i != 256) err = 1;
  if (*pi != 256) err = 1;
  if (gc != 'b') err = 1;
  if (gi != 2048) err = 1;

  *pi = 0;
  if (i != 0) err = 1;

  if (err == 0) {
    printf("5.pointer_type.c PASS\n");
  } else {
    printf("5.pointer_type.c FAIL\n");
  }
  return err;
}
