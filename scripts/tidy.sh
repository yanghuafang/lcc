#!/bin/bash

# tidy.sh — run clang-tidy over lcc's hand-written sources.
#
# Complements format.sh: clang-format fixes layout, clang-tidy fixes constructs
# (redundant declarations, missing const, std::endl in hot paths, and so on).
# The check list lives in ../.clang-tidy, with the reasoning for what is
# deliberately disabled.
#
# Needs a compile database — CMakeLists.txt sets CMAKE_EXPORT_COMPILE_COMMANDS,
# so ./build-lcc.sh produces ../../lcc-build/compile_commands.json. Run a build
# first if the file is missing.
#
# Modes:
#   (default)   report findings; exit 1 if any
#   --fix       apply clang-tidy's automatic fixes in place, then re-format
#
# Both modes also exit 1 when clang-tidy could not analyze what it was asked to,
# which is a separate condition from "found something". Findings land on stdout,
# so an empty stdout means "clean" and "analyzed nothing" equally, and the
# quieter half of that pair is the one that matters in CI. See the three signals
# checked around the clang-tidy call below.
#
# Usage:
#   ./tidy.sh
#   ./tidy.sh --fix
#   ./tidy.sh ../src/irgen/ExprToIr.cpp   # limit to specific files

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/build-env.sh" || exit 1

repo_root="$(cd "${script_dir}/.." && pwd)"
build_dir="$(cd "${repo_root}/.." && pwd)/lcc-build"

fix=false
files=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --fix)
      fix=true
      shift
      ;;
    -h|--help)
      echo "Usage: $0 [--fix] [file...]" >&2
      exit 0
      ;;
    *)
      files+=("$1")
      shift
      ;;
  esac
done

if ! command -v clang-tidy >/dev/null 2>&1; then
  echo "clang-tidy not found. Install LLVM 20; see docs/Install.md." >&2
  echo "  macOS:  brew install llvm@20        (ships clang-tidy)" >&2
  echo "  Ubuntu: sudo apt install clang-tidy-20" >&2
  exit 1
fi

# Same reasoning as format.sh: check names and diagnostics move between majors,
# so record which binary produced the findings.
echo "Using $(command -v clang-tidy) — $(clang-tidy --version | sed -n '1p')"

if [[ ! -f "${build_dir}/compile_commands.json" ]]; then
  echo "No compile database at ${build_dir}/compile_commands.json." >&2
  echo "Run ./build-lcc.sh first." >&2
  exit 1
fi

# clang-tidy from Homebrew LLVM does not know the macOS SDK location, so the
# standard library headers would not resolve and every file would fail to parse.
extra_args=()
if [[ "$(uname -s)" == Darwin ]]; then
  sdk_path="$(xcrun --show-sdk-path 2>/dev/null)" || sdk_path=""
  if [[ -n "$sdk_path" ]]; then
    extra_args+=("--extra-arg=-isysroot${sdk_path}")
  fi
fi

if [[ ${#files[@]} -eq 0 ]]; then
  while IFS= read -r f; do
    files+=("$f")
  done < <(find "${repo_root}/src" -name '*.cpp' -not -path '*/generated/*' | sort)
fi

# The quietest way for this check to pass while analyzing nothing: a file that
# the compile database does not mention. clang-tidy's response is version- and
# batch-dependent — it may print "Skipping <file>. Compile command not found.",
# or guess a command from a sibling entry, or (observed with LLVM 20 on a
# single-file run) do nothing at all with empty output and exit 0. Only the first
# of those is detectable after the fact, so check membership up front instead.
#
# This is the state the tree is in whenever a source file is added without
# re-running CMake, i.e. exactly when a green check is most misleading.
compile_db="${build_dir}/compile_commands.json"
unanalyzable=()
stale_db=false
for file in "${files[@]}"; do
  if [[ ! -f "$file" ]]; then
    unanalyzable+=("${file} — no such file")
    continue
  fi
  # Compare against the absolute path the database stores. The surrounding
  # quotes keep the match exact, so Foo.cpp cannot match BarFoo.cpp.
  abs_file="$(cd "$(dirname "$file")" && pwd)/$(basename "$file")"
  if ! grep -qF "\"${abs_file}\"" "${compile_db}"; then
    unanalyzable+=("${abs_file} — not in the compile database")
    stale_db=true
  fi
done

if [[ ${#unanalyzable[@]} -gt 0 ]]; then
  echo "clang-tidy cannot analyze ${#unanalyzable[@]} of ${#files[@]} file(s):" >&2
  printf '  %s\n' "${unanalyzable[@]}" >&2
  if [[ "$stale_db" == true ]]; then
    echo "Re-run ./build-lcc.sh to refresh ${compile_db}." >&2
  fi
  exit 1
fi

tidy_args=(-p "${build_dir}" "${extra_args[@]}" --quiet)
if [[ "$fix" == true ]]; then
  tidy_args+=(--fix --fix-errors)
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/lcc-tidy-XXXXXX")"
cleanup() {
  rm -rf "${work_dir}"
}
trap cleanup EXIT

# clang-tidy splits its output across both streams, and the two carry different
# meanings:
#
#   stdout   the findings — one block per diagnostic, empty when there are none
#   stderr   progress ("[1/21] Processing file ...", "N warnings generated.")
#            mixed with the reasons a file could not be checked at all:
#            "Skipping <file>. Compile command not found.", "Error while
#            processing", "unable to handle compilation"
#
# Redirect them to separate files rather than discarding stderr, so a broken run
# is distinguishable from a clean one. Pass/fail then comes from three
# independent signals: findings on stdout, trouble on stderr, and clang-tidy's
# own exit status. Any one of them alone misses cases the other two catch.
echo "Running clang-tidy over ${#files[@]} file(s)..."
clang-tidy "${tidy_args[@]}" "${files[@]}" \
  >"${work_dir}/stdout" 2>"${work_dir}/stderr"
tidy_status=$?

# Findings are expected output in --fix mode (they are what just got fixed), so
# they are tracked separately from the failures that make a run untrustworthy.
findings=0
if [[ -s "${work_dir}/stdout" ]]; then
  cat "${work_dir}/stdout"
  findings=1
fi

broken=0

# Everything on stderr except the known-benign progress and tally lines is worth
# showing; keeping the filter narrow means an unfamiliar message surfaces rather
# than being swallowed the way all of stderr used to be.
grep -vE '^(\[[0-9]+/[0-9]+\] Processing file |[0-9]+ warnings? generated\.|Suppressed [0-9]+ warnings? )' \
  "${work_dir}/stderr" >"${work_dir}/stderr-notable"

if [[ -s "${work_dir}/stderr-notable" ]]; then
  echo "clang-tidy wrote to stderr:" >&2
  cat "${work_dir}/stderr-notable" >&2
fi

if grep -qE 'Compile command not found|Error while processing|Error while trying to load a compilation database|unable to handle compilation' \
     "${work_dir}/stderr"; then
  echo "clang-tidy could not analyze one or more files (see stderr above)." >&2
  broken=1
fi

if [[ "$tidy_status" -ne 0 ]]; then
  echo "clang-tidy exited ${tidy_status}." >&2
  broken=1
fi

if [[ "$fix" == true ]]; then
  # clang-tidy's rewrites do not respect .clang-format line breaking.
  "${script_dir}/format.sh" >/dev/null
  echo "Applied fixes and re-formatted."
  exit "$broken"
fi

if [[ "$findings" -eq 0 && "$broken" -eq 0 ]]; then
  echo "clang-tidy: no findings (${#files[@]} file(s) analyzed)."
fi

if [[ "$findings" -ne 0 || "$broken" -ne 0 ]]; then
  exit 1
fi
exit 0
