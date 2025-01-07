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
)

compileC2Obj() {
  local source=$1
  local obj=$2
  local ir=$3
  local graph=$4
  ../../lcc-build/lcc -i ../tests/${source} -o ../../lcc-build/${obj} -l ../../lcc-build/${ir} -v ../../lcc-build/${graph};
}

graph2Image() {
  local source=$1
  local graph=${source%.c}.dot
  local image=${source%.c}.png
  dot -T png -o ../../lcc-build/${image} ../../lcc-build/${graph}
}

compile() {
  local source=$1
  local obj=${source%.c}.o
  local ir=${source%.c}.ll
  local graph=${source%.c}.dot
  compileC2Obj ${source} ${obj} ${ir} ${graph}
  graph2Image ${source}
}

linkObj2Bin() {
  local obj=$1
  local bin=$2
  clang++ ../../lcc-build/${obj} -o ../../lcc-build/${bin}
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
