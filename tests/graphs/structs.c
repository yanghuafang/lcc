// Aggregate member access: through a value with `.`, through a pointer with
// `->`, an array of structs, and a union sharing its storage.
//
// A graph fixture: no assertions. tests/2-3, tests/24, and tests/29 verify the
// layout and the values.

struct Point {
  int x;
  int y;
};

union Value {
  int i;
  double d;
};

int main() {
  Point p;
  Point line[2];
  Point* ptr;
  Value v;

  p.x = 1;
  p.y = 2;

  ptr = &p;
  ptr->x = 3;

  line[0].x = 4;
  line[1] = p;

  v.i = 5;
  return v.i + p.x + ptr->y + line[0].x;
}
