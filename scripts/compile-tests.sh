#!/bin/bash

# compile-tests.sh — compile the test suite with lcc (stage 1 of 3).
#
# Runs lcc over tests/*.c, producing the object files plus the AST graph and IR
# artifacts under debug/. The test list lives in tests-compile-link-run.sh,
# which this sources.
#
# Then run ./link-tests.sh and ./run-tests.sh. Pass a file name to limit the
# run to one test:
#
#   ./compile-tests.sh                 # whole suite
#   ./compile-tests.sh 0.hello_world.c # just one

set -euo pipefail

source ./tests-compile-link-run.sh

compileAll() {
  for source in "${tests[@]}"
  do
    compile $source
  done
}

mkdir -p ../../lcc-build/debug

if [ $# -eq 0 ]; then
  compileAll
else
  compile "$1"
fi
