#!/bin/bash

# build-lcc.sh — configure and build lcc into ../../lcc-build.
#
# Sources build-env.sh first, so the Homebrew flex, bison and LLVM are found
# ahead of the ones macOS ships; the system bison is too old for this grammar.

set -euo pipefail

source ./build-env.sh
# cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Debug
cmake -S ../ -B "${LCC_BUILD_DIR}" -DCMAKE_BUILD_TYPE=Release

# Build across all logical cores (override with LCC_BUILD_JOBS=N ./build-lcc.sh).
if [[ -n "${LCC_BUILD_JOBS:-}" ]]; then
  build_jobs="${LCC_BUILD_JOBS}"
else
  build_jobs="$(sysctl -n hw.logicalcpu)"
fi

echo "Building lcc with ${build_jobs} parallel jobs..."
cmake --build "${LCC_BUILD_DIR}" --parallel "${build_jobs}"
