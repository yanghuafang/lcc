# Developing and debugging `lcc`

## Debug `lcc` in VS Code

Use Visual Studio Code to edit and debug the compiler binary (`../../lcc-build/lcc`).

Two LLDB debugger extensions work:

| Extension | Marketplace identifier | `launch.json` `"type"` |
|-----------|------------------------|-------------------------|
| LLDB DAP | `llvm-vs-code-extensions.lldb-dap` | `lldb-dap` |
| CodeLLDB | `vadimcn.vscode-lldb` | `lldb` |

Configure `lcc/.vscode/launch.json` for the extension you install.

## Generated sources and LLDB

LLDB may fail to step into `yyparse` because it looks for `Parser.cpp`, `Parser.hpp` (from `Parser.y`) and `Lexer.cpp` (from `Lexer.l`) under the build tree (`lcc-build`) instead of `lcc/src`.

Remap sources in LLDB:

```text
settings set target.source-map <build path> <src path>
```

Example:

```text
settings set target.source-map /Users/you/study-projects/lcc-build /Users/you/study-projects/lcc/src
```

Adjust paths for your checkout layout.

Example `launch.json` args for a smoke compile (IR and AST under `lcc/debug/`, object under `lcc-build/`):

```json
"-l", "${workspaceFolder}/debug/0.hello_world.debug.ll",
"-v", "${workspaceFolder}/debug/0.hello_world.dot"
```

## Related docs

- [Install.md](Install.md) — build modes, manual CMake, regenerating lexer/parser
- [Conflicts.md](Conflicts.md) — parser conflict reports and `Parser.output`
- [Roadmap.md](Roadmap.md) — planned language and codegen extensions
- [Usage.md](Usage.md) — debugging **programs compiled by** `lcc` (not `lcc` itself)
