#!/bin/bash

# link-tests.sh — link the objects lcc produced into executables (stage 2 of 3).
#
# Uses the system toolchain rather than LLVM's clang: build-env.sh picks
# LCC_LINKER, because lcc's PIC objects want a stock PIE link. Run
# ./compile-tests.sh first; then ./run-tests.sh.

set -euo pipefail

source ./tests-compile-link-run.sh

linkAll() {
  echo "Linking ${#tests[@]} tests with ${LCC_LINKER}..."
  for source in "${tests[@]}"
  do
    link "$source"
  done
  echo "All tests linked."
}

if [ $# -eq 0 ]; then
  linkAll
else
  link $1
fi