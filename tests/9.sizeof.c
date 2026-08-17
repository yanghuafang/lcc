// sizeof on both types and expressions. The operand is not evaluated, and an
// array's size is its full extent, not the decayed pointer's.
//
// The aggregate cases below are the ones that need the target's real data
// layout: a scalar is the same width everywhere, but padding is not. Padded
// is the sharpest of them — under LLVM's default layout, where i64 has 4-byte
// ABI alignment, it comes out 12 instead of 16.

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

struct Padded {
  char c;
  long l;
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
  Padded padded;
  Student students[3];
  long longs[4];

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

  // Aggregates: size includes the padding the target's alignment rules
  // require, so these fail unless the module knows what it is compiling for.
  if (sizeof(Padded) != 16) err = 1;
  if (sizeof(padded) != 16) err = 1;
  if (sizeof(Student) != 24) err = 1;
  if (sizeof(student) != 24) err = 1;
  if (sizeof(ID) != 8) err = 1;
  if (sizeof(id) != 8) err = 1;
  if (sizeof(students) != 72) err = 1;
  if (sizeof(longs) != 32) err = 1;

  if (err == 0) {
    printf("9.sizeof.c PASS\n");
  } else {
    printf("9.sizeof.c FAIL\n");
  }
  return err;
}
