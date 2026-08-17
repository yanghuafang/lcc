// Function forms: a prototype, a definition matching it, an empty parameter
// list, a variadic declaration, a file-scope static, and a call to each.
//
// A graph fixture: no assertions. tests/8 and tests/37-38 verify the behaviour.

int printf(char*, ...);

int add(int a, int b);

static int scale(int v) { return v * 2; }

int add(int a, int b) { return a + b; }

int noParams(void) { return 7; }

int main() {
  int s = add(1, 2);
  s = scale(s);
  s = s + noParams();
  printf("%d\n", s);
  return 0;
}
