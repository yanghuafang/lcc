#!/bin/bash

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
    --debug|--release|--relwithdebinfo)
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

if [[ -z "$compile_mode" ]]; then
  compile_mode="--debug"
fi
setCompileMode "$compile_mode" || exit 1

set -e

mkdir -p ../../lcc-build/debug

if [ ${#remaining[@]} -eq 0 ]; then
  compileAll
else
  compile "${remaining[0]}"
fi
