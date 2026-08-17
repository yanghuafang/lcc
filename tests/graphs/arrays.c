// Array declaration and initialization in every form lcc accepts: explicit
// bound, inferred bound, brace init, string init, 2D, and a mixed declarator
// list where only some names carry bounds.
//
// A graph fixture: no assertions. tests/6 and tests/30-34 verify the values.

int ga[3] = {1, 2, 3};
char gs[] = "hi";

int main() {
  int a[4];
  int b[3] = {1, 2, 3};
  int c[] = {4, 5};
  char s[] = "hey";
  char t[4] = "hey";
  int m[2][3];
  int n[2][2] = {{1, 2}, {3, 4}};
  int scalar, mixed[2];

  a[0] = 1;
  m[1][2] = 7;
  scalar = b[1] + c[0] + n[1][1] + s[0] + t[1] + ga[2] + gs[1];
  mixed[0] = scalar;
  return mixed[0];
}
