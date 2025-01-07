#!/bin/bash

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