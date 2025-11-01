# Testing

All commands below assume `cd lcc/scripts`.

## Scripts

| Script | Purpose |
|--------|---------|
| `build-env.sh` | Export `PATH`, `LLVM_DIR`, `LCC_LINKER` for macOS (Homebrew) or Ubuntu (apt LLVM 20) |
| `install-deps-ubuntu.sh` | Install apt packages on Ubuntu LTS |
| `install-deps-macos.sh` | Install Homebrew packages on macOS |
| `build-lcc.sh` | Configure and build the `lcc` compiler — see [Install.md](Install.md) |
| `compile-tests.sh` | Compile unit tests to `../../lcc-build/*.o`; writes AST/IR/asm under `../debug/` |
| `link-tests.sh` | Link `../../lcc-build/*.o` to executables with `LCC_LINKER` |
| `run-tests.sh` | Run linked test binaries |
| `check-debug-info.sh` | Smoke test: compile with `-g -O0`, verify `llvm-dwarfdump` output |
| `check-asm-smoke.sh` | Smoke test: `-O2 -S` on one test; verify non-empty asm (M18 CI) |
| `check-machine-pass-smoke.sh` | Smoke test: `-machine-stats` emits a summary and leaves the object byte-identical (M17 CI) |
| `check-ir-opt.sh` | IR opt regression: recompile `-O2`, compare IR vs committed `debug/` goldens (M16) |
| `mir-study.sh` | Study helper: print MIR before/after regalloc via `llc` (M13) |
| `bench.sh` | Benchmark `benchmarks/*` (compile time, IR count, runtime); `--smoke` for CI — see [Benchmarks.md](Benchmarks.md) |

`tests-compile-link-run.sh` is not run directly; it defines the test list and shared `compile` / `link` / `run` helpers used by the three `*-tests.sh` scripts.

`link-tests.sh` prints progress when linking the full suite:

```text
Linking the suite with /usr/bin/clang...
All tests linked.
```

## Unit tests

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

### Study fixtures (not in the regression suite)

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

`compile-tests.sh` always passes `-v`, `-l-pre-opt`, `-l-post-opt`, `-l`, and `-S` so AST (`.dot`, `.png`), middle-end IR, final IR, and assembly land in `lcc/debug/`. The repo keeps reference snapshots for both modes (every test × 2 modes × 4 IR/asm types for pre/post/final/asm).

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

Post-opt goldens (`.release.post.ll`) contain no `target datalayout` / `target triple` lines, so the count and `--diff` modes need no filtering. That is only about the header: the IR body is still shaped by the host datalayout. The `--release` diff uses the final IR (with target lines stripped). Any mismatch prints the offending test and exits non-zero:

```text
12.arithmetic                             3        2  CHANGED
IR opt regression check FAILED — IR differs from committed goldens.
If the change is intentional, regenerate: ./compile-tests.sh --release
```

The goldens are host-specific (their datalayout shapes struct-heavy IR), so run this on the same host that generated them. After an **intentional** IR change, regenerate the goldens with `./compile-tests.sh --release` and re-run the check. Not wired into CI for that reason — it is a local pre-commit / pre-PR guard.

### Benchmark smoke test

```bash
./bench.sh --smoke
```

See [Benchmarks.md](Benchmarks.md) for workloads, timed runs, and recording results.

## CI

GitHub Actions (`.github/workflows/build.yml`) runs a matrix on `ubuntu-latest` and `macos-latest`: install, build, compile, link, run, `check-debug-info.sh`, `check-asm-smoke.sh`, `check-machine-pass-smoke.sh`, and `bench.sh --smoke`. See [Install.md](Install.md) for dependencies.

`check-ir-opt.sh` (M16) is **not** in CI: its `debug/` goldens are host-specific, so it is a local pre-commit guard run on the host that generated them.
