int printf(char*, ...);

int g_data = 0;

void getAddress(int** p) { *p = &g_data; }

int main() {
  int err = 0;
  int* p = &g_data;
  *p = 1234;

  int* p2;
  getAddress(&p2);
  *p2 = 5678;

  if (g_data != 5678) err = 1;
  if (*p2 != 5678) err = 1;
  if (*p != 5678) err = 1;

  *p = 0;
  if (g_data != 0) err = 1;

  *p2 = -42;
  if (g_data != -42) err = 1;

  if (err == 0) {
    printf("10.double_pointer_type.c PASS\n");
  } else {
    printf("10.double_pointer_type.c FAIL\n");
  }
  return err;
}
