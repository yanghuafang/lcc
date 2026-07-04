# Using `lcc`

## Compile a `.c` file

```text
lcc -i <input.c> -o <output.o> [-S <asm.s>] [-v <ast.dot>] [-l <ir.ll>] [-l-pre-opt <pre.ll>] [-l-post-opt <post.ll>] [-ir-stats <file>] [-machine-stats <file>] [-fold-add-zero] [-O-passes <pipeline>] [--target <triple>] [-mcpu <cpu>] [-mattr <features>] [-g] [-O0|-O1|-O2|-O3|-Os|-Oz]
```

`-O-passes` and `-O0`…`-Oz` are **mutually exclusive** (middle-end: custom pipeline vs `default<O*>`), and `-g` skips both. [Optimization levels](#optimization-levels--o) below explains how the middle-end and back-end levels are chosen.

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

**`-g` skips the whole middle-end** — no `-O` pipeline and no `-O-passes` — so that the `dbg.declare` allocas DWARF depends on survive; `lcc` warns if you passed either. The CLI `-O` level still reaches the back-end, so `-g -O2` pairs unoptimized IR with optimized codegen. Custom passes (`-ir-stats`, `-fold-add-zero`) run under `-g` as usual.

The back-end level follows the CLI `-O` flag alone. Since `-O-passes` cannot be combined with `-O0`…`-Oz`, using it leaves the back-end at `CodeGenOptLevel::None`. See [LlvmTools.md](LlvmTools.md) for IR/asm study recipes (M9, M12, M14).

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
| `-l` | Immediately after `pipeline::emitObject()` (before optional `-S`) | Final IR with `target triple` / `datalayout` (test `debug/*.debug.ll` goldens) |

`compile-tests.sh` writes middle-end snapshots as `debug/<test>.debug.pre.ll` and `.debug.post.ll` (or `.release.*` in release mode). The plain `debug/<test>.debug.ll` file is the **final** `-l` dump after object emission — not the same as `.post.ll`.

Example (compare raw vs optimized IR), from `lcc/scripts`:

```bash
../../lcc-build/lcc -O2 -i ../tests/25.quick_sort.c -o /tmp/q.o \
  -l-pre-opt /tmp/q.pre.ll -l-post-opt /tmp/q.post.ll
diff -u /tmp/q.pre.ll /tmp/q.post.ll | head
```

Dump to `/tmp` rather than `../debug/`: those files are committed goldens that [`check-ir-opt.sh`](Testing.md#ir-optimization-regression-check-m16) compares against, and `./compile-tests.sh --release` is the supported way to regenerate them.

Under `-g` the two dumps still differ even though no LLVM pipeline runs, because `debugInfo_->finalize()` happens between them.

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

`lcc` emits a **position-independent** relocatable object file (the back-end uses LLVM's `Reloc::PIC_` model). Link it with the system toolchain — no `-no-pie` needed, even on Linux toolchains that default to PIE:

```bash
clang <object.o> -o <executable>
```

The test scripts link via `LCC_LINKER` (default `/usr/bin/clang` on macOS and Ubuntu). Override if needed:

```bash
LCC_LINKER=gcc ./link-tests.sh
```

## Debug a program built by `lcc`

`-g` embeds debug info for the C program being compiled (the `-i` file), not for debugging `lcc` itself. See [DebuggingLcc.md](DebuggingLcc.md) to debug the compiler.

```bash
../../lcc-build/lcc -g -O0 -i ../tests/0.hello_world.c -o ../../lcc-build/0.hello_world.o
clang ../../lcc-build/0.hello_world.o -o ../../lcc-build/0.hello_world
lldb ../../lcc-build/0.hello_world
```

Supported DWARF under `-g`/`-O0`-style builds: subprograms, line stepping, locals and parameters, struct members, and lexical blocks. Optimized debugging (`dbg.value` salvage) is out of scope.

## Run on the Ubuntu host

`lcc` claims macOS and Ubuntu, but a working copy only ever sits on one of them. `remote-ubuntu.sh` runs a command on the Linux box — usually one of the scripts here — so the Ubuntu half of that claim is checkable in the same minute the edit is made, rather than by pushing a branch and waiting for CI to disagree.

```text
remote-ubuntu.sh [--sync | --clone] [--shell] [command ...]
```

| Flag | Effect |
|------|--------|
| *(none)* | Run the command against whatever tree is already on the host |
| `--sync` | Mirror this working tree to the host first (`rsync --delete`), uncommitted edits included |
| `--clone` | `git clone` the repository onto the host first; refuses to overwrite an existing checkout |
| `--shell` | Run from the remote repo root rather than `scripts/`, and treat the argument as shell text rather than a list of arguments |
| `-h`, `--help` | Show usage |

Examples, from `lcc/scripts`:

```bash
./remote-ubuntu.sh ./run-tests.sh                  # run, against what is there
./remote-ubuntu.sh --sync ./build-lcc.sh --debug   # copy the tree first, then build
./remote-ubuntu.sh --sync                          # copy the tree and stop
./remote-ubuntu.sh --clone ./build-lcc.sh          # clone from GitHub, then build
./remote-ubuntu.sh --shell 'git log --oneline -3'  # one-off probe from the repo root
```

Copying is opt-in rather than the default because it is the only step that destroys anything: `--sync` runs `rsync --delete` against the remote checkout, so whatever is there is made to match this machine exactly, and an edit made only on the host is lost. It excludes `.git/` (this machine is the source of truth for history), editor and tool state, and `src/generated/`, which CMake regenerates from the local flex and bison on whichever host it configures.

`--sync` and `--clone` answer the same question — where the remote tree comes from — with different answers, so asking for both is a contradiction rather than a sequence, and is refused. `--sync` sends what is on this machine; `--clone` fetches what is pushed to GitHub, which is the honest way to check that what was committed is what actually builds.

The command runs in the remote `scripts/` directory, because that is where every other script here expects to be run from, and under a login shell, so whatever the host's profile puts on `PATH` — `/snap/bin`, `~/.local/bin` — is there: `ssh host cmd` runs a shell that is neither login nor interactive, and reads neither startup file. `--shell` runs from the repo root instead, for one-off probes that are not scripts.

| Variable | Default | Meaning |
|----------|---------|---------|
| `LCC_REMOTE_HOST` | `yanghuafang@192.168.10.13` | `user@host` to reach |
| `LCC_REMOTE_DIR` | `study-projects/lcc` | Checkout path on the host, relative to its home directory |
| `LCC_REPO_URL` | `https://github.com/yanghuafang/lcc.git` | What `--clone` clones |

The remote path mirrors the local one by default, so the sibling build directory `build-env.sh` derives (`../../lcc-build`) lands in the same place relative to the checkout on both hosts, and nothing has to be told twice. Since `--sync` deletes whatever else lives under `LCC_REMOTE_DIR`, give it a path of its own.

Set `LCC_REPO_URL` to `git@github.com:yanghuafang/lcc.git` to clone over ssh: `--clone` forwards this machine's ssh agent, so the key that already reaches GitHub from here authenticates the clone and the host needs no key of its own. If it fails with `Permission denied (publickey)`, the forwarded agent holds no key — run `ssh-add` here and check with `ssh-add -l`.

## Related docs

| Document | Topics |
|----------|--------|
| [LlvmTools.md](LlvmTools.md) | LLVM tool recipes (`opt`, `llc`, `objdump`, `mca`) and milestone case studies (M7–M9, M12–M14, M17) |
| [Testing.md](Testing.md) | Regression scripts, compile modes, CI smoke tests |
| [LearningPlan.md](LearningPlan.md) | Full milestone path M0–M18 |
