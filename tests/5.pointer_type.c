int printf(char*, ...);

char gc = 'a';
int gi = 1024;

int main() {
  char c = 'A';
  int i = 128;

  char* pc = &c;
  int* pi = &i;

  printf("c: %c %c\n", c, *pc);
  printf("i: %i %i\n", i, *pi);

  *pc = 'B';
  *pi = 256;

  printf("new c: %c %c\n", c, *pc);
  printf("new i: %i %i\n", i, *pi);

  char* pgc = &gc;
  int* pgi = &gi;

  printf("gc: %c %c\n", gc, *pgc);
  printf("gi: %i %i\n", gi, *pgi);

  *pgc = 'b';
  *pgi = 2048;

  printf("new gc: %c %c\n", gc, *pgc);
  printf("new gi: %i %i\n", gi, *pgi);

  return 0;
}