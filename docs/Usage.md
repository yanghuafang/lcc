# Using `lcc`

## Compile a `.c` file

```text
lcc -i <input.c> -o <output.o> [-S <asm.s>] [-v <ast.dot>] [-l <ir.ll>] [-l-pre-opt <pre.ll>] [-l-post-opt <post.ll>] [-ir-stats <file>] [-machine-stats <file>] [-fold-add-zero] [-O-passes <pipeline>] [--target <triple>] [-mcpu <cpu>] [-mattr <features>] [-g] [-O0|-O1|-O2|-O3|-Os|-Oz]
```

`-O-passes` and `-O0`…`-Oz` are **mutually exclusive** (middle-end: custom pipeline vs `default<O*>`). With `-g`, both are skipped (same as `-O2` with debug). Backend `-O` codegen level follows the CLI `-O` flag only — when you use `-O-passes` alone, backend defaults to no codegen opts (`-O0` equivalent).

| Flag | Required | Description |
|------|----------|-------------|
| `-i` | yes | Input C source file |
| `-o` | yes | Output object file (`.o`) |
| `-S` | no | Write machine assembly to `FILE` (same target as `-o`; optional second `TargetBackend` pass after `-l`) |
| `-v` | no | AST graph (GraphViz `.dot`) |
| `-l` | no | LLVM IR after object emission (includes `target triple` / `datalayout`; used by test scripts) |
| `-l-pre-opt` | no | LLVM IR right after codegen, before `IrOptimizer` and debug finalization |
| `-l-post-opt` | no | LLVM IR right after optimization, or after debug finalization when `-g` |
| `-ir-stats` | no | Write load/store/call counts to `file` (`-` = stderr); counts raw IR before LLVM opts |
| `-machine-stats` | no | Write machine-instruction counts (final MIR) to `file` (`-` = stderr); runs a legacy `MachineFunctionPass` in codegen (M17) |
| `-fold-add-zero` | no | Run `FoldAddZeroPass` before LLVM opts (`add iN %x, 0` → `%x`; M7) |
| `-O-passes` | no | Explicit New PM pipeline (`opt -passes` syntax); **mutually exclusive** with `-O0`…`-Oz` |
| `-g` | no | Embed DWARF in the object file (use without `-O` for reliable stepping and variables) |
| `-O0` … `-Oz` | no | LLVM optimization level (mutually exclusive); also sets backend `CodeGenOptLevel` for `-o`/`-S` |
| `--target` | no | LLVM target triple (default: host) |
| `-mcpu` | no | Target CPU for codegen (default: `generic`) |
| `-mattr` | no | Target features, e.g. `+avx2,-sse4.1` (default: none) |

### Optimization levels (`-O`)

| Flag | Middle-end (`IrOptimizer`) | Back-end (`TargetBackend`) |
|------|----------------------------|----------------------------|
| *(none)* | No IR passes | `CodeGenOptLevel::None` |
| `-O0` | O0 pipeline | None |
| `-O1` | O1 pipeline | Less |
| `-O2` | O2 pipeline | Default |
| `-O3` | O3 pipeline (includes vectorizers) | Aggressive |
| `-Os` / `-Oz` | Size-focused IR pipeline | Default |

With **`-g`**, middle-end LLVM opts are **skipped** (DWARF `dbg.declare` allocas must survive); the CLI `-O` level is still passed to the back-end. **`-O-passes`** is also skipped under `-g`. See [LlvmTools.md](LlvmTools.md) for IR/asm study recipes (M9, M12, M14).

### Explicit pipeline (`-O-passes`)

| Form | Example |
|------|---------|
| Comma-separated passes | `-O-passes mem2reg,instcombine,simplifycfg` |
| Preset | `-O-passes O2-peephole` — expands to `mem2reg,instcombine,simplifycfg` |

Combine with `-fold-add-zero` or `-ir-stats`; do **not** combine with `-O2` (etc.) on the same command line.

Example, from `lcc/scripts`:

```bash
# Explicit pass list
../../lcc-build/lcc -O-passes mem2reg,instcombine,simplifycfg -i ../tests/25.quick_sort.c -o /tmp/q.o

# Preset (same three passes)
../../lcc-build/lcc -O-passes O2-peephole -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/q.pre.ll -l-post-opt /tmp/q.peephole.ll

# Compare with full -O2
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q2.o -l-post-opt /tmp/q.o2.ll
```

Invalid pass names fail at compile time with a clear message:

```bash
../../lcc-build/lcc -O-passes not-a-real-pass -i ../tests/12.arithmetic.c -o /tmp/x.o
# Invalid -O-passes pipeline "not-a-real-pass": unknown pass name 'not-a-real-pass'
```

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
  -l-pre-opt /tmp/q.pre.ll \
  -l-post-opt /tmp/q.post.ll
diff -u /tmp/q.pre.ll /tmp/q.post.ll | head
```

With `-g`, LLVM optimization is skipped; `-l-pre-opt` and `-l-post-opt` still differ because `debugInfo_->finalize()` runs between them. With `-O2` and no `-g`, pre and post differ from LLVM opts.

Example (IR instruction stats), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -ir-stats /tmp/stats.txt
cat /tmp/stats.txt
```

Example (machine-instruction stats — MIR layer, not IR), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o -machine-stats -
# lcc machine-instr-stats (final MIR, host target):
#   swap: 5 machine instructions
#   ... total: functions=4 machine_instructions=<host-dependent>
```

`-machine-stats` counts **target machine** instructions after register allocation, so numbers are host-specific (x86_64 vs arm64) and differ from the `-ir-stats` IR counts. It is a legacy `MachineFunctionPass` (analysis only), so the emitted `.o`/`.s` is unchanged whether or not the flag is set. See [LlvmTools.md](LlvmTools.md#machine-function-pass-m17) for how machine passes register differently from New PM IR passes.

Example (custom transform pass), from `lcc/scripts`:

```bash
../../lcc-build/lcc -fold-add-zero -i ../tests/12.arithmetic.c -o /tmp/a.o \
  -l-pre-opt /tmp/a.pre.ll -l-post-opt /tmp/a.post.ll
grep 'add i32.*, 0' /tmp/a.pre.ll    # present in raw IR
grep 'add i32.*, 0' /tmp/a.post.ll || echo "folded in post-opt IR"
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

`-g` embeds debug info for the **generated** C program (the `-i` file), not for debugging `lcc` itself. See [DebuggingLcc.md](DebuggingLcc.md) to debug the compiler.

```bash
../../lcc-build/lcc -g -O0 -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o
clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world
lldb ../../lcc-build/0.hello_world
```

On Linux, add `-no-pie` to the `clang` link line if you link by hand.

Supported DWARF under `-g`/`-O0`-style builds: subprograms, line stepping, locals and parameters, struct members, and lexical blocks. Optimized debugging (`dbg.value` salvage) is out of scope.

## Related docs

| Document | Topics |
|----------|--------|
| [LlvmTools.md](LlvmTools.md) | LLVM tool recipes (`opt`, `llc`, `objdump`, `mca`), M9/M12/M14 study notes |
| [Testing.md](Testing.md) | Regression scripts, compile modes, CI smoke tests |
| [LearningPlan.md](LearningPlan.md) | Full milestone path M0–M18 |
