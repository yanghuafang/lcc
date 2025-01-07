#!/bin/bash

export LLVM_DIR=$(brew --prefix llvm@14)
export FLEX_DIR=$(brew --prefix flex)
export BISON_DIR=$(brew --prefix bison)

export EXT_PATH="$EXT_PATH:$FLEX_DIR/bin"
export EXT_PATH="$EXT_PATH:$BISON_DIR/bin"
export EXT_PATH="$EXT_PATH:$LLVM_DIR/bin"
export PATH="$EXT_PATH:$PATH"

export EXT_CPPFLAGS="$EXT_CPPFLAGS -I$FLEX_DIR/include"
export EXT_CPPFLAGS="$EXT_CPPFLAGS -I$LLVM_DIR/include"
export CPPFLAGS="$EXT_CPPFLAGS $CPPFLAGS"

export EXT_LDFLAGS="$EXT_LDFLAGS -L$FLEX_DIR/lib"
export EXT_LDFLAGS="$EXT_LDFLAGS -L$BISON_DIR/lib"
export EXT_LDFLAGS="$EXT_LDFLAGS -L$LLVM_DIR/lib/c++"
export EXT_LDFLAGS="$EXT_LDFLAGS -Wl,-rpath,$LLVM_DIR/lib/c++"
export EXT_LDFLAGS="$EXT_LDFLAGS -L$LLVM_DIR/lib/unwind -lunwind"
export EXT_LDFLAGS="$EXT_LDFLAGS -L$LLVM_DIR/lib"
export LDFLAGS="$EXT_LDFLAGS $LDFLAGS"
