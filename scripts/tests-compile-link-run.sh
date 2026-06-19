#!/bin/bash

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
)

# lcc flags for test compilation; set via setCompileMode() from compile-tests.sh.
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
    --relwithdebinfo)
      lcc_debug_flags="-g"
      lcc_opt_flags="-O2"
      ;;
    *)
      echo "Unknown compile mode: $1" >&2
      echo "Expected --debug, --release, or --relwithdebinfo." >&2
      return 1
      ;;
  esac
}

compileC2Obj() {
  local source=$1
  local obj=$2
  local ir=$3
  local graph=$4
  if ! ../../lcc-build/lcc ${lcc_debug_flags} ${lcc_opt_flags} \
    -i ../tests/${source} -o ../../lcc-build/${obj} \
    -l ../debug/${ir} -v ../debug/${graph}; then
    echo "Failed to compile ${source}" >&2
    rm -f ../../lcc-build/${obj}
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
  local ir_suffix=".ll"
  case "$compile_mode" in
    --debug)
      ir_suffix=".debug.ll"
      ;;
    --release)
      ir_suffix=".release.ll"
      ;;
    --relwithdebinfo)
      ir_suffix=".relwithdebinfo.ll"
      ;;
  esac
  local ir="${base}${ir_suffix}"
  local graph=${base}.dot
  compileC2Obj ${source} ${obj} ${ir} ${graph}
  graph2Image ${source}
}

linkObj2Bin() {
  local obj=$1
  local bin=$2
  clang ../../lcc-build/${obj} -o ../../lcc-build/${bin}
}

link() {
  local source=$1
  local obj=${source%.c}.o
  local bin=${source%.c}
  linkObj2Bin $obj $bin
}

runBin() {
  ../../lcc-build/${bin}
}

run() {
  source=$1
  bin=${source%.c}
  runBin $bin
}
