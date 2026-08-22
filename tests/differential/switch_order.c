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

// Dispatch order and body order are separate things, and this is where they
// meet: reaching default by falling off the end of the case above it, or
// falling out of default into the case below.
void fallThrough(int v) {
  printf("v=%d", v);
  switch (v) {
    case 1:
      printf(" one");
    default:
      printf(" default");
    case 3:
      printf(" three");
  }
  printf("\n");
}

void onlyDefault(int v) {
  switch (v) {
    default:
      printf("v=%d only-default\n", v);
  }
}

int main() {
  pick(1);
  pick(2);
  pick(3);
  pickLast(1);
  pickLast(2);
  fallThrough(1);
  fallThrough(2);
  fallThrough(3);
  onlyDefault(7);
  return 0;
}
