#!/bin/bash

# check-differential.sh — compile a program with lcc and with the system
# compiler, run both, and compare what they print.
#
# The numbered suite cannot do this. Every program in tests/ checks itself and
# prints PASS or FAIL, so it catches only a value someone already knew was
# wrong. A construct nobody thought to test passes silently, and so does one
# whose expected value was worked out with lcc itself. The programs under
# tests/differential/ assert nothing — they print computed values, and the
# system compiler supplies the answers.
#
# What they print does not matter. Only that both compilers agree on it, which
# is what lets a semantics fix be verified rather than asserted: run this
# before the change and after.
#
# Deliberately not in CI. The divergences it reports are real bugs in lcc, so
# it fails today on purpose; wire it in once it is green.

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=build-env.sh
source "${script_dir}/build-env.sh"

lcc="${LCC_BUILD_DIR}/lcc"
src_dir="${script_dir}/../tests/differential"
# The linker build-env.sh already picked doubles as the reference compiler: it
# is the system toolchain either way. Override for a second opinion.
reference_cc="${LCC_REFERENCE_CC:-${LCC_LINKER}}"

usage() {
  cat <<'EOF'
Usage: check-differential.sh [PROGRAM.c]

Compile each program under ../tests/differential/ with lcc and with the system
compiler, run both, and compare stdout and exit status. Any difference is a
miscompilation in lcc.

Options:
  -h, --help  Show this help.

Environment:
  LCC_REFERENCE_CC  Compiler to compare against (default: $LCC_LINKER).

With no PROGRAM.c, checks every program in the directory.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/lcc-differential-XXXXXX")"
cleanup() {
  rm -rf "${work_dir}"
}
trap cleanup EXIT

checkOne() {
  local source=$1
  local base
  base="$(basename "${source}" .c)"
  local obj="${work_dir}/${base}.o"
  local lcc_bin="${work_dir}/${base}.lcc"
  local ref_bin="${work_dir}/${base}.ref"
  local lcc_out="${work_dir}/${base}.lcc.out"
  local ref_out="${work_dir}/${base}.ref.out"
  local log="${work_dir}/${base}.log"

  if ! "${lcc}" -i "${source}" -o "${obj}" >"${log}" 2>&1; then
    printf '%-22s lcc failed to compile it\n' "${base}"
    sed 's/^/    /' "${log}"
    return 1
  fi
  if ! "${LCC_LINKER}" "${obj}" -o "${lcc_bin}" >"${log}" 2>&1; then
    printf '%-22s lcc object failed to link\n' "${base}"
    sed 's/^/    /' "${log}"
    return 1
  fi
  # -w because every program declares the libc helpers it uses by hand, which
  # the real headers then disagree with. lcc has no preprocessor.
  if ! "${reference_cc}" -w "${source}" -o "${ref_bin}" >"${log}" 2>&1; then
    printf '%-22s reference compiler rejected it\n' "${base}"
    sed 's/^/    /' "${log}"
    return 1
  fi

  local lcc_status=0
  local ref_status=0
  "${lcc_bin}" >"${lcc_out}" 2>&1 || lcc_status=$?
  "${ref_bin}" >"${ref_out}" 2>&1 || ref_status=$?

  if [ "${lcc_status}" -ne "${ref_status}" ]; then
    printf '%-22s DIFFER  exit %s from lcc, %s from %s\n' \
      "${base}" "${lcc_status}" "${ref_status}" "$(basename "${reference_cc}")"
    return 1
  fi
  if ! diff -u --label "reference" "${ref_out}" --label "lcc" "${lcc_out}"; then
    printf '%-22s DIFFER  output above\n' "${base}"
    return 1
  fi

  printf '%-22s agree (%s lines)\n' "${base}" "$(wc -l <"${ref_out}" | tr -d ' ')"
  return 0
}

sources=()
if [ $# -eq 0 ]; then
  for f in "${src_dir}"/*.c; do
    sources+=("${f}")
  done
else
  sources+=("${src_dir}/$1")
fi

diverged=0
for source in "${sources[@]}"; do
  if [ ! -f "${source}" ]; then
    echo "No such program: ${source}" >&2
    exit 1
  fi
  checkOne "${source}" || diverged=$((diverged + 1))
done

echo
if [ "${diverged}" -ne 0 ]; then
  echo "Differential check FAILED — ${diverged} of ${#sources[@]} program(s) diverge from ${reference_cc}."
  exit 1
fi
echo "Differential check passed — ${#sources[@]} program(s) agree with ${reference_cc}."
