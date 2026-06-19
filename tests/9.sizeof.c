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
  int err = 0;
  char c;
  int i;
  long l;
  float f;
  double d;
  char* pc;
  Student student;
  ID id;
  SEX sex;

  if (sizeof(char) != 1) err = 1;
  if (sizeof(short) != 2) err = 1;
  if (sizeof(int) != 4) err = 1;
  if (sizeof(long) != 8) err = 1;
  if (sizeof(float) != 4) err = 1;
  if (sizeof(double) != 8) err = 1;
  if (sizeof(char*) != 8) err = 1;
  if (sizeof(int*) != 8) err = 1;
  if (sizeof(c) != 1) err = 1;
  if (sizeof(i) != 4) err = 1;
  if (sizeof(SEX) != 4) err = 1;
  if (sizeof(sex) != 4) err = 1;

  if (err == 0) {
    printf("9.sizeof.c PASS\n");
  } else {
    printf("9.sizeof.c FAIL\n");
  }
  return err;
}
