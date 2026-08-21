#!/bin/bash

# Smoke test: -machine-stats runs lcc's legacy MachineFunctionPass on final MIR
# (M17). Confirms two things on the host target:
#   1. the pass emits a machine-instruction summary, and
#   2. it is analysis-only — the object is byte-identical with vs without it.
# This is the only CI coverage of TargetBackend's hand-rolled codegen pipeline
# (addEmitPassesWithMachineStats); the default suite never passes -machine-stats.

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/build-env.sh"

lcc="${LCC_BUILD_DIR}/lcc"
source="${script_dir}/../tests/25.quick_sort.c"
with="$(mktemp "${TMPDIR:-/tmp}/lcc-mstats-with-XXXXXX.o")"
without="$(mktemp "${TMPDIR:-/tmp}/lcc-mstats-without-XXXXXX.o")"
stats="$(mktemp "${TMPDIR:-/tmp}/lcc-mstats-XXXXXX.txt")"

cleanup() {
  rm -f "${with}" "${without}" "${stats}"
}
trap cleanup EXIT

# Manual codegen pipeline path (machine pass spliced before the AsmPrinter).
"${lcc}" -O2 -i "${source}" -o "${with}" -machine-stats "${stats}"
# Stock addPassesToEmitFile path.
"${lcc}" -O2 -i "${source}" -o "${without}"

if ! grep -q 'machine_instructions=' "${stats}"; then
  echo "Expected machine-instruction summary in ${stats}" >&2
  cat "${stats}" >&2
  exit 1
fi

if ! cmp -s "${with}" "${without}"; then
  echo "Object differs with vs without -machine-stats; pass must be analysis-only" >&2
  exit 1
fi

echo "Machine-pass smoke check passed."
