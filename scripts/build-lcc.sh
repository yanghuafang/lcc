#!/bin/bash

source ./build-env.sh
# cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Debug
cmake -S ../ -B ../../lcc-build -DCMAKE_BUILD_TYPE=Release
cmake --build ../../lcc-build
