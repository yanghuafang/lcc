#!/bin/bash

# docs.sh — generate lcc's API documentation with Doxygen.
#
# Reads ../docs/Doxyfile, which documents only what carries a /// comment: the
# public headers under src/. Output lands in ../../lcc-build/docs/html, beside
# the build tree rather than inside the repo, for the same reason object files
# do.
#
# Pass/fail comes from the warning log, not the exit status. Doxygen exits 0
# after complaining about an unresolved \param or a broken reference, so a
# green run means nothing on its own -- this is the same reasoning behind
# tidy.sh checking clang-tidy's stdout separately from its exit code.
#
# Usage:
#   ./docs.sh
#   ./docs.sh --open      # also open the generated index in a browser

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
# Honors LCC_BUILD_DIR without sourcing build-env.sh, which this script
# deliberately does not need: doxygen and dot are the only tools here, and
# requiring LLVM 20 to build documentation would be a worse trade.
docs_dir="${LCC_BUILD_DIR:-$(cd "${repo_root}/.." && pwd)/lcc-build}/docs"

open_after=false
if [[ "${1:-}" == "--open" ]]; then
  open_after=true
fi

if ! command -v doxygen >/dev/null 2>&1; then
  echo "doxygen not found. See docs/Install.md." >&2
  echo "  macOS:  brew install doxygen" >&2
  echo "  Ubuntu: sudo apt install doxygen" >&2
  exit 1
fi

# HAVE_DOT is on, so a missing dot would silently drop every diagram.
if ! command -v dot >/dev/null 2>&1; then
  echo "graphviz's dot not found; the Doxyfile sets HAVE_DOT=YES." >&2
  echo "  macOS:  brew install graphviz" >&2
  echo "  Ubuntu: sudo apt install graphviz" >&2
  exit 1
fi

# Same reasoning as format.sh and tidy.sh: record which binary produced the
# output, because Doxygen's warnings move between releases.
echo "Using $(command -v doxygen) — Doxygen $(doxygen --version)"

# WARN_LOGFILE is opened before Doxygen creates OUTPUT_DIRECTORY.
mkdir -p "${docs_dir}"
log="${docs_dir}/doxygen-warnings.log"
rm -f "${log}"

# Doxygen writes into html/ without clearing it, so a page that stops being
# generated stays on disk and keeps being served locally. The directory pair
# pages showed why that bites: their file names carry directory indices, which
# shift whenever a source file is added, so a tree holding seven of them
# accumulated thirty-four across one afternoon of rebuilds. CI is unaffected --
# a fresh runner starts empty -- which is exactly why the local site has to be
# cleared to match what CI publishes. Only html/ goes: the warning log above
# lives beside it and is written before Doxygen runs.
rm -rf "${docs_dir}/html"

# Paths in the Doxyfile are repo-relative, so run from there.
cd "${repo_root}"

# The Doxyfile names its own output directory, which is right for anyone
# running `doxygen docs/Doxyfile` by hand. Appending the two keys on stdin
# lets LCC_BUILD_DIR win here without the Doxyfile depending on it being set:
# doxygen reads a config from "-", and a later assignment overrides an earlier
# one.
{
  cat docs/Doxyfile
  echo "OUTPUT_DIRECTORY = ${docs_dir}"
  echo "WARN_LOGFILE = ${log}"
} | doxygen -

if [[ -s "${log}" ]]; then
  echo "Doxygen reported problems:" >&2
  cat "${log}" >&2
  exit 1
fi

echo "Documentation written to ${docs_dir}/html/index.html"

if [[ "${open_after}" == true ]]; then
  if command -v open >/dev/null 2>&1; then
    open "${docs_dir}/html/index.html"
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "${docs_dir}/html/index.html"
  fi
fi
