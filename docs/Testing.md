# Testing

All commands below assume `cd lcc/scripts`.

## Scripts

| Script | Purpose |
|--------|---------|
| `build-env.sh` | Export `PATH`, `LLVM_DIR`, `LCC_LINKER` for macOS (Homebrew) or Ubuntu (apt LLVM 20) |
| `install-deps-ubuntu.sh` | Install apt packages on Ubuntu 24.04 LTS |
| `build-lcc.sh` | Configure and build the `lcc` compiler — see [Install.md](Install.md) |
| `compile-tests.sh` | Compile unit tests to `../../lcc-build/*.o`; writes AST/IR under `../debug/` |
| `link-tests.sh` | Link `../../lcc-build/*.o` to executables with `LCC_LINKER` |
| `run-tests.sh` | Run linked test binaries |
| `check-debug-info.sh` | Smoke test: compile with `-g -O0`, verify `llvm-dwarfdump` output |

`tests-compile-link-run.sh` is not run directly; it defines the test list and shared `compile` / `link` / `run` helpers used by the three `*-tests.sh` scripts.

`link-tests.sh` prints progress when linking the full suite:

```text
Linking 40 tests with /usr/bin/clang...
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

### `compile-tests.sh` modes

Optional compile mode (at most one; applies to all tests or the single named test):

| Flag | `lcc` flags | IR suffix |
|------|-------------|-----------|
| *(none)* | `-g -O0` | `.debug.ll` (same as `--debug`) |
| `--debug` | `-g -O0` | `.debug.ll` |
| `--release` | `-O2` | `.release.ll` |
| `--relwithdebinfo` | `-g -O2`¹ | `.relwithdebinfo.ll` |

¹ `-g` disables LLVM optimization in `lcc`; `-O2` is passed but ignored (warning printed). DWARF is still emitted; IR differs from `--debug` mainly in the checked-in snapshot name.

Examples:

```bash
./compile-tests.sh --debug
./compile-tests.sh --release 25.quick_sort.c
./compile-tests.sh --relwithdebinfo
```

`compile-tests.sh` always passes `-v` and `-l` so AST (`.dot`, `.png`) and IR land in `lcc/debug/`. The repo keeps reference IR for all three modes: `*.debug.ll`, `*.release.ll`, and `*.relwithdebinfo.ll` (40 tests × 3 modes).

### Debug-info smoke test

```bash
./check-debug-info.sh
```

Validates `DW_TAG_subprogram`, local variables, lexical blocks, and struct debug types via `llvm-dwarfdump`.

## CI

GitHub Actions (`.github/workflows/linux.yml`) on `ubuntu-24.04` runs install, build, compile, link, run, and `check-debug-info.sh`. See [Install.md](Install.md) for Ubuntu dependencies.
