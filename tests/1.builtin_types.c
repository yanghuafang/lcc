int printf(char*, ...);

int main() {
  int err = 0;
  char ch = 'A';
  short sh = -1024;
  int in = -12345678;
  long ln = -1234567890l;
  unsigned char uch = 250;
  unsigned uint = 0xabcdef0;
  unsigned long uln = 9876043210ul;
  float fl = 3.1415926f;
  double db = 3.14159265358979;
  bool bt = true;
  bool bf = false;

  if (ch != 'A') err = 1;
  if (sh != -1024) err = 1;
  if (in != -12345678) err = 1;
  if (ln != -1234567890l) err = 1;
  if (uch != 250) err = 1;
  if (uint != 0xabcdef0) err = 1;
  if (uln != 9876043210ul) err = 1;
  if (bt != 1) err = 1;
  if (bf != 0) err = 1;

  if (err == 0) {
    printf("1.builtin_types.c PASS\n");
  } else {
    printf("1.builtin_types.c FAIL\n");
  }
  return err;
}
