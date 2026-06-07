# Testing

All commands below assume `cd lcc/scripts`.

## Scripts

| Script | Purpose |
|--------|---------|
| `build-env.sh` | Export `PATH`, `LLVM_DIR`, `LCC_LINKER` for macOS (Homebrew) or Ubuntu (apt LLVM 20) |
| `install-deps-ubuntu.sh` | Install apt packages on Ubuntu LTS |
| `install-deps-macos.sh` | Install Homebrew packages on macOS |
| `build-lcc.sh` | Configure and build the `lcc` compiler — see [Install.md](Install.md) |
| `compile-tests.sh` | Compile the test programs to `../../lcc-build/*.o`; writes AST/IR/asm under `../debug/` |
| `link-tests.sh` | Link `../../lcc-build/*.o` to executables with `LCC_LINKER` |
| `run-tests.sh` | Run linked test binaries |
| `check-lex-errors.sh` | Smoke test: a literal the lexer rejects exits 4 and writes no object |
| `check-debug-info.sh` | Smoke test: compile with `-g -O0`, verify `llvm-dwarfdump` output |
| `check-asm-smoke.sh` | Smoke test: `-O2 -S` on one test; verify non-empty asm (M18 CI) |
| `check-machine-pass-smoke.sh` | Smoke test: `-machine-stats` emits a summary and leaves the object byte-identical (M17 CI) |
| `check-ir-opt.sh` | IR opt regression: recompile `-O2`, compare IR vs committed `debug/` goldens (M16) |
| `check-differential.sh` | Compile `tests/differential/*` with lcc and the system compiler, run both, compare output |
| `coverage.sh` | Build an instrumented `lcc`, compile the suite with it, report which of `lcc`'s own lines that reaches |
| `mir-study.sh` | Study helper: print MIR before/after regalloc via `llc` (M13) |
| `bench.sh` | Benchmark `benchmarks/*` (compile time, IR count, runtime); `--smoke` for CI — see [Benchmarks.md](Benchmarks.md) |
| `format.sh` | `clang-format` plus trailing-whitespace strip; `--check` reports without writing |
| `tidy.sh` | `clang-tidy` against the curated list in `.clang-tidy`; `--fix` applies what it can |

`format.sh` and `tidy.sh` are style gates rather than tests, but CI runs both, so run them before pushing. Both skip `src/generated/` — flex and bison rewrite it on every configure, so formatting it produces thousands of lines of phantom diff.

`tests-compile-link-run.sh` is not run directly; it defines the test list and shared `compile` / `link` / `run` helpers used by the three `*-tests.sh` scripts.

`link-tests.sh` prints progress when linking the full suite:

```text
Linking N tests with /usr/bin/clang...
All tests linked.
```

## Regression suite

Typical full run:

```bash
./compile-tests.sh
./link-tests.sh
./run-tests.sh
```

Single test:

```bash
./compile-tests.sh 0.hello_world.c
./link-tests.sh 0.hello_world.c
./run-tests.sh 0.hello_world.c
```

Each test prints `PASS` or `FAIL` on stdout. Scripts exit non-zero on the first compile, link, or run failure.

### Study fixtures (not in the suite)

| File | Purpose |
|------|---------|
| `tests/40.array_sum.c` | M14 vectorization study — compile manually with `-O3`; see [LlvmTools.md](LlvmTools.md#auto-vectorization-study-m14) |

### `compile-tests.sh` modes

Optional compile mode (at most one; applies to all tests or the single named test):

| Flag | `lcc` flags | IR / asm artifacts (under `debug/`) |
|------|-------------|-------------------------------------|
| *(none)* | `-g -O0` | same as `--debug` |
| `--debug` | `-g -O0` | `*.debug.pre.ll`, `*.debug.post.ll`, `*.debug.ll`, `*.debug.s` |
| `--release` | `-O2` | `*.release.pre.ll`, `*.release.post.ll`, `*.release.ll`, `*.release.s` |

| Suffix | When captured | Contents |
|--------|---------------|----------|
| `.pre.ll` | After codegen, before `IrOptimizer` | Raw frontend IR |
| `.post.ll` | After `IrOptimizer` and debug finalization (`-g`) | Middle-end IR (no target metadata) |
| `.debug.ll` / `.release.ll` | After object emission (`-l`) | Final IR with `target triple` / `datalayout` |
| `.debug.s` / `.release.s` | After object emission (`-S`) | Machine assembly |

Examples:

```bash
./compile-tests.sh --debug
./compile-tests.sh --release 25.quick_sort.c
```

`compile-tests.sh` always passes `-l-pre-opt`, `-l-post-opt`, `-l`, and `-S`, so middle-end IR, final IR, and assembly land in `lcc/debug/`. The repo keeps reference snapshots for both modes: every test × 2 modes × 4 IR/asm types, for pre/post/final/asm.

### AST graphs

`-v` is **not** passed for the suite. A suite program is mostly assertions, and that scaffolding dominates its AST: `15.logic.c` came to 818 nodes, roughly 700 of them `if (x != y) err = 1;`, against about 100 for the nine logic operators the file exists to demonstrate. The graphs were 29 MB of PNG in which the construct was the hard part to find.

Graphs come from `tests/graphs/` instead — six assertion-free fixtures, one per language area, rendered into `debug/graphs/`:

| Fixture | Covers |
| --------- | -------- |
| `types.c` | builtin scalars, pointer, array, struct, union, enum, typedef |
| `expressions.c` | every operator, plus cast, `sizeof`, ternary, comma |
| `statements.c` | if/else, switch, all three loops, break/continue/return |
| `functions.c` | prototype, definition, `void` params, variadic, static, call |
| `arrays.c` | 1D/2D, explicit and inferred bounds, brace and string init |
| `structs.c` | `.` and `->`, struct arrays, unions |

They are compiled but never linked or run, since they assert nothing — behaviour is the numbered suite's job. Add a fixture by dropping a `.c` in `tests/graphs/` and adding its name to `graph_fixtures` in `tests-compile-link-run.sh`.

`0.hello_world.c` is the one suite program that still gets a graph: at 50 nodes it is already fixture-sized, and `README.md` embeds `debug/0.hello_world.png`.

### Lex error smoke test

```bash
./check-lex-errors.sh
```

Two shapes of one contract. First, a file holding three out-of-range integer literals: `lcc` must exit **4** and write no object. Then a file holding three bytes no lexer rule matches, with the same two assertions plus a third — that `lcc` wrote nothing to stdout. Before the catch-all rule existed, flex's default one echoed the stray byte there and carried on, so the program compiled, exited 0, and the byte came back mixed into lcc's own output.

The regression suite cannot cover this, which is how the bug it guards survived: every file in `tests/` is meant to compile, so nothing there exercises a front end that reports an error and keeps going. The lexer does exactly that — it reports a malformed or out-of-range literal, substitutes `0`, and hands the parser a valid token, so `yyparse()` returns 0 and every later stage sees a clean parse. `lcc` used to emit an object from the substituted values and exit 0.

Three literals rather than one, because a single one would pass whether the driver counts errors or merely latches a flag; the check asserts the summary line reports all three. It also compiles `0.hello_world.c` afterwards, so a build that rejected everything could not pass.

### Debug-info smoke test

```bash
./check-debug-info.sh
```

Validates `DW_TAG_subprogram`, local variables, lexical blocks, and struct debug types via `llvm-dwarfdump`.

### Assembly smoke test

```bash
./check-asm-smoke.sh
```

Compiles `12.arithmetic.c` with `-O2 -S` and checks that assembly is non-empty and defines `main`. CI runs this after the full suite and `check-debug-info.sh`.

### Machine pass smoke test

```bash
./check-machine-pass-smoke.sh
```

Compiles `25.quick_sort.c` with `-machine-stats` and checks that (1) the legacy `MachineFunctionPass` emits a `machine_instructions=` summary, and (2) the object is **byte-identical** with vs without the flag (the pass is analysis-only). This is the only CI coverage of `TargetBackend`'s hand-rolled codegen pipeline (`addEmitPassesWithMachineStats`), since the regular suite never passes `-machine-stats`. Machine-instruction counts are host-specific, so the check asserts the summary exists rather than an exact number.

### IR optimization regression check (M16)

Catches unintended middle-end IR changes after a compiler edit. It recompiles every test at `-O2` into a temp directory and compares the result against the committed goldens under `debug/`.

```bash
./check-ir-opt.sh            # count mode (default)
./check-ir-opt.sh --diff     # full diff of post-opt IR
./check-ir-opt.sh --release  # full diff of final IR (target lines ignored)
./check-ir-opt.sh --diff 25.quick_sort.c   # single test
```

| Mode | Golden | Compares |
|------|--------|----------|
| *(default)* count | `debug/<t>.release.post.ll` | Post-opt IR **instruction count** (coarse, fast) |
| `--diff` | `debug/<t>.release.post.ll` | Full textual diff of post-opt IR (exact) |
| `--release` | `debug/<t>.release.ll` | Full diff of final IR, ignoring `target datalayout` / `target triple` |

Post-opt goldens (`.release.post.ll`) contain no `target datalayout` / `target triple` lines, so the count and `--diff` modes need no filtering; the `--release` mode strips those lines from the final IR instead. This is only about the header lines — the IR body is still shaped by the host datalayout. Any mismatch prints the offending test and exits non-zero:

```text
12.arithmetic                             3        2  CHANGED
IR opt regression check FAILED — IR differs from committed goldens.
If the change is intentional, regenerate: ./compile-tests.sh --release
```

The goldens are host-specific (their datalayout shapes struct-heavy IR), so run this on the same host that generated them. After an **intentional** IR change, regenerate the goldens with `./compile-tests.sh --release` and re-run the check. Not wired into CI for that reason — it is a local pre-commit / pre-PR guard.

The final-IR goldens (`*.debug.ll`, `*.release.ll`) embed the full host triple, including the OS patch version (`arm64-apple-darwin25.6.0`). An OS point upgrade therefore makes `compile-tests.sh` rewrite every one of them, in both modes, with nothing but a triple change — review such diffs before committing. `check-ir-opt.sh` is unaffected: its default and `--diff` modes read `.post.ll`, which has no target lines, and `--release` strips them.

### Benchmark smoke test

```bash
./bench.sh --smoke
```

See [Benchmarks.md](Benchmarks.md) for workloads, timed runs, and recording results.

### Differential check

```bash
./check-differential.sh                 # every program
./check-differential.sh shifts.c        # one of them
```

Compiles each program under `tests/differential/` twice — once with `lcc`, once
with the system compiler — runs both, and compares stdout and exit status. Any
difference is a miscompilation in `lcc`.

The numbered suite cannot cover this ground. Every program in `tests/` checks
itself and prints `PASS` or `FAIL`, which catches only a value someone already
knew was wrong: a construct nobody thought to test passes silently, and so does
one whose expected value was worked out with `lcc` itself. The programs here
assert nothing. They print computed values, and the system compiler supplies
the answers — so a semantics fix can be verified rather than asserted by
running the check before the change and after.

| Program | Covers |
| --------- | -------- |
| `baseline.c` | A control: semantics `lcc` already gets right, so it must always agree |
| `conversions.c` | Integer conversions across signedness and width |
| `shifts.c` | `<<` and `>>` with mixed operand types |
| `usual_conversions.c` | The usual arithmetic conversions on mixed signed/unsigned pairs |
| `switch_order.c` | `case` and `default` label order |

`baseline.c` is what tells a broken harness apart from a real divergence: if it
ever reports a difference, the reference compiler or the capture is at fault,
not the operand types its neighbours are testing.

Set `LCC_REFERENCE_CC` to compare against something other than `LCC_LINKER`.

All five programs agreed once the conversion, shift and `switch` lowering were
fixed — the check reported four diverging programs when it was written and
reports none now — so it runs in CI on every platform in the matrix.

The reference compile passes `-fsigned-char`. Plain `char` is signed or
unsigned by platform, and `lcc` has made its choice: `char` is signed
everywhere, and the supported subset has no `signed char` to say so with. The
current runners happen to agree, but on a host where they did not, `char c =
-1` widened to `unsigned long` would come back `255` from the reference and
`ULONG_MAX` from `lcc` — an ABI difference that reads exactly like a
miscompilation.

### Coverage

```bash
./coverage.sh             # build instrumented, run the suite, print the report
./coverage.sh --html      # also write a line-by-line report
./coverage.sh --no-build  # reuse the instrumented binary from a previous run
```

Builds `lcc` with `-fprofile-instr-generate -fcoverage-mapping` into its own
directory, compiles every registered test in both modes plus the graph
fixtures, then reports with `llvm-cov`. It measures **`lcc`'s own source**, not
the test programs — the question is which of `lcc`'s lines run while it
compiles `tests/*.c`.

Only the compile stage is instrumented, because that is where `lcc`'s code is.
`link-tests.sh` hands the work to the system linker and `run-tests.sh` to the
compiled program; neither executes a line of `lcc`.

No percentage is recorded here, deliberately. It moves with every test and
every source file added, nothing enforces it, and a stale figure in a document
is worse than no figure. Run the script for the current number. What is worth
writing down is the part that does not drift — the code the suite cannot reach
by construction:

| Not reached by the suite | Why |
| -------------------------- | ----- |
| `opt/passes/IrInstructionStatsPass.cpp` | Needs `-ir-stats`, which **no script passes** |
| `opt/passes/FoldAddZeroPass.cpp` | Needs `-fold-add-zero`; `bench.sh` passes it, the suite does not |
| `backend/passes/MachineInstrStatsPass.cpp` | Needs `-machine-stats`; `check-machine-pass-smoke.sh` passes it |
| Most of `opt/IrOptimizer.cpp` | The suite compiles at `-O0` and `-O2` only, never `-O1`, `-Os`, `-Oz`, or `-O-passes` |
| Most of `frontend/Diagnostics.cpp` | No program in `tests/` fails to lex or parse |
| The `--target` / `-mcpu` / `-mattr` paths in `backend/TargetBackend.cpp` | The suite never retargets |

The first three are the ones worth noting: `lcc`'s own passes are the milestone
work, and the numbered suite runs none of them. Two are covered from CI by the
smoke scripts above. `IrInstructionStatsPass` is covered by nothing.

`src/generated/` is left out of the report — flex and bison tables have
unreachable-by-construction states that say nothing about the test suite.

`.github/workflows/analysis.yml` runs it as a report, not a gate: there is no
threshold to enforce, and the instrumented build is a second full build of
`lcc`, so it stands apart from the workflow that gates a change.

## CI

GitHub Actions runs one workflow per gate. `.github/workflows/build.yml` is the matrix on `ubuntu-latest` and `macos-latest`: install, build, compile, link, run, `check-differential.sh`, `check-lex-errors.sh`, `check-debug-info.sh`, `check-asm-smoke.sh`, `check-machine-pass-smoke.sh`, and `bench.sh --smoke`. `.github/workflows/lint.yml` runs `format.sh --check` and `tidy.sh`, and `.github/workflows/docs.yml` runs `docs.sh`. `.github/workflows/sanitizer.yml` builds `lcc` under ASan and UBSan on both platforms and compiles the suite in both modes with the instrumented binary. `.github/workflows/analysis.yml` reports coverage. See [Install.md](Install.md) for dependencies.

`format.sh --check` is a job of its own rather than a step in the build, so a formatting slip fails in seconds rather than after a full LLVM link. `tidy.sh` needs the compile database a build produces, so its job builds `lcc` again. It and `docs.sh` run on `ubuntu-latest` only — their findings are host-independent, so a second and third copy would add cost without signal.

`check-ir-opt.sh` (M16) is **not** in CI: its `debug/` goldens are host-specific, so it is a local pre-commit guard run on the host that generated them.
