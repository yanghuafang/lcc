# Benchmarks

lcc ships a **benchmark harness** and large workloads under [`benchmarks/`](../benchmarks/) so you can measure the effect of middle-end and back-end optimizations on **compile time**, **IR size**, and **runtime**. Benchmarks are separate from the 40-test PASS/FAIL suite in [`tests/`](../tests/): unit tests stay small and deterministic; benchmarks are sized for meaningful timing.

**Milestone:** M15 ([LearningPlan.md](LearningPlan.md)). **Script:** [`scripts/bench.sh`](../scripts/bench.sh).

---

## Quick start

From `lcc/scripts` (after [`build-lcc.sh`](Install.md)):

```bash
# Correctness only — fast, used in CI
./bench.sh --smoke

# Full benchmark: compile time + IR count + runtime (default 10 timed runs)
./bench.sh

# One workload, fewer runs
./bench.sh --runs 5 matrix_mul_large.c
```

---

## What gets measured

For each **benchmark program** × **optimization variant**, `bench.sh` reports:

| Column | Meaning |
|--------|---------|
| `compile(s)` | Wall time to run `lcc` (averaged over `--runs`, default 10) |
| `IR insts` | Post-opt IR instruction count from `-l-post-opt` |
| `runtime(s)` | End-to-end wall time to run the linked executable (includes process launch; same run count) |

Output is one table per benchmark file, one row per optimization variant. Full numbers for the current baseline are in [Results log](#results-log) below.

Re-run on your machine; numbers vary by host, load, and `--runs`.

---

## Optimization variants

| Variant | lcc flags | What it exercises |
|---------|-----------|-------------------|
| O0 | `-O0` | Baseline: minimal IR opts, minimal codegen opts |
| O2 | `-O2` | Full LLVM middle-end + default backend opts |
| O2+fold-add-zero | `-O2 -fold-add-zero` | M7 custom pass before LLVM pipeline |

**No `-mcpu` variant.** lcc defaults to LLVM's `generic` CPU, so `-mcpu generic` produces the same IR and codegen as plain `-O2` — it adds a redundant row without new signal. `bench.sh` therefore stays CPU-agnostic. For host-specific codegen study, run `lcc` manually with an explicit CPU name, e.g. `-mcpu apple-m2` or `-mcpu skylake` (note: lcc passes `-mcpu` straight to LLVM `TargetMachine`, which — unlike **clang** — does not expand `native` to the host CPU on macOS or Ubuntu).

---

## Benchmark programs

Sources live in [`benchmarks/`](../benchmarks/). They are **not** in `compile-tests.sh`. Each program returns `0` on success (no hot-loop printing).

| File | Workload | Why it is here |
|------|----------|----------------|
| [`array_add_large.c`](../benchmarks/array_add_large.c) | 65536 element-wise adds, 1000 reps | Stride-1 loop; candidate for `-O3` / vectorization study ([M14](Pipeline.md#auto-vectorization-study-m14)) |
| [`matrix_mul_large.c`](../benchmarks/matrix_mul_large.c) | 128×128 matmul, 40 reps | Triple-nested loop; strong O0 vs O2 runtime gap on compute-bound workloads |
| [`quick_sort_large.c`](../benchmarks/quick_sort_large.c) | 8192 ints, 100 sorts | Irregular control flow, calls in loop — like `tests/25.quick_sort.c` but large enough to time |

**Language notes:** Benchmarks use literal array sizes (no preprocessor). Matrices use flat row-major 1D arrays because lcc has no 2D array parameters. Reduction-style loops are covered by the M14 study fixture [`tests/40.array_sum.c`](../tests/40.array_sum.c), not duplicated here.

---

## `bench.sh` modes

| Command | Purpose | Timing? | CI? |
|---------|---------|---------|-----|
| `./bench.sh` | Full table for all `benchmarks/*.c` | Yes (10 runs) | No |
| `./bench.sh --runs N …` | Same, with `N` timed runs | Yes | No |
| `./bench.sh --smoke` | Compile, link, run each variant once | No | **Yes** |

Smoke mode only checks that every variant **builds and runs correctly**; it does not assert performance thresholds. CI runs `./bench.sh --smoke` in [`.github/workflows/linux.yml`](../.github/workflows/linux.yml).

---

## Adding benchmarks or variants

When you add optimizations (custom passes, new `-O-passes` presets, backend tuning):

1. **Add a workload** under `benchmarks/` if existing programs do not stress the new behavior (follow the same style: self-check, no `#define`, no `(expr) % n` on RHS — see [Language.md](Language.md)).
2. **Extend `bench.sh`** `variants=(…)` if you want a new flag combination in the default table.
3. **Record results** in this doc (see [Results log](#results-log) below) or in commit/PR notes so GitHub readers can see before/after trends.

Suggested workload types for future opts:

| Optimization target | Example benchmark idea |
|---------------------|-------------------------|
| Loop vectorization | Larger stride-1 loop, compare `-O2` vs `-O3` |
| Custom IR pass (M7-style) | Program with many `add x, 0`-style patterns |
| `-O-passes` preset (M8) | Same program, compare preset vs full `-O2` |
| Backend / `-mcpu` | Compute-bound kernel with explicit `-mcpu` in a new variant |

---

## Results log

Dated `./bench.sh` runs for comparing milestones and PRs. Append newer entries at the bottom.

### 2026-07-03 — macOS arm64 (Apple M2 Pro), LLVM 20

```text
# Command: cd lcc/scripts && ./bench.sh

lcc benchmark (M15)
Host: Darwin arm64

=== array_add_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.010        116        0.157
O2                            0.018         94        0.082
O2+fold-add-zero              0.019         94        0.083

=== matrix_mul_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.021        183        0.124
O2                            0.041        163        0.054
O2+fold-add-zero              0.020        163        0.052

=== quick_sort_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.042        188        0.084
O2                            0.020        115        0.076
O2+fold-add-zero              0.020        115        0.060
```

**How to read this baseline**

Workloads at commit time: `array_add_large` **1000 reps**, `matrix_mul_large` **40 reps**, `quick_sort_large` **100 sorts**. Each `runtime(s)` value is the mean of **10** `./bench.sh` runs (default `--runs`).

| Benchmark | Reps | O0 runtime | O2 runtime | O0→O2 |
|-----------|------|------------|------------|-------|
| `array_add_large` | 1000 | 0.157 s | 0.082 s | ~48% |
| `matrix_mul_large` | 40 | 0.124 s | 0.054 s | ~56% |
| `quick_sort_large` | 100 | 0.084 s | 0.076 s | ~10% |

- **IR insts:** `-O2` lowers post-opt IR vs `-O0` on every workload (e.g. `quick_sort_large` 188 → 115; `matrix_mul_large` 183 → 163).
- **Runtime:** O0 per-run times are 84–157 ms — well above launch noise. Largest gap is **`matrix_mul_large`** (~56%); `quick_sort_large` shows the smallest (~10%, call-heavy recursion).
- **O2+fold-add-zero:** IR matches plain `-O2` (no `add x, 0` to fold on these workloads); runtime matches O2 within noise (the lower `quick_sort_large` value is run-to-run jitter, not a real speedup).

### 2026-07-03 — Linux x86_64 (Ubuntu 26.04), LLVM 20

```text
# Command: cd lcc/scripts && ./bench.sh

lcc benchmark (M15)
Host: Linux x86_64

=== array_add_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.010        116        0.153
O2                            0.010         94        0.040
O2+fold-add-zero              0.011         94        0.040

=== matrix_mul_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.010        183        0.090
O2                            0.020        163        0.030
O2+fold-add-zero              0.020        163        0.030

=== quick_sort_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.009        188        0.050
O2                            0.011        115        0.020
O2+fold-add-zero              0.015        115        0.020
```

**How to read this baseline**

Same workloads and `--runs 10` as the macOS entry above.

| Benchmark | Reps | O0 runtime | O2 runtime | O0→O2 |
|-----------|------|------------|------------|-------|
| `array_add_large` | 1000 | 0.153 s | 0.040 s | ~74% |
| `matrix_mul_large` | 40 | 0.090 s | 0.030 s | ~67% |
| `quick_sort_large` | 100 | 0.050 s | 0.020 s | ~60% |

- **IR insts:** Same post-opt counts as macOS arm64 — IR metrics are host-independent.
- **Runtime:** Faster CPU than M2 Pro; O0 times are 50–153 ms, O2 times 20–40 ms. All three workloads show strong O0→O2 gaps; largest is **`array_add_large`** (~74%, likely auto-vectorized at `-O2` on x86).
- **O2+fold-add-zero:** IR matches plain `-O2`; runtime within noise on this host.

---

## Related docs

| Doc | Topic |
|-----|--------|
| [Testing.md](Testing.md) | Unit tests vs benchmarks; other scripts |
| [Pipeline.md](Pipeline.md#benchmark-harness-m15) | M15 in the compiler pipeline context |
| [Usage.md](Usage.md) | `-O0`…`-O3`, `-fold-add-zero`, `-O-passes`, `-mcpu` |
| [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md) | M15 acceptance criteria |
| [LearningPlan.md](LearningPlan.md) | Full M0–M18 path |
