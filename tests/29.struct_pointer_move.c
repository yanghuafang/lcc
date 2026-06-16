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

struct Data {
  int id;
  int data;
};

int main() {
  printf("**** 29.struct_pointer_move.c ****\n");

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
  check_int("data[0] id", p->id, 10);
  check_int("data[0] data", (*p).data, 12);
  p += 1;
  printf("data[1] id:%d, data:%d\n", p->id, (*p).data);
  check_int("data[1] id", p->id, 20);
  check_int("data[1] data", (*p).data, 24);
  ++p;
  printf("data[2] id:%d, data:%d\n", p->id, (*p).data);
  check_int("data[2] id", p->id, 30);
  p++;
  printf("data[3] id:%d, data:%d\n", p->id, (*p).data);
  check_int("data[3] id", p->id, 40);
  check_int("data[3] data", (*p).data, 48);

  p = &data[3];
  printf("data[3] id:%d, data:%d\n", p->id, (*p).data);
  p -= 1;
  printf("data[2] id:%d, data:%d\n", p->id, (*p).data);
  check_int("back data[2] id", p->id, 30);
  --p;
  printf("data[1] id:%d, data:%d\n", p->id, (*p).data);
  check_int("back data[1] id", p->id, 20);
  p--;
  printf("data[0] id:%d, data:%d\n", p->id, (*p).data);
  check_int("back data[0] id", p->id, 10);

  report_result();
  return test_errors;
}
