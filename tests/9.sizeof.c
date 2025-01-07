int printf(char*, ...);

struct Student {
  int id;
  char* name;
  char sex;
  float score;
};

union ID {
  int id;
  char* name;
};

enum SEX { MALE, FEMALE };

int main() {
  char charVal = 'A';
  unsigned char ucharVal;
  short shortVal;
  unsigned short ushortVal;
  int intVal;
  unsigned int uintVal;
  long longVal;
  unsigned long ulongVal;
  float floatVal;
  double doubleVal;
  char* pchar;
  int* pint;

  Student student;
  ID id;
  SEX sex;

  printf("sizeof(char):%d\n", sizeof(char));
  printf("sizeof(charVal):%d\n", sizeof(charVal));
  printf("sizeof(unsigned char):%d\n", sizeof(unsigned char));
  printf("sizeof(ucharVal):%d\n", sizeof(ucharVal));

  printf("sizeof(short):%d\n", sizeof(short));
  printf("sizeof(shortVal):%d\n", sizeof(shortVal));
  printf("sizeof(unsigned short):%d\n", sizeof(unsigned short));
  printf("sizeof(ushortVal):%d\n", sizeof(ushortVal));

  printf("sizeof(int):%d\n", sizeof(int));
  printf("sizeof(intVal):%d\n", sizeof(intVal));
  printf("sizeof(unsigned int):%d\n", sizeof(unsigned int));
  printf("sizeof(uintVal):%d\n", sizeof(uintVal));

  printf("sizeof(long):%d\n", sizeof(long));
  printf("sizeof(longVal):%d\n", sizeof(longVal));
  printf("sizeof(unsigned long):%d\n", sizeof(unsigned long));
  printf("sizeof(ulongVal):%d\n", sizeof(ulongVal));

  printf("sizeof(float):%d\n", sizeof(float));
  printf("sizeof(floatVal):%d\n", sizeof(floatVal));
  printf("sizeof(double):%d\n", sizeof(double));
  printf("sizeof(doubleVal):%d\n", sizeof(doubleVal));

  printf("sizeof(char*):%d\n", sizeof(char*));
  printf("sizeof(pchar):%d\n", sizeof(pchar));
  printf("sizeof(int*):%d\n", sizeof(int*));
  printf("sizeof(pint):%d\n", sizeof(pint));

  printf("sizeof(Student):%d\n", sizeof(Student));
  printf("sizeof(student):%d\n", sizeof(student));

  printf("sizeof(ID):%d\n", sizeof(ID));
  printf("sizeof(id):%d\n", sizeof(id));

  printf("sizeof(SEX):%d\n", sizeof(SEX));
  printf("sizeof(sex):%d\n", sizeof(sex));
  return 0;
}
