// Runtime benchmark (not in compile-tests.sh).
// Tiled/blocked 512x512 matmul (32x32 blocks) on flat arrays — cache-blocked
// counterpart to matrix_mul_huge.c (same size, inputs, and reps). At 512x512
// the 1 MB matrices spill cache, so blocking the loops keeps each tile's
// working set resident and is markedly faster than the naive baseline here
// (unlike the cache-resident 128x128 pair, where blocking is neutral).
// Return 0 on success. Flat 1D arrays (row-major); lcc has no 2D array params.

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

// Blocked matmul: iterate over 32x32 tiles of C, accumulating each tile's
// contribution one A/B block at a time to keep the working set cache-resident.
// out must start zeroed because the kk loop adds into out across blocks
// (the naive matmul in matrix_mul_huge.c overwrites out[i][j] instead).
void matmul(int* out, int* x, int* y) {
  int ii = 0;
  int jj = 0;
  int kk = 0;
  int i = 0;
  int j = 0;
  int k = 0;
  int p = 32;  // tile size; 512 % 32 == 0 so tiles cover the matrix exactly
  int ib = 0;
  int sum = 0;

  for (i = 0; i < 262144; i = i + 1) {
    out[i] = 0;
  }

  for (ii = 0; ii < 512; ii = ii + p) {
    for (jj = 0; jj < 512; jj = jj + p) {
      for (kk = 0; kk < 512; kk = kk + p) {
        for (i = ii; i < ii + p; i = i + 1) {
          ib = i * 512;
          for (j = jj; j < jj + p; j = j + 1) {
            sum = out[ib + j];
            for (k = kk; k < kk + p; k = k + 1) {
              sum = sum + x[ib + k] * y[k * 512 + j];
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
