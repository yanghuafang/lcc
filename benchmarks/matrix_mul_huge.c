// M15 runtime benchmark (not in compile-tests.sh).
// Naive 512x512 matmul on flat arrays — the cache-spilling baseline for
// matrix_mul_tiled_huge.c. Each matrix is 1 MB, so the working set exceeds L1
// (and L2 on many hosts); the naive column-strided reads of B are cache-bound,
// which is exactly what the tiled variant fixes. Fewer reps than the 128x128
// matrix_mul_large.c because each matmul is ~64x heavier. Return 0 on success.
// Flat 1D arrays (row-major) because lcc has no 2D array parameters.

int a[262144];
int b[262144];
int c[262144];

void fill(int* m, int base) {
  int i = 0;
  int j = 0;
  int v = 0;
  int idx = 0;
  for (i = 0; i < 512; i = i + 1) {
    for (j = 0; j < 512; j = j + 1) {
      idx = i * 512 + j;
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
  for (i = 0; i < 512; i = i + 1) {
    xi = i * 512;
    for (j = 0; j < 512; j = j + 1) {
      sum = 0;
      for (k = 0; k < 512; k = k + 1) {
        sum = sum + x[xi + k] * y[k * 512 + j];
      }
      out[xi + j] = sum;
    }
  }
}

int checksum(int* m) {
  int i = 0;
  int sum = 0;
  for (i = 0; i < 262144; i = i + 1) {
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
  for (r = 0; r < 4; r = r + 1) {
    matmul(c, a, b);
    if (checksum(c) != expected) {
      return 1;
    }
  }
  return 0;
}
