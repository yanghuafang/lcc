/* Block-scope typedef: an alias declared inside a function or a nested block.
 *
 * Only file-scope typedef used to parse. TYPEDEF was not one of the forms a
 * statement could take, so `typedef int MyInt;` inside a function was a syntax
 * error, while the alias table in irgen/SymbolTable was already scoped. The
 * work was in the grammar, not the lowering.
 *
 * What this pins beyond "it parses": an inner alias shadows an outer one of the
 * same name, and the outer meaning returns when the block ends. sizeof is what
 * catches a wrong lookup. A shadowed alias still declares variables correctly
 * by accident, because the initializer is converted to whichever type won, but
 * sizeof reports the type that was actually resolved. */

int printf(char*, ...);

typedef int Alias;

/* Declared outside every inner block, so it can only ever see the file alias.
 */
int outerSize() { return sizeof(Alias); }

int main() {
  int failed = 0;
  Alias outer = 1000;

  if (outer != 1000) {
    failed = 1;
  }
  if (sizeof(Alias) != 4) {
    failed = 1;
  }

  {
    /* Shadows the file-scope Alias for the rest of this block. */
    typedef char Alias;
    Alias narrow = 300; /* char keeps the low byte: 44 */

    if (narrow != 44) {
      failed = 1;
    }
    if (sizeof(Alias) != 1) {
      failed = 1;
    }
  }

  /* The outer meaning is back. */
  if (sizeof(Alias) != 4) {
    failed = 1;
  }
  if (outerSize() != 4) {
    failed = 1;
  }

  {
    typedef int* IntPtr;
    int v = 7;
    IntPtr p = &v;

    if (*p != 7) {
      failed = 1;
    }
    if (sizeof(IntPtr) != 8) {
      failed = 1;
    }
  }

  {
    typedef struct Point {
      int x;
      int y;
    } Point;
    Point pt;

    pt.x = 3;
    pt.y = 4;
    if (pt.x + pt.y != 7) {
      failed = 1;
    }
    if (sizeof(Point) != 8) {
      failed = 1;
    }
  }

  {
    typedef long Wide;
    {
      /* An alias of an alias, one block deeper. */
      typedef Wide Deeper;
      Deeper w = 5;

      if (w != 5) {
        failed = 1;
      }
      if (sizeof(Deeper) != 8) {
        failed = 1;
      }
    }
  }

  if (failed == 0) {
    printf("48.block_typedef.c PASS\n");
    return 0;
  }
  printf("48.block_typedef.c FAIL\n");
  return 1;
}
