#!/bin/bash

# install-deps-macos.sh — install lcc's build dependencies via Homebrew.
#
# LLVM 20, flex, bison, argparse, graphviz, doxygen, cmake. Homebrew keeps
# llvm@20 and the newer flex/bison keg-only, which is why build-env.sh adds
# them to PATH explicitly instead of relying on the default one.

set -euo pipefail

if [[ "$(uname -s)" != Darwin ]]; then
  echo "This script installs dependencies on macOS via Homebrew." >&2
  exit 1
fi

# Bootstrap Homebrew if it is not already installed.
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found; installing it from https://brew.sh ..."
  # NONINTERACTIVE so the installer does not block on a RETURN keypress.
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # The installer does not touch the current shell's PATH; add brew for the rest
  # of this script (Apple Silicon = /opt/homebrew, Intel = /usr/local).
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# flex/bison are keg-only on macOS; build-env.sh prepends their Homebrew bins to
# PATH. argparse is optional (CMake FetchContent falls back), but the formula
# exists, so install it to match the CMake find_package path.
brew install flex bison llvm@20 argparse graphviz doxygen cmake

echo "macOS dependencies installed. Build with: ./build-lcc.sh"
