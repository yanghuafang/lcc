# Testing

All commands below assume `cd lcc/scripts`.

## Scripts

| Script | Purpose |
|--------|---------|
| `build-env.sh` | Export `PATH`, `LLVM_DIR`, `LCC_LINKER` for macOS (Homebrew) or Ubuntu (apt LLVM 20) |
| `install-deps-ubuntu.sh` | Install apt packages on Ubuntu 24.04 / 26.04 LTS |
| `install-deps-macos.sh` | Install Homebrew packages on macOS |
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

Examples:

```bash
./compile-tests.sh --debug
./compile-tests.sh --release 25.quick_sort.c
```

`compile-tests.sh` always passes `-v` and `-l` so AST (`.dot`, `.png`) and IR land in `lcc/debug/`. The repo keeps reference IR for both modes: `*.debug.ll` and `*.release.ll` (40 tests × 2 modes).

### Debug-info smoke test

```bash
./check-debug-info.sh
```

Validates `DW_TAG_subprogram`, local variables, lexical blocks, and struct debug types via `llvm-dwarfdump`.

## CI

GitHub Actions (`.github/workflows/ci.yml`) runs a matrix on `ubuntu-24.04`, `ubuntu-26.04`, and `macos-latest`: install, build, compile, link, run, and `check-debug-info.sh`. See [Install.md](Install.md) for dependencies.
