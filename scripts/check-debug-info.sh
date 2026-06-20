#!/bin/bash

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
export EXT_PATH="${EXT_PATH:-}"
source "${script_dir}/build-env.sh"

lcc="${script_dir}/../../lcc-build/lcc"
hello_source="${script_dir}/../tests/0.hello_world.c"
struct_source="${script_dir}/../tests/2.struct_type.c"
hello_obj="$(mktemp "${TMPDIR:-/tmp}/lcc-check-hello-XXXXXX")"
struct_obj="$(mktemp "${TMPDIR:-/tmp}/lcc-check-struct-XXXXXX")"

cleanup() {
  rm -f "${hello_obj}" "${struct_obj}"
}
trap cleanup EXIT

"${lcc}" -g -O0 -i "${hello_source}" -o "${hello_obj}"

if ! llvm-dwarfdump --name=main "${hello_obj}" | grep -q 'DW_TAG_subprogram'; then
  echo "Expected DW_TAG_subprogram for main in ${hello_obj}" >&2
  exit 1
fi

if ! llvm-dwarfdump --name=err "${hello_obj}" | grep -q 'DW_TAG_variable'; then
  echo "Expected DW_TAG_variable for err in ${hello_obj}" >&2
  exit 1
fi

line_count=$(llvm-dwarfdump --debug-line "${hello_obj}" | awk '/^0x[0-9a-f]+/ { print $2 }' | sort -u | wc -l | tr -d ' ')
if [ "${line_count}" -lt 2 ]; then
  echo "Expected multiple source lines in debug info for ${hello_obj}, got ${line_count} unique lines" >&2
  exit 1
fi

lex_source="$(mktemp "${TMPDIR:-/tmp}/lcc-check-lex-src-XXXXXX")"
lex_obj="$(mktemp "${TMPDIR:-/tmp}/lcc-check-lex-obj-XXXXXX")"
cat > "${lex_source}" <<'EOF'
int main() {
  int err = 0;
  {
    int inner = 1;
    err = inner;
  }
  return err;
}
EOF

"${lcc}" -g -O0 -i "${lex_source}" -o "${lex_obj}"

if ! llvm-dwarfdump "${lex_obj}" | grep -q 'DW_TAG_lexical_block'; then
  echo "Expected DW_TAG_lexical_block in ${lex_obj}" >&2
  exit 1
fi

rm -f "${lex_source}" "${lex_obj}"

"${lcc}" -g -O0 -i "${struct_source}" -o "${struct_obj}"

if ! llvm-dwarfdump --name=Employee "${struct_obj}" | grep -q 'DW_TAG_structure_type'; then
  echo "Expected DW_TAG_structure_type for Employee in ${struct_obj}" >&2
  exit 1
fi

if ! llvm-dwarfdump --name=id "${struct_obj}" | grep -q 'DW_TAG_member'; then
  echo "Expected DW_TAG_member for struct field id in ${struct_obj}" >&2
  exit 1
fi

echo "Debug info check passed."
