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

## CI

GitHub Actions (`.github/workflows/build.yml`) runs a matrix on `ubuntu-latest` and `macos-latest`: install, build, compile, link, run, `check-debug-info.sh`, and `check-asm-smoke.sh`. See [Install.md](Install.md) for dependencies.
