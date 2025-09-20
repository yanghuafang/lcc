#!/bin/bash

# build-lcc.sh — configure and build the lcc compiler.
#
# Wraps CMake so a learner needs one command rather than the right cmake
# invocation. Sources build-env.sh for the LLVM 20 / flex / bison paths, then
# configures into ../../lcc-build (a sibling of the repo, so the source tree
# stays clean) and builds across all cores.
#
# Modes:
#   --debug | --release | --relwithdebinfo   CMAKE_BUILD_TYPE (default Release)
#   --parse                                  also regenerate
#                                            src/generated/Parser.counterexamples,
#                                            bison's explanation of each grammar
#                                            conflict — see docs/ParserConflicts.md
#   --asan                                   build lcc with AddressSanitizer
#   --ubsan                                  build lcc with
#                                            UndefinedBehaviorSanitizer;
#                                            combinable with --asan
#   --werror                                 fail the build on any warning
#
# Override the job count with LCC_BUILD_JOBS=N.

set -euo pipefail

source ./build-env.sh || exit 1

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

cmake -S ../ -B "${LCC_BUILD_DIR}" \
  -DCMAKE_BUILD_TYPE="${build_type}" \
  -DLLVM_DIR="${LLVM_DIR}" \
  -DCMAKE_EXE_LINKER_FLAGS="" \
  -DCMAKE_SHARED_LINKER_FLAGS="" \
  -DCMAKE_MODULE_LINKER_FLAGS=""

# Build across all logical cores (override with LCC_BUILD_JOBS=N ./build-lcc.sh).
if [[ -n "${LCC_BUILD_JOBS:-}" ]]; then
  build_jobs="${LCC_BUILD_JOBS}"
elif command -v nproc >/dev/null 2>&1; then
  build_jobs="$(nproc)"                      # Linux
elif [[ "$(uname -s)" == Darwin ]]; then
  build_jobs="$(sysctl -n hw.logicalcpu)"    # macOS
else
  build_jobs="$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)"
fi

echo "Building lcc with ${build_jobs} parallel jobs..."
cmake --build "${LCC_BUILD_DIR}" --parallel "${build_jobs}"
