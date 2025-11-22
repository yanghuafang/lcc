#!/bin/bash

# Benchmark lcc opt variants on large workloads under benchmarks/.
# Full guide: ../docs/Benchmarks.md
# Reports compile time, post-opt IR instruction count, and runtime.
# CI: ./bench.sh --smoke (correctness only, no timing).
#
# No -mcpu variant: lcc defaults to LLVM's "generic" CPU, so -mcpu generic
# matches the default. For host-specific codegen study, run lcc manually with
# an explicit CPU name (e.g. -mcpu apple-m2, -mcpu skylake).

set -euo pipefail

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=build-env.sh
source "${script_dir}/build-env.sh"

lcc="${LCC_BUILD_DIR}/lcc"
benchmarks_dir="${script_dir}/../benchmarks"
smoke=0
min_runs=10
benchmark_file=""

usage() {
  cat <<'EOF'
Usage: bench.sh [--smoke] [--runs N] [BENCHMARK.c]

Benchmark lcc optimization variants on ../benchmarks/*:
  O0, O2, O2+fold-add-zero

Options:
  --smoke     Compile, link, and run each variant once; skip timing (CI).
  --runs N    Timed runs per variant for compile and runtime (default: 10).
  -h, --help  Show this help.

With no BENCHMARK.c, runs every *.c under ../benchmarks/.
Metrics: compile wall time, post-opt IR instruction count, executable runtime.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --smoke)
      smoke=1
      shift
      ;;
    --runs)
      min_runs="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      benchmark_file="$1"
      shift
      ;;
  esac
done

if [ ! -x "${lcc}" ]; then
  echo "lcc not built: ${lcc} (run ./build-lcc.sh)" >&2
  exit 1
fi

benchmarks=()
if [ -n "${benchmark_file}" ]; then
  benchmarks=("$(basename "${benchmark_file}")")
else
  for path in "${benchmarks_dir}"/*.c; do
    [ -e "${path}" ] || continue
    benchmarks+=("$(basename "${path}")")
  done
fi

if [ "${#benchmarks[@]}" -eq 0 ]; then
  echo "No benchmarks found under ${benchmarks_dir}" >&2
  exit 1
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/lcc-bench-XXXXXX")"
cleanup() {
  rm -rf "${work_dir}"
}
trap cleanup EXIT

# Variants benchmarked for every workload.
variants=(
  "O0|-O0"
  "O2|-O2"
  "O2+fold-add-zero|-O2 -fold-add-zero"
)

count_ir_instructions() {
  local ir="$1"
  if [ ! -s "${ir}" ]; then
    echo "0"
    return
  fi
  grep -cE '^[[:space:]]*(%[0-9]+[[:space:]]*=)?[[:space:]]*(load|store|add|sub|mul|br|call|ret|phi|icmp|sext|trunc|getelementptr|and|or|xor|shl|lshr|ashr|zext|switch|select|fadd|fsub|fmul|fdiv|alloca|bitcast|inttoptr|ptrtoint|extractvalue|insertvalue|shufflevector|extractelement|insertelement)[[:space:]]' \
    "${ir}" || echo "0"
}

compile_variant() {
  local flags="$1"
  local src="$2"
  local obj="$3"
  local post_ir="$4"
  # shellcheck disable=SC2086
  "${lcc}" ${flags} -i "${src}" -o "${obj}" -l-post-opt "${post_ir}" >/dev/null
}

link_variant() {
  local obj="$1"
  local bin="$2"
  # lcc emits PIC objects (Reloc::PIC_), so no -no-pie is needed on Linux.
  "${LCC_LINKER}" "${obj}" -o "${bin}"
}

# Average wall time (seconds) of a command over min_runs via /usr/bin/time -p.
avg_seconds() {
  local total=0
  local i
  for ((i = 0; i < min_runs; i++)); do
    local elapsed
    elapsed="$({ /usr/bin/time -p "$@" >/dev/null; } 2>&1 | awk '/^real/{print $2}')"
    total="$(awk -v a="${total}" -v b="${elapsed}" 'BEGIN{printf "%.3f", a+b}')"
  done
  awk -v t="${total}" -v n="${min_runs}" 'BEGIN{printf "%.3f", t/n}'
}

bench_one() {
  local bench="$1"
  local src="${benchmarks_dir}/${bench}"
  if [ ! -f "${src}" ]; then
    echo "Benchmark not found: ${src}" >&2
    return 1
  fi
  local base
  base="$(basename "${bench}" .c)"

  if [ "${smoke}" -eq 1 ]; then
    echo "Smoke: ${base}"
    for entry in "${variants[@]}"; do
      local name="${entry%%|*}"
      local flags="${entry#*|}"
      local slug="${name// /_}"
      local obj="${work_dir}/${base}_${slug}.o"
      local bin="${work_dir}/${base}_${slug}"
      echo "  ${name} ..."
      compile_variant "${flags}" "${src}" "${obj}" "${work_dir}/${base}_${slug}.post.ll"
      link_variant "${obj}" "${bin}"
      "${bin}" >/dev/null
    done
    return 0
  fi

  echo "=== ${base} ==="
  printf "%-22s %12s %10s %12s\n" "Variant" "compile(s)" "IR insts" "runtime(s)"
  printf "%-22s %12s %10s %12s\n" "----------------------" "------------" "----------" "------------"
  for entry in "${variants[@]}"; do
    local name="${entry%%|*}"
    local flags="${entry#*|}"
    local slug="${name// /_}"
    local obj="${work_dir}/${base}_${slug}.o"
    local post_ir="${work_dir}/${base}_${slug}.post.ll"
    local bin="${work_dir}/${base}_${slug}"

    compile_variant "${flags}" "${src}" "${obj}" "${post_ir}"
    link_variant "${obj}" "${bin}"

    # shellcheck disable=SC2086
    local compile_avg
    compile_avg="$(avg_seconds "${lcc}" ${flags} -i "${src}" -o "${obj}" -l-post-opt "${post_ir}")"
    local ir_count
    ir_count="$(count_ir_instructions "${post_ir}")"
    local runtime_avg
    runtime_avg="$(avg_seconds "${bin}")"
    printf "%-22s %12s %10s %12s\n" "${name}" "${compile_avg}" "${ir_count}" "${runtime_avg}"
  done
  echo
}

if [ "${smoke}" -eq 0 ]; then
  echo "lcc benchmark"
  echo "Host: $(uname -s) $(uname -m)"
  echo
fi

for bench in ${benchmarks[@]+"${benchmarks[@]}"}; do
  bench_one "${bench}"
done

if [ "${smoke}" -eq 1 ]; then
  echo "Benchmark smoke check passed (${#benchmarks[@]} benchmark(s))."
else
  echo "Note: timing is host-dependent; CI does not gate on runtime numbers."
fi
