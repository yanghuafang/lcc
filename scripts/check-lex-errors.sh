#!/bin/bash

# check-lex-errors.sh — a rejected literal must fail the build.
#
# The lexer recovers from a malformed or out-of-range literal: it reports the
# problem, substitutes 0, and hands the parser a valid token. That recovery is
# deliberate — it lets one run name every bad literal in a file instead of
# stopping at the first — but it means the grammar never learns anything went
# wrong, so yyparse() returns 0 and every stage after it sees a clean parse.
#
# lcc used to emit an object from those substituted values and exit 0, which is
# the worst shape a compiler bug can take: a diagnostic on stderr, a successful
# exit status, and a program that silently computes something else. A build
# script checking exit codes saw nothing at all.
#
# The regression suite cannot cover this. Every file in tests/ is meant to
# compile, so nothing there exercises a front end that reports and continues —
# which is exactly how the bug survived. Hence a check of its own.
#
# Note what this asserts beyond the exit code: that no object file is written.
# Exit 4 with a stale or partial .o on disk would leave a Makefile believing
# the target was up to date.

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/build-env.sh"

lcc="${LCC_BUILD_DIR}/lcc"
work_dir="$(mktemp -d "${TMPDIR:-/tmp}/lcc-lex-errors-XXXXXX")"

cleanup() {
  rm -rf "${work_dir}"
}
trap cleanup EXIT

source_file="${work_dir}/rejected.c"
obj="${work_dir}/rejected.o"

# Three bad literals rather than one, so the count in the summary line is
# checked too. A single one passes whether the driver counts or merely latches
# a flag.
cat >"${source_file}" <<'EOF'
int main() {
  int a = 99999999999999999999999;
  int b = 88888888888888888888888;
  int c = 77777777777777777777777;
  return a + b + c;
}
EOF

# set -e must not abort on the failure this is here to observe.
set +e
output="$("${lcc}" -i "${source_file}" -o "${obj}" 2>&1)"
status=$?
set -e

if [ "${status}" -ne 4 ]; then
  echo "Expected exit 4 for a rejected literal, got ${status}." >&2
  echo "${output}" >&2
  exit 1
fi

if [ -e "${obj}" ]; then
  echo "Object file written despite a rejected literal: ${obj}" >&2
  exit 1
fi

if ! grep -q 'invalid integer literal' <<<"${output}"; then
  echo "Expected the lexer to report the bad literals." >&2
  echo "${output}" >&2
  exit 1
fi

# The three bad literals sit on lines 2, 3 and 4 of the source above, each
# starting at column 11. Asserting the exact positions rather than just the
# shape is what catches a yycolumn that drifts: a prefix of the right form
# pointing at the wrong token reads as correct, and is worse than no position.
for position in 2:11 3:11 4:11; do
  if ! grep -q "${source_file}:${position}: error: invalid integer literal" \
       <<<"${output}"; then
    echo "Expected a diagnostic at ${position} in clang's file:line:column form." >&2
    echo "${output}" >&2
    exit 1
  fi
done

if ! grep -q 'Front end reported 3 error(s)' <<<"${output}"; then
  echo "Expected all three rejected literals to be counted." >&2
  echo "${output}" >&2
  exit 1
fi

# The other half of the contract: a good program is still compiled. A check
# that only proves lcc can fail would pass just as well if it rejected
# everything.
"${lcc}" -i "${script_dir}/../tests/0.hello_world.c" -o "${work_dir}/ok.o" \
  >/dev/null

if [ ! -s "${work_dir}/ok.o" ]; then
  echo "Expected a valid program to still compile." >&2
  exit 1
fi

echo "Lex error check passed."
