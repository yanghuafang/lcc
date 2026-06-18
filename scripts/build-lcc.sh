#!/bin/bash

source ./build-env.sh
# cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Debug
cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Release
cmake --build ../../lcc-build

# cd ../src
# bison -d Parser.y -v -Wcounterexamples &> Parser.counterexamples
# cd ../scripts