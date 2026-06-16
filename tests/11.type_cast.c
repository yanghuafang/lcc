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

void check_char(const char* name, char actual, char expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %c expected %c\n", name, actual, expected);
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
  printf("**** 11.type_cast.c ****\n");

  char charVal = 'A';
  unsigned char ucharVal = (unsigned char)charVal;
  unsigned char ucharVal2;
  ucharVal2 = (unsigned char)charVal;
  char charVal2 = (char)ucharVal;

  int intVal = (int)charVal;
  unsigned int uintVal = (unsigned int)intVal;
  unsigned int uintVal2;
  uintVal2 = (unsigned int)intVal;
  int intVal2;
  intVal2 = (int)uintVal;

  long longVal = (long)intVal;
  unsigned long ulongVal = (unsigned long)longVal;
  unsigned long ulongVal2;
  ulongVal2 = (unsigned long)longVal;
  long longVal2;
  longVal2 = (long)ulongVal2;

  float floatVal = 3.1415926;
  double doubleVal = (double)floatVal;
  double doubleVal2;
  doubleVal2 = (double)floatVal;
  float floatVal2;
  floatVal2 = (float)doubleVal;

  printf("charVal %c %c\n", charVal, charVal2);
  printf("ucharVal %d %d\n", ucharVal, ucharVal2);
  printf("intVal %d %d\n", intVal, intVal2);
  printf("uintVal %u %u\n", uintVal, uintVal2);
  printf("longVal %ld %ld\n", longVal, longVal2);
  printf("ulongVal %lu %lu\n", ulongVal, ulongVal2);
  printf("floatVal %f %f\n", floatVal, floatVal2);
  printf("doubleVal %f %f\n", doubleVal, doubleVal2);

  double doubleVal3 = 3.1415926535897932384626;
  float floatVal3 = (float)doubleVal3;
  printf("doubleVal %.15f floatVal %.7f\n", doubleVal3, floatVal3);

  check_char("char round-trip", charVal2, 'A');
  check_int("uchar from char", ucharVal, 65);
  check_int("int from char", intVal, 65);
  check_uint("uint from int", uintVal, 65);
  check_int("int from uint", intVal2, 65);
  check_int("long from int", (int)longVal, 65);
  check_int("ulong from long", (int)ulongVal, 65);
  check_int("long from ulong", (int)longVal2, 65);

  unsigned char ucharBoundary = 250;
  int intFromUchar = (int)ucharBoundary;
  printf("boundary uchar 250 -> int: %d\n", intFromUchar);
  check_int("unsigned char 250 widens to 250", intFromUchar, 250);

  unsigned char ucharFromInt = (unsigned char)intFromUchar;
  check_uint("int 250 narrows to uchar", ucharFromInt, 250);

  unsigned negToUint = (unsigned)(-1);
  printf("cast (unsigned)(-1): %u\n", negToUint);
  check_uint("negative int to unsigned", negToUint, 0xffffffff);

  report_result();
  return test_errors;
}
