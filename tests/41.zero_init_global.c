int printf(char*, ...);

// Static-storage objects with no initializer must be zero-initialized
// (C11 6.7.9/10). Reading them before any write must observe 0 / null.
int g_scalar;
int g_arr[4];
int g_matrix[2][3];
int* g_ptr;

struct Point {
  int x;
  int y;
};

struct Point g_point;

int main(void) {
  int err = 0;

  if (g_scalar != 0) err = 1;

  if (g_arr[0] != 0) err = 1;
  if (g_arr[1] != 0) err = 1;
  if (g_arr[2] != 0) err = 1;
  if (g_arr[3] != 0) err = 1;

  if (g_matrix[0][0] != 0) err = 1;
  if (g_matrix[0][2] != 0) err = 1;
  if (g_matrix[1][1] != 0) err = 1;
  if (g_matrix[1][2] != 0) err = 1;

  if (g_ptr != 0) err = 1;

  if (g_point.x != 0) err = 1;
  if (g_point.y != 0) err = 1;

  if (err == 0) {
    printf("41.zero_init_global.c PASS\n");
  } else {
    printf("41.zero_init_global.c FAIL\n");
  }
  return err;
}
