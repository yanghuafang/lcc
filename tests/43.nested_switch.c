// switch nested inside a case body.
//
// The fall-through target is a property of the case body being lowered, and
// case bodies nest — a switch inside a case is ordinary C. ControlFlowContext
// kept a single slot for it rather than a stack, so the inner switch cleared
// the outer case's successor on its way out and the outer body had nowhere to
// fall through to: "Case fall-through outside switch!", at compile time.

int printf(char*, ...);

// Inner switch inside case 1, whose body then falls through to case 2.
int nested(int outer, int inner) {
  int r = 0;
  switch (outer) {
    case 1:
      switch (inner) {
        case 1:
          r = r + 1;
          break;
        case 2:
          r = r + 2;
          break;
        default:
          r = r + 4;
          break;
      }
      r = r + 10;
    // No break: the inner switch must not have consumed this fall-through.
    case 2:
      r = r + 100;
      break;
    default:
      r = r + 1000;
      break;
  }
  return r;
}

// Three levels, so the stack is exercised as a stack rather than two slots.
int threeDeep(int x) {
  int r = 0;
  switch (x) {
    case 1:
      switch (x) {
        case 1:
          switch (x) {
            case 1:
              r = r + 1;
              break;
          }
          r = r + 2;
        // Falls through to the middle switch's case 2.
        case 2:
          r = r + 4;
          break;
      }
      r = r + 8;
      break;
    default:
      r = r + 16;
      break;
  }
  return r;
}

// break inside the inner switch leaves that switch only; continue inside a
// nested switch still reaches the enclosing loop.
int loopWithNestedSwitch(void) {
  int total = 0;
  for (int i = 0; i < 5; i++) {
    switch (i) {
      case 0:
        switch (i) {
          case 0:
            break;
        }
        total = total + 1;
        break;
      case 3:
        continue;
      default:
        total = total + 10;
        break;
    }
    total = total + 100;
  }
  return total;
}

int main() {
  int err = 0;

  if (nested(1, 1) != 111) err = 1;
  if (nested(1, 2) != 112) err = 1;
  if (nested(1, 5) != 114) err = 1;
  if (nested(2, 1) != 100) err = 1;
  if (nested(3, 1) != 1000) err = 1;

  if (threeDeep(1) != 15) err = 1;
  if (threeDeep(9) != 16) err = 1;

  if (loopWithNestedSwitch() != 431) err = 1;

  if (err == 0) {
    printf("43.nested_switch.c PASS\n");
  } else {
    printf("43.nested_switch.c FAIL\n");
  }
  return err;
}
