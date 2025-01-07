int printf(char*, ...);

union IPv4 {
  unsigned int ip;
  unsigned char c;
};

int main() {
  IPv4 ipv4;
  ipv4.ip = 0x12abcd34;
  printf("ip 0x%x c 0x%x\n", ipv4.ip, ipv4.c);

  ipv4.c = 0x56;
  printf("ip 0x%x c 0x%x\n", ipv4.ip, ipv4.c);

  return 0;
}