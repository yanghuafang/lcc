int printf(char*, ...);

int main() {
  int err = 0;
  unsigned int a = 0x12345678;
  unsigned int b = 0x87654321;

  unsigned int andVal = a & b;
  unsigned int orVal = a | b;
  unsigned int xorVal = a ^ b;
  unsigned notVal1 = ~a;
  unsigned notVal2 = ~b;

  unsigned int andeqVal = andVal;
  andeqVal &= a;
  unsigned int oreqVal = orVal;
  oreqVal |= a;
  unsigned int xoreqVal = xorVal;
  xoreqVal ^= a;

  unsigned leftShiftVal = a << 8;
  unsigned rightShiftVal = b >> 8;
  leftShiftVal <<= 8;
  rightShiftVal >>= 8;

  if (andVal != 0x02244220) err = 1;
  if (orVal != 0x97755779) err = 1;
  if (xorVal != 0x95511559) err = 1;
  if (notVal1 != 0xedcba987) err = 1;
  if (notVal2 != 0x789abcde) err = 1;
  if (andeqVal != 0x02244220) err = 1;
  if (oreqVal != 0x97755779) err = 1;
  if (xoreqVal != 0x87654321) err = 1;
  if (leftShiftVal != 0x56780000) err = 1;
  if (rightShiftVal != 0x8765) err = 1;

  unsigned int msbSet = 0x80000000;
  if ((msbSet >> 1) != 0x40000000) err = 1;

  int signedVal = -8;
  if ((signedVal >> 1) != -4) err = 1;

  if (err == 0) {
    printf("14.bitwise.c PASS\n");
  } else {
    printf("14.bitwise.c FAIL\n");
  }
  return err;
}
