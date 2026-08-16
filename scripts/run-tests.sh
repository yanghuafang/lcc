#!/bin/bash

# run-tests.sh — run the linked test executables and report PASS/FAIL (stage 3).
#
# Each test prints "<name> PASS" or "<name> FAIL" and returns 0 or non-zero, so
# this is a pass/fail gate rather than an output comparison. Run
# ./compile-tests.sh and ./link-tests.sh first.

set -eo pipefail

source ./tests-compile-link-run.sh

runAll() {
  for source in "${tests[@]}"
  do
    run "$source"
  done
}

if [ $# -eq 0 ]; then
  runAll
else
  run $1
fi