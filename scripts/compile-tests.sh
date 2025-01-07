#!/bin/bash

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
