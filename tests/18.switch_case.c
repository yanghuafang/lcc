int printf(char*, ...);

char gradeOfScore(int score) {
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
  return grade;
}

int main() {
  int err = 0;

  if (gradeOfScore(3) != 'D') err = 1;
  if (gradeOfScore(5) != 'D') err = 1;
  if (gradeOfScore(6) != 'C') err = 1;
  if (gradeOfScore(8) != 'B') err = 1;
  if (gradeOfScore(9) != 'A') err = 1;

  char grade;
  int boundary = 0;
  switch (boundary) {
    default:
      grade = 'E';
      break;
  }
  if (grade != 'E') err = 1;

  if (err == 0) {
    printf("18.switch_case.c PASS\n");
  } else {
    printf("18.switch_case.c FAIL\n");
  }
  return err;
}
