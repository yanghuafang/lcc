int printf(char*, ...);

int g_data = 0;

void getAddress(int** p) { *p = &g_data; }

int main() {
  int* p = &g_data;
  *p = 1234;
  printf("p: %p, *p: %d, &g_data: %p, g_data: %d\n", p, *p, &g_data, g_data);

  int* p2;
  getAddress(&p2);
  *p2 = 5678;
  printf("p2: %p, *p2: %d, &g_data: %p, g_data: %d\n", p2, *p2, &g_data,
         g_data);

  return 0;
}
