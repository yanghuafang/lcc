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
  printf("**** 14.bitwise.c ****\n");

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

  check_uint("andVal", andVal, 0x02244220);
  check_uint("orVal", orVal, 0x97755779);
  check_uint("xorVal", xorVal, 0x95511559);
  check_uint("not a", notVal1, 0xedcba987);
  check_uint("not b", notVal2, 0x789abcde);
  check_uint("andeqVal", andeqVal, 0x02244220);
  check_uint("oreqVal", oreqVal, 0x97755779);
  check_uint("xoreqVal", xoreqVal, 0x87654321);
  check_uint("leftShiftVal", leftShiftVal, 0x56780000);
  check_uint("rightShiftVal boundary", rightShiftVal, 0x8765);

  unsigned int msbSet = 0x80000000;
  unsigned int lshr = msbSet >> 1;
  printf("boundary lshr 0x80000000>>1=0x%x\n", lshr);
  check_uint("unsigned >> clears MSB", lshr, 0x40000000);

  int signedVal = -8;
  int ashr = signedVal >> 1;
  printf("signed -8 >> 1: %d\n", ashr);
  check_int("signed >> preserves sign", ashr, -4);

  report_result();
  return test_errors;
}
