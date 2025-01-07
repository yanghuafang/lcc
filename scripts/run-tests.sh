#!/bin/bash

source ./tests-compile-link-run.sh

runAll() {
  for source in "${tests[@]}"
  do
    run $source
  done
}

if [ $# -eq 0 ]; then
  runAll
else
  run $1
fi