int printf(char*, ...);

int main() {
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
}