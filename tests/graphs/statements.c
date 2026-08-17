// Every statement form, once each: the two branches of if, switch with a
// default, all three loops, and the three jumps.
//
// A graph fixture: no assertions, so the control-flow shape is what the graph
// shows. tests/17-23 and tests/39 are what verify the behaviour.

int classify(int n) {
  int total = 0;

  if (n > 0) {
    total = 1;
  } else {
    total = 2;
  }

  switch (n) {
    case 0:
      total = total + 1;
      break;
    default:
      break;
  }

  for (int i = 0; i < 3; i++) {
    if (i == 1) {
      continue;
    }
    if (i == 2) {
      break;
    }
    total = total + i;
  }

  while (total < 5) {
    total = total + 1;
  }

  do {
    total = total + 1;
  } while (total < 8);

  return total;
}

int main() { return classify(1); }
