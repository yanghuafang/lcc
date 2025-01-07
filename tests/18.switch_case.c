int printf(char*, ...);

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
}

int main() {
  gradeOfScore(3);
  gradeOfScore(5);
  gradeOfScore(6);
  gradeOfScore(8);
  gradeOfScore(9);
  return 0;
}