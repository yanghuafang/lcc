// Arrays deeper than two dimensions. Declaration, subscript, sizeof and file
// scope all work at any depth — only the brace initializer stops at two, which
// is why nothing here uses one.
//
// Worth pinning: with no test covering it, Language.md came to list
// `int a[2][8][5];` itself as unsupported, which the compiler disproves.

int printf(char*, ...);

int g3[2][3][4];
int g4[2][2][2][2];

int main() {
  int err = 0;
  int a[2][3][4];
  int b[2][2][2][2];
  int i, j, k, l;
  int sum = 0;

  for (i = 0; i < 2; i++) {
    for (j = 0; j < 3; j++) {
      for (k = 0; k < 4; k++) {
        a[i][j][k] = i * 100 + j * 10 + k;
      }
    }
  }

  for (i = 0; i < 2; i++) {
    for (j = 0; j < 3; j++) {
      for (k = 0; k < 4; k++) {
        sum += a[i][j][k];
      }
    }
  }

  if (a[0][0][0] != 0) err = 1;
  if (a[1][2][3] != 123) err = 1;
  if (sum != 1476) err = 1;

  // Depth is not capped at three.
  for (i = 0; i < 2; i++) {
    for (j = 0; j < 2; j++) {
      for (k = 0; k < 2; k++) {
        for (l = 0; l < 2; l++) {
          b[i][j][k][l] = i + j + k + l;
        }
      }
    }
  }

  if (b[0][1][0][1] != 2) err = 1;
  if (b[1][1][1][1] != 4) err = 1;

  // A file-scope array takes a different path from a local one.
  g3[1][2][3] = 7;
  if (g3[1][2][3] != 7) err = 1;
  if (g3[0][0][0] != 0) err = 1;

  g4[1][1][1][1] = 9;
  if (g4[1][1][1][1] != 9) err = 1;

  // Every dimension multiplies the size: 2*3*4*4 and 2*2*2*2*4.
  if (sizeof(a) != 96) err = 1;
  if (sizeof(g3) != 96) err = 1;
  if (sizeof(b) != 64) err = 1;

  if (err == 0) {
    printf("46.array_3d.c PASS\n");
  } else {
    printf("46.array_3d.c FAIL\n");
  }
  return err;
}
