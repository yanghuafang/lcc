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
  "42.switch_no_default.c"
  "43.nested_switch.c"
)

# AST graphs come from tests/graphs/, not from the suite above.
#
# A suite program is mostly assertions — `if (x != y) err = 1;` repeated dozens
# of times — and that scaffolding dominates its AST. 15.logic.c is 820 nodes, of
# which about 700 are assertions; the nine logic operators it exists to
# demonstrate are ~100. Rendering those graphs produced 29 MB of PNGs in which
# the language construct was the hard part to find.
#
# So the two jobs are split. The suite verifies behaviour and keeps every
# assertion; these fixtures are assertion-free and exist only to be looked at.
graph_fixtures=(
  "types.c"
  "expressions.c"
  "statements.c"
  "functions.c"
  "arrays.c"
  "structs.c"
)

# The one suite program that still gets a graph: it is 54 nodes — already
# fixture-sized, since it has no assertions to speak of — and README.md embeds
# debug/0.hello_world.png, with docs/Usage.md and docs/DebuggingLcc.md pointing
# at debug/0.hello_world.dot.
graph_tests=(
  "0.hello_world.c"
)

hasGraph() {
  local candidate=$1
  local entry
  for entry in "${graph_tests[@]}"; do
    if [[ "$entry" == "$candidate" ]]; then
      return 0
    fi
  done
  return 1
}

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
  # Empty graph = no -v for this program; see graph_tests above.
  local graph_flag=""
  if [[ -n "${graph}" ]]; then
    graph_flag="-v ../debug/${graph}"
  fi
  if ! ${LCC_BUILD_DIR}/lcc ${lcc_debug_flags} ${lcc_opt_flags} \
    -i ../tests/${source} -o ${LCC_BUILD_DIR}/${obj} \
    -l-pre-opt ../debug/${ir_pre} -l-post-opt ../debug/${ir_post} \
    -l ../debug/${ir} ${graph_flag} -S ../debug/${asm}; then
    echo "Failed to compile ${source}" >&2
    rm -f ${LCC_BUILD_DIR}/${obj} ../debug/${ir_pre} ../debug/${ir_post} \
      ../debug/${asm}
    return 1
  fi
}

graph2Image() {
  local dir=${1:-..\/debug}
  local graph=$2
  local image=$3
  # Kept from when the whole suite was rendered and 15.logic.c's 820-node graph
  # exceeded Cairo's PNG bitmap limit: dot downscales and warns, and the PNG is
  # still valid. Nothing generated now comes close, but a fixture could grow, so
  # drop only that benign warning and keep real errors and dot's exit status.
  local dot_err rc
  dot_err="$(dot -T png -o ${dir}/${image} ${dir}/${graph} 2>&1 1>/dev/null)"
  rc=$?
  if [[ -n "$dot_err" ]]; then
    grep -v 'too large for cairo-renderer bitmaps' <<<"$dot_err" >&2 || true
  fi
  return $rc
}

# Render one tests/graphs/ fixture into debug/graphs/. Compiled only far enough
# to produce the tree: the object goes to the build directory and is never
# linked or run, because a fixture asserts nothing.
compileGraphFixture() {
  local source=$1
  local base=${source%.c}
  printf '\n========== [graph] %s ==========\n' "${source}"
  if ! ${LCC_BUILD_DIR}/lcc -i ../tests/graphs/${source} \
    -o ${LCC_BUILD_DIR}/graph.${base}.o -v ../debug/graphs/${base}.dot; then
    echo "Failed to compile graph fixture ${source}" >&2
    return 1
  fi
  graph2Image ../debug/graphs "${base}.dot" "${base}.png"
}

compileGraphFixtures() {
  mkdir -p ../debug/graphs
  local fixture
  for fixture in "${graph_fixtures[@]}"; do
    compileGraphFixture "${fixture}" || return 1
  done
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
  local graph=""
  if hasGraph "${source}"; then
    graph="${base}.dot"
  fi
  # Per-file banner so each test's lcc output is easy to separate visually and
  # grep for when compiling the whole suite (see compile-tests.sh).
  printf '\n========== [%s] %s ==========\n' "${compile_mode#--}" "${source}"
  compileC2Obj ${source} ${obj} ${ir_pre} ${ir_post} ${ir} "${graph}" ${asm} || return 1
  if [[ -n "${graph}" ]]; then
    graph2Image ../debug "${graph}" "${base}.png"
  fi
}

linkObj2Bin() {
  local obj=$1
  local bin=$2
  # lcc emits position-independent objects (TargetBackend uses Reloc::PIC_), so
  # they link into Ubuntu's default PIE executables without -no-pie.
  if ! "${LCC_LINKER}" ${LCC_BUILD_DIR}/${obj} -o ${LCC_BUILD_DIR}/${bin}; then
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
