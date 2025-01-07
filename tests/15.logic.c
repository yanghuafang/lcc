int printf(char*, ...);

int main() {
  bool t = true;
  bool f = false;
  printf("t:%d f:%d\n", t, f);

  bool boolAnd1 = t && f;
  bool boolAnd2 = t && t;
  bool boolAnd3 = f && f;
  printf("t && f:%d\n", boolAnd1);
  printf("t && f:%d\n", t && f);
  printf("t && t:%d\n", boolAnd2);
  printf("t && t:%d\n", t && t);
  printf("f && f:%d\n", boolAnd3);
  printf("f && f:%d\n", f && f);

  bool boolOr1 = t || f;
  bool boolOr2 = t || t;
  bool boolOr3 = f || f;
  printf("t || f:%d\n", boolOr1);
  printf("t || f:%d\n", t || f);
  printf("t || t:%d\n", boolOr2);
  printf("t || t:%d\n", t || t);
  printf("f || f:%d\n", boolOr3);
  printf("f || f:%d\n", f || f);

  bool boolNot1 = !t;
  bool boolNot2 = !f;
  printf("!t:%d\n", boolNot1);
  printf("!t:%d\n", !t);
  printf("!f:%d\n", !boolNot2);
  printf("!f:%d\n", !f);

  int a = 100;
  int b = 100;
  int c = 128;

  bool boolEq1 = a == b;
  bool boolEq2 = a == c;
  printf("100 == 100: %d\n", boolEq1);
  printf("100 == 100: %d\n", a == b);
  printf("100 == 128: %d\n", boolEq2);
  printf("100 == 128: %d\n", a == c);

  bool boolNEq1 = a != b;
  bool boolNEq2 = a != c;
  printf("100 != 100: %d\n", boolNEq1);
  printf("100 != 100: %d\n", a != b);
  printf("100 != 128: %d\n", boolNEq2);
  printf("100 != 128: %d\n", a != c);

  // LT
  bool boolLT1 = a < b;
  bool boolLT2 = a < c;
  printf("100 < 100: %d\n", boolLT1);
  printf("100 < 100: %d\n", a < b);
  printf("100 < 128: %d\n", boolLT2);
  printf("100 < 128: %d\n", a < c);

  bool boolLT3 = c < a;
  printf("128 < 100: %d\n", boolLT3);
  printf("128 < 100: %d\n", c < a);

  // LE
  bool boolLE1 = a <= b;
  bool boolLE2 = a <= c;
  printf("100 <= 100: %d\n", boolLE1);
  printf("100 <= 100: %d\n", a <= b);
  printf("100 <= 128: %d\n", boolLE2);
  printf("100 <= 128: %d\n", a <= c);

  bool boolLE3 = c <= a;
  printf("128 <= 100: %d\n", boolLE3);
  printf("128 <= 100: %d\n", c <= a);

  // GT
  bool boolGT1 = a > b;
  bool boolGT2 = a > c;
  printf("100 > 100: %d\n", boolGT1);
  printf("100 > 100: %d\n", a > b);
  printf("100 > 128: %d\n", boolGT2);
  printf("100 > 128: %d\n", a > c);

  bool boolGT3 = c > a;
  printf("128 > 100: %d\n", boolGT3);
  printf("128 > 100: %d\n", c > a);

  // GE
  bool boolGE1 = a >= b;
  bool boolGE2 = a >= c;
  printf("100 >= 100: %d\n", boolGE1);
  printf("100 >= 100: %d\n", a >= b);
  printf("100 >= 128: %d\n", boolGE2);
  printf("100 >= 128: %d\n", a >= c);

  bool boolGE3 = c >= a;
  printf("128 >= 100: %d\n", boolGE3);
  printf("128 >= 100: %d\n", c >= a);

  return 0;
}