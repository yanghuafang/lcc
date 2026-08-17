// Every type lcc understands, declared once each.
//
// A graph fixture: no assertions and no PASS/FAIL reporting, so the picture is
// the type tree rather than the scaffolding that would verify it. Correctness
// for these types is covered by the numbered tests in tests/.

typedef int Int;

struct Point {
  int x;
  int y;
};

union Value {
  int i;
  double d;
};

enum Color { RED, GREEN, BLUE };

int main() {
  char c;
  short s;
  int i;
  long l;
  unsigned int u;
  unsigned long ul;
  float f;
  double d;
  bool b;
  int* p;
  int** pp;
  int a[4];
  int m[2][3];
  Point pt;
  Value v;
  Color col;
  Int alias;
  return 0;
}
