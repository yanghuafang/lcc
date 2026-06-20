#!/bin/bash

set -eo pipefail

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