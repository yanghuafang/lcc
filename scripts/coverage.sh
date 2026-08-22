#!/bin/bash

# coverage.sh — report how much of lcc's own source the test suite reaches.
#
# Builds an instrumented lcc, runs it over every program the suite registers,
# and prints a per-file line/function/branch report. This measures lcc, not the
# test programs: the question it answers is which of lcc's lines run while it
# compiles tests/*.c.
#
# It compiles rather than links or runs, because that is where lcc's code is.
# link-tests.sh and run-tests.sh hand the work to the system linker and to the
# compiled program, neither of which executes a line of lcc.
#
# Three things the report is expected to show, so they are not mistaken for
# regressions. lcc's own passes (opt/passes/, backend/passes/) sit behind
# -fold-add-zero, -ir-stats and -machine-stats, which the suite never passes,
# so they read 0%. bench.sh and check-machine-pass-smoke.sh reach two of the
# three from CI; nothing passes -ir-stats. opt/IrOptimizer.cpp is low because
# the suite uses -O0 and -O2 only. frontend/Diagnostics.cpp is low because no
# program in tests/ fails to lex or parse.
#
# The build goes in its own directory, so the ordinary lcc build is left alone:
# instrumentation makes lcc several times slower, which is fine here and not
# what you want from the binary the other scripts use.

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"

# Set before sourcing: build-env.sh honors an LCC_BUILD_DIR already in the
# environment, which is what keeps the instrumented binary out of the normal
# build directory.
export LCC_BUILD_DIR="${LCC_COVERAGE_BUILD_DIR:-$(cd "${script_dir}/../.." && pwd)/lcc-build-coverage}"

# shellcheck source=tests-compile-link-run.sh
source "${script_dir}/tests-compile-link-run.sh"

lcc="${LCC_BUILD_DIR}/lcc"
tests_dir="${script_dir}/../tests"
work_dir="${LCC_BUILD_DIR}/coverage"
profile="${work_dir}/lcc.profdata"

usage() {
  cat <<'EOF'
Usage: coverage.sh [--no-build] [--html]

Build an instrumented lcc, compile the whole test suite with it, and report
how much of lcc's own source that reaches.

Options:
  --no-build  Reuse the instrumented binary already in the coverage build
              directory. Fails if there is none.
  --html      Also write a browsable line-by-line report and print its path.
  -h, --help  Show this help.

Environment:
  LCC_COVERAGE_BUILD_DIR  Where to build (default: ../../lcc-build-coverage).

Coverage of src/generated/ is excluded: it is flex and bison output, and its
unreachable-by-construction table entries say nothing about the test suite.
EOF
}

build=true
html=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-build)
      build=false
      shift
      ;;
    --html)
      html=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

for tool in llvm-profdata llvm-cov; do
  if ! command -v "${tool}" >/dev/null 2>&1; then
    echo "${tool} not found. It ships with LLVM; see docs/Install.md." >&2
    exit 1
  fi
done
echo "Using $(command -v llvm-cov)"

if [[ "${build}" == true ]]; then
  "${script_dir}/build-lcc.sh" --debug --coverage
elif [[ ! -x "${lcc}" ]]; then
  echo "No instrumented lcc at ${lcc}. Run without --no-build." >&2
  exit 1
fi

# A stale .profraw from an earlier run would be merged in as if it were part of
# this one, and one from an earlier binary would not merge at all.
rm -rf "${work_dir}"
mkdir -p "${work_dir}/raw" "${work_dir}/artifacts"

# %p keeps the runs apart (lcc is run about a hundred times), %m keeps a
# profile from an older binary from colliding with this one's.
export LLVM_PROFILE_FILE="${work_dir}/raw/lcc-%p-%m.profraw"

# The suite's own compileC2Obj is not reused: it writes into debug/, where the
# committed IR and assembly goldens live, and a coverage run has no business
# rewriting those. This mirrors its flags and sends the artifacts to scratch.
compileForCoverage() {
  local source=$1
  local tag=$2
  shift 2
  local mode_flags=("$@")
  local base
  base="$(basename "${source}" .c)"
  local out="${work_dir}/artifacts/${tag}.${base}"

  local graph_flag=()
  local graph_test
  for graph_test in "${graph_tests[@]}"; do
    if [[ "$(basename "${source}")" == "${graph_test}" ]]; then
      graph_flag=(-v "${out}.dot")
      break
    fi
  done

  # bash 3.2, which macOS still ships, treats "${graph_flag[@]}" on an empty
  # array as an unbound variable under `set -u`. The +expansion is the portable
  # way to say "these elements, if there are any".
  if ! "${lcc}" "${mode_flags[@]}" \
    -i "${source}" -o "${out}.o" \
    -l-pre-opt "${out}.pre.ll" -l-post-opt "${out}.post.ll" -l "${out}.ll" \
    ${graph_flag[@]+"${graph_flag[@]}"} -S "${out}.s" >/dev/null 2>&1; then
    echo "Failed to compile ${source} [${tag}]" >&2
    return 1
  fi
}

runs=0
failed=0
for source in "${tests[@]}"; do
  compileForCoverage "${tests_dir}/${source}" debug -g -O0 || failed=$((failed + 1))
  compileForCoverage "${tests_dir}/${source}" release -O2 || failed=$((failed + 1))
  runs=$((runs + 2))
done

# The graph fixtures assert nothing and are never linked, so they exist only to
# drive -v. They are most of what covers dot/.
for fixture in "${graph_fixtures[@]}"; do
  base="${fixture%.c}"
  if ! "${lcc}" -i "${tests_dir}/graphs/${fixture}" \
    -o "${work_dir}/artifacts/graph.${base}.o" \
    -v "${work_dir}/artifacts/graph.${base}.dot" >/dev/null 2>&1; then
    echo "Failed to compile graph fixture ${fixture}" >&2
    failed=$((failed + 1))
  fi
  runs=$((runs + 1))
done

echo "Ran lcc ${runs} time(s); ${failed} failed."
if [ "${failed}" -ne 0 ]; then
  echo "Coverage below is incomplete — fix the failures first." >&2
fi

llvm-profdata merge -sparse "${work_dir}"/raw/*.profraw -o "${profile}"

ignore='(/generated/|/usr/|^/opt/|^/Applications/)'
echo
llvm-cov report "${lcc}" -instr-profile="${profile}" \
  -ignore-filename-regex="${ignore}"

if [[ "${html}" == true ]]; then
  llvm-cov show "${lcc}" -instr-profile="${profile}" \
    -ignore-filename-regex="${ignore}" \
    -format=html -output-dir="${work_dir}/html" >/dev/null
  echo
  echo "Line-by-line report: ${work_dir}/html/index.html"
fi
