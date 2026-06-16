int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_bool(const char* name, int actual, int expectedTruthy) {
  int isTruthy = 0;
  if (actual != 0) {
    isTruthy = 1;
  }
  if (isTruthy != expectedTruthy) {
    if (expectedTruthy) {
      printf("ERROR [%s]: got %d expected true\n", name, actual);
    } else {
      printf("ERROR [%s]: got %d expected false\n", name, actual);
    }
    test_errors++;
  }
}

void report_result(void) {
  if (test_errors == 0) {
    printf("PASS\n");
  } else {
    printf("FAIL: %d error(s)\n", test_errors);
  }
}

int main() {
  printf("**** 15.logic.c ****\n");

  bool t = true;
  bool f = false;
  printf("t:%d f:%d\n", t, f);

  bool boolAnd1 = t && f;
  bool boolAnd2 = t && t;
  bool boolAnd3 = f && f;
  printf("t && f:%d\n", boolAnd1);
  printf("t && t:%d\n", boolAnd2);
  printf("f && f:%d\n", boolAnd3);

  bool boolOr1 = t || f;
  bool boolOr2 = t || t;
  bool boolOr3 = f || f;
  printf("t || f:%d\n", boolOr1);
  printf("t || t:%d\n", boolOr2);
  printf("f || f:%d\n", boolOr3);

  bool boolNot1 = !t;
  bool boolNot2 = !f;
  printf("!t:%d\n", boolNot1);
  printf("!f:%d\n", boolNot2);

  int a = 100;
  int b = 100;
  int c = 128;

  check_int("t", t, 1);
  check_int("f", f, 0);
  check_int("t && f", boolAnd1, 0);
  check_int("t && t", boolAnd2, 1);
  check_int("f && f", boolAnd3, 0);
  check_int("t || f", boolOr1, 1);
  check_int("t || t", boolOr2, 1);
  check_int("f || f", boolOr3, 0);
  check_int("!t", boolNot1, 0);
  check_int("!f", boolNot2, 1);

  check_bool("100 == 100", a == b, 1);
  check_bool("100 == 128", a == c, 0);
  check_bool("100 != 100", a != b, 0);
  check_bool("100 != 128", a != c, 1);
  check_bool("100 < 100", a < b, 0);
  check_bool("100 < 128", a < c, 1);
  check_bool("128 < 100", c < a, 0);
  check_bool("100 <= 100", a <= b, 1);
  check_bool("100 <= 128", a <= c, 1);
  check_bool("128 <= 100", c <= a, 0);
  check_bool("100 > 100", a > b, 0);
  check_bool("100 > 128", a > c, 0);
  check_bool("128 > 100", c > a, 1);
  check_bool("100 >= 100", a >= b, 1);
  check_bool("100 >= 128", a >= c, 0);
  check_bool("128 >= 100", c >= a, 1);

  unsigned ua = 1;
  unsigned ub = 0xffffffff;
  int unsignedLess = ua < ub;
  int unsignedGreater = ub > ua;
  printf("unsigned 1 < 0xFFFFFFFF: %d\n", unsignedLess);
  printf("unsigned 0xFFFFFFFF > 1: %d\n", unsignedGreater);
  check_bool("unsigned less boundary", unsignedLess, 1);
  check_bool("unsigned greater boundary", unsignedGreater, 1);

  int si = -1;
  unsigned ui = 1;
  int mixedLess = si < ui;
  int mixedGreater = si > ui;
  printf("mixed -1 < 1u: %d\n", mixedLess);
  printf("mixed -1 > 1u: %d\n", mixedGreater);
  check_bool("mixed -1 < 1u promotes unsigned", mixedLess, 0);
  check_bool("mixed -1 > 1u promotes unsigned", mixedGreater, 1);

  report_result();
  return test_errors;
}
