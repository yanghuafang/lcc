#!/bin/bash

# check-asm-smoke.sh — smoke test for -S assembly emission.
#
# Compiles at -O2 with -S and checks the output is non-empty and contains a
# `main` symbol. Separate from the main suite because -S runs its own codegen
# pipeline over the module, independent of the object path — a break there is
# invisible to a test that only links and runs the .o. compile-tests.sh also
# writes debug/*.s; this is the fast explicit check (CI).

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/build-env.sh"

lcc="${LCC_BUILD_DIR}/lcc"
source="${script_dir}/../tests/12.arithmetic.c"
# mktemp only substitutes XXXXXX at the end of the template: with a
# suffix after it macOS returns the name unchanged, so two runs would
# race on one file. Take a directory and name the files inside it.
work_dir="$(mktemp -d "${TMPDIR:-/tmp}/lcc-asm-smoke-XXXXXX")"
obj="${work_dir}/smoke.o"
asm="${work_dir}/smoke.s"

cleanup() {
  rm -rf "${work_dir}"
}
trap cleanup EXIT

"${lcc}" -O2 -i "${source}" -o "${obj}" -S "${asm}"

if [ ! -s "${asm}" ]; then
  echo "Assembly output is empty: ${asm}" >&2
  exit 1
fi

# macOS: _main; Linux ELF: main (optional leading underscore on some targets).
if ! grep -qE '(^|\.globl[[:space:]]+)(_)?main' "${asm}"; then
  echo "Expected main symbol in ${asm}" >&2
  head -20 "${asm}" >&2
  exit 1
fi

echo "Assembly smoke check passed."
