int printf(char*, ...);

int main() {
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
}