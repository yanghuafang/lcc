#!/bin/bash

# compile-tests.sh — compile the test suite with lcc (stage 1 of 3).
#
# Runs lcc over tests/*.c, producing the object files plus the AST graph and
# IR artifacts under debug/. The test list and per-mode flags live in
# tests-compile-link-run.sh, which this sources.
#
# Then run ./link-tests.sh and ./run-tests.sh. Pass a file name to limit the
# run to one test:
#
#   ./compile-tests.sh                 # whole suite
#   ./compile-tests.sh 0.hello_world.c # just one
#   ./compile-tests.sh --release       # -O2 instead of -g

set -euo pipefail

source ./tests-compile-link-run.sh

compileAll() {
  for source in "${tests[@]}"
  do
    compile $source
  done
}

compile_mode=""
remaining=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --debug|--release)
      if [[ -n "$compile_mode" ]]; then
        echo "Only one compile mode may be specified." >&2
        exit 1
      fi
      compile_mode="$1"
      shift
      ;;
    *)
      remaining+=("$1")
      shift
      ;;
  esac
done

if [[ -n "$compile_mode" ]]; then
  setCompileMode "$compile_mode" || exit 1
fi

set -e

mkdir -p ../../lcc-build/debug

if [ ${#remaining[@]} -eq 0 ]; then
  compileAll
else
  compile "${remaining[0]}"
fi
