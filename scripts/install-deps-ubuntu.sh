#!/bin/bash

# install-deps-ubuntu.sh — install lcc's build dependencies via apt.
#
# Targets Ubuntu, where llvm-20 and libargparse-dev are in the
# distro archive; on other distributions it warns that those packages may be absent
# rather than adding a third-party apt source.

set -euo pipefail

if [[ "$(uname -s)" != Linux ]]; then
  echo "This script installs dependencies on Ubuntu LTS." >&2
  exit 1
fi

if [[ -f /etc/os-release ]]; then
  # shellcheck disable=SC1091
  source /etc/os-release
  if [[ "${ID:-}" != ubuntu ]]; then
    echo "Warning: this script targets Ubuntu; LLVM apt packages may be missing on ${PRETTY_NAME:-this system}." >&2
  fi
fi

sudo apt-get update

for pkg in llvm-20-dev libargparse-dev clang-format-20 clang-tidy-20; do
  if ! apt-cache show "${pkg}" >/dev/null 2>&1; then
    echo "Package ${pkg} is not available. Use Ubuntu LTS." >&2
    exit 1
  fi
done

sudo apt-get install -y \
  build-essential \
  cmake \
  flex \
  bison \
  graphviz \
  doxygen \
  clang \
  git \
  llvm-20 \
  llvm-20-dev \
  llvm-20-tools \
  clang-format-20 \
  clang-tidy-20 \
  libargparse-dev

echo "Ubuntu dependencies installed. Build with: ./build-lcc.sh"
