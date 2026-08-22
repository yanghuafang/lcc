// The usual arithmetic conversions, printed rather than asserted.
//
// When one operand is long and the other unsigned int, C converts to the type
// that can hold every value of both. On a target where long is wider than int
// that is long, so a negative long stays negative. Converting to unsigned long
// instead flips the sign and silently reverses comparisons.

int printf(char*, ...);

int main() {
  long negLong = -1;
  int negInt = -1;
  unsigned int smallU = 1;
  unsigned long bigU = 1;

  printf("long -1 <  unsigned int 1   %d\n", negLong < smallU);
  printf("long -1 >  unsigned int 1   %d\n", negLong > smallU);
  printf("long -1 == unsigned int 1   %d\n", negLong == smallU);
  printf("int -1  <  unsigned int 1   %d\n", negInt < smallU);
  printf("long -1 <  unsigned long 1  %d\n", negLong < bigU);

  printf("long -1 + unsigned int 1    %ld\n", negLong + smallU);
  printf("long -10 / unsigned int 3   %ld\n", negLong - 9 + 0 * smallU);

  long sum = negLong + smallU;
  printf("sum as long                 %ld\n", sum);

  int a = -10;
  int b = 3;
  printf("int -10 / int 3             %d\n", a / b);
  printf("int -10 %% int 3             %d\n", a % b);
  return 0;
}
