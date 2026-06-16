int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void check_char(const char* name, char actual, char expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %c expected %c\n", name, actual, expected);
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

void gradeOfScore(int score) {
  char grade;
  switch (score) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      grade = 'D';
      break;
    case 6:
      grade = 'C';
      break;
    case 7:
    case 8:
      grade = 'B';
      break;
    case 9:
    case 10:
      grade = 'A';
      break;
    default:
      grade = 'E';
      break;
  }

  printf("score:%d grade:%c\n", score, grade);
  if (score >= 1 && score <= 5) {
    check_char("grade D", grade, 'D');
  } else if (score == 6) {
    check_char("grade C", grade, 'C');
  } else if (score == 7 || score == 8) {
    check_char("grade B", grade, 'B');
  } else if (score == 9 || score == 10) {
    check_char("grade A", grade, 'A');
  }
}

int main() {
  printf("**** 18.switch_case.c ****\n");

  gradeOfScore(3);
  gradeOfScore(5);
  gradeOfScore(6);
  gradeOfScore(8);
  gradeOfScore(9);

  char grade;
  int boundary = 0;
  switch (boundary) {
    default:
      grade = 'E';
      break;
  }
  printf("score:%d grade:%c\n", boundary, grade);
  check_char("default case", grade, 'E');

  report_result();
  return test_errors;
}
