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

int checkAge1(int age) {
  if (age < 18) {
    printf("age < 18: %d\n", age);
  }

  if (age == 18) {
    printf("age == 18: %d\n", age);
  } else {
    printf("age != 18\n");
  }

  if (age > 18) {
    printf("age > 18: %d\n", age);
  }

  return age;
}

int checkAge2(int age) {
  if (age < 18) {
    printf("age < 18: %d\n", age);
  } else if (age == 18) {
    printf("age == 18: %d\n", age);
  } else {
    printf("age > 18: %d\n", age);
  }

  return age;
}

int checkAge3(int age) {
  if (age <= 6) {
    printf("baby: %d\n", age);
  } else if (age > 6 && age <= 14) {
    printf("chld: %d\n", age);
  } else if (age > 14 && age <= 18) {
    printf("teenager: %d\n", age);
  } else if (age > 18 && age <= 35) {
    printf("young: %d\n", age);
  }

  return age;
}

int main() {
  printf("**** 17.if_else.c ****\n");

  int age = checkAge1(16);
  printf("age:%d\n", age);
  age = checkAge1(18);
  printf("age:%d\n", age);
  age = checkAge1(20);
  printf("age:%d\n", age);

  age = checkAge2(16);
  printf("age2:%d\n", age);
  age = checkAge2(18);
  printf("age2:%d\n", age);
  age = checkAge2(20);
  printf("age2:%d\n", age);

  age = checkAge3(6);
  printf("age3:%d\n", age);
  age = checkAge3(14);
  printf("age3:%d\n", age);
  age = checkAge3(18);
  printf("age3:%d\n", age);
  age = checkAge3(35);
  printf("age3:%d\n", age);

  check_int("checkAge1(16)", checkAge1(16), 16);
  check_int("checkAge1(18)", checkAge1(18), 18);
  check_int("checkAge1(20)", checkAge1(20), 20);
  check_int("checkAge3 boundary 6", checkAge3(6), 6);
  check_int("checkAge3 boundary 35", checkAge3(35), 35);

  report_result();
  return test_errors;
}
