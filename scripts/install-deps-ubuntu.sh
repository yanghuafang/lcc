#!/bin/bash

set -euo pipefail

if [[ "$(uname -s)" != Linux ]]; then
  echo "This script installs dependencies on Ubuntu 24.04 / 26.04 LTS." >&2
  exit 1
fi

if [[ -f /etc/os-release ]]; then
  # shellcheck disable=SC1091
  source /etc/os-release
  case "${VERSION_ID:-}" in
    24.04|26.04) ;;
    *)
      echo "Warning: lcc is tested on Ubuntu 24.04 / 26.04 LTS; llvm-20 apt packages may be missing on ${PRETTY_NAME:-this system}." >&2
      ;;
  esac
fi

sudo apt-get update

for pkg in llvm-20-dev libargparse-dev; do
  if ! apt-cache show "${pkg}" >/dev/null 2>&1; then
    echo "Package ${pkg} is not available. Use Ubuntu 24.04 LTS." >&2
    exit 1
  fi
done

sudo apt-get install -y \
  build-essential \
  cmake \
  flex \
  bison \
  graphviz \
  clang \
  git \
  llvm-20 \
  llvm-20-dev \
  llvm-20-tools \
  libargparse-dev

echo "Ubuntu dependencies installed. Build with: ./build-lcc.sh"
