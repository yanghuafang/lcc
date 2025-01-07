int printf(char*, ...);

char charVal = 'A';
short shortVal = 1024;
short shortVal2 = -1024;
int intVal = 12345678;
int intVal2 = -12345678;
int intVal3 = +12345678;
int intVal4 = -0x9abcdef;
long longVal = 1234567890;
long longVal2 = -1234567890;
long longVal3 = 1234567890l;
long longVal4 = -1234567890l;

unsigned char ucharVal = 250;
unsigned short ushortVal = 2048;
unsigned uintVal = 87654321;
unsigned int uintVal2 = 87654321;
unsigned int uintVal3 = 87654321u;
unsigned int uintVal4 = 0xabcdef0;
unsigned long ulongVal = 9876043210l;
unsigned long ulongVal2 = 9876043210ul;

float floatVal = 3.1415926;
float floatVal2 = 3.1415926f;
double doubleVal = 3.14159265358979;

bool boolVal = true;
bool boolVal2 = false;

int main() {
  printf("charVal: %c\n", charVal);
  printf("shortVal: %hd\n", shortVal);
  printf("shortVal: %hd\n", shortVal2);
  printf("intVal: %d\n", intVal);
  printf("intVal2: %d\n", intVal2);
  printf("intVal3: %d\n", intVal3);
  printf("intVal4: -0x%x\n", -intVal4);
  printf("longVal: %ld\n", longVal);
  printf("longVal2: %ld\n", longVal2);
  printf("longVal3: %ld\n", longVal3);
  printf("longVal4: %ld\n", longVal4);

  printf("ucharVal: %u\n", ucharVal);
  printf("ushortVal: %hu\n", ushortVal);
  printf("uintVal: %u\n", uintVal);
  printf("uintVal2: %u\n", uintVal2);
  printf("uintVal3: %u\n", uintVal3);
  printf("uintVal4: 0x%x\n", uintVal4);
  printf("ulongVal: %lu\n", ulongVal);
  printf("ulongVal2: %lu\n", ulongVal2);

  printf("floatVal: %f\n", floatVal);
  printf("floatVal2: %f\n", floatVal2);
  printf("doubleVal: %.15f\n", doubleVal);

  printf("boolVal: %d\n", boolVal);
  printf("boolVal2: %d\n", boolVal2);

  return 0;
}