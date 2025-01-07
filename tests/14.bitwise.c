int printf(char*, ...);

int main() {
  unsigned int a = 0x12345678;
  unsigned int b = 0x87654321;
  printf("a:0x%x b:0x%x\n", a, b);

  unsigned int andVal = a & b;
  unsigned int orVal = a | b;
  unsigned int xorVal = a ^ b;
  unsigned notVal1 = ~a;
  unsigned notVal2 = ~b;
  printf("andVal:0x%x\n", andVal);
  printf("orVal:0x%x\n", orVal);
  printf("xorVal:0x%x\n", xorVal);
  printf("not a:0x%x\n", notVal1);
  printf("not b:0x%x\n", notVal2);

  unsigned int andeqVal = andVal;
  andeqVal &= a;
  unsigned int oreqVal = orVal;
  oreqVal |= a;
  unsigned int xoreqVal = xorVal;
  xoreqVal ^= a;
  printf("andeqVal:0x%x\n", andeqVal);
  printf("oreqVal:0x%x\n", oreqVal);
  printf("xoreqVal:0x%x\n", xoreqVal);

  unsigned leftShiftVal = a << 8;
  unsigned rightShiftVal = b >> 8;
  printf("leftShiftVal:0x%x\n", leftShiftVal);
  printf("rightShiftVal:0x%x\n", rightShiftVal);
  leftShiftVal <<= 8;
  rightShiftVal >>= 8;
  printf("leftShiftEqVal:0x%x\n", leftShiftVal);
  printf("rightShiftEqVal:0x%x\n", rightShiftVal);

  return 0;
}