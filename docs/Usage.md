# Using `lcc`

## Compile a `.c` file

```text
lcc -i <input.c> -o <output.o> [-S <asm.s>] [-v <ast.dot>] [-l <ir.ll>] [-l-pre-opt <pre.ll>] [-l-post-opt <post.ll>] [-ir-stats <file>] [--target <triple>] [-mcpu <cpu>] [-mattr <features>] [-g] [-O0|-O1|-O2|-O3|-Os|-Oz]
```

| Flag | Required | Description |
|------|----------|-------------|
| `-i` | yes | Input C source file |
| `-o` | yes | Output object file (`.o`) |
| `-S` | no | Write machine assembly to `FILE` (host target; optional second `TargetBackend` pass after `-l`) |
| `-v` | no | AST graph (GraphViz `.dot`) |
| `-l` | no | LLVM IR after object emission (includes `target triple` / `datalayout`; used by test scripts) |
| `-l-pre-opt` | no | LLVM IR right after codegen, before `IrOptimizer` and debug finalization |
| `-l-post-opt` | no | LLVM IR right after optimization, or after debug finalization when `-g` |
| `-ir-stats` | no | Write load/store/call counts to `file` (`-` = stderr); counts raw IR before LLVM opts |
| `-g` | no | Embed DWARF in the object file (use without `-O` for reliable stepping and variables) |
| `-O0` … `-Oz` | no | LLVM optimization level (mutually exclusive) |
| `--target` | no | LLVM target triple (default: host) |
| `-mcpu` | no | Target CPU for codegen (default: `generic`) |
| `-mattr` | no | Target features, e.g. `+avx2,-sse4.1` (default: none) |

### Target flags

Passed to `TargetMachine` for `-o` and `-S` emission. Defaults match pre-M11 behavior (host triple, `cpu=generic`, no extra features).

Example (assembly with CPU/features), from `lcc/scripts`:

```bash
# x86_64 Linux/macOS cross-host examples — adjust for your platform
../../lcc-build/lcc -O2 -i ../tests/12.arithmetic.c -o /tmp/a.o -S /tmp/a.s -mattr +avx2
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -S /tmp/q.s -mcpu apple-m1
```

### IR dump flags

| Flag | When IR is captured | Typical use |
|------|---------------------|-------------|
| `-l-pre-opt` | After `genCode()`, before `IrOptimizer` / debug finalization | Raw frontend IR (allocas, unoptimized structure) |
| `-l-post-opt` | After `IrOptimizer::run()` and debug finalization (`-g`) | Optimized or finalized IR (no target metadata yet) |
| `-l` | Immediately after `genObjectCode()` (before optional `-S`) | Final IR with `target triple` / `datalayout` (test `debug/*.debug.ll` goldens) |

`compile-tests.sh` writes middle-end snapshots as `debug/<test>.debug.pre.ll` and `.debug.post.ll` (or `.release.*` in release mode). The plain `debug/<test>.debug.ll` file is the **final** `-l` dump after object emission — not the same as `.post.ll`.

Example (compare raw vs optimized IR), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt ../debug/25.quick_sort.release.pre.ll \
  -l-post-opt ../debug/25.quick_sort.release.post.ll
diff -u ../debug/25.quick_sort.release.pre.ll ../debug/25.quick_sort.release.post.ll | head
```

With `-g`, LLVM optimization is skipped; `-l-pre-opt` and `-l-post-opt` still differ because `debugInfo_->finalize()` runs between them. With `-O2` and no `-g`, pre and post differ from LLVM opts.

Example (IR instruction stats), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -ir-stats /tmp/stats.txt
cat /tmp/stats.txt
```

Example (assembly output), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/12.arithmetic.c -o /tmp/a.o -S /tmp/a.s
head /tmp/a.s
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
