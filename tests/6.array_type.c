int printf(char*, ...);

char gs[16];
char* gps = "hello world!";
int gi[4];

int main() {
  int err = 0;
  char s[16];
  int i[4];

  s[0] = 'g';
  s[1] = 'o';
  s[2] = 'o';
  s[3] = 'd';
  s[4] = 0;

  gs[0] = 'l';
  gs[1] = 'u';
  gs[2] = 'c';
  gs[3] = 'k';
  gs[4] = 'y';
  gs[5] = 0;

  i[0] = 128;
  i[1] = 256;
  gi[0] = 1024;
  gi[1] = 2048;

  if (i[0] != 128) err = 1;
  if (i[1] != 256) err = 1;
  if (gi[0] != 1024) err = 1;
  if (gi[1] != 2048) err = 1;
  if (s[0] != 'g') err = 1;
  if (gs[0] != 'l') err = 1;

  i[2] = 0;
  i[3] = -1;
  if (i[2] != 0) err = 1;
  if (i[3] != -1) err = 1;

  if (err == 0) {
    printf("6.array_type.c PASS\n");
  } else {
    printf("6.array_type.c FAIL\n");
  }
  return err;
}
