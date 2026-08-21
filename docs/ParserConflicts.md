# Parser grammar conflicts in lcc

This document explains the **shift/reduce** and **reduce/reduce** conflicts reported by GNU Bison for `src/frontend/Parser.y`. It is written for learners studying how a bottom-up (LALR) C parser is built.

lcc's grammar is intentionally compact: declarations, statements, and expressions share non-terminals in places that a production compiler would often split apart. That simplicity is good for learning, but it produces conflicts. Bison still builds a working parser by applying **default resolution rules**. All conflicts are resolved automatically; none block compilation of the current test suite.

## Quick numbers

| Kind | Count | Bison default |
|------|------:|---------------|
| Shift/reduce | 48 | Prefer **shift** |
| Reduce/reduce | 6 | Prefer the **first** grammar rule |

As of the current grammar, `./build-lcc.sh` (which runs `bison -d Parser.y -v` via CMake) prints:

```
Parser.y: warning: 48 shift/reduce conflicts [-Wconflicts-sr]
Parser.y: warning: 6 reduce/reduce conflicts [-Wconflicts-rr]
```

State numbers in `Parser.output` **change when the grammar grows** (new rules insert states). Regenerate with `bison -d Parser.y -v` and search for `conflicts:` rather than relying on fixed state IDs from an older report.

## How to inspect conflicts yourself

From the repository root:

```bash
cd src

# Generate Parser.cpp / Parser.hpp and a full state machine report
bison -d frontend/Parser.y -v

# Human-readable conflict report (search for "conflicts:")
less generated/Parser.output

# Concrete ambiguous examples (Bison 3.7+)
bison -d frontend/Parser.y -Wcounterexamples 2>&1 | less
```

Or use the project build script (same bison invocation as CMake):

```bash
cd ../scripts
./build-lcc.sh
```

`Parser.output` lists every LR state. Lines like `State 133 conflicts: 4 reduce/reduce` mark states where the parser had to guess. Bracketed actions such as `[reduce using rule 110 (Expr)]` show the action Bison **did not** take by default.

## Background: what is a conflict?

A **bottom-up** parser reads tokens left to right and repeatedly:

1. **Shifts** — push the next token onto a stack.
2. **Reduces** — replace the top few stack symbols with a non-terminal using a grammar rule.

At some states, more than one action is valid:

- **Shift/reduce** — the parser can either finish a rule (reduce) or read more input (shift). Classic example: dangling `else`.
- **Reduce/reduce** — two different rules could apply to the same stack top. The parser must pick one.

Bison resolves many conflicts without your help:

| Conflict | Default | Typical intent |
|----------|---------|----------------|
| Shift/reduce | **Shift** | "Read more input before closing the construct." |
| Reduce/reduce | **First rule** in the grammar file | Arbitrary but deterministic |

You can override defaults with precedence (`%left`, `%right`, `%nonassoc`) or explicit rule precedence (`%prec`). lcc uses both — though a precedence declaration only bites when **both** the lookahead token and the reducing rule have a precedence, which is exactly the trap described in section 2.

## Conflict map (high level)

```
48 shift/reduce
├── 40  Expr • [ subscript ]     (subscript vs completed unary/binary operand)
├──  3  IDENTIFIER • [           (ArrayBoundList ε vs `[`; FuncDecl `(` vs array declarator)
├──  2  struct/union • IDENTIFIER (typedef name vs closing _VarType)
├──  1  _VarType • ;             (TypeDecl vs VarDecl with empty VarList)
├──  1  sizeof ( id • )          (three sizeof productions — shift on `)`)
└──  1  if (...) stmt • else     (dangling else — resolved by the shift default)

 6 reduce/reduce
├──  4  IDENTIFIER •             (typedef name as _VarType vs variable as Expr)
└──  2  sizeof ( id • )          (_VarType vs Expr inside sizeof)
```

The extra five shift/reduce conflicts (vs an earlier 43-conflict grammar) come from **array bounds** and **typedef struct/union** rules added for 2D arrays and `typedef` support.

The sections below walk through each group.

---

## 1. Subscript vs operators (40 shift/reduce)

### What the grammar says

Subscripting is a postfix operator on expressions:

```yacc
Expr: Expr LBRACKET Expr RBRACKET   /* array[index] */
```

Unary and binary operators also produce `Expr`:

```yacc
Expr: ASTERISK Expr                 /* *ptr */
    | ADD Expr                      /* +x */
    | Expr ADD Expr                 /* a + b */
    /* ... many more binary rules ... */
```

After parsing the left part of an expression, the parser may reach a state summarized as:

```
SomeOperator Expr • LBRACKET Expr RBRACKET
```

The dot (`•`) is the parse position: the subexpression is complete, and the next token is `[`.

### The two choices

| Action | Parse shape | Example `*ptr[i]` |
|--------|-------------|-------------------|
| **Shift** `[` | operator applies to the **subscript result** | `*(ptr[i])` |
| **Reduce** operator first, then subscript | subscript applies to the **operator result** | `(*ptr)[i]` |

### What C requires

In ISO C, postfix `[]` binds **tighter** than unary `*`, `+`, `-`, `!`, `~`, and binary operators. So:

```c
*ptr[i]    /* means *(ptr[i]), not (*ptr)[i] */
```

### What Bison does — subscript

Default shift/reduce resolution **shifts** `[`, which chooses the correct C reading.

### Where to look — subscript states

Conflicts appear in many states after unary/binary rules — for example **states 131–132, 141–146, 202, 205–206, 209–235, 265, and 288** (search for `LBRACKET  [reduce using rule` or `conflicts: 1 shift/reduce` in the file header). Counterexample pattern:

```
Example: ASTERISK Expr • LBRACKET Expr RBRACKET
  Shift:   * ( Expr [ Expr ] )
  Reduce:  ( * Expr ) [ Expr ]
```

The same pattern repeats for `&`, `+`, `-`, `++`, `--`, `!`, `~`, and every binary operator — one conflict per rule that ends with `Expr •` before `[`.

### Takeaway — a benign conflict

Not every shift/reduce conflict is a bug. When the default is **shift**, and that matches language precedence, the conflict is **benign**. You still want to verify with counterexamples and test programs.

---

## 2. Dangling else (1 shift/reduce)

### The problem

Nested `if` without braces creates ambiguity:

```c
if (a)
    if (b)
        stmt1
else
    stmt2
```

Does `else` belong to the inner `if` or the outer `if`?

### lcc's grammar

```yacc
IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt
      | IF LPARENTHESES Expr RPARENTHESES Stmt
      ;
```

After parsing `if (b) stmt1 •`, the parser can:

- **Shift** `ELSE` — start the rule **with** `else` (inner `if` gets it).
- **Reduce** to `IfStmt` without `else` — close the inner `if` and leave `else` for the outer `if`.

### What actually resolves it: the shift default

Bison **shifts**, so `else` attaches to the nearest open `if`. That is standard C behavior — but it is the plain shift/reduce default doing the work, not a precedence declaration.

`Parser.y` does contain the textbook remedy

```yacc
%nonassoc ELSE
```

but **that declaration is inert here.** Understanding why is worth more than the declaration itself.

Precedence resolution compares two precedences: the **lookahead token's** and the **rule's**. A rule gets its precedence from the **last terminal in its right-hand side**, unless overridden with `%prec`. The rule competing for the reduce is rule 94:

```yacc
IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt      /* last terminal: RPARENTHESES */
```

Its last terminal is `RPARENTHESES`, which appears in no `%left` / `%right` / `%nonassoc` line, so **rule 94 has no precedence at all**. With nothing to compare against `ELSE`, Bison cannot apply precedence and falls back to its default: shift.

`%nonassoc ELSE` does give rule 93 (`… Stmt ELSE Stmt`, last terminal `ELSE`) a precedence, but rule 93 is never the reducing rule in a conflict on lookahead `ELSE`, so that has no observable effect either. Consistently, `Parser.output` contains no `error (nonassociative)` action anywhere.

### How Parser.output proves it

Two signals, both visible in state 305:

```
State 305 conflicts: 1 shift/reduce

   93 IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt • ELSE Stmt
   94       | IF LPARENTHESES Expr RPARENTHESES Stmt •

    ELSE  shift, and go to state 312

    ELSE      [reduce using rule 94 (IfStmt)]
```

1. The conflict is **counted** — it is one of the 48 reported by bison. A conflict resolved by precedence is silently resolved and never reported.
2. The discarded reduce is **bracketed** (`[reduce using rule 94 …]`), which is how Bison marks an action dropped by a default resolution.

Delete `%nonassoc ELSE`, rerun bison, and the counts stay at 48/6 with a byte-identical automaton in `Parser.output`. That is the experiment to trust over the comment.

### Where to look — dangling else

- **State 305** in `Parser.output`
- Counterexample:

```
IF ( Expr ) IF ( Expr ) Stmt • ELSE Stmt
  Shift:   inner if takes else
  Reduce:  outer if closes, else would attach outward
```

### Making the resolution explicit (optional)

To resolve this by precedence rather than by default, give the else-less rule a precedence lower than `ELSE` using a dummy token:

```yacc
%nonassoc THEN      /* dummy token, never returned by the lexer */
%nonassoc ELSE      /* declared later ⇒ higher precedence */

IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt
      | IF LPARENTHESES Expr RPARENTHESES Stmt %prec THEN
      ;
```

Now both sides have a precedence, `ELSE` wins, and the conflict disappears from the report: **47** shift/reduce instead of 48, and state 305 loses its bracketed reduce. The parse is unchanged — only the resolution becomes intentional and documented by the grammar itself.

### Takeaway — a "fix" that does nothing is still a lesson

This is the most famous parser ambiguity, and `%nonassoc ELSE` is the most famous cure — copied so often that it is easy to assume it must be doing something. Here it is not. When you rely on precedence, verify it: check that the conflict count actually dropped and that `Parser.output` no longer brackets the losing action.

---

## 3. TypeDecl vs empty VarDecl (1 shift/reduce)

### The rules involved

```yacc
TypeDecl: _VarType SEMICOLON              /* e.g. struct S; */

VarDecl:  VarType VarList SEMICOLON
VarList:  ε                               /* empty — no variables listed */
VarType:  _VarType
```

After `_VarType •` with lookahead `;`:

| Action | Meaning | Example |
|--------|---------|---------|
| **Shift** `;` | `TypeDecl` | `struct Node;` (forward declaration) |
| **Reduce** to `VarType`, then `VarList → ε`, then `VarDecl` | declaration with empty list | `int;` |

Both are syntactically allowed in lcc's grammar.

### What Bison does — TypeDecl

Default: **shift** `;` → `TypeDecl` wins when `_VarType` is immediately followed by `;`.

### Where to look — TypeDecl

- **State 26** in `Parser.output`

### Takeaway — entangled declaration syntax

Declaration syntax in C is notoriously entangled (types, declarators, and specifiers overlap). A teaching grammar often accepts a few odd forms (`int;`) to avoid a much larger parser.

---

## 4. Identifier: type name or expression? (4 reduce/reduce)

### The overlap

The same token `IDENTIFIER` can start two different rules:

```yacc
_VarType: IDENTIFIER          /* typedef / struct tag name → DefinedType */
Expr:     IDENTIFIER          /* variable reference → Variable */
```

After reading a single identifier, the stack shows:

```
IDENTIFIER •
```

With lookahead `;`, `,`, `*`, `)`, etc., both reductions are valid in different derivation trees.

### Example counterexample

```
IDENTIFIER • ;
  First:  Stmt → TypeDecl → _VarType → IDENTIFIER     (type-only line)
  Second: Stmt → Expr SEMICOLON → IDENTIFIER          (expression statement)
```

For `MyType;` at file scope, the first reading is a forward type declaration; the second would treat `MyType` as a variable — very different semantics.

### What Bison does — IDENTIFIER

Reduce/reduce default: pick **rule 29** (`_VarType: IDENTIFIER`) over **rule 110** (`Expr: IDENTIFIER`) because it appears first in the grammar file.

### Where to look — IDENTIFIER

- **State 133** — four reduce/reduce conflicts on `COMMA`, `SEMICOLON`, `ASTERISK`, `RPARENTHESES`

### Practical impact

This is the **most subtle** conflict group. Industrial compilers often:

- parse typedef names in a separate scope and lexer hack (`TYPENAME` vs `IDENTIFIER`), or
- run a semantic pass that disambiguates.

lcc keeps one token and relies on rule order. The 43-test suite avoids the affected shapes, but this is **not** a theoretical risk: because rule 29 wins on lookahead `ASTERISK` and `RPARENTHESES`, a parenthesized expression that begins with a bare identifier followed by `)` or `*` commits to the type reading and fails outright:

```c
r = (a);            /* syntax error, unexpected SEMICOLON  — parsed as a cast */
r = (a * 7) + 1;    /* syntax error, unexpected INTEGER, expecting RPARENTHESES */
```

Both are ordinary integer variables — no typedef required. Any other lookahead after the identifier keeps the `Expr` reading (`(a + 7)`, `(a == 3)`), as does a parenthesis that does not open with a bare identifier (`(7 * a)`, `(*p * 7)`). See [Language.md](Language.md#not-supported-yet) for the user-facing note and workarounds.

### Takeaway — reduce/reduce needs a grammar change

Reduce/reduce conflicts are **never** resolved by "shift." You must either reorder rules, split non-terminals, or enrich the lexer — otherwise you are silently choosing one meaning.

---

## 5. sizeof(identifier) (1 shift/reduce + 2 reduce/reduce)

### Three rules for one syntax

```yacc
Expr: SIZEOF LPARENTHESES VarType RPARENTHESES    /* sizeof(type) — rule 119 */
    | SIZEOF LPARENTHESES Expr RPARENTHESES       /* sizeof expression — rule 120 */
    | SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES /* sizeof name — rule 121 */
    ;
```

For input `sizeof ( foo )`, after `foo •`:

| Candidate | Path |
| ----------- | ------ |
| Rule 121 | `sizeof ( IDENTIFIER )` — shift `)` |
| Rule 119 | `sizeof ( VarType )` with `VarType → _VarType → IDENTIFIER` |
| Rule 120 | `sizeof ( Expr )` with `Expr → IDENTIFIER` |

### What Bison does — sizeof

- On `)`: **shift** prefers the dedicated `IDENTIFIER` production (rule 121).
- Reduce/reduce on `*` / `)`: **first** matching reduce — `_VarType` path before `Expr`.

### Semantic note

All three actions build an `AST::SizeOf` node in `Parser.y`. The conflict affects **how** the parse tree is shaped, not which AST node type is created for simple `sizeof(foo)` cases.

### Where to look — sizeof

- **State 197** in `Parser.output`

### Takeaway — overlapping productions

Overlapping productions are common when a language allows `sizeof(T)` and `sizeof expr` with similar syntax. A dedicated third rule removes some ambiguity but can introduce new conflicts unless the grammar is unified.

---

## 6. Array bounds and typedef struct/union (5 shift/reduce)

These conflicts appeared when lcc gained **array declarators** (`VarInit: IDENTIFIER ArrayBoundList …`) and **typedef struct/union** productions. They are separate from the subscript-vs-operator group in section 1.

### ArrayBoundList ε vs `[` (3 conflicts)

After `IDENTIFIER •`, the parser can:

- **Shift** `[` — start `ArrayBoundList` / array declarator (`int a[10];`, `int a[] = {…};`).
- **Reduce** `ArrayBoundList → ε` — treat the name as a non-array declarator and continue (e.g. function parameter list).

The same position also overlaps **function declarators** when lookahead is `(` vs `[`:

```yacc
FuncDecl: VarType IDENTIFIER LPARENTHESES …
VarInit:  IDENTIFIER ArrayBoundList …
```

Default **shift** on `[` and `(` favors the longer declarator path.

**Where to look:** states **41**, **46**, and **78** in `Parser.output`.

### Struct/union body complete vs typedef alias name (2 conflicts)

After `struct Tag { … } •` or `union Tag { … } •`:

| Action | Meaning |
|--------|---------|
| **Shift** `IDENTIFIER` | Continue `typedef struct Tag { … } Alias;` |
| **Reduce** `_VarType` | Close at `struct Tag { … }` (tag reference only) |

Default **shift** favors the typedef form when an alias name follows.

**Where to look:** states **124** and **125** in `Parser.output`.

### Takeaway — new declarator forms add states

Declaration syntax in C entangles types, declarators, and specifiers. Each new declarator form can add shift/reduce states without changing the older conflict groups.

---

## Operator precedence in lcc (context)

Conflicts around `[` are separate from the `%left` / `%right` precedence table, which mainly orders **binary** operators and assignment. The bottom of the table (highest binding strength among listed tokens):

```yacc
%right DADD DSUB NOT BNOT SIZEOF   /* unary */
%left  DOT ARROW                   /* member access — also used as %prec on some rules */
```

Subscript `LBRACKET` is **not** in the precedence table; it is a distinct postfix production (`Expr LBRACKET Expr RBRACKET`). That is why unary/binary-vs-subscript conflicts show up as explicit shift/reduce pairs rather than being silently ordered by `%prec`.

The grouping and punctuation tokens — `LPARENTHESES`, `RPARENTHESES`, `LBRACKET`, `RBRACKET`, `LBRACE`, `RBRACE`, `SEMICOLON` — are likewise absent from the table. That absence is what makes several rules **precedence-less**, since a rule inherits the precedence of its last terminal: any rule ending in `)` or `;` is invisible to precedence resolution. Section 2 shows the consequence for the dangling else.

`%nonassoc ELSE` sits after `%left DOT ARROW` in `Parser.y`, so `ELSE` is the highest precedence level in the file. That ranking never comes into play — see section 2.

Full table: `src/frontend/Parser.y` (comments link to [C operator precedence](https://en.cppreference.com/w/c/language/operator_precedence)).

---

## Are these conflicts acceptable?

For a **learning compiler** with a fixed test suite: **yes**, with caveats.

| Conflict group | Resolved correctly for C? | Risk |
| ---------------- | --------------------------- | ------ |
| Subscript vs operators | Yes (shift) | Low |
| Dangling else | Yes (shift — `%nonassoc ELSE` is inert) | Low |
| TypeDecl vs empty VarDecl | Shift favors `TypeDecl` | Low — odd forms like `int;` |
| Array bounds / typedef struct | Shift favors declarator continuation | Low for current tests |
| IDENTIFIER type vs expr | First rule wins (`_VarType`) | **Medium** — rejects `(a)` and `(a * x)` for any variable, not just typedefs |
| sizeof overload | Similar AST nodes | Low for current tests |

A conflict-free grammar is possible but usually costs more non-terminals, lexer complexity, or a separate typedef pass — trade-offs lcc deliberately avoids in `Parser.y`.

---

## Suggested exercises

1. **Reproduce** — Run `bison -d Parser.y -v` and find state 305. Read the item set and actions for `ELSE`.

2. **Counterexample** — Run `bison -d Parser.y -Wcounterexamples 2>&1 | rg -A12 "LBRACKET"` and trace one example on paper.

3. **Precedence experiment** — Temporarily remove `%nonassoc ELSE`, rebuild, and diff `Parser.output` against the original: nothing changes, because the declaration is inert (see section 2). Then add the `%prec THEN` marker from that section and watch the shift/reduce count drop from 48 to 47 (do not commit either change).

4. **Test ambiguity** — Write a small `.c` file using a typedef name both as a type and as a variable in a function body. Does lcc parse what you expect?

5. **Compare** — Read how `Parser.y` merges `Stmt`, `Expr`, and `Decl` (e.g. `Expr : public Stmt` in the AST). Relate that design choice to state 133.

---

## Further reading

- [Bison manual — Operator Precedence](https://www.gnu.org/software/bison/manual/html_node/Precedence.html)
- [Bison manual — Shift/Reduce](https://www.gnu.org/software/bison/manual/html_node/Shift_002fReduce.html)
- [Bison manual — Reduce/Reduce](https://www.gnu.org/software/bison/manual/html_node/Reduce_002fReduce.html)
- [Install.md](Install.md) — manual bison commands and `Parser.output` generation
- `src/frontend/Parser.y` — full grammar and precedence declarations
- `src/generated/Parser.output` — complete LR automaton (regenerate with `bison -d Parser.y -v`)
