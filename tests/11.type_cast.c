int printf(char*, ...);

int main() {
  int err = 0;
  char charVal = 'A';
  unsigned char ucharVal = (unsigned char)charVal;
  unsigned char ucharVal2 = (unsigned char)charVal;
  char charVal2 = (char)ucharVal;

  int intVal = (int)charVal;
  unsigned int uintVal = (unsigned int)intVal;
  unsigned int uintVal2 = (unsigned int)intVal;
  int intVal2 = (int)uintVal;

  long longVal = (long)intVal;
  unsigned long ulongVal = (unsigned long)longVal;
  unsigned long ulongVal2 = (unsigned long)longVal;
  long longVal2 = (long)ulongVal2;

  float floatVal = 3.1415926;
  double doubleVal = (double)floatVal;
  double doubleVal2 = (double)floatVal;
  float floatVal2 = (float)doubleVal;

  if (charVal2 != 'A') err = 1;
  if (ucharVal != 65) err = 1;
  if (intVal != 65) err = 1;
  if (uintVal != 65) err = 1;
  if (intVal2 != 65) err = 1;
  if ((int)longVal != 65) err = 1;
  if ((int)ulongVal != 65) err = 1;
  if ((int)longVal2 != 65) err = 1;

  unsigned char ucharBoundary = 250;
  int intFromUchar = (int)ucharBoundary;
  if (intFromUchar != 250) err = 1;

  unsigned char ucharFromInt = (unsigned char)intFromUchar;
  if (ucharFromInt != 250) err = 1;

  unsigned negToUint = (unsigned)(-1);
  if (negToUint != 0xffffffff) err = 1;

  if (err == 0) {
    printf("11.type_cast.c PASS\n");
  } else {
    printf("11.type_cast.c FAIL\n");
  }
  return err;
}
