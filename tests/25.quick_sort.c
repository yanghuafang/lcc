int printf(char*, ...);

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

int main() {
  int err = 0;
  int arr[6];
  arr[0] = 10;
  arr[1] = 7;
  arr[2] = 8;
  arr[3] = 9;
  arr[4] = 1;
  arr[5] = 5;
  int n = sizeof(arr) / sizeof(arr[0]);

  quickSort(arr, 0, n - 1);

  if (arr[0] != 1) err = 1;
  if (arr[1] != 5) err = 1;
  if (arr[2] != 7) err = 1;
  if (arr[3] != 8) err = 1;
  if (arr[4] != 9) err = 1;
  if (arr[5] != 10) err = 1;

  int single[1];
  single[0] = 42;
  quickSort(single, 0, 0);
  if (single[0] != 42) err = 1;

  if (err == 0) {
    printf("25.quick_sort.c PASS\n");
  } else {
    printf("25.quick_sort.c FAIL\n");
  }
  return err;
}
