// Shift operators, printed rather than asserted.
//
// C promotes each shift operand on its own and gives the result the promoted
// type of the *left* one, so an unsigned right operand does not make the shift
// unsigned. Treating the pair the way a binary arithmetic operator is treated
// turns an arithmetic shift into a logical one, which only shows up when the
// left operand is negative.

int printf(char*, ...);

int main() {
  int x = -8;
  long lx = -8;
  unsigned int u = 1;
  long lu = 1;

  printf("int -8 >> int 1        %d\n", x >> 1);
  printf("int -8 >> unsigned 1   %d\n", x >> u);
  printf("int -8 >> long 1       %d\n", x >> lu);
  printf("long -8 >> int 1       %ld\n", lx >> 1);
  printf("long -8 >> unsigned 1  %ld\n", lx >> u);

  unsigned int ux = 4294967288u;
  printf("unsigned >> int 1      %u\n", ux >> 1);
  printf("unsigned >> unsigned 1 %u\n", ux >> u);

  int y = 1;
  printf("int 1 << int 3         %d\n", y << 3);
  printf("int 1 << unsigned 3    %d\n", y << 3u);

  short sh = -8;
  printf("short -8 >> int 1      %d\n", sh >> 1);

  char ch = -8;
  printf("char -8 >> int 1       %d\n", ch >> 1);

  // The compound forms take the same path, then store back through the
  // lvalue's own type.
  int cx = -8;
  cx >>= u;
  printf("int -8 >>= unsigned 1  %d\n", cx);

  long cl = -8;
  cl >>= u;
  printf("long -8 >>= unsigned 1 %ld\n", cl);

  unsigned int cu = 4294967288u;
  cu >>= 1;
  printf("unsigned >>= int 1     %u\n", cu);

  short cs = -8;
  cs >>= 1;
  printf("short -8 >>= int 1     %d\n", cs);

  int cshl = 1;
  cshl <<= u;
  printf("int 1 <<= unsigned 1   %d\n", cshl);

  // A shift's type is its promoted left operand, which matters once the
  // result takes part in something wider.
  int fx = -8;
  long widened = (fx >> u) + 1;
  printf("(int >> unsigned) + 1  %ld\n", widened);
  return 0;
}
