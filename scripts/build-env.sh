#!/bin/bash

# build-env.sh — toolchain paths for every other script here.
#
# Sourced, never executed: it exports LLVM_DIR, prepends the LLVM 20 / flex /
# bison directories to PATH, and picks LCC_LINKER. Detects Homebrew on macOS and
# apt layout on Ubuntu, and fails with an actionable message when LLVM 20 is
# missing rather than letting a later script fail obscurely.
#
# LCC_LINKER deliberately prefers the *system* clang/gcc over the LLVM 20 clang
# this script just put on PATH: lcc emits PIC objects that want a stock PIE
# link, and Homebrew's clang mishandles them on macOS.

# Toolchain paths for building and testing lcc. Sourced by other scripts in this
# directory; detects macOS (Homebrew) vs Linux (Ubuntu/Debian apt packages).

lcc_fail_env() {
  echo "$1" >&2
  return 1
}

lcc_detect_linker() {
  # Link with the distro toolchain, not LLVM's clang from PATH (build-env prepends
  # llvm-20/bin). On macOS, Homebrew clang mishandles lcc .o files; on Linux we
  # prefer the system clang/gcc for a stock PIE link of lcc's PIC objects.
  if [[ "$(uname -s)" == Darwin ]] && [[ -x /usr/bin/clang ]]; then
    echo /usr/bin/clang
    return
  fi
  if [[ "$(uname -s)" == Linux ]]; then
    if [[ -x /usr/bin/clang ]]; then
      echo /usr/bin/clang
      return
    fi
    if [[ -x /usr/bin/gcc ]]; then
      echo /usr/bin/gcc
      return
    fi
  fi
  if command -v clang >/dev/null 2>&1; then
    command -v clang
    return
  fi
  if command -v gcc >/dev/null 2>&1; then
    command -v gcc
    return
  fi
  echo clang
}

# A preset LLVM_DIR wins over detection, and the prefix is derived back out of
# it so that PATH follows: llvm-dwarfdump, opt and llc have to come from the
# same install CMake links against, or check-debug-info.sh reads one LLVM while
# lcc was built against another. LLVM_DIR is <prefix>/lib/cmake/llvm, so the
# prefix is three levels up.
LCC_LLVM_DIR_PRESET="${LLVM_DIR:-}"

EXT_PATH="${EXT_PATH:-}"
EXT_CPPFLAGS="${EXT_CPPFLAGS:-}"
EXT_LDFLAGS="${EXT_LDFLAGS:-}"

case "$(uname -s)" in
  Darwin)
    if ! command -v brew >/dev/null 2>&1; then
      lcc_fail_env "Homebrew is required on macOS. See docs/Install.md."
      return 1
    fi
    if [[ -n "${LCC_LLVM_DIR_PRESET}" ]]; then
      LLVM_PREFIX="$(cd "${LCC_LLVM_DIR_PRESET}/../../.." && pwd)"
    else
      LLVM_PREFIX="$(brew --prefix llvm@20 2>/dev/null)" || {
        lcc_fail_env "Install LLVM 20: brew install llvm@20"
        return 1
      }
    fi
    FLEX_DIR="$(brew --prefix flex)"
    BISON_DIR="$(brew --prefix bison)"

    export LLVM_DIR="${LCC_LLVM_DIR_PRESET:-${LLVM_PREFIX}/lib/cmake/llvm}"
    EXT_PATH="${EXT_PATH}:${FLEX_DIR}/bin"
    EXT_PATH="${EXT_PATH}:${BISON_DIR}/bin"
    EXT_PATH="${EXT_PATH}:${LLVM_PREFIX}/bin"

    EXT_CPPFLAGS="${EXT_CPPFLAGS} -I${FLEX_DIR}/include"
    EXT_CPPFLAGS="${EXT_CPPFLAGS} -I${LLVM_PREFIX}/include"
    ;;
  Linux)
    if [[ -n "${LCC_LLVM_DIR_PRESET}" ]]; then
      LLVM_PREFIX="$(cd "${LCC_LLVM_DIR_PRESET}/../../.." && pwd)"
    elif [[ -d /usr/lib/llvm-20/lib/cmake/llvm ]]; then
      LLVM_PREFIX=/usr/lib/llvm-20
    elif command -v llvm-config-20 >/dev/null 2>&1; then
      LLVM_PREFIX="$(llvm-config-20 --prefix)"
    else
      lcc_fail_env "LLVM 20 not found. On Ubuntu 24.04 run: ./install-deps-ubuntu.sh"
      return 1
    fi

    export LLVM_DIR="${LCC_LLVM_DIR_PRESET:-${LLVM_PREFIX}/lib/cmake/llvm}"
    EXT_PATH="${EXT_PATH}:${LLVM_PREFIX}/bin"
    EXT_CPPFLAGS="${EXT_CPPFLAGS} -I${LLVM_PREFIX}/include"
    ;;
  *)
    lcc_fail_env "Unsupported OS: $(uname -s). Supported: macOS and Ubuntu 24.04 LTS."
    return 1
    ;;
esac

export PATH="${EXT_PATH}:${PATH}"
export CPPFLAGS="${EXT_CPPFLAGS} ${CPPFLAGS:-}"

# Do not export LDFLAGS here: CMake caches CMAKE_EXE_LINKER_FLAGS from the
# environment on first configure; lcc links LLVM via CMake targets, not LDFLAGS.

# Link lcc-built .o files with the system toolchain (not necessarily LLVM clang).
export LCC_LINKER="${LCC_LINKER:-$(lcc_detect_linker)}"

# Where every script reads and writes build output. A sibling of the repo by
# default, so the source tree stays clean; overridable because the default is a
# choice about someone else's filesystem, and ten scripts spelled it three
# different ways rather than asking one place. BASH_SOURCE rather than $0,
# since this file is sourced and $0 is the caller's name.
lcc_env_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export LCC_BUILD_DIR="${LCC_BUILD_DIR:-$(cd "${lcc_env_dir}/../.." && pwd)/lcc-build}"
