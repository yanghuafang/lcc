/* goto and labels: the one jump whose target is not built by the statement that
 * jumps. break and continue read their target from ControlFlowContext, which is
 * a stack; a label is reachable from anywhere in its function, so CodeGenerator
 * holds a per-function table instead, and a block named by a forward goto stays
 * detached until the label itself is reached.
 *
 * afterReturn is the case worth keeping: a statement after a return used to end
 * generation, because nothing could reach it. A label can, so the walk now
 * continues past a terminator when the next statement is one. Without that the
 * goto branched to a block that was never attached.
 *
 * firstPair is why goto earns its place in C at all -- one exit from nested
 * loops, which break cannot express. */

int printf(char*, ...);

/* Backward goto: a loop built by hand. */
int countTo(int n) {
  int i = 0;
top:
  i = i + 1;
  if (i < n) {
    goto top;
  }
  return i;
}

/* Forward goto skipping work. */
int skip(int flag) {
  int r = 1;
  if (flag) {
    goto done;
  }
  r = 2;
done:
  return r;
}

/* The classic use: one exit from nested loops. */
int firstPair(int limit, int target) {
  int i = 0;
  int j;
  int found = -1;
  while (i < limit) {
    j = 0;
    while (j < limit) {
      if (i * 10 + j == target) {
        found = i * 10 + j;
        goto out;
      }
      j = j + 1;
    }
    i = i + 1;
  }
out:
  return found;
}

/* A label after a return: reachable only by jumping to it. */
int afterReturn(int flag) {
  if (flag) {
    goto tail;
  }
  return 1;
tail:
  return 2;
}

/* Out of a switch. */
int fromSwitch(int x) {
  switch (x) {
    case 1:
      goto one;
    case 2:
      return 20;
    default:
      break;
  }
  return 0;
one:
  return 10;
}

int main() {
  int failed = 0;

  if (countTo(5) != 5) {
    failed = 1;
  }
  if (skip(1) != 1 || skip(0) != 2) {
    failed = 1;
  }
  if (firstPair(5, 23) != 23 || firstPair(3, 99) != -1) {
    failed = 1;
  }
  if (afterReturn(1) != 2 || afterReturn(0) != 1) {
    failed = 1;
  }
  if (fromSwitch(1) != 10 || fromSwitch(2) != 20 || fromSwitch(9) != 0) {
    failed = 1;
  }

  if (failed == 0) {
    printf("50.goto_label.c PASS\n");
    return 0;
  }
  printf("50.goto_label.c FAIL\n");
  return 1;
}
