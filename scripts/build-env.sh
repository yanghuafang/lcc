#!/bin/bash

# build-env.sh — toolchain paths for every other script here.
#
# Sourced, never executed: it exports LLVM_DIR and puts Homebrew's LLVM, flex
# and bison ahead of the versions macOS ships, whose bison is too old for this
# grammar.
#
# No `set -euo pipefail` here, unlike every script that runs directly: shell
# options are not scoped to a file, so setting them in something sourced
# changes the caller's shell too. Each caller sets its own, and this file runs
# under whichever one sourced it — hence the `:-` defaults below.

# A preset LLVM_DIR wins over detection, so a build can point at
# an LLVM that Homebrew did not install.
export LLVM_DIR="${LLVM_DIR:-$(brew --prefix llvm@14)}"
export FLEX_DIR=$(brew --prefix flex)
export BISON_DIR=$(brew --prefix bison)

export EXT_PATH="${EXT_PATH:-}:$FLEX_DIR/bin"
export EXT_PATH="${EXT_PATH:-}:$BISON_DIR/bin"
export EXT_PATH="${EXT_PATH:-}:$LLVM_DIR/bin"
export PATH="${EXT_PATH:-}:$PATH"

export EXT_CPPFLAGS="${EXT_CPPFLAGS:-} -I$FLEX_DIR/include"
export EXT_CPPFLAGS="${EXT_CPPFLAGS:-} -I$LLVM_DIR/include"
export CPPFLAGS="${EXT_CPPFLAGS:-} ${CPPFLAGS:-}"

export EXT_LDFLAGS="${EXT_LDFLAGS:-} -L$FLEX_DIR/lib"
export EXT_LDFLAGS="${EXT_LDFLAGS:-} -L$BISON_DIR/lib"
export EXT_LDFLAGS="${EXT_LDFLAGS:-} -L$LLVM_DIR/lib/c++"
export EXT_LDFLAGS="${EXT_LDFLAGS:-} -Wl,-rpath,$LLVM_DIR/lib/c++"
export EXT_LDFLAGS="${EXT_LDFLAGS:-} -L$LLVM_DIR/lib/unwind -lunwind"
export EXT_LDFLAGS="${EXT_LDFLAGS:-} -L$LLVM_DIR/lib"
export LDFLAGS="${EXT_LDFLAGS:-} ${LDFLAGS:-}"

# Where every script reads and writes build output. A sibling of the repo by
# default, so the source tree stays clean; overridable because the default is a
# choice about someone else's filesystem, and the scripts spelled it three
# different ways rather than asking one place. BASH_SOURCE rather than $0,
# since this file is sourced and $0 is the caller's name.
lcc_env_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export LCC_BUILD_DIR="${LCC_BUILD_DIR:-$(cd "${lcc_env_dir}/../.." && pwd)/lcc-build}"
