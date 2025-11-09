// Runtime benchmark (not in compile-tests.sh).
// Tiled/blocked square matrix multiply C = A * B (128x128) on flat arrays.
// Same size, inputs, and repeat count as matrix_mul_large.c, so runtimes are
// directly comparable; the only difference is 32x32 cache blocking of the
// three loops. Return 0 on success.
// Flat 1D arrays (row-major) because lcc has no 2D array parameters.

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

// Blocked matmul: iterate over PxP tiles of C, accumulating each tile's
// contribution one A/B block at a time to keep the working set cache-resident.
// out must start zeroed because the kk loop adds into out across blocks
// (the naive matmul in matrix_mul_large.c overwrites out[i][j] instead).
void matmul(int* out, int* x, int* y) {
  int ii = 0;
  int jj = 0;
  int kk = 0;
  int i = 0;
  int j = 0;
  int k = 0;
  int p = 32;  // tile size; 128 % 32 == 0 so tiles cover the matrix exactly
  int ib = 0;
  int sum = 0;

  for (i = 0; i < 16384; i = i + 1) {
    out[i] = 0;
  }

  for (ii = 0; ii < 128; ii = ii + p) {
    for (jj = 0; jj < 128; jj = jj + p) {
      for (kk = 0; kk < 128; kk = kk + p) {
        for (i = ii; i < ii + p; i = i + 1) {
          ib = i * 128;
          for (j = jj; j < jj + p; j = j + 1) {
            sum = out[ib + j];
            for (k = kk; k < kk + p; k = k + 1) {
              sum = sum + x[ib + k] * y[k * 128 + j];
            }
            out[ib + j] = sum;
          }
        }
      }
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
