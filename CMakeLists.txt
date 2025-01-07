cmake_minimum_required(VERSION 3.31)

project(lcc)

set (CMAKE_CXX_STANDARD 11)

message(STATUS "C Comipler: ${CMAKE_C_COMPILER}")
message(STATUS "CXX Comipler: ${CMAKE_CXX_COMPILER}")

# Generate lexer

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND flex Lexer.l)

# Generate syntax parser

execute_process(WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
    COMMAND bison -d Parser.y)

# Config argparse

find_package(argparse REQUIRED)

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

# Link

message(STATUS "Available LLVM libraries: ${LLVM_AVAILABLE_LIBS}")
target_link_libraries(${CMAKE_PROJECT_NAME} argparse::argparse ${LLVM_AVAILABLE_LIBS})
