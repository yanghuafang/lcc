#!/bin/bash

source ./build-env.sh

build_type="Release"
build_mode=""
parse_counterexamples=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --debug)
      if [[ -n "$build_mode" ]]; then
        echo "Only one build mode may be specified." >&2
        exit 1
      fi
      build_mode="$1"
      build_type="Debug"
      shift
      ;;
    --release)
      if [[ -n "$build_mode" ]]; then
        echo "Only one build mode may be specified." >&2
        exit 1
      fi
      build_mode="$1"
      build_type="Release"
      shift
      ;;
    --relwithdebinfo)
      if [[ -n "$build_mode" ]]; then
        echo "Only one build mode may be specified." >&2
        exit 1
      fi
      build_mode="$1"
      build_type="RelWithDebInfo"
      shift
      ;;
    --parse)
      parse_counterexamples=true
      shift
      ;;
    *)
      echo "Unknown option: $1" >&2
      echo "Usage: $0 [--debug|--release|--relwithdebinfo] [--parse]" >&2
      exit 1
      ;;
  esac
done

if [[ "$parse_counterexamples" == true ]]; then
  cd ../src
  bison -d Parser.y -v -Wcounterexamples &> Parser.counterexamples
  cd ../scripts
fi

cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE="${build_type}"
cmake --build ../../lcc-build
