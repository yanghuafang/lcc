int printf(char*, ...);

struct Data {
  int id;
  int data;
};

int main() {
  Data da[2];
  da[1].id = 10;
  da[1].data = 80;
  printf("da[1].id:%d da[1].data:%d\n", da[1].id, da[1].data);
  return 0;
}