// Short-circuit evaluation: && and || skip their right operand, and ?: skips
// the arm it does not select.
//
// Almost every assertion here is about what does *not* run. lcc used to lower
// all three eagerly with LLVM select, which computes both operands before
// choosing between them. The values it produced were still correct, so a test
// that only checked results would have passed throughout — which is why this
// file counts calls instead. The counters are what fail on an eager lowering;
// the null guard below is what segfaults on one.
//
// The constant initializers at the top go the other way. They are folded
// before any code runs, so they keep the eager form: there is no control flow
// to branch through in a global block, and a phi is not a constant. They are
// here because that fallback is easy to drop by accident.

int printf(char*, ...);

int gTernary = 1 ? 2 : 3;
int gAnd = 1 && 0;
int gOr = 2 || 0;

int calls = 0;

int bump() {
  calls = calls + 1;
  return 1;
}

int trueRan = 0;
int falseRan = 0;

int trueArm() {
  trueRan = 1;
  return 10;
}

int falseArm() {
  falseRan = 1;
  return 20;
}

int main() {
  int err = 0;
  static int sTernary = 1 ? 5 : 6;

  // A decided left operand settles the answer, and the right one never runs.
  calls = 0;
  if ((0 && bump()) != 0) err = 1;
  if (calls != 0) err = 1;

  calls = 0;
  if ((1 || bump()) != 1) err = 1;
  if (calls != 0) err = 1;

  // An undecided one runs it exactly once.
  calls = 0;
  if ((1 && bump()) != 1) err = 1;
  if (calls != 1) err = 1;

  calls = 0;
  if ((0 || bump()) != 1) err = 1;
  if (calls != 1) err = 1;

  // The guard idiom, and the reason this matters: on an eager lowering the
  // dereference happens anyway and the program dies here rather than failing
  // an assertion.
  int* p = 0;
  if (p != 0 && *p == 1) err = 1;

  // A bounds guard is the same shape with the same consequence.
  int arr[3] = {1, 2, 3};
  int i = 7;
  if (i < 3 && arr[i] == 0) err = 1;

  // ?: runs the arm it selects and only that one.
  trueRan = 0;
  falseRan = 0;
  if ((1 ? trueArm() : falseArm()) != 10) err = 1;
  if (trueRan != 1) err = 1;
  if (falseRan != 0) err = 1;

  trueRan = 0;
  falseRan = 0;
  if ((0 ? trueArm() : falseArm()) != 20) err = 1;
  if (trueRan != 0) err = 1;
  if (falseRan != 1) err = 1;

  // Nesting. The join's phi has to name the block an operand *finished* in,
  // and a nested && or ?: finishes in its own join rather than where it
  // started. These are the shapes where naming the wrong one shows up.
  int a = 1;
  int b = 0;
  int c = 1;
  if ((a && b || c) != 1) err = 1;
  if ((a && (b && c)) != 0) err = 1;
  if (((a ? b : c) && a) != 0) err = 1;

  // Assigned rather than compared in place: a ?: whose arms are themselves
  // ?: or && reports no type of its own, so comparing one directly is
  // rejected. Unrelated to short-circuiting, and it predates it.
  int nestedLogic = a ? (b && c) : (b || c);
  if (nestedLogic != 0) err = 1;
  int nestedTernary = a ? (a ? 1 : 2) : 3;
  if (nestedTernary != 1) err = 1;

  // Arms of different types. Their common type is not known until both have
  // been evaluated, so each conversion is emitted back into the arm that
  // produced its value — the other path never computes it.
  double d = 0 ? 1 : 2.5;
  if (d != 2.5) err = 1;
  d = 1 ? 2.5 : 1;
  if (d != 2.5) err = 1;

  // In a loop condition the phi is reached once per iteration, and the test
  // that ends the loop is the one that must skip the call.
  calls = 0;
  int k = 0;
  while (k < 3 && bump() == 1) {
    k = k + 1;
  }
  if (k != 3) err = 1;
  if (calls != 3) err = 1;

  // The folded-constant path.
  if (gTernary != 2) err = 1;
  if (gAnd != 0) err = 1;
  if (gOr != 1) err = 1;
  if (sTernary != 5) err = 1;

  if (err == 0) {
    printf("45.short_circuit.c PASS\n");
  } else {
    printf("45.short_circuit.c FAIL\n");
  }
  return err;
}
