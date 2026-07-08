#!/bin/bash

set -euo pipefail

if [[ "$(uname -s)" != Linux ]]; then
  echo "This script installs dependencies on Ubuntu 22.04 / 24.04 LTS." >&2
  exit 1
fi

if [[ -f /etc/os-release ]]; then
  # shellcheck disable=SC1091
  source /etc/os-release
  case "${VERSION_ID:-}" in
    22.04|24.04) ;;
    *)
      echo "Warning: lcc is tested on Ubuntu 22.04 / 24.04 LTS; llvm-14 apt packages may be missing on ${PRETTY_NAME:-this system}." >&2
      ;;
  esac
fi

sudo apt-get update

# llvm-14-dev is required. libargparse-dev only ships on newer Ubuntu (24.04+);
# where it is missing (e.g. 22.04) CMake fetches argparse via FetchContent, so it
# is optional here.
if ! apt-cache show llvm-14-dev >/dev/null 2>&1; then
  echo "Package llvm-14-dev is not available. Use Ubuntu 22.04 / 24.04 LTS." >&2
  exit 1
fi

packages=(
  build-essential
  cmake
  flex
  bison
  graphviz
  clang
  git
  llvm-14
  llvm-14-dev
  llvm-14-tools
)
if apt-cache show libargparse-dev >/dev/null 2>&1; then
  packages+=(libargparse-dev)
else
  echo "libargparse-dev not in apt (expected on Ubuntu 22.04); CMake will fetch argparse via FetchContent." >&2
fi

sudo apt-get install -y "${packages[@]}"

echo "Ubuntu dependencies installed. Build with: ./build-lcc.sh"
