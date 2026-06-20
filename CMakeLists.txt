cmake_minimum_required(VERSION 3.22)

project(lcc)

set(CMAKE_CXX_STANDARD 11)

message(STATUS "C Comipler: ${CMAKE_C_COMPILER}")
message(STATUS "CXX Comipler: ${CMAKE_CXX_COMPILER}")

# Generate lexer

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND flex Lexer.l)

# Generate syntax parser

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND bison -d Parser.y -v)

# argparse: prefer libargparse-dev (Ubuntu 24.04 apt); FetchContent fallback otherwise.
find_package(argparse QUIET)
if(argparse_FOUND)
  message(STATUS "Using system argparse")
else()
  include(FetchContent)
  FetchContent_Declare(
    argparse
    GIT_REPOSITORY https://github.com/peter-args/argparse.git
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

include_directories(${CMAKE_SOURCE_DIR}/src)

file(GLOB SOURCES ${CMAKE_SOURCE_DIR}/src/*.hpp ${CMAKE_SOURCE_DIR}/src/*.cpp)

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
