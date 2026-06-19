int printf(char*, ...);

struct Data {
  int id;
  int data;
};

int main() {
  int err = 0;
  Data da[2];
  int id;
  int data;

  da[0].id = 0;
  da[0].data = 0;
  da[1].id = 10;
  da[1].data = 80;

  id = da[1].id;
  data = da[1].data;
  if (id != 10) err = 1;
  if (data != 80) err = 1;

  id = da[0].id;
  data = da[0].data;
  if (id != 0) err = 1;
  if (data != 0) err = 1;

  if (err == 0) {
    printf("24.struct_array.c PASS\n");
  } else {
    printf("24.struct_array.c FAIL\n");
  }
  return err;
}
