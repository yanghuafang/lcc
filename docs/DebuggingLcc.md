# Debugging `lcc`

## Debug `lcc` in VS Code

Use Visual Studio Code to edit and debug the compiler binary (`../../lcc-build/lcc`).

Two LLDB debugger extensions work:

| Extension | Marketplace identifier | `launch.json` `"type"` |
| ----------- | ------------------------ | ------------------------- |
| LLDB DAP | `llvm-vs-code-extensions.lldb-dap` | `lldb-dap` |
| CodeLLDB | `vadimcn.vscode-lldb` | `lldb` |

Configure `lcc/.vscode/launch.json` for the extension you install.

## Generated sources and LLDB

LLDB may fail to step into `yyparse` because it looks for `Parser.cpp`, `Parser.hpp` (from `Parser.y`) and `Lexer.cpp` (from `Lexer.l`) under the build tree (`lcc-build`) instead of `lcc/src/generated`.

Remap sources in LLDB:

```text
settings set target.source-map <build path> <src path>
```

Example:

```text
settings set target.source-map /Users/you/study-projects/lcc-build /Users/you/study-projects/lcc/src/generated
```

Adjust paths for your checkout layout.

Example `launch.json` args for a smoke compile, writing every artifact under `lcc-build/` — the paths the repo's own `.vscode/launch.json` uses. Do not point `-l` or `-v` into `lcc/debug/`: those files are committed goldens that `check-ir-opt.sh` diffs against, and only `./compile-tests.sh --release` should rewrite them. `-i` and `-o` are required; the rest are optional dumps:

```json
"args": [
  "-i", "${workspaceFolder}/tests/0.hello_world.c",
  "-o", "${workspaceFolder}/../lcc-build/0.hello_world.o",
  "-l", "${workspaceFolder}/../lcc-build/0.hello_world.debug.ll",
  "-v", "${workspaceFolder}/../lcc-build/0.hello_world.dot"
]
```

## Related docs

- [Architecture.md](Architecture.md) — `src/` file map and where to make a given change
- [Install.md](Install.md) — build modes, manual CMake, regenerating lexer/parser
- [ParserConflicts.md](ParserConflicts.md) — parser conflict reports and `Parser.output`
- [LearningPlan.md](LearningPlan.md) — active learning path (IR, optimization, backend; M0–M18)
- [FrontendNotes.md](FrontendNotes.md) — front-end language features (complete; historical detail)
- [Usage.md](Usage.md) — debugging **programs compiled by** `lcc` (not `lcc` itself)
