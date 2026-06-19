int printf(char*, ...);

int checkAge1(int age) {
  if (age < 18) {
    return age;
  }
  if (age == 18) {
    return age;
  } else {
  }
  if (age > 18) {
    return age;
  }
  return age;
}

int checkAge2(int age) {
  if (age < 18) {
    return age;
  } else if (age == 18) {
    return age;
  } else {
    return age;
  }
}

int checkAge3(int age) {
  if (age <= 6) {
    return age;
  } else if (age > 6 && age <= 14) {
    return age;
  } else if (age > 14 && age <= 18) {
    return age;
  } else if (age > 18 && age <= 35) {
    return age;
  }
  return age;
}

int main() {
  int err = 0;

  if (checkAge1(16) != 16) err = 1;
  if (checkAge1(18) != 18) err = 1;
  if (checkAge1(20) != 20) err = 1;
  if (checkAge2(16) != 16) err = 1;
  if (checkAge2(18) != 18) err = 1;
  if (checkAge2(20) != 20) err = 1;
  if (checkAge3(6) != 6) err = 1;
  if (checkAge3(35) != 35) err = 1;

  if (err == 0) {
    printf("23.return.c PASS\n");
  } else {
    printf("23.return.c FAIL\n");
  }
  return err;
}
