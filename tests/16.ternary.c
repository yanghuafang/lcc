int printf(char*, ...);

int main() {
  int err = 0;
  int a = 3;
  int c = 7;

  int minVal = a < c ? a : c;
  int maxVal = a < c ? c : a;
  if (minVal != 3) err = 1;
  if (maxVal != 7) err = 1;

  int d = -5;
  int e = 2;
  int minNeg = d < e ? d : e;
  int maxNeg = d < e ? e : d;
  if (minNeg != -5) err = 1;
  if (maxNeg != 2) err = 1;

  int same = 42;
  int ternarySame = same < same ? 0 : 1;
  if (ternarySame != 1) err = 1;

  if (err == 0) {
    printf("16.ternary.c PASS\n");
  } else {
    printf("16.ternary.c FAIL\n");
  }
  return err;
}
