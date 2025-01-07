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
  printf("WEEK: %d, %d, %d, %d, %d, %d, %d\n", SUNDAY, MONDAY, TUESDAY,
         WEDNESDAY, THURSDAY, FRIDAY, SATURDAY);

  WEEKDAY day;
  day = FRIDAY;
  printf("day: %d\n", day);

  printf("all sexes: %d, %d\n", MALE, FEMALE);
  SEX sex = FEMALE;
  printf("sex: %d\n", sex);
  return 0;
}