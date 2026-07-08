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
| [`matrix_mul_tiled_large.c`](../benchmarks/matrix_mul_tiled_large.c) | 128×128 matmul in 32×32 tiles, 40 reps | Cache-blocked variant of `matrix_mul_large.c` (same size/inputs/reps); compare IR size and runtime of blocking vs the naive triple loop |
| [`matrix_mul_huge.c`](../benchmarks/matrix_mul_huge.c) | 512×512 matmul, 4 reps | Cache-**spilling** naive baseline (1 MB/matrix); pairs with the tiled huge version to show blocking's win at scale |
| [`matrix_mul_tiled_huge.c`](../benchmarks/matrix_mul_tiled_huge.c) | 512×512 matmul in 32×32 tiles, 4 reps | Tiled version of `matrix_mul_huge.c` (same size/inputs/reps); ~40% faster at `-O2` here because the matrices exceed cache |
| [`quick_sort_large.c`](../benchmarks/quick_sort_large.c) | 8192 ints, 100 sorts | Irregular control flow, calls in loop — like `tests/25.quick_sort.c` but large enough to time |

**Language notes:** Benchmarks use literal array sizes (no preprocessor). Matrices use flat row-major 1D arrays because lcc has no 2D array parameters. Reduction-style loops are covered by the M14 study fixture [`tests/40.array_sum.c`](../tests/40.array_sum.c), not duplicated here.

**Tiling note:** the tiled kernels block the loops into 32×32 tiles and zero `C` up front (the naive kernel overwrites `C[i][j]`, the blocked one accumulates into it across `kk` tiles); both produce a bit-identical result to their naive counterpart. Blocking only pays off once the working set exceeds cache, so there are **two matched pairs**:

- **128×128** (`matrix_mul_large.c` vs `matrix_mul_tiled_large.c`) — the 192 KB working set is cache-resident, so blocking is roughly **runtime-neutral** and merely adds IR and compile time.
- **512×512** (`matrix_mul_huge.c` vs `matrix_mul_tiled_huge.c`) — the 1 MB matrices **spill cache**, so blocking is markedly faster (~40% at `-O2` on the host below). This is the pair that demonstrates the win.

The 512 pair uses far fewer reps than the 128 pair because each matmul is ~64× heavier.

---

## `bench.sh` modes

| Command | Purpose | Timing? | CI? |
|---------|---------|---------|-----|
| `./bench.sh` | Full table for all `benchmarks/*.c` | Yes (10 runs) | No |
| `./bench.sh --runs N …` | Same, with `N` timed runs | Yes | No |
| `./bench.sh --smoke` | Compile, link, run each variant once | No | **Yes** |

Smoke mode only checks that every variant **builds and runs correctly**; it does not assert performance thresholds. CI runs `./bench.sh --smoke` in [`.github/workflows/ci.yml`](../.github/workflows/ci.yml).

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

### 2026-07-08 — macOS arm64 (Apple M2 Pro), LLVM 20

```text
# Command: cd lcc/scripts && ./bench.sh

lcc benchmark (M15)
Host: Darwin arm64

=== array_add_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.010        116        0.158
O2                            0.020         94        0.088
O2+fold-add-zero              0.020         94        0.088

=== matrix_mul_huge ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.020        183        1.013
O2                            0.020        163        0.450
O2+fold-add-zero              0.023        163        0.451

=== matrix_mul_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.010        183        0.129
O2                            0.039        163        0.060
O2+fold-add-zero              0.037        163        0.060

=== matrix_mul_tiled_huge ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.021        261        0.996
O2                            0.033        203        0.250
O2+fold-add-zero              0.020        203        0.249

=== matrix_mul_tiled_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.030        261        0.149
O2                            0.023        203        0.058
O2+fold-add-zero              0.020        203        0.058

=== quick_sort_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.010        188        0.089
O2                            0.020        115        0.059
O2+fold-add-zero              0.036        115        0.059

Note: timing is host-dependent; CI does not gate on runtime numbers.
```

### 2026-07-08 — Linux x86_64 (Ubuntu 26.04), LLVM 20

```text
# Command: cd lcc/scripts && ./bench.sh

lcc benchmark (M15)
Host: Linux x86_64

=== array_add_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.040        116        0.343
O2                            0.068         94        0.139
O2+fold-add-zero              0.071         94        0.135

=== matrix_mul_huge ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.040        183        2.508
O2                            0.079        163        1.041
O2+fold-add-zero              0.082        163        1.011

=== matrix_mul_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.040        183        0.251
O2                            0.080        163        0.118
O2+fold-add-zero              0.077        163        0.124

=== matrix_mul_tiled_huge ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.040        261        1.596
O2                            0.099        203        0.497
O2+fold-add-zero              0.092        203        0.489

=== matrix_mul_tiled_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.040        261        0.269
O2                            0.095        203        0.112
O2+fold-add-zero              0.092        203        0.103

=== quick_sort_large ===
Variant                  compile(s)   IR insts   runtime(s)
---------------------- ------------ ---------- ------------
O0                            0.040        188        0.163
O2                            0.073        115        0.089
O2+fold-add-zero              0.070        115        0.088

Note: timing is host-dependent; CI does not gate on runtime numbers.
```

**How to read these baselines**

Full-suite `./bench.sh` (default **10 runs**) on both reference hosts. Reps per workload: `array_add_large` 1000, `matrix_mul_large` / `matrix_mul_tiled_large` 40, `matrix_mul_huge` / `matrix_mul_tiled_huge` 4, `quick_sort_large` 100. `IR insts` is host-independent (identical on both hosts).

**O0 → O2 (runtime):**

| Benchmark | macOS O0 → O2 | Linux O0 → O2 |
|-----------|---------------|---------------|
| `array_add_large` | 0.158 → 0.088 s (~44%) | 0.343 → 0.139 s (~59%) |
| `matrix_mul_large` | 0.129 → 0.060 s (~53%) | 0.251 → 0.118 s (~53%) |
| `matrix_mul_huge` | 1.013 → 0.450 s (~56%) | 2.508 → 1.041 s (~58%) |
| `quick_sort_large` | 0.089 → 0.059 s (~34%) | 0.163 → 0.089 s (~45%) |

**Naive vs tiled matmul (the M15 tiling study):**

| Size | naive O2 | tiled O2 | tiled speedup |
|------|----------|----------|---------------|
| 128×128 (cache-resident), macOS | 0.060 | 0.058 | ~neutral |
| 128×128, Linux | 0.118 | 0.112 | ~neutral |
| 512×512 (cache-spilling), macOS | 0.450 | 0.250 | **~44%** |
| 512×512, Linux | 1.041 | 0.497 | **~52%** |

- **Tiling pays off only once the working set exceeds cache.** At 128×128 (192 KB, cache-resident) tiled ≈ naive at `-O2` and is even slightly *slower* at `-O0` (0.149 vs 0.129 s on macOS) from the extra loop nest and `C`-zeroing. At 512×512 (1 MB/matrix, cache-spilling) blocking wins big at `-O2` on both hosts.
- **Host nuance at `-O0`:** the 512 tiling win shows on Linux x86_64 even without opts (2.508 → 1.596 s, ~36%) but is ~neutral on macOS arm64 (1.013 → 0.996 s) — unoptimized codegen overhead masks the locality gain more on the arm64 host.
- **IR insts:** `-O2` lowers post-opt IR on every workload; the tiled kernels carry more IR than their naive twins (183 → 261 at O0, 163 → 203 at O2) from the extra loops and the `C`-zeroing pass. Counts are identical across hosts.
- **O2+fold-add-zero:** matches plain `-O2` in IR and runtime (no `add x, 0` to fold on these workloads); small differences are run-to-run jitter.

---

## Related docs

| Doc | Topic |
|-----|--------|
| [Testing.md](Testing.md) | Unit tests vs benchmarks; other scripts |
| [Pipeline.md](Pipeline.md#benchmark-harness-m15) | M15 in the compiler pipeline context |
| [Usage.md](Usage.md) | `-O0`…`-O3`, `-fold-add-zero`, `-O-passes`, `-mcpu` |
| [MiddleBackendRoadmap.md](MiddleBackendRoadmap.md) | M15 acceptance criteria |
| [LearningPlan.md](LearningPlan.md) | Full M0–M18 path |
