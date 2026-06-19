int printf(char*, ...);

int for_break_continue(void) {
  int sum = 0;
  for (int i = 0; i < 10; i++) {
    if (i == 3) {
      continue;
    }
    if (i == 7) {
      break;
    }
    sum = sum + i;
  }
  return sum;
}

int switch_break_fallthrough(void) {
  int x = 1;
  int r = 0;
  switch (x) {
    case 1:
      r = r + 1;
    case 2:
      r = r + 10;
      break;
    default:
      r = 99;
      break;
  }
  return r;
}

int switch_break_only(void) {
  int x = 2;
  int r = 0;
  switch (x) {
    case 1:
      r = 10;
      break;
    case 2:
      r = 20;
      break;
    default:
      r = 99;
      break;
  }
  return r;
}

int for_switch_break_continue(void) {
  int sum = 0;
  for (int i = 0; i < 6; i++) {
    switch (i) {
      case 1:
        continue;
      case 3:
        break;
      case 5:
        sum = sum + 100;
        break;
      default:
        sum = sum + i;
        break;
    }
  }
  return sum;
}

int switch_for_break_continue(void) {
  int r = 0;
  int x = 1;
  switch (x) {
    case 1:
      {
        int sum = 0;
        for (int i = 0; i < 5; i++) {
          if (i == 2) {
            continue;
          }
          if (i == 4) {
            break;
          }
          sum = sum + i;
        }
        r = sum;
      }
      break;
    default:
      r = -1;
      break;
  }
  return r;
}

int main(void) {
  int err = 0;

  if (for_break_continue() != 18) err = 1;
  if (switch_break_fallthrough() != 11) err = 1;
  if (switch_break_only() != 20) err = 1;
  if (for_switch_break_continue() != 106) err = 1;
  if (switch_for_break_continue() != 4) err = 1;

  if (err == 0) {
    printf("39.break_continue_hierarchy.c PASS\n");
  } else {
    printf("39.break_continue_hierarchy.c FAIL\n");
  }
  return err;
}
