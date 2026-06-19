int printf(char*, ...);

struct Data {
  int id;
  int data;
};

int main() {
  int err = 0;
  Data data[4];
  int id;
  int val;

  data[0].id = 10;
  data[0].data = 12;
  data[1].id = 20;
  data[1].data = 24;
  data[2].id = 30;
  data[2].data = 36;
  data[3].id = 40;
  data[3].data = 48;

  Data* p = data;
  id = p->id;
  val = (*p).data;
  if (id != 10) err = 1;
  if (val != 12) err = 1;
  p += 1;
  id = p->id;
  val = (*p).data;
  if (id != 20) err = 1;
  if (val != 24) err = 1;
  ++p;
  id = p->id;
  if (id != 30) err = 1;
  p++;
  id = p->id;
  val = (*p).data;
  if (id != 40) err = 1;
  if (val != 48) err = 1;

  p = &data[3];
  p -= 1;
  id = p->id;
  if (id != 30) err = 1;
  --p;
  id = p->id;
  if (id != 20) err = 1;
  p--;
  id = p->id;
  if (id != 10) err = 1;

  if (err == 0) {
    printf("29.struct_pointer_move.c PASS\n");
  } else {
    printf("29.struct_pointer_move.c FAIL\n");
  }
  return err;
}
