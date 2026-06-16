int printf(char*, ...);

int test_errors = 0;

void check_uint(const char* name, unsigned actual, unsigned expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %u expected %u\n", name, actual, expected);
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

union IPv4 {
  unsigned int ip;
  unsigned char c;
};

int main() {
  printf("**** 3.union_type.c ****\n");

  IPv4 ipv4;
  ipv4.ip = 0x12abcd34;
  printf("ip 0x%x c 0x%x\n", ipv4.ip, ipv4.c);
  check_uint("initial ip", ipv4.ip, 0x12abcd34);
  check_uint("initial low byte", ipv4.c, 0x34);

  ipv4.c = 0x56;
  printf("ip 0x%x c 0x%x\n", ipv4.ip, ipv4.c);
  check_uint("ip after c write", ipv4.ip, 0x12abcd56);
  check_uint("c after write", ipv4.c, 0x56);

  ipv4.ip = 0xffffffff;
  check_uint("union all ones", ipv4.ip, 0xffffffff);

  ipv4.c = 0;
  check_uint("byte zero clears low byte", ipv4.ip, 0xffffff00);

  report_result();
  return test_errors;
}
