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

usage() {
  cat <<'EOF'
Usage: link-tests.sh [TEST.c]

Link the test suite built by lcc (stage 2 of 3).

Options:
  -h, --help  Show this help.

With no TEST.c, links every test. Objects must exist already: run compile-tests.sh first. Then run-tests.sh.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [ $# -eq 0 ]; then
  linkAll
else
  link $1
fi