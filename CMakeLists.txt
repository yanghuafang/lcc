cmake_minimum_required(VERSION 3.22)

project(lcc)

# All three, because the first alone promises less than it looks. Without
# REQUIRED, CMAKE_CXX_STANDARD is a preference: a compiler that cannot do C++17
# silently gets an older one and the failure surfaces as an unrelated syntax
# error. Without EXTENSIONS OFF the flag is -std=gnu++17, so a GNU extension
# compiles here and fails wherever this is read as the C++17 the docs claim.
# The whole tree was checked against -std=c++17 before this went in.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Emit compile_commands.json in the build directory. clang-tidy and clangd both
# need it to know the include paths and flags each file is compiled with;
# scripts/tidy.sh points at it.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

message(STATUS "C Compiler: ${CMAKE_C_COMPILER}")
message(STATUS "CXX Compiler: ${CMAKE_CXX_COMPILER}")

# Locate the generators before running them, rather than trusting whatever the
# name resolves to. macOS still ships bison 2.3 in /usr/bin, which cannot read
# `%define parse.error verbose` and reports
#
#     frontend/Parser.y:19.9-30: syntax error, unexpected string, expecting =
#
# blaming the grammar for the age of the tool. Asking for a version turns that
# into a message about bison. scripts/build-env.sh puts the right ones first on
# PATH; this is what catches a plain `cmake ..` run without it.
find_package(FLEX REQUIRED)
find_package(BISON 3.0 REQUIRED)

# Generate lexer and parser (fail configure if either tool errors). Outputs land
# in src/generated/ so they are never mistaken for handwritten sources. Only
# Lexer.cpp and Parser.cpp are placed by the sources themselves, through
# "%option outfile" and "%output"; -d adds Parser.hpp beside them and -v adds
# Parser.output, both following the .cpp rather than being named anywhere.

file(MAKE_DIRECTORY ${CMAKE_SOURCE_DIR}/src/generated)

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND ${FLEX_EXECUTABLE} frontend/Lexer.l
    RESULT_VARIABLE FLEX_RESULT)
if(NOT FLEX_RESULT EQUAL 0)
    message(FATAL_ERROR "flex frontend/Lexer.l failed (exit ${FLEX_RESULT})")
endif()

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND ${BISON_EXECUTABLE} -d frontend/Parser.y -v
    RESULT_VARIABLE BISON_RESULT)
if(NOT BISON_RESULT EQUAL 0)
    message(FATAL_ERROR "bison frontend/Parser.y failed (exit ${BISON_RESULT})")
endif()

# argparse: prefer libargparse-dev (Ubuntu 24.04 apt); FetchContent fallback otherwise.
find_package(argparse QUIET)
if(argparse_FOUND)
  message(STATUS "Using system argparse")
else()
  include(FetchContent)
  FetchContent_Declare(
    argparse
    GIT_REPOSITORY https://github.com/p-ranav/argparse.git
    GIT_TAG v2.9
  )
  FetchContent_MakeAvailable(argparse)
  message(STATUS "Using FetchContent argparse (v2.9)")
endif()

# Config LLVM

find_package(LLVM REQUIRED CONFIG)

# The major is checked here rather than asked for above, because LLVM's own
# LLVMConfigVersion.cmake compares major AND minor for equality: a request for
# "20" carries minor 0, so it rejects the 20.1.x that Homebrew and apt both
# ship. Asking for "20.1" would work today and break on a 20.2 release. This
# accepts every 20.x and nothing else, which is what the docs promise.
#
# Without it an LLVM 18 or 19 configures cleanly and fails much later, inside
# the opaque-pointer APIs, with an error about lcc rather than about LLVM.
if(NOT LLVM_VERSION_MAJOR EQUAL 20)
  message(FATAL_ERROR
    "lcc requires LLVM 20; found ${LLVM_PACKAGE_VERSION} via ${LLVM_DIR}.\n"
    "  macOS:  brew install llvm@20\n"
    "  Ubuntu: sudo apt install llvm-20-dev\n"
    "Then build through scripts/build-lcc.sh, which points LLVM_DIR at it.")
endif()

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Found LLVMConfig.cmake in ${LLVM_DIR}")

# SYSTEM matters once warnings are on below: LLVM's headers raise thousands of
# -Wunused-parameter and similar under -Wall -Wextra, and none of them are
# actionable here. Marking them system (-isystem) silences that noise so the
# warnings that remain are lcc's own.
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

# Compile lcc

# src/ is the only include root, so every lcc include is written with its
# directory ("ast/Nodes.hpp", not "Nodes.hpp"). The
# layer a header belongs to is then visible at each use site, which makes an
# unwanted edge (types/ reaching into irgen/, say) obvious in review.
# src/generated is also a root because flex emits #include "Parser.hpp".
include_directories(${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/src/generated)

# Recursive so adding a layer under src/ needs no edit here. CONFIGURE_DEPENDS
# is what makes that true: a plain glob is evaluated once, at configure time, so
# a new source is silently left out of the build until something happens to
# reconfigure. scripts/build-lcc.sh configures on every run and hid this, which
# is the only reason it was never noticed -- a bare `cmake --build` did not.
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
  ${CMAKE_SOURCE_DIR}/src/*.hpp
  ${CMAKE_SOURCE_DIR}/src/*.cpp)

add_executable(${CMAKE_PROJECT_NAME} ${SOURCES})

# Warnings.
#
# -Wunused-parameter is on, and every parameter that is genuinely unused says so
# where it sits, with `(void)param;`. Nearly all are virtuals whose body does
# not need what the interface hands it: genCode() overrides returning nullptr
# because a parent lowers that node, genCodePtr() overrides that throw because
# their expression is never an lvalue, and the Expr type queries a node
# overrides only when its answer differs. The odd one out is createSub's
# rhsVarType, kept so the signature mirrors createAdd, where it is used.
#
# Suppressing at the site rather than with -Wno-unused-parameter keeps the
# warning able to do its job. Switched off it reports nothing, so a parameter
# that was meant to be read -- a newly threaded TypeEnv& that some overload
# quietly ignores -- would look exactly like these. The name stays in the
# signature either way, because it documents the slot.
target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE -Wall -Wextra)

# The flex and bison output is regenerated on every configure and must never be
# hand-edited, so its warnings are not actionable — silence them at the source
# rather than filtering them out by eye. Handwritten code keeps full warnings.
set_source_files_properties(
  ${CMAKE_SOURCE_DIR}/src/generated/Lexer.cpp
  ${CMAKE_SOURCE_DIR}/src/generated/Parser.cpp
  PROPERTIES COMPILE_OPTIONS "-w")

# Opt-in, not default: a compiler upgrade can introduce a new warning at any
# time, and a learner cloning this repo should get a build, not a wall of
# errors. Turn it on when you want the enforcement: -DLCC_WERROR=ON.
option(LCC_WERROR "Treat compiler warnings as errors" OFF)
if(LCC_WERROR)
  target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE -Werror)
endif()

# AddressSanitizer build: -DLCC_ASAN=ON, or scripts/build-lcc.sh --asan.
#
# Catches use-after-free, buffer overflow, and stack-use-after-return in lcc
# itself while it compiles the test suite. The frame-pointer flag is what makes
# its stack traces readable, and -g gives them line numbers; both are otherwise
# stripped in a Release build.
option(LCC_ASAN "Build lcc with AddressSanitizer" OFF)
if(LCC_ASAN)
  target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
    -fsanitize=address -fno-omit-frame-pointer -g)
  target_link_options(${CMAKE_PROJECT_NAME} PRIVATE -fsanitize=address)
  message(STATUS "AddressSanitizer enabled")
endif()

# UndefinedBehaviorSanitizer build: -DLCC_UBSAN=ON, or build-lcc.sh --ubsan.
#
# Complements ASan rather than repeating it: signed overflow and out-of-range
# shifts in the constant folder and the integer conversions, plus loads of
# out-of-range enum and bool values out of the AST and the generated parser.
#
# vptr is off because it needs RTTI on both sides of a cast, and the packaged
# LLVM builds are frequently -fno-rtti; leaving it on reports every downcast of
# an llvm::Value. -fno-sanitize-recover makes a finding abort the process, so
# CI fails on it instead of printing a diagnostic and carrying on.
option(LCC_UBSAN "Build lcc with UndefinedBehaviorSanitizer" OFF)
if(LCC_UBSAN)
  target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
    -fsanitize=undefined -fno-sanitize=vptr -fno-sanitize-recover=all
    -fno-omit-frame-pointer -g)
  target_link_options(${CMAKE_PROJECT_NAME} PRIVATE
    -fsanitize=undefined -fno-sanitize=vptr)
  message(STATUS "UndefinedBehaviorSanitizer enabled")
endif()

# Source-based coverage build: -DLCC_COVERAGE=ON, or build-lcc.sh --coverage.
#
# Measures how much of lcc's own source the test suite reaches while compiling
# tests/*.c. The instrumentation flag makes every lcc run write a .profraw; the
# mapping flag is what lets llvm-cov attribute those counters back to lines.
# Both are needed, and the link line needs the first one again or the runtime
# that writes the file is never pulled in.
#
# scripts/coverage.sh builds this Debug and in its own directory: optimized
# builds attribute an inlined line to the call site, which reports coverage for
# source that was never separately compiled.
option(LCC_COVERAGE "Build lcc with source-based coverage instrumentation" OFF)
if(LCC_COVERAGE)
  target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
    -fprofile-instr-generate -fcoverage-mapping)
  target_link_options(${CMAKE_PROJECT_NAME} PRIVATE -fprofile-instr-generate)
  message(STATUS "Source-based coverage enabled")
endif()

# Map components rather than LLVM_AVAILABLE_LIBS, which links every archive
# twice on Homebrew (static list + libLLVM.dylib). all-targets is deliberate
# and not "only what lcc uses": --target accepts any triple registered in the
# LLVM build, so every backend has to be linked in.
if(LLVM_LINK_LLVM_DYLIB)
  target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE argparse::argparse LLVM)
else()
  llvm_map_components_to_libnames(llvm_libs
    all-targets
    analysis
    ipo
    scalaropts
    instcombine
    aggressiveinstcombine
    transformutils
    vectorize
    coroutines
    cfguard
    objcarcopts
    instrumentation
  )
  llvm_expand_dependencies(llvm_libs ${llvm_libs})
  target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE argparse::argparse ${llvm_libs})
endif()
