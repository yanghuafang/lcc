int printf(char*, ...);

int main() {
  int err = 0;
  int a = 37;
  int b = 8;

  int sum = a + b;
  int sub = a - b;
  int sub2 = b - a;
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

  if (sum != 45) err = 1;
  if (sub != 29) err = 1;
  if (sub2 != -29) err = 1;
  if (mul != 296) err = 1;
  if (div != 4) err = 1;
  if (mod != 5) err = 1;
  if (sumeq != 53) err = 1;
  if (subeq != 45) err = 1;
  if (muleq != 360) err = 1;
  if (diveq != 45) err = 1;
  if (modeq != 5) err = 1;

  unsigned int ua = 10;
  unsigned int ub = 3;
  if (ua / ub != 3) err = 1;
  if (ua % ub != 1) err = 1;

  int negA = -8;
  int negB = 3;
  if (negA % negB != -2) err = 1;

  int mixedSi = -1;
  unsigned mixedUi = 1;
  if (mixedSi + mixedUi != 0) err = 1;

  if (err == 0) {
    printf("12.arithmetic.c PASS\n");
  } else {
    printf("12.arithmetic.c FAIL\n");
  }
  return err;
}
