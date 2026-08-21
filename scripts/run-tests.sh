#!/bin/bash

# run-tests.sh — run the linked test executables and report PASS/FAIL (stage 3).
#
# Each test prints "<name> PASS" or "<name> FAIL" and returns 0 or non-zero, so
# this is a pass/fail gate rather than an output comparison. Run
# ./compile-tests.sh and ./link-tests.sh first.

set -euo pipefail

source ./tests-compile-link-run.sh

runAll() {
  for source in "${tests[@]}"
  do
    run "$source"
  done
}

usage() {
  cat <<'EOF'
Usage: run-tests.sh [TEST.c]

Run the test suite built by lcc (stage 3 of 3).

Options:
  -h, --help  Show this help.

With no TEST.c, runs every test. Binaries must exist already: run compile-tests.sh and link-tests.sh first.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [ $# -eq 0 ]; then
  runAll
else
  run $1
fi