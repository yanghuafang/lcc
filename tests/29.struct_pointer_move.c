int printf(char*, ...);

struct Data {
  int id;
  int data;
};

int main() {
  Data data[4];
  data[0].id = 10;
  data[0].data = 12;
  data[1].id = 20;
  data[1].data = 24;
  data[2].id = 30;
  data[2].data = 36;
  data[3].id = 40;
  data[3].data = 48;

  Data* p = data;
  printf("data[0] id:%d, data:%d\n", p->id, (*p).data);
  p += 1;
  printf("data[1] id:%d, data:%d\n", p->id, (*p).data);
  ++p;
  printf("data[2] id:%d, data:%d\n", p->id, (*p).data);
  p++;
  printf("data[3] id:%d, data:%d\n", p->id, (*p).data);

  p = &data[3];
  printf("data[3] id:%d, data:%d\n", p->id, (*p).data);
  p -= 1;
  printf("data[2] id:%d, data:%d\n", p->id, (*p).data);
  --p;
  printf("data[1] id:%d, data:%d\n", p->id, (*p).data);
  p--;
  printf("data[0] id:%d, data:%d\n", p->id, (*p).data);

  return 0;
}