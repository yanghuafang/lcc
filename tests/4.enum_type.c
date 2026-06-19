int printf(char*, ...);

enum WEEKDAY {
  SUNDAY = 0,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY
};

enum SEX { MALE, FEMALE };

int main() {
  int err = 0;
  WEEKDAY day = FRIDAY;
  SEX sex = FEMALE;
  int v;

  v = SUNDAY;
  if (v != 0) err = 1;
  v = MONDAY;
  if (v != 1) err = 1;
  v = FRIDAY;
  if (v != 5) err = 1;
  v = SATURDAY;
  if (v != 6) err = 1;
  v = day;
  if (v != 5) err = 1;
  v = MALE;
  if (v != 0) err = 1;
  v = FEMALE;
  if (v != 1) err = 1;
  v = sex;
  if (v != 1) err = 1;

  if (err == 0) {
    printf("4.enum_type.c PASS\n");
  } else {
    printf("4.enum_type.c FAIL\n");
  }
  return err;
}
