int printf(char*, ...);

// Function to swap two elements
void swap(int* a, int* b) {
  int t = *a;
  *a = *b;
  *b = t;
}

// Function to partition the array
int partition(int* arr, int low, int high) {
  int pivot = arr[high];  // Choosing the last element as pivot
  int i = (low - 1);      // Index of smaller element

  for (int j = low; j <= high - 1; j++) {
    // If current element is smaller than or equal to pivot
    if (arr[j] <= pivot) {
      i++;                     // Increment index of smaller element
      swap(&arr[i], &arr[j]);  // Swap
    }
  }
  swap(&arr[i + 1], &arr[high]);  // Place the pivot in the correct position
  return (i + 1);
}

// Main function that implements QuickSort
void quickSort(int* arr, int low, int high) {
  if (low < high) {
    // Partitioning index
    int pi = partition(arr, low, high);

    // Recursively sort elements before and after partition
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

// Function to print an array
void printArray(int* arr, int size) {
  for (int i = 0; i < size; i++) printf("%d ", arr[i]);
  printf("\n");
}

// Driver program to test above functions
int main() {
  int arr[6];
  arr[0] = 10;
  arr[1] = 7;
  arr[2] = 8;
  arr[3] = 9;
  arr[4] = 1;
  arr[5] = 5;
  int n = sizeof(arr) / sizeof(arr[0]);

  quickSort(arr, 0, n - 1);

  printf("Sorted array: \n");
  printArray(arr, n);

  return 0;
}
