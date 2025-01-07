
int printf(char*, ...);

int checkAge1(int age) {
  if (age < 18) {
    printf("age < 18: %d\n", age);
    return age;
  }

  if (age == 18) {
    printf("age == 18: %d\n", age);
    return age;
  } else {
    printf("age != 18\n", age);
  }

  if (age > 18) {
    printf("age > 18: %d\n", age);
    return age;
  }
}

int checkAge2(int age) {
  if (age < 18) {
    printf("age < 18: %d\n", age);
    return age;
  } else if (age == 18) {
    printf("age == 18: %d\n", age);
    return age;
  } else {
    printf("age > 18: %d\n", age);
    return age;
  }
}

int checkAge3(int age) {
  if (age <= 6) {
    printf("baby: %d\n", age);
    return age;
  } else if (age > 6 && age <= 14) {
    printf("chld: %d\n", age);
    return age;
  } else if (age > 14 && age <= 18) {
    printf("teenager: %d\n", age);
    return age;
  } else if (age > 18 && age <= 35) {
    printf("young: %d\n", age);
    return age;
  }

  return age;
}

int main() {
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

  return 0;
}