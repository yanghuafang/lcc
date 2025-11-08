#!/bin/bash

# tests-compile-link-run.sh — shared definitions for the three test stages.
#
# Not run directly; compile-tests.sh, link-tests.sh, and run-tests.sh each
# source it. Holds the one authoritative list of suite programs plus the
# per-stage helpers, so adding a test means editing the `tests` array here only.
#
# Compile modes (setCompileMode) decide which lcc flags each test gets:
# --debug adds -g, --release adds -O2. The debug/ artifacts are named after the
# mode, which is why the goldens do not collide — see docs/Testing.md.
#
# No `set -euo pipefail` here, unlike every script that runs directly: shell
# options are not scoped to a file, so setting them in something sourced
# changes the caller's shell too. Each of the callers sets its own, and this
# file runs under whichever one sourced it.

script_dir="$(cd "$(dirname "$0")" && pwd)"
source "${script_dir}/build-env.sh" || exit 1

tests=(
  "0.hello_world.c"
  "1.builtin_types.c"
  "2.struct_type.c"
  "3.union_type.c"
  "4.enum_type.c"
  "5.pointer_type.c"
  "6.array_type.c"
  "7.variable_list.c"
  "8.function.c"
  "9.sizeof.c"
  "10.double_pointer_type.c"
  "11.type_cast.c"
  "12.arithmetic.c"
  "13.double_inc_sub.c"
  "14.bitwise.c"
  "15.logic.c"
  "16.ternary.c"
  "17.if_else.c"
  "18.switch_case.c"
  "19.for_loop.c"
  "20.do_while.c"
  "21.continue.c"
  "22.break.c"
  "23.return.c"
  "24.struct_array.c"
  "25.quick_sort.c"
  "26.operator_precedence.c"
  "27.parenthesis_change_precedence.c"
  "28.pointer_move.c"
  "29.struct_pointer_move.c"
  "30.array_mixed_decl.c"
  "31.array_1d_brace_init.c"
  "32.array_1d_inferred_string_init.c"
  "33.array_2d_decl.c"
  "34.array_2d_brace_init.c"
  "35.typedef_builtin.c"
  "36.typedef_struct.c"
  "37.static_file.c"
  "38.static_local.c"
  "39.break_continue_hierarchy.c"
  "41.zero_init_global.c"
)

# lcc flags for test compilation; set via setCompileMode() from compile-tests.sh
# (defaults to --debug when compile-tests.sh is run with no mode flag).
lcc_debug_flags=""
lcc_opt_flags=""
compile_mode=""

setCompileMode() {
  compile_mode="$1"
  case "$1" in
    --debug)
      lcc_debug_flags="-g"
      lcc_opt_flags="-O0"
      ;;
    --release)
      lcc_debug_flags=""
      lcc_opt_flags="-O2"
      ;;
    *)
      echo "Unknown compile mode: $1" >&2
      echo "Expected --debug or --release." >&2
      return 1
      ;;
  esac
}

compileC2Obj() {
  local source=$1
  local obj=$2
  local ir_pre=$3
  local ir_post=$4
  local ir=$5
  local graph=$6
  local asm=$7
  if ! ${LCC_BUILD_DIR}/lcc ${lcc_debug_flags} ${lcc_opt_flags} \
    -i ../tests/${source} -o ${LCC_BUILD_DIR}/${obj} \
    -l-pre-opt ../debug/${ir_pre} -l-post-opt ../debug/${ir_post} \
    -l ../debug/${ir} -v ../debug/${graph} -S ../debug/${asm}; then
    echo "Failed to compile ${source}" >&2
    rm -f ${LCC_BUILD_DIR}/${obj} ../debug/${ir_pre} ../debug/${ir_post} \
      ../debug/${asm}
    return 1
  fi
}

graph2Image() {
  local source=$1
  local graph=${source%.c}.dot
  local image=${source%.c}.png
  dot -T png -o ../debug/${image} ../debug/${graph}
}

compile() {
  local source=$1
  local base=${source%.c}
  local obj=${base}.o
  local mode_suffix=".debug"
  case "$compile_mode" in
    --debug)
      mode_suffix=".debug"
      ;;
    --release)
      mode_suffix=".release"
      ;;
  esac
  local ir_pre="${base}${mode_suffix}.pre.ll"
  local ir_post="${base}${mode_suffix}.post.ll"
  local ir="${base}${mode_suffix}.ll"
  local asm="${base}${mode_suffix}.s"
  local graph=${base}.dot
  compileC2Obj ${source} ${obj} ${ir_pre} ${ir_post} ${ir} ${graph} ${asm}
  graph2Image ${source}
}

# The flag array is empty on macOS, and bash 3.2 counts an empty
# "${arr[@]}" as unbound under `set -u`, so the expansion is guarded.
linkObj2Bin() {
  local obj=$1
  local bin=$2
  local link_flags=()
  if [[ "$(uname -s)" == Linux ]]; then
    # lcc emits non-PIC objects; Ubuntu defaults to PIE executables.
    link_flags=(-no-pie)
  fi
  if ! "${LCC_LINKER}" ${LCC_BUILD_DIR}/${obj} -o ${LCC_BUILD_DIR}/${bin} \
    ${link_flags[@]+"${link_flags[@]}"}; then
    echo "Failed to link ${obj} with ${LCC_LINKER}" >&2
    return 1
  fi
}

link() {
  local source=$1
  local obj=${source%.c}.o
  local bin=${source%.c}
  if ! linkObj2Bin "$obj" "$bin"; then
    echo "Failed while linking ${source}" >&2
    return 1
  fi
}

runBin() {
  ${LCC_BUILD_DIR}/${bin}
}

run() {
  source=$1
  bin=${source%.c}
  runBin $bin
}
