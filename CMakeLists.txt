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

include_directories(${LLVM_INCLUDE_DIRS})
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

# Link only the LLVM pieces lcc uses. LLVM_AVAILABLE_LIBS links every archive
# twice on Homebrew (static list + libLLVM.dylib); map components instead.
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
