#!/bin/bash

# build-lcc.sh — configure and build lcc into ../../lcc-build.
#
# Sources build-env.sh first, so the Homebrew flex, bison and LLVM are found
# ahead of the ones macOS ships; the system bison is too old for this grammar.

set -euo pipefail

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

cmake -S ../ -B "${LCC_BUILD_DIR}" -DCMAKE_BUILD_TYPE="${build_type}"

# Build across all logical cores (override with LCC_BUILD_JOBS=N ./build-lcc.sh).
if [[ -n "${LCC_BUILD_JOBS:-}" ]]; then
  build_jobs="${LCC_BUILD_JOBS}"
else
  build_jobs="$(sysctl -n hw.logicalcpu)"
fi

echo "Building lcc with ${build_jobs} parallel jobs..."
cmake --build "${LCC_BUILD_DIR}" --parallel "${build_jobs}"
