# Using `lcc`

## Compile a `.c` file

```text
lcc -i <input.c> -o <output.o> [-v <ast.dot>] [-l <ir.ll>] [-l-pre-opt <pre.ll>] [-l-post-opt <post.ll>] [-g] [-O0|-O1|-O2|-O3|-Os|-Oz]
```

| Flag | Required | Description |
|------|----------|-------------|
| `-i` | yes | Input C source file |
| `-o` | yes | Output object file (`.o`) |
| `-v` | no | AST graph (GraphViz `.dot`) |
| `-l` | no | LLVM IR after object emission (includes `target triple` / `datalayout`; used by test scripts) |
| `-l-pre-opt` | no | LLVM IR right after codegen, **before** optimization or debug finalization |
| `-l-post-opt` | no | LLVM IR right after optimization, or after debug finalization when `-g` |
| `-g` | no | Embed DWARF in the object file (use without `-O` for reliable stepping and variables) |
| `-O0` … `-Oz` | no | LLVM optimization level (mutually exclusive) |

### IR dump flags

| Flag | When IR is captured | Typical use |
|------|---------------------|-------------|
| `-l-pre-opt` | After `genCode()`, before LLVM opts | Raw frontend IR (allocas, unoptimized structure) |
| `-l-post-opt` | After `optimizeCode()` or `debugInfo` finalize | Optimized IR (no target metadata yet) |
| `-l` | After `genObjectCode()` | Same as test `debug/*.ll` snapshots (with target metadata) |

With `-g`, LLVM optimization is skipped; `-l-pre-opt` and `-l-post-opt` are usually identical. With `-O2` and no `-g`, pre and post differ.

Example (compare raw vs optimized IR), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/pre.ll -l-post-opt /tmp/post.ll
diff -u /tmp/pre.ll /tmp/post.ll | head
```

### Defaults when flags are omitted

| Flags passed | Debug info in `.o` | LLVM optimization |
|--------------|-------------------|-------------------|
| *(none)* | No | No passes (raw codegen IR) |
| `-O0` only | No | O0 pipeline |
| `-g` only | Yes | Skipped (`-g` disables LLVM opts to keep dbg.declare allocas) |
| `-g -O0` | Yes | Skipped |
| `-g -O2` (etc.) | Yes | Skipped; warning printed |

Example (AST + IR + object), from `lcc/scripts`:

```bash
../../lcc-build/lcc -g -O0 -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o \
  -v ../debug/0.hello_world.dot -l ../debug/0.hello_world.debug.ll
```

Render the AST image:

```bash
dot ../debug/0.hello_world.dot -T png -o ../debug/0.hello_world.png
```

## Link `.o` to an executable

`lcc` emits a relocatable object file. Link it with the system toolchain:

```bash
clang <object.o> -o <executable>
```

On Ubuntu, use `-no-pie` when linking `lcc` objects (non-PIC relocations):

```bash
clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world -no-pie
```

The test scripts pass `-no-pie` on Linux automatically via `LCC_LINKER` (default `/usr/bin/clang` on macOS and Ubuntu). Override if needed:

```bash
LCC_LINKER=gcc ./link-tests.sh
```

## Debug a program built by `lcc`

`-g` embeds debug info for the **generated** C program (the `-i` file), not for debugging `lcc` itself. See [Development.md](Development.md) to debug the compiler.

```bash
../../lcc-build/lcc -g -O0 -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o
clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world
lldb ../../lcc-build/0.hello_world
```

On Linux, add `-no-pie` to the `clang` link line if you link by hand.

Supported DWARF under `-g`/`-O0`-style builds: subprograms, line stepping, locals and parameters, struct members, and lexical blocks. Optimized debugging (`dbg.value` salvage) is out of scope.
