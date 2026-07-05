#!/bin/bash

# check-ir-opt.sh — IR optimization regression check (M16).
#
# Recompiles each unit test at -O2 and compares the resulting IR against the
# committed goldens under ../debug/, catching unintended middle-end IR changes
# after compiler edits. See ../docs/Testing.md.
#
# Modes:
#   (default)   count   — compare post-opt IR *instruction counts* against
#                         debug/<test>.release.post.ll. Host-portable (post-opt
#                         IR carries no target metadata); a coarse fast signal.
#   --diff              — full textual diff of fresh post-opt IR against
#                         debug/<test>.release.post.ll. Portable and exact.
#   --release           — full diff of fresh final IR (-l, after object
#                         emission) against debug/<test>.release.ll, ignoring the
#                         host-specific `target datalayout` / `target triple`.
#
# Goldens are produced by ./compile-tests.sh --release and are host-specific
# (they embed the datalayout that shapes struct-heavy IR), so run this on the
# same host that generated them. After an intentional IR change, regenerate the
# goldens and re-run this check.

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=tests-compile-link-run.sh
source "${script_dir}/tests-compile-link-run.sh"

lcc="${script_dir}/../../lcc-build/lcc"
debug_dir="${script_dir}/../debug"
tests_dir="${script_dir}/../tests"

mode="count"
only_test=""

usage() {
  cat <<'EOF'
Usage: check-ir-opt.sh [--diff | --release] [TEST.c]

Compare freshly compiled -O2 IR against committed goldens under debug/ (M16).

Modes:
  (default)   Compare post-opt IR instruction counts vs debug/<t>.release.post.ll.
  --diff      Full diff of post-opt IR vs debug/<t>.release.post.ll (portable).
  --release   Full diff of final IR (-l) vs debug/<t>.release.ll (host triple and
              datalayout lines ignored).

With no TEST.c, checks every test in the suite. After an intentional IR change,
regenerate goldens with ./compile-tests.sh --release, then re-run this check.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --diff)
      mode="diff"
      shift
      ;;
    --release)
      mode="release"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      only_test="$1"
      shift
      ;;
  esac
done

if [ ! -x "${lcc}" ]; then
  echo "lcc not built: ${lcc} (run ./build-lcc.sh)" >&2
  exit 1
fi

selected=()
if [ -n "${only_test}" ]; then
  selected=("$(basename "${only_test}")")
else
  selected=("${tests[@]}")
fi

work_dir="$(mktemp -d "${TMPDIR:-/tmp}/lcc-ir-opt-XXXXXX")"
cleanup() {
  rm -rf "${work_dir}"
}
trap cleanup EXIT

# Count LLVM IR instructions. Instructions are indented (>= 2 spaces); labels,
# globals, `define`/`declare` headers, attribute groups, and metadata sit at
# column 0, and comments start with ';'. The same rule is applied to golden and
# current IR, so a genuine instruction delta always shows up.
count_ir_instructions() {
  local ir="$1"
  [ -s "${ir}" ] || { echo 0; return; }
  grep -cE '^[[:space:]]+[^;[:space:]]' "${ir}" || echo 0
}

# Strip host-specific lines so a --release diff reflects IR, not the build host.
normalize_ll() {
  sed -E '/^target datalayout = /d;/^target triple = /d' "$1"
}

fail=0
checked=0

echo "IR opt regression check (mode: ${mode})"
if [ "${mode}" = "count" ]; then
  printf "%-34s %8s %8s  %s\n" "test" "golden" "current" "status"
fi

for source in "${selected[@]}"; do
  base="${source%.c}"
  src="${tests_dir}/${source}"
  if [ ! -f "${src}" ]; then
    echo "Missing test source: ${src}" >&2
    fail=1
    continue
  fi

  obj="${work_dir}/${base}.o"
  post="${work_dir}/${base}.post.ll"
  final="${work_dir}/${base}.ll"

  if ! "${lcc}" -O2 -i "${src}" -o "${obj}" \
      -l-post-opt "${post}" -l "${final}" >/dev/null 2>"${work_dir}/err"; then
    echo "Failed to compile ${source}:" >&2
    cat "${work_dir}/err" >&2
    fail=1
    continue
  fi

  case "${mode}" in
    count)
      golden="${debug_dir}/${base}.release.post.ll"
      current_count="$(count_ir_instructions "${post}")"
      if [ ! -f "${golden}" ]; then
        printf "%-34s %8s %8s  %s\n" "${base}" "-" "${current_count}" "NO GOLDEN"
        fail=1
        continue
      fi
      golden_count="$(count_ir_instructions "${golden}")"
      checked=$((checked + 1))
      if [ "${golden_count}" = "${current_count}" ]; then
        printf "%-34s %8s %8s  %s\n" "${base}" "${golden_count}" "${current_count}" "ok"
      else
        printf "%-34s %8s %8s  %s\n" "${base}" "${golden_count}" "${current_count}" "CHANGED"
        fail=1
      fi
      ;;
    diff)
      golden="${debug_dir}/${base}.release.post.ll"
      if [ ! -f "${golden}" ]; then
        echo "NO GOLDEN: ${golden}" >&2
        fail=1
        continue
      fi
      checked=$((checked + 1))
      if ! diff -u "${golden}" "${post}" >"${work_dir}/diff"; then
        echo "CHANGED: ${base} (post-opt IR)"
        sed 's/^/  /' "${work_dir}/diff"
        fail=1
      fi
      ;;
    release)
      golden="${debug_dir}/${base}.release.ll"
      if [ ! -f "${golden}" ]; then
        echo "NO GOLDEN: ${golden}" >&2
        fail=1
        continue
      fi
      checked=$((checked + 1))
      if ! diff -u <(normalize_ll "${golden}") <(normalize_ll "${final}") \
          >"${work_dir}/diff"; then
        echo "CHANGED: ${base} (final IR, target lines ignored)"
        sed 's/^/  /' "${work_dir}/diff"
        fail=1
      fi
      ;;
  esac
done

echo
if [ "${fail}" -ne 0 ]; then
  echo "IR opt regression check FAILED — IR differs from committed goldens." >&2
  echo "If the change is intentional, regenerate: ./compile-tests.sh --release" >&2
  exit 1
fi
echo "IR opt regression check passed (${checked} test(s), mode: ${mode})."
