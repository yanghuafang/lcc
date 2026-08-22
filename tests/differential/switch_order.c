// switch label order, printed rather than asserted.
//
// C tries every case label before it reaches default, wherever default is
// written. Lowering the labels as a chain in source order makes a default that
// comes first swallow the cases after it.

int printf(char*, ...);

void pick(int v) {
  switch (v) {
    default:
      printf("v=%d default\n", v);
      break;
    case 2:
      printf("v=%d case 2\n", v);
      break;
    case 3:
      printf("v=%d case 3\n", v);
      break;
  }
}

void pickLast(int v) {
  switch (v) {
    case 2:
      printf("v=%d case 2\n", v);
      break;
    default:
      printf("v=%d default\n", v);
      break;
  }
}

int main() {
  pick(1);
  pick(2);
  pick(3);
  pickLast(1);
  pickLast(2);
  return 0;
}
