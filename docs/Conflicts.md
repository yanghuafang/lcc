# Parser grammar conflicts in lcc

This document explains the **shift/reduce** and **reduce/reduce** conflicts reported by GNU Bison for `src/Parser.y`. It is written for learners studying how a bottom-up (LALR) C parser is built.

lcc's grammar is intentionally compact: declarations, statements, and expressions share non-terminals in places that a production compiler would often split apart. That simplicity is good for learning, but it produces conflicts. Bison still builds a working parser by applying **default resolution rules**. All conflicts are resolved automatically; none block compilation of the current test suite.

## Quick numbers

| Kind | Count | Bison default |
|------|------:|---------------|
| Shift/reduce | 43 | Prefer **shift** |
| Reduce/reduce | 6 | Prefer the **first** grammar rule |

As of the current grammar, `./build-lcc.sh` (which runs `bison -d Parser.y` via CMake) prints:

```
Parser.y: warning: 43 shift/reduce conflicts [-Wconflicts-sr]
Parser.y: warning: 6 reduce/reduce conflicts [-Wconflicts-rr]
```

## How to inspect conflicts yourself

From the repository root:

```bash
cd src

# Generate Parser.cpp / Parser.hpp and a full state machine report
bison -d Parser.y -v

# Human-readable conflict report (search for "conflicts:")
less Parser.output

# Concrete ambiguous examples (Bison 3.7+)
bison -d Parser.y -Wcounterexamples 2>&1 | less
```

Or use the project build script (same bison invocation as CMake):

```bash
cd scripts
./build-lcc.sh
```

`Parser.output` lists every LR state. Lines like `State 96 conflicts: 4 reduce/reduce` mark states where the parser had to guess. Bracketed actions such as `[reduce using rule 90 (Expr)]` show the action Bison **did not** take by default.

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

You can override defaults with precedence (`%left`, `%right`, `%nonassoc`) or explicit rule precedence (`%prec`). lcc uses both in a few important places.

## Conflict map (high level)

```
43 shift/reduce
├── 40  Expr • [ subscript ]     (subscript vs completed unary/binary operand)
├──  1  _VarType • ;             (TypeDecl vs VarDecl with empty VarList)
├──  1  sizeof ( id • )          (three sizeof productions)
└──  1  if (...) stmt • else     (dangling else — resolved by %nonassoc ELSE)

 6 reduce/reduce
├──  4  IDENTIFIER •             (typedef name as _VarType vs variable as Expr)
└──  2  sizeof ( id • )          (_VarType vs Expr inside sizeof)
```

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

### What Bison does

Default shift/reduce resolution **shifts** `[`, which chooses the correct C reading.

### Where to look in Parser.output

Conflicts appear in many states (e.g. states 99–193) after unary/binary rules. Counterexample pattern:

```
Example: ASTERISK Expr • LBRACKET Expr RBRACKET
  Shift:   * ( Expr [ Expr ] )
  Reduce:  ( * Expr ) [ Expr ]
```

The same pattern repeats for `&`, `+`, `-`, `++`, `--`, `!`, `~`, and every binary operator — one conflict per rule that ends with `Expr •` before `[`.

### Takeaway for learners

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

### lcc's fix

```yacc
%nonassoc ELSE
```

`%nonassoc` on `ELSE` tells Bison: do not reduce a rule that ends with `ELSE` on the stack when the lookahead is also `ELSE`. In practice, on input `... stmt • else`, the parser **shifts** `else` to the nearest open `if`. That is standard C behavior.

### Where to look

- **State 261** in `Parser.output`
- Counterexample:

```
IF ( Expr ) IF ( Expr ) Stmt • ELSE Stmt
  Shift:   inner if takes else
  Reduce:  outer if closes, else would attach outward
```

### Takeaway

This is the most famous parser ambiguity. The fix is a one-line precedence declaration, not a grammar rewrite.

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

### What Bison does

Default: **shift** `;` → `TypeDecl` wins when `_VarType` is immediately followed by `;`.

### Where to look

- **State 23** in `Parser.output`

### Takeaway

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

### What Bison does

Reduce/reduce default: pick **rule 20** (`_VarType: IDENTIFIER`) over **rule 90** (`Expr: IDENTIFIER`) because it appears first in the grammar file.

### Where to look

- **State 96** — four reduce/reduce conflicts on `COMMA`, `SEMICOLON`, `ASTERISK`, `RPARENTHESES`

### Practical impact

This is the **most subtle** conflict group. Industrial compilers often:

- parse typedef names in a separate scope and lexer hack (`TYPENAME` vs `IDENTIFIER`), or
- run a semantic pass that disambiguates.

lcc keeps one token and relies on rule order. The current tests do not expose incorrect parses, but typedef-heavy code in ambiguous positions could mis-parse.

### Takeaway for learners

Reduce/reduce conflicts are **never** resolved by "shift." You must either reorder rules, split non-terminals, or enrich the lexer — otherwise you are silently choosing one meaning.

---

## 5. sizeof(identifier) (1 shift/reduce + 2 reduce/reduce)

### Three rules for one syntax

```yacc
Expr: SIZEOF LPARENTHESES VarType RPARENTHESES    /* sizeof(type) */
    | SIZEOF LPARENTHESES Expr RPARENTHESES       /* sizeof expression */
    | SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES /* sizeof name — dedicated */
    ;
```

For input `sizeof ( foo )`, after `foo •`:

| Candidate | Path |
|-----------|------|
| Rule 101 | `sizeof ( IDENTIFIER )` — shift `)` |
| Rule 99 | `sizeof ( VarType )` with `VarType → _VarType → IDENTIFIER` |
| Rule 100 | `sizeof ( Expr )` with `Expr → IDENTIFIER` |

### What Bison does

- On `)`: **shift** prefers the dedicated `IDENTIFIER` production (rule 101).
- Reduce/reduce on `*` / `)`: **first** matching reduce — `_VarType` path before `Expr`.

### Semantic note

All three actions build an `AST::SizeOf` node in `Parser.y`. The conflict affects **how** the parse tree is shaped, not which AST node type is created for simple `sizeof(foo)` cases.

### Where to look

- **State 155** in `Parser.output`

### Takeaway

Overlapping productions are common when a language allows `sizeof(T)` and `sizeof expr` with similar syntax. A dedicated third rule removes some ambiguity but can introduce new conflicts unless the grammar is unified.

---

## Operator precedence in lcc (context)

Conflicts around `[` are separate from the `%left` / `%right` precedence table, which mainly orders **binary** operators and assignment. The bottom of the table (highest binding strength among listed tokens):

```yacc
%right DADD DSUB NOT BNOT SIZEOF   /* unary */
%left  DOT ARROW                   /* member access — also used as %prec on some rules */
```

Subscript `LBRACKET` is **not** in the precedence table; it is a distinct postfix production (`Expr LBRACKET Expr RBRACKET`). That is why unary/binary-vs-subscript conflicts show up as explicit shift/reduce pairs rather than being silently ordered by `%prec`.

Full table: `src/Parser.y` (comments link to [C operator precedence](https://en.cppreference.com/w/c/language/operator_precedence)).

---

## Are these conflicts acceptable?

For a **learning compiler** with a fixed test suite: **yes**, with caveats.

| Conflict group | Resolved correctly for C? | Risk |
|----------------|---------------------------|------|
| Subscript vs operators | Yes (shift) | Low |
| Dangling else | Yes (`%nonassoc ELSE`) | Low |
| TypeDecl vs empty VarDecl | Shift favors `TypeDecl` | Low — odd forms like `int;` |
| IDENTIFIER type vs expr | First rule wins (`_VarType`) | Medium for typedef-heavy code |
| sizeof overload | Similar AST nodes | Low for current tests |

A conflict-free grammar is possible but usually costs more non-terminals, lexer complexity, or a separate typedef pass — trade-offs lcc deliberately avoids in `Parser.y`.

---

## Suggested exercises

1. **Reproduce** — Run `bison -d Parser.y -v` and find state 261. Read the item set and actions for `ELSE`.

2. **Counterexample** — Run `bison -d Parser.y -Wcounterexamples 2>&1 | rg -A12 "LBRACKET"` and trace one example on paper.

3. **Precedence experiment** — Temporarily remove `%nonassoc ELSE`, rebuild, and observe how the conflict count or parse changes for nested `if` (do not commit the change).

4. **Test ambiguity** — Write a small `.c` file using a typedef name both as a type and as a variable in a function body. Does lcc parse what you expect?

5. **Compare** — Read how `Parser.y` merges `Stmt`, `Expr`, and `Decl` (e.g. `Expr : public Stmt` in the AST). Relate that design choice to state 96.

---

## Further reading

- [Bison manual — Operator Precedence](https://www.gnu.org/software/bison/manual/html_node/Precedence.html)
- [Bison manual — Shift/Reduce](https://www.gnu.org/software/bison/manual/html_node/Shift_002fReduce.html)
- [Bison manual — Reduce/Reduce](https://www.gnu.org/software/bison/manual/html_node/Reduce_002fReduce.html)
- lcc `README.md` — manual bison commands and `Parser.output` generation
- `src/Parser.y` — full grammar and precedence declarations
- `src/Parser.output` — complete LR automaton (regenerate with `bison -d Parser.y -v`)
