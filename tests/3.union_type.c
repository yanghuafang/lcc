int printf(char*, ...);

union IPv4 {
  unsigned int ip;
  unsigned char c;
};

int main() {
  int err = 0;
  IPv4 ipv4;
  unsigned int ip;
  unsigned char byte;

  ipv4.ip = 0x12abcd34;
  ip = ipv4.ip;
  byte = ipv4.c;
  if (ip != 0x12abcd34) err = 1;
  if (byte != 0x34) err = 1;

  ipv4.c = 0x56;
  ip = ipv4.ip;
  byte = ipv4.c;
  if (ip != 0x12abcd56) err = 1;
  if (byte != 0x56) err = 1;

  ipv4.ip = 0xffffffff;
  ip = ipv4.ip;
  if (ip != 0xffffffff) err = 1;

  ipv4.c = 0;
  ip = ipv4.ip;
  if (ip != 0xffffff00) err = 1;

  if (err == 0) {
    printf("3.union_type.c PASS\n");
  } else {
    printf("3.union_type.c FAIL\n");
  }
  return err;
}
