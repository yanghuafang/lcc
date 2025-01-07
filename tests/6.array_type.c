int printf(char*, ...);

char gs[16];
char* gps = "hello world!";
int gi[4];

int main() {
  char* ps = "happy new year!";
  printf("%s\n", ps);

  printf("%s\n", gps);

  char s[16];
  s[0] = 'g';
  s[1] = 'o';
  s[2] = 'o';
  s[3] = 'd';
  s[4] = 0;
  printf("%s\n", s);

  gs[0] = 'l';
  gs[1] = 'u';
  gs[2] = 'c';
  gs[3] = 'k';
  gs[4] = 'y';
  gs[5] = 0;
  printf("%s\n", gs);

  int i[4];
  i[0] = 128;
  i[1] = 256;
  printf("i %d %d\n", i[0], i[1]);
  printf("i addr %p %p\n", &i[0], &i[1]);

  gi[0] = 1024;
  gi[1] = 2048;
  printf("gi %d %d\n", gi[0], gi[1]);
  printf("gi addr %p %p\n", &gi[0], &gi[1]);

  return 0;
}