// M14 vectorization study fixture (not in compile-tests.sh).
// Simple reduction loop; compile with -O3 and inspect -l-post-opt / -S.
// See docs/Pipeline.md § M14.

int sum_array(int* a, int n) {
  int sum = 0;
  for (int i = 0; i < n; i += 1) {
    sum += a[i];
  }
  return sum;
}

int main() {
  int a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
  int err = 0;
  if (sum_array(a, 8) != 36) err = 1;
  if (sum_array(a, 0) != 0) err = 1;
  return err;
}
