// M15 runtime benchmark (not in compile-tests.sh).
// Square matrix multiply C = A * B (128x128) on flat arrays, repeated.
// Flat 1D arrays (row-major) because lcc has no 2D array parameters.
// Return 0 on success.

int a[16384];
int b[16384];
int c[16384];

void fill(int* m, int base) {
  int i = 0;
  int j = 0;
  int v = 0;
  int idx = 0;
  for (i = 0; i < 128; i = i + 1) {
    for (j = 0; j < 128; j = j + 1) {
      idx = i * 128 + j;
      v = base + i * 7 + j * 3;
      v = v % 32768;
      m[idx] = v;
    }
  }
}

void matmul(int* out, int* x, int* y) {
  int i = 0;
  int j = 0;
  int k = 0;
  int sum = 0;
  int xi = 0;
  for (i = 0; i < 128; i = i + 1) {
    xi = i * 128;
    for (j = 0; j < 128; j = j + 1) {
      sum = 0;
      for (k = 0; k < 128; k = k + 1) {
        sum = sum + x[xi + k] * y[k * 128 + j];
      }
      out[xi + j] = sum;
    }
  }
}

int checksum(int* m) {
  int i = 0;
  int sum = 0;
  for (i = 0; i < 16384; i = i + 1) {
    sum = sum + m[i];
  }
  return sum;
}

int main() {
  int r = 0;
  fill(a, 1);
  fill(b, 5);
  matmul(c, a, b);
  int expected = checksum(c);
  for (r = 0; r < 40; r = r + 1) {
    matmul(c, a, b);
    if (checksum(c) != expected) {
      return 1;
    }
  }
  return 0;
}
