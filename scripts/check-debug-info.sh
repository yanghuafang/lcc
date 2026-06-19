#!/bin/bash

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
export EXT_PATH="${EXT_PATH:-}"
source "${script_dir}/build-env.sh"

lcc="${script_dir}/../../lcc-build/lcc"
source_file="${script_dir}/../tests/0.hello_world.c"
obj_file="$(mktemp -t 0.hello_world.o)"

cleanup() {
  rm -f "${obj_file}"
}
trap cleanup EXIT

"${lcc}" -g -O0 -i "${source_file}" -o "${obj_file}"

if ! llvm-dwarfdump --name=main "${obj_file}" | grep -q 'DW_TAG_subprogram'; then
  echo "Expected DW_TAG_subprogram for main in ${obj_file}" >&2
  exit 1
fi

echo "Debug info check passed."
