/* Function pointers: `int (*p)(int);`, assigning a function to one, calling
 * through it, and passing one as a parameter.
 *
 * The declarator wraps its own name, which the flat `VarType VarList` shape of
 * an ordinary declaration cannot express, so it has its own production in
 * Parser.y. FuncPointerType carries the signature because an opaque `ptr` no
 * longer records what it points at -- the call site rebuilds the llvm
 * FunctionType from the AST.
 *
 * Both spellings of taking a function's address are checked: C converts a
 * function name to its address implicitly, so `p = f` and `p = &f` have to
 * produce the same value. Callbacks get most of the attention here because a
 * function pointer you cannot pass to a function has little use.
 *
 * The typedef spelling is here too, because it is what C actually uses for a
 * callback type and it reaches the pointer by a different route: `Op p;` leaves
 * p with a DefinedType naming the alias, so the call has to resolve through it
 * to find the signature at all.
 *
 * The alias also reaches the positions the declarator cannot: a struct or union
 * member, an array element, and a return type all take an ordinary type name,
 * so `Op` works there while `int (*op)(int)` does not. Those are checked here
 * because the difference is easy to lose -- nothing about the pointer changes,
 * only where its type is allowed to be written. Each is called by copying the
 * pointer to a local first, since a callee has to be a bare name. */

int printf(char*, ...);

int addOne(int x) { return x + 1; }
int square(int x) { return x * x; }
int addTwo(int a, int b) { return a + b; }

int apply(int (*fn)(int), int n) { return fn(n); }

typedef int (*Op)(int);
typedef int (*Op2)(int, int);
typedef Op Chained; /* an alias of an alias */

int applyAlias(Op fn, int n) { return fn(n); }

/* The alias in the three positions the declarator cannot reach. */
struct Rec {
  int id;
  Op fn;
};

union Slot {
  Op fn;
  int n;
};

Op pickOp(int which) {
  if (which == 0) {
    return addOne;
  }
  return square;
}

int sumWith(int (*fn)(int), int from, int to) {
  int total = 0;
  int i = from;

  while (i <= to) {
    total = total + fn(i);
    i = i + 1;
  }
  return total;
}

/* At file scope, so the global path is covered too. */
int (*chosen)(int);

int main() {
  int failed = 0;
  int (*p)(int);
  int (*q)(int, int);
  int r;

  /* A bare function name is its address. */
  p = addOne;
  if (p(10) != 11) {
    failed = 1;
  }

  /* &f is the same value, not a pointer to it. */
  p = &square;
  if (p(6) != 36) {
    failed = 1;
  }

  /* More than one parameter. */
  q = addTwo;
  if (q(3, 4) != 7) {
    failed = 1;
  }

  /* The result has the pointer's return type, so it composes. */
  r = p(5) + 1;
  if (r != 26) {
    failed = 1;
  }

  /* As a parameter: the reason the feature is worth having. */
  if (apply(addOne, 41) != 42) {
    failed = 1;
  }
  if (apply(square, 7) != 49) {
    failed = 1;
  }

  /* Called repeatedly from inside a loop. */
  if (sumWith(square, 1, 4) != 30) {
    failed = 1;
  }

  /* File-scope pointer. */
  chosen = addOne;
  if (chosen(99) != 100) {
    failed = 1;
  }

  /* The same pointer aimed at something else. */
  p = addOne;
  if (p(7) != 8) {
    failed = 1;
  }

  /* The typedef spelling, declared and called through the alias. */
  {
    Op viaAlias;
    Op2 twoArgs;
    Chained chain;

    viaAlias = addOne;
    if (viaAlias(10) != 11) {
      failed = 1;
    }

    viaAlias = &square;
    if (viaAlias(6) != 36) {
      failed = 1;
    }

    twoArgs = addTwo;
    if (twoArgs(3, 4) != 7) {
      failed = 1;
    }

    /* An alias of an alias still reaches the signature. */
    chain = square;
    if (chain(9) != 81) {
      failed = 1;
    }

    /* A parameter declared with the alias rather than the declarator. */
    if (applyAlias(addOne, 41) != 42) {
      failed = 1;
    }

    /* The alias names a pointer, so it is pointer-sized. */
    if (sizeof(Op) != 8) {
      failed = 1;
    }
  }

  /* The alias wherever an ordinary type name may go. */
  {
    struct Rec rec;
    union Slot slot;
    Op table[3];
    Op fromMember;
    int i;
    int total;

    /* Struct member, beside an ordinary one so layout is exercised. */
    rec.id = 5;
    rec.fn = square;
    fromMember = rec.fn;
    if (rec.id != 5 || fromMember(7) != 49) {
      failed = 1;
    }

    /* Reassigning the member leaves the neighbour alone. */
    rec.fn = addOne;
    fromMember = rec.fn;
    if (rec.id != 5 || fromMember(7) != 8) {
      failed = 1;
    }

    /* Union member. */
    slot.fn = addOne;
    fromMember = slot.fn;
    if (fromMember(41) != 42) {
      failed = 1;
    }

    /* Array element, called from inside a loop. */
    table[0] = addOne;
    table[1] = square;
    table[2] = addOne;
    total = 0;
    i = 0;
    while (i < 3) {
      fromMember = table[i];
      total = total + fromMember(i + 1);
      i = i + 1;
    }
    if (total != 10) {
      failed = 1;
    }

    /* Return type: the function hands back a pointer chosen at run time. */
    fromMember = pickOp(0);
    if (fromMember(10) != 11) {
      failed = 1;
    }
    fromMember = pickOp(1);
    if (fromMember(10) != 100) {
      failed = 1;
    }
  }

  if (failed == 0) {
    printf("49.func_pointer.c PASS\n");
    return 0;
  }
  printf("49.func_pointer.c FAIL\n");
  return 1;
}
