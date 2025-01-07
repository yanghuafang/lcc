int printf(char*, ...);

int main() {
  char c[4];
  c[0] = 'A';
  c[1] = 'B';
  c[2] = 'C';
  c[3] = 'D';

  char* pc = c;
  printf("c[0]: %c %c\n", *pc, pc[0]);
  pc += 1;
  printf("c[1]: %c %c\n", *pc, pc[0]);
  ++pc;
  printf("c[2]: %c %c\n", *pc, pc[0]);
  pc++;
  printf("c[3]: %c %c\n", *pc, pc[0]);

  pc = &c[3];
  printf("c[3]: %c %c\n", *pc, pc[0]);
  pc -= 1;
  printf("c[2]: %c %c\n", *pc, pc[0]);
  --pc;
  printf("c[1]: %c %c\n", *pc, pc[0]);
  pc--;
  printf("c[0]: %c %c\n", *pc, pc[0]);

  return 0;
}
