// Runtime benchmark (not in compile-tests.sh).
// Repeated quicksort on a fixed-size array; return 0 on success.

int work[8192];

void swap(int* a, int* b) {
  int t = *a;
  *a = *b;
  *b = t;
}

int partition(int* arr, int low, int high) {
  int pivot = arr[high];
  int i = (low - 1);
  for (int j = low; j <= high - 1; j++) {
    if (arr[j] <= pivot) {
      i++;
      swap(&arr[i], &arr[j]);
    }
  }
  swap(&arr[i + 1], &arr[high]);
  return (i + 1);
}

void quickSort(int* arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

void fill(int* arr, int n, int seed) {
  int x = seed;
  int i = 0;
  int v = 0;
  for (i = 0; i < n; i = i + 1) {
    x = x * 1103515245 + 12345;
    v = x >> 16;
    v = v % 32768;
    arr[i] = v;
  }
}

int is_sorted(int* arr, int n) {
  for (int i = 1; i < n; i += 1) {
    if (arr[i - 1] > arr[i]) {
      return 0;
    }
  }
  return 1;
}

int main() {
  int err = 0;
  int r = 0;
  for (r = 0; r < 100; r = r + 1) {
    fill(work, 8192, 12345 + r);
    quickSort(work, 0, 8191);
    if (is_sorted(work, 8192) == 0) {
      err = 1;
    }
  }
  return err;
}
