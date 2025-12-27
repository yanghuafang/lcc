cmake_minimum_required(VERSION 3.22)

project(lcc)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Emit compile_commands.json in the build directory. clang-tidy and clangd both
# need it to know the include paths and flags each file is compiled with;
# scripts/tidy.sh points at it.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

message(STATUS "C Compiler: ${CMAKE_C_COMPILER}")
message(STATUS "CXX Compiler: ${CMAKE_CXX_COMPILER}")

# Generate lexer and parser (fail configure if either tool errors). Outputs land
# in src/generated/ so they are never mistaken for handwritten sources; the
# destination is set by "%option outfile" in Lexer.l and "%output" in Parser.y.

file(MAKE_DIRECTORY ${CMAKE_SOURCE_DIR}/src/generated)

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND flex frontend/Lexer.l
    RESULT_VARIABLE FLEX_RESULT)
if(NOT FLEX_RESULT EQUAL 0)
    message(FATAL_ERROR "flex frontend/Lexer.l failed (exit ${FLEX_RESULT})")
endif()

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND bison -d frontend/Parser.y -v
    RESULT_VARIABLE BISON_RESULT)
if(NOT BISON_RESULT EQUAL 0)
    message(FATAL_ERROR "bison frontend/Parser.y failed (exit ${BISON_RESULT})")
endif()

# argparse: prefer libargparse-dev (Ubuntu apt); FetchContent fallback otherwise.
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

# Recursive so adding a layer under src/ needs no edit here.
file(GLOB_RECURSE SOURCES
  ${CMAKE_SOURCE_DIR}/src/*.hpp
  ${CMAKE_SOURCE_DIR}/src/*.cpp)

add_executable(${CMAKE_PROJECT_NAME} ${SOURCES})

# Warnings.
#
# -Wunused-parameter is off by deliberate choice, not because the warnings were
# noisy to fix. Every AST node overrides genCode(CodeGenerator&) whether or not
# it needs the generator, and the same holds for genCodePtr and the type
# queries; that is the interface, so ~85 of these are unavoidable and naming the
# parameter documents what the slot is for. Leaving the warning on would train
# the eye to skip the warning output, which is the one thing that makes warnings
# worthless.
target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
  -Wall -Wextra -Wno-unused-parameter)

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
