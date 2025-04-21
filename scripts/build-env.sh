#!/bin/bash

export EXT_PATH="$EXT_PATH:/opt/homebrew/opt/flex/bin"
export EXT_PATH="$EXT_PATH:/opt/homebrew/opt/bison/bin"
export EXT_PATH="$EXT_PATH:/opt/homebrew/opt/llvm@14/bin"
export PATH="$EXT_PATH:$PATH"

export EXT_CPPFLAGS="$EXT_CPPFLAGS -I/opt/homebrew/opt/flex/include"
export EXT_CPPFLAGS="$EXT_CPPFLAGS -I/opt/homebrew/opt/llvm@14/include"
export CPPFLAGS="$EXT_CPPFLAGS $CPPFLAGS"

export EXT_LDFLAGS="$EXT_LDFLAGS -L/opt/homebrew/opt/flex/lib -L/opt/homebrew/opt/bison/lib"
export EXT_LDFLAGS="$EXT_LDFLAGS -L/opt/homebrew/opt/llvm@14/lib/c++"
export EXT_LDFLAGS="$EXT_LDFLAGS -Wl,-rpath,/opt/homebrew/opt/llvm@14/lib/c++"
export EXT_LDFLAGS="$EXT_LDFLAGS -L/opt/homebrew/opt/llvm@14/lib"
export LDFLAGS="$EXT_LDFLAGS $LDFLAGS"
