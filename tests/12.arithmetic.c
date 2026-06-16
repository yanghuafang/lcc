int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_uint(const char* name, unsigned actual, unsigned expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %u expected %u\n", name, actual, expected);
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
  printf("**** 12.arithmetic.c ****\n");

  int a = 37;
  int b = 8;

  int sum = a + b;
  int sum2 = 37 + 8;

  int sub = a - b;
  int sub2 = b - a;
  int sub3 = 37 - 8;
  int sub4 = 8 - 37;

  int mul = a * b;
  int div = a / b;
  int mod = a % b;

  int sumeq = sum;
  sumeq += b;
  int subeq = sumeq;
  subeq -= b;
  int muleq = subeq;
  muleq *= b;
  int diveq = muleq;
  diveq /= b;
  int modeq = diveq;
  modeq %= b;

  printf("a:%d b:%d\n", a, b);
  printf("sum: %d %d\n", sum, sum2);
  printf("sub: %d %d %d %d\n", sub, sub2, sub3, sub4);
  printf("mul: %d\n", mul);
  printf("div: %d\n", div);
  printf("mod: %d\n", mod);
  printf("sumeq: %d\n", sumeq);
  printf("subeq: %d\n", subeq);
  printf("muleq: %d\n", muleq);
  printf("diveq: %d\n", diveq);
  printf("modeq: %d\n", modeq);

  check_int("sum", sum, 45);
  check_int("sum2", sum2, 45);
  check_int("sub", sub, 29);
  check_int("sub2", sub2, -29);
  check_int("sub3", sub3, 29);
  check_int("sub4", sub4, -29);
  check_int("mul", mul, 296);
  check_int("div", div, 4);
  check_int("mod", mod, 5);
  check_int("sumeq", sumeq, 53);
  check_int("subeq", subeq, 45);
  check_int("muleq", muleq, 360);
  check_int("diveq", diveq, 45);
  check_int("modeq", modeq, 5);

  unsigned int ua = 10;
  unsigned int ub = 3;
  unsigned int udiv = ua / ub;
  unsigned int umod = ua % ub;
  printf("unsigned div 10/3=%u mod=%u\n", udiv, umod);
  check_uint("unsigned div", udiv, 3);
  check_uint("unsigned mod", umod, 1);

  int negA = -8;
  int negB = 3;
  int negMod = negA % negB;
  printf("signed mod -8%%3=%d\n", negMod);
  check_int("signed negative mod", negMod, -2);

  int mixedSi = -1;
  unsigned mixedUi = 1;
  unsigned mixedSum = mixedSi + mixedUi;
  printf("mixed -1 + 1u: %u\n", mixedSum);
  check_uint("mixed int + unsigned", mixedSum, 0);

  report_result();
  return test_errors;
}
