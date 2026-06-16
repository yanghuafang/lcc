int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
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
  printf("**** 4.enum_type.c ****\n");

  printf("WEEK: %d, %d, %d, %d, %d, %d, %d\n", SUNDAY, MONDAY, TUESDAY,
         WEDNESDAY, THURSDAY, FRIDAY, SATURDAY);

  WEEKDAY day;
  day = FRIDAY;
  printf("day: %d\n", day);

  printf("all sexes: %d, %d\n", MALE, FEMALE);
  SEX sex = FEMALE;
  printf("sex: %d\n", sex);

  check_int("SUNDAY", SUNDAY, 0);
  check_int("MONDAY", MONDAY, 1);
  check_int("TUESDAY", TUESDAY, 2);
  check_int("WEDNESDAY", WEDNESDAY, 3);
  check_int("THURSDAY", THURSDAY, 4);
  check_int("FRIDAY", FRIDAY, 5);
  check_int("SATURDAY", SATURDAY, 6);
  check_int("day", day, 5);
  check_int("MALE", MALE, 0);
  check_int("FEMALE", FEMALE, 1);
  check_int("sex", sex, 1);

  report_result();
  return test_errors;
}
