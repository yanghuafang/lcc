int printf(char*, ...);

int main() {
  int a = 3;
  int b = 3;
  int c = 7;

  int minVal = a < c ? a : c;
  int maxVal = a < c ? c : a;
  printf("minVal:%d\n", minVal);
  printf("maxVal:%d\n", maxVal);
  return 0;
}