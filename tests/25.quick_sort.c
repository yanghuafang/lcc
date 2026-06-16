int printf(char*, ...);

int test_errors = 0;

void check_int(const char* name, int actual, int expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %d expected %d\n", name, actual, expected);
    test_errors++;
  }
}

void report_result(void) {
  if (test_errors == 0) {
    printf("PASS\n");
  } else {
    printf("FAIL: %d error(s)\n", test_errors);
  }
}

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

void printArray(int* arr, int size) {
  for (int i = 0; i < size; i++) printf("%d ", arr[i]);
  printf("\n");
}

int main() {
  printf("**** 25.quick_sort.c ****\n");

  int arr[6];
  arr[0] = 10;
  arr[1] = 7;
  arr[2] = 8;
  arr[3] = 9;
  arr[4] = 1;
  arr[5] = 5;
  int n = sizeof(arr) / sizeof(arr[0]);

  printf("Original array: \n");
  printArray(arr, n);

  quickSort(arr, 0, n - 1);

  printf("Sorted array: \n");
  printArray(arr, n);

  check_int("sorted[0]", arr[0], 1);
  check_int("sorted[1]", arr[1], 5);
  check_int("sorted[2]", arr[2], 7);
  check_int("sorted[3]", arr[3], 8);
  check_int("sorted[4]", arr[4], 9);
  check_int("sorted[5]", arr[5], 10);

  int single[1];
  single[0] = 42;
  quickSort(single, 0, 0);
  check_int("single element", single[0], 42);

  report_result();
  return test_errors;
}
