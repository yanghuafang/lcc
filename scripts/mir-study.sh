#!/bin/bash

# Print MIR at key codegen stages for one function (M13 study helper).
# Uses llc from build-env.sh (LLVM 20). No lcc changes required.

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=build-env.sh
source "${script_dir}/build-env.sh"

ir="${1:-${script_dir}/../debug/25.quick_sort.release.post.ll}"
func="${2:-partition}"
head_lines="${MIR_STUDY_HEAD:-40}"

if ! command -v llc >/dev/null 2>&1; then
  echo "llc not found on PATH (source build-env.sh or install LLVM 20)." >&2
  exit 1
fi

if [ ! -f "${ir}" ]; then
  echo "IR file not found: ${ir}" >&2
  echo "Run compile-tests.sh or lcc -l-post-opt first." >&2
  exit 1
fi

dump_stage() {
  local title="$1"
  shift
  echo "=== ${title} (@${func}) ==="
  llc -O2 --filter-print-funcs="${func}" "$@" "${ir}" -o /dev/null 2>&1 | head -n "${head_lines}"
  echo
}

dump_stage "After instruction selection" --print-after-isel
dump_stage "Before greedy register allocator" --print-before=greedy
dump_stage "After greedy register allocator" --print-after=greedy
dump_stage "After prolog/epilog (physical register names)" --print-after=prologepilog

echo "MIR study complete (IR: ${ir}, function: ${func})."
