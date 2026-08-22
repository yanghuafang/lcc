// Integer conversions, printed rather than asserted.
//
// C converts a value to a wider unsigned type by sign-extending and then
// reinterpreting, so a negative signed value becomes a large unsigned one.
// Getting that wrong yields a small positive number instead, and nothing about
// the source says which is right — that is what the reference compiler is for.

int printf(char*, ...);

int main() {
  char c = -1;
  short s = -1;
  int i = -1;
  long l = -1;

  printf("char -1 to unsigned long   %lu\n", (unsigned long)c);
  printf("short -1 to unsigned long  %lu\n", (unsigned long)s);
  printf("int -1 to unsigned long    %lu\n", (unsigned long)i);
  printf("long -1 to unsigned long   %lu\n", (unsigned long)l);
  printf("char -1 to unsigned int    %u\n", (unsigned int)c);
  printf("short -1 to unsigned int   %u\n", (unsigned int)s);

  unsigned char uc = 200;
  unsigned short us = 60000;
  unsigned int ui = 3000000000u;

  printf("unsigned char 200 to long  %ld\n", (long)uc);
  printf("unsigned short to long     %ld\n", (long)us);
  printf("unsigned int 3e9 to long   %ld\n", (long)ui);
  printf("unsigned int 3e9 to int    %d\n", (int)ui);

  printf("char -1 narrowed to char   %d\n", (char)c);
  printf("long -1 narrowed to int    %d\n", (int)l);
  printf("long -1 narrowed to short  %d\n", (short)l);
  return 0;
}
