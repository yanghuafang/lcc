int printf(char*, ...);

int main() {
  int err = 0;
  bool t = true;
  bool f = false;
  int v;

  if (t == 0) err = 1;
  if (f != 0) err = 1;

  v = t && f;
  if (v != 0) err = 1;
  v = t && t;
  if (v == 0) err = 1;
  v = f && f;
  if (v != 0) err = 1;

  v = t || f;
  if (v == 0) err = 1;
  v = t || t;
  if (v == 0) err = 1;
  v = f || f;
  if (v != 0) err = 1;

  v = !t;
  if (v != 0) err = 1;
  v = !f;
  if (v == 0) err = 1;

  int a = 100;
  int b = 100;
  int c = 128;

  v = a == b;
  if (v == 0) err = 1;
  v = a == c;
  if (v != 0) err = 1;
  v = a != b;
  if (v != 0) err = 1;
  v = a != c;
  if (v == 0) err = 1;
  v = a < b;
  if (v != 0) err = 1;
  v = a < c;
  if (v == 0) err = 1;
  v = c < a;
  if (v != 0) err = 1;
  v = a <= b;
  if (v == 0) err = 1;
  v = a <= c;
  if (v == 0) err = 1;
  v = c <= a;
  if (v != 0) err = 1;
  v = a > b;
  if (v != 0) err = 1;
  v = a > c;
  if (v != 0) err = 1;
  v = c > a;
  if (v == 0) err = 1;
  v = a >= b;
  if (v == 0) err = 1;
  v = a >= c;
  if (v != 0) err = 1;
  v = c >= a;
  if (v == 0) err = 1;

  unsigned ua = 1;
  unsigned ub = 0xffffffff;
  v = ua < ub;
  if (v == 0) err = 1;
  v = ub > ua;
  if (v == 0) err = 1;

  int si = -1;
  unsigned ui = 1;
  v = si < ui;
  if (v != 0) err = 1;
  v = si > ui;
  if (v == 0) err = 1;

  if (err == 0) {
    printf("15.logic.c PASS\n");
  } else {
    printf("15.logic.c FAIL\n");
  }
  return err;
}
