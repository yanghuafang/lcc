// switch without a default label, and switch where every case returns.
//
// Both are cases the comparison-chain lowering in SwitchStmt gets wrong if the
// block chain is off by one: with no default, the last case's failed test needs
// somewhere to branch, and that target must be switch.end rather than a
// comparison block that never gets inserted into the function.

int printf(char*, ...);

// No default: falling off the end of the chain must reach switch.end.
int grade(int score) {
  int r = 0;
  switch (score) {
    case 1:
      r = 10;
      break;
    case 2:
      r = 20;
      break;
  }
  return r;
}

// Every case returns, so switch.end has no predecessors at all.
int allReturn(int x) {
  switch (x) {
    case 1:
      return 100;
    default:
      return 200;
  }
}

int main() {
  int err = 0;

  if (grade(1) != 10) err = 1;
  if (grade(2) != 20) err = 1;
  if (grade(7) != 0) err = 1;

  if (allReturn(1) != 100) err = 1;
  if (allReturn(3) != 200) err = 1;

  if (err == 0) {
    printf("42.switch_no_default.c PASS\n");
  } else {
    printf("42.switch_no_default.c FAIL\n");
  }
  return err;
}
