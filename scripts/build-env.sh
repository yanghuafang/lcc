#!/bin/bash

# Toolchain paths for building and testing lcc. Sourced by other scripts in this
# directory; detects macOS (Homebrew) vs Linux (Ubuntu/Debian apt packages).

lcc_fail_env() {
  echo "$1" >&2
  return 1
}

lcc_detect_linker() {
  # Link with the distro toolchain, not LLVM's clang from PATH (build-env prepends
  # llvm-20/bin). On macOS, Homebrew clang mishandles lcc .o files; on Linux,
  # LLVM's driver often defaults to lld and rejects non-PIC relocations in PIE
  # links unless objects were built with -fPIC/-fPIE.
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

EXT_PATH="${EXT_PATH:-}"
EXT_CPPFLAGS="${EXT_CPPFLAGS:-}"
EXT_LDFLAGS="${EXT_LDFLAGS:-}"

case "$(uname -s)" in
  Darwin)
    if ! command -v brew >/dev/null 2>&1; then
      lcc_fail_env "Homebrew is required on macOS. See docs/Install.md."
      return 1
    fi
    LLVM_PREFIX="$(brew --prefix llvm@20 2>/dev/null)" || {
      lcc_fail_env "Install LLVM 20: brew install llvm@20"
      return 1
    }
    FLEX_DIR="$(brew --prefix flex)"
    BISON_DIR="$(brew --prefix bison)"

    export LLVM_DIR="${LLVM_PREFIX}/lib/cmake/llvm"
    EXT_PATH="${EXT_PATH}:${FLEX_DIR}/bin"
    EXT_PATH="${EXT_PATH}:${BISON_DIR}/bin"
    EXT_PATH="${EXT_PATH}:${LLVM_PREFIX}/bin"

    EXT_CPPFLAGS="${EXT_CPPFLAGS} -I${FLEX_DIR}/include"
    EXT_CPPFLAGS="${EXT_CPPFLAGS} -I${LLVM_PREFIX}/include"
    ;;
  Linux)
    if [[ -d /usr/lib/llvm-20/lib/cmake/llvm ]]; then
      LLVM_PREFIX=/usr/lib/llvm-20
    elif command -v llvm-config-20 >/dev/null 2>&1; then
      LLVM_PREFIX="$(llvm-config-20 --prefix)"
    else
      lcc_fail_env "LLVM 20 not found. On Ubuntu 24.04 run: ./install-deps-ubuntu.sh"
      return 1
    fi

    export LLVM_DIR="${LLVM_PREFIX}/lib/cmake/llvm"
    EXT_PATH="${EXT_PATH}:${LLVM_PREFIX}/bin"
    EXT_CPPFLAGS="${EXT_CPPFLAGS} -I${LLVM_PREFIX}/include"
    ;;
  *)
    lcc_fail_env "Unsupported OS: $(uname -s). Supported: macOS and Ubuntu 24.04 LTS."
    return 1
    ;;
esac

export PATH="${EXT_PATH}:${PATH}"
export CPPFLAGS="${EXT_CPPFLAGS} ${CPPFLAGS}"

# Do not export LDFLAGS here: CMake caches CMAKE_EXE_LINKER_FLAGS from the
# environment on first configure; lcc links LLVM via CMake targets, not LDFLAGS.

# Link lcc-built .o files with the system toolchain (not necessarily LLVM clang).
export LCC_LINKER="${LCC_LINKER:-$(lcc_detect_linker)}"
