#include <llvm/Support/ManagedStatic.h>

#include <argparse/argparse.hpp>
#include <cstdio>
#include <iostream>

#include "ast/Nodes.hpp"
#include "backend/TargetBackend.hpp"
#include "dot/DotFileWriter.hpp"
#include "driver/Pipeline.hpp"
#include "frontend/TokenStrings.hpp"
#include "irgen/CodeGenerator.hpp"

// lcc's entry point: parse the command line, then hand off to driver/Pipeline
// for the actual compilation. Everything here is CLI concerns — nothing in this
// file knows how a C construct becomes IR.
//
// The front end is reached through two globals rather than a function call,
// because that is bison's interface: yyparse() reads from stdin (main freopens
// the -i file onto it) and leaves the finished tree in g_root. Both are defined
// in the generated parser.
//
// == Exit codes ==
//
// The test scripts distinguish these, so they are a real interface and should
// not be renumbered casually. Each one names the stage that failed:
//
//   0  success
//   1  no arguments — help text printed to stdout, not an error
//   2  bad command line: unparseable flags, or -O-passes combined with -O0..Oz
//   3  cannot open the -i source file
//   4  lex/parse failed (yyparse returned non-zero)
//   5  writing the -v AST graph failed
//   6  IR generation or the middle end failed — including an unresolvable
//      --target, since the module is configured for its target before the AST
//      walk begins (sizeof and DWARF offsets both need the data layout)
//   7  object emission failed
//   8  writing the -l IR dump failed
//   9  assembly emission failed
//
// The ordering of stages 7-9 is deliberate and not obvious: -l is dumped after
// the object file, but before the optional -S, since legacy-PM codegen mutates
// the module as it lowers. The IR dumped after -S is not the IR the object was
// built from.

extern int yyparse();

extern AST::Program* g_root;

namespace {

// Frees g_root after compile; must outlive CodeGenerator, which stores
// non-owning AST::VarType* pointers in symbol tables during genIrCode.
class AstRootOwner {
 public:
  ~AstRootOwner() {
    delete g_root;
    g_root = nullptr;
  }
};

}  // namespace

int main(int argc, char* argv[]) {
  // Tears down LLVM's ManagedStatic registries — the legacy pass registry that
  // TargetBackend's PassManager populates, and the command-line option table
  // inside libLLVM — on the way out. LLVM allocates these lazily on first use
  // and never frees them itself, so without this they are still reachable-but
  // -owned-by-nobody at exit, which is what LeakSanitizer reports.
  //
  // Declared before every other local in main so it is destroyed *last*: the
  // registries must outlive CodeGenerator's LLVMContext and the AST, and
  // shutting them down while LLVM objects are still alive is undefined. Being
  // first also covers the early `return` paths below, which RAII would
  // otherwise be the only thing to catch.
  //
  // This does not free everything LLVM allocates — only the ManagedStatic set.
  // Anything owned by an LLVMContext is freed when that context is destroyed.
  llvm::llvm_shutdown_obj shutdown;

  // Arguments parsing...

  argparse::ArgumentParser parser("lcc");
  parser.add_argument("-i", "--input-source-file")
      .required()
      .help("input C source file.");
  parser.add_argument("-o", "--output-object-file")
      .required()
      .help("output compiled object file.");
  parser.add_argument("-v", "--output-ast-graph-file")
      .default_value("")
      .help("output AST graph file.");
  parser.add_argument("-l", "--output-llvm-ir-file")
      .default_value("")
      .help(
          "output LLVM IR file (after object emission; test scripts use "
          "this).");
  parser.add_argument("-l-pre-opt", "--output-llvm-ir-pre-opt-file")
      .default_value("")
      .help("output LLVM IR immediately after codegen, before optimization.");
  parser.add_argument("-l-post-opt", "--output-llvm-ir-post-opt-file")
      .default_value("")
      .help("output LLVM IR after optimization (or after debug info when -g).");
  parser.add_argument("-g", "--generate-debug-info")
      .default_value(false)
      .implicit_value(true)
      .help("generate debug info with object file.");
  parser.add_argument("-ir-stats", "--ir-instruction-stats-file")
      .default_value("")
      .help(
          "write load/store/call counts to FILE (use - for stderr); omit to "
          "disable.");
  parser.add_argument("-fold-add-zero", "--fold-add-zero")
      .default_value(false)
      .implicit_value(true)
      .help("fold add iN %x, 0 to %x before LLVM opts (M7 teaching pass).");
  parser.add_argument("-O-passes", "--optimization-passes")
      .default_value("")
      .help(
          "explicit LLVM New PM pipeline (mutually exclusive with -O0..Oz; "
          "preset: O2-peephole = mem2reg,instcombine,simplifycfg).");
  parser.add_argument("-S", "--emit-assembly")
      .default_value("")
      .help("write assembly to FILE.");
  parser.add_argument("--target")
      .default_value("")
      .help("LLVM target triple (default: host).");
  parser.add_argument("-mcpu").default_value("generic").help(
      "target CPU for codegen (default: generic).");
  parser.add_argument("-mattr").default_value("").help(
      "target features for codegen, e.g. +avx2,-sse4.1");
  parser.add_argument("-machine-stats", "--machine-instruction-stats-file")
      .default_value("")
      .help(
          "write machine-instruction counts (final MIR) to FILE (use - for "
          "stderr); M17 legacy MachineFunctionPass. Omit to disable.");

  auto& optimizationGroup = parser.add_mutually_exclusive_group();
  optimizationGroup.add_argument("-O0")
      .default_value(std::string{""})
      .implicit_value(std::string{"O0"})
      .help("Optimization level O0.");
  optimizationGroup.add_argument("-O1")
      .default_value(std::string{""})
      .implicit_value(std::string{"O1"})
      .help("Optimization level O1.");
  optimizationGroup.add_argument("-O2")
      .default_value(std::string{""})
      .implicit_value(std::string{"O2"})
      .help("Optimization level O2.");
  optimizationGroup.add_argument("-O3")
      .default_value(std::string{""})
      .implicit_value(std::string{"O3"})
      .help("Optimization level O3.");
  optimizationGroup.add_argument("-Os")
      .default_value(std::string{""})
      .implicit_value(std::string{"Os"})
      .help("Optimization level Os.");
  optimizationGroup.add_argument("-Oz")
      .default_value(std::string{""})
      .implicit_value(std::string{"Oz"})
      .help("Optimization level Oz.");

  if (argc == 1) {
    std::cout << parser.help().str();
    return 1;
  }

  try {
    parser.parse_args(argc, argv);
  } catch (std::exception& e) {
    std::cerr << e.what() << '\n';
    return 2;
  }

  std::string optimizationLevel;
  if (!parser.get<std::string>("-O0").empty()) {
    optimizationLevel = parser.get<std::string>("-O0");
  } else if (!parser.get<std::string>("-O1").empty()) {
    optimizationLevel = parser.get<std::string>("-O1");
  } else if (!parser.get<std::string>("-O2").empty()) {
    optimizationLevel = parser.get<std::string>("-O2");
  } else if (!parser.get<std::string>("-O3").empty()) {
    optimizationLevel = parser.get<std::string>("-O3");
  } else if (!parser.get<std::string>("-Os").empty()) {
    optimizationLevel = parser.get<std::string>("-Os");
  } else if (!parser.get<std::string>("-Oz").empty()) {
    optimizationLevel = parser.get<std::string>("-Oz");
  } else {
    optimizationLevel = "";
  }

  const auto customPipeline = parser.get<std::string>("-O-passes");
  if (!customPipeline.empty() && !optimizationLevel.empty()) {
    std::cerr << "Cannot use -O-passes with -O0..Oz (mutually exclusive)."
              << '\n';
    return 2;
  }

  // Compile: lex/parse -> AST, then single-pass codegen (types resolved during
  // genCode(), not in a separate semantic-analysis pass).

  // Open input source file.
  FILE* p = freopen(parser.get<std::string>("-i").c_str(), "r", stdin);
  if (p == nullptr) {
    std::cerr << "Failed to open C source file "
              << parser.get<std::string>("-i") << '\n';
    return 3;
  }

  // Lex & syntax parsing.
  int ret = yyparse();

  // The lexer allocates one string per IDENTIFIER/STRING token from an arena,
  // because Bison frees a token value only when it discards one — never when a
  // reduction consumes it. The grammar actions have copied everything they need
  // into the AST by now, so the arena goes back here, on both paths.
  tokenstrings::releaseAll();

  if (ret != 0) {
    fclose(p);
    p = nullptr;
    delete g_root;
    g_root = nullptr;
    std::cerr << "yyparse failed with ret " << ret << '\n';
    return 4;
  }

  AstRootOwner astRootOwner;

  fclose(p);
  p = nullptr;

  // Generate AST file of GraphViz DOT format for visualization.
  try {
    if (!parser.get<std::string>("-v").empty()) {
      std::pair<std::string, std::string> tree = g_root->genGraph();
      std::string graph = "digraph {\n" + tree.second + "}\n";
      dotfile::write(parser.get<std::string>("-v"), graph);
      std::cout << "Generated AST graph file successfully!" << '\n';
    }
  } catch (std::exception& e) {
    std::cerr << "Failed to generate AST graph file!" << '\n';
    std::cerr << e.what() << '\n';
    return 5;
  }

  // Code generation: walk AST via genCode(); symbol lookup and type info
  // (getExprTypeId / getExprVarType) happen on demand while emitting IR.
  CodeGenerator generator;

  // Built before genIr, not just before emission: the target's data layout
  // decides what sizeof answers and where DWARF puts struct members, so the
  // module has to know its target before the AST walk starts.
  TargetBackendOptions backendOptions;
  backendOptions.triple = parser.get<std::string>("--target");
  backendOptions.cpu = parser.get<std::string>("-mcpu");
  backendOptions.features = parser.get<std::string>("-mattr");
  backendOptions.optimizationLevel = optimizationLevel;
  backendOptions.machineStatsPath = parser.get<std::string>("-machine-stats");

  pipeline::IrCodeGenOptions irCodeGenOptions;
  irCodeGenOptions.optimizationLevel = optimizationLevel;
  irCodeGenOptions.generateDebugInfo = parser.get<bool>("-g");
  irCodeGenOptions.sourcePath = parser.get<std::string>("-i");
  irCodeGenOptions.preOptIrPath = parser.get<std::string>("-l-pre-opt");
  irCodeGenOptions.postOptIrPath = parser.get<std::string>("-l-post-opt");
  irCodeGenOptions.irStatsPath = parser.get<std::string>("-ir-stats");
  irCodeGenOptions.foldAddZero = parser.get<bool>("-fold-add-zero");
  irCodeGenOptions.customPipeline = customPipeline;
  try {
    pipeline::genIr(generator, g_root, irCodeGenOptions, backendOptions);
    std::cout << "Generated IR code successfully!" << '\n';
    if (!parser.get<std::string>("-l-pre-opt").empty()) {
      std::cout << "Dumped pre-optimization IR to "
                << parser.get<std::string>("-l-pre-opt") << '\n';
    }
    if (!parser.get<std::string>("-l-post-opt").empty()) {
      std::cout << "Dumped post-optimization IR to "
                << parser.get<std::string>("-l-post-opt") << '\n';
    }
  } catch (std::exception& e) {
    std::cerr << "Failed to generate IR code!" << '\n';
    std::cerr << e.what() << '\n';
    return 6;
  }

  try {
    pipeline::emitObject(generator.getModule(), parser.get<std::string>("-o"),
                         backendOptions);
    std::cout << "Generated object code successfully!" << '\n';
  } catch (std::exception& e) {
    std::cerr << "Failed to generate object code!" << '\n';
    std::cerr << e.what() << '\n';
    return 7;
  }

  // Final LLVM IR dump (-l): immediately after object emission so target
  // triple/data layout match committed debug/*.ll artifacts. Must run before
  // optional -S; legacy PM codegen mutates the in-memory module.
  try {
    if (!parser.get<std::string>("-l").empty()) {
      pipeline::dumpIr(generator.getModule(), parser.get<std::string>("-l"));
      std::cout << "Dump IR code successfully!" << '\n';
    }
  } catch (std::exception& e) {
    std::cerr << "Failed to dump IR code!" << '\n';
    std::cerr << e.what() << '\n';
    return 8;
  }

  try {
    if (!parser.get<std::string>("-S").empty()) {
      pipeline::emitAssembly(generator.getModule(),
                             parser.get<std::string>("-S"), backendOptions);
      std::cout << "Generated assembly successfully!" << '\n';
    }
  } catch (std::exception& e) {
    std::cerr << "Failed to generate assembly!" << '\n';
    std::cerr << e.what() << '\n';
    return 9;
  }

  std::cout << "lcc compiled " << parser.get<std::string>("-i")
            << " successfully!" << '\n';
  return 0;
}
