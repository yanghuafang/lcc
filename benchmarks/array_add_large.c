// Runtime benchmark (not in compile-tests.sh).
// Element-wise add on large arrays; return 0 on success.

int a[65536];
int b[65536];
int c[65536];

void fill(int* arr, int n, int base) {
  int i = 0;
  int v = 0;
  for (i = 0; i < n; i = i + 1) {
    v = base + i * 13;
    v = v % 32768;
    arr[i] = v;
  }
}

void add_arrays(int* out, int* x, int* y, int n) {
  for (int i = 0; i < n; i += 1) {
    out[i] = x[i] + y[i];
  }
}

int checksum(int* arr, int n) {
  int sum = 0;
  for (int i = 0; i < n; i += 1) {
    sum += arr[i];
  }
  return sum;
}

int main() {
  int r = 0;
  fill(a, 65536, 1);
  fill(b, 65536, 7);
  add_arrays(c, a, b, 65536);
  int expected = checksum(c, 65536);
  for (r = 0; r < 1000; r = r + 1) {
    add_arrays(c, a, b, 65536);
    if (checksum(c, 65536) != expected) {
      return 1;
    }
  }
  return 0;
}
