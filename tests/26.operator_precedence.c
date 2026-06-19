int printf(char*, ...);

void subFunc(int i) { }

int main() {
  int err = 0;

  unsigned long a = 0x1234567812345678;
  unsigned long b = 0x9abcdef09abcdef0;
  unsigned long c = (unsigned long)&a;
  unsigned long d = (unsigned long)&c & a & b;
  if (a != 0x1234567812345678) err = 1;
  if (b != 0x9abcdef09abcdef0) err = 1;

  int plusA = 13;
  if (3 + +plusA != 16) err = 1;
  if (3 - +plusA != -10) err = 1;
  if (3 + +13 != 16) err = 1;
  if (3 - +13 != -10) err = 1;

  int minusA = 13;
  if (3 - -minusA != 16) err = 1;
  if (3 - -13 != 16) err = 1;

  int mulA = 3;
  int mulB = 4;
  int* mulC = &mulB;
  if (mulA * mulB * *mulC != 48) err = 1;

  long callI = 1234;
  subFunc((int)callI);
  if ((int)callI != 1234) err = 1;

  int incA = 10;
  int incB = (++incA)++;
  if (incA != 12) err = 1;
  if (incB != 11) err = 1;

  int decA = 10;
  int decB = (--decA)--;
  if (decA != 8) err = 1;
  if (decB != 9) err = 1;

  if (err == 0) {
    printf("26.operator_precedence.c PASS\n");
  } else {
    printf("26.operator_precedence.c FAIL\n");
  }
  return err;
}
