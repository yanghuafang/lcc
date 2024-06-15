#!/bin/bash

# link-tests.sh — link the compiled tests into executables (stage 2 of 3).
#
# Links each object lcc produced against the system libc with clang, which is
# the point: lcc output is ordinary Mach-O, not something a toy VM runs.

set -euo pipefail

source ./tests-compile-link-run.sh

linkAll() {
  for source in "${tests[@]}"
  do
    link $source
  done
}

if [ $# -eq 0 ]; then
  linkAll
else
  link $1
fi