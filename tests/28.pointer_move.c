int printf(char*, ...);

int test_errors = 0;

void check_char(const char* name, char actual, char expected) {
  if (actual != expected) {
    printf("ERROR [%s]: got %c expected %c\n", name, actual, expected);
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

int main() {
  printf("**** 28.pointer_move.c ****\n");

  char c[4];
  c[0] = 'A';
  c[1] = 'B';
  c[2] = 'C';
  c[3] = 'D';

  char* pc = c;
  printf("c[0]: %c %c\n", *pc, pc[0]);
  check_char("c[0] forward", *pc, 'A');
  pc += 1;
  printf("c[1]: %c %c\n", *pc, pc[0]);
  check_char("c[1] forward", *pc, 'B');
  ++pc;
  printf("c[2]: %c %c\n", *pc, pc[0]);
  check_char("c[2] forward", *pc, 'C');
  pc++;
  printf("c[3]: %c %c\n", *pc, pc[0]);
  check_char("c[3] forward", *pc, 'D');

  pc = &c[3];
  printf("c[3]: %c %c\n", *pc, pc[0]);
  check_char("c[3] backward start", *pc, 'D');
  pc -= 1;
  printf("c[2]: %c %c\n", *pc, pc[0]);
  check_char("c[2] backward", *pc, 'C');
  --pc;
  printf("c[1]: %c %c\n", *pc, pc[0]);
  check_char("c[1] backward", *pc, 'B');
  pc--;
  printf("c[0]: %c %c\n", *pc, pc[0]);
  check_char("c[0] backward end", *pc, 'A');

  report_result();
  return test_errors;
}
