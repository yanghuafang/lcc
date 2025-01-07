#include <stdio.h>

#include <argparse/argparse.hpp>
#include <iostream>

#include "AbstractSyntaxTree.hpp"
#include "CodeGenerator.hpp"
#include "Utils.hpp"

extern int yyparse();

extern AST::Program* g_root;

int main(int argc, char* argv[]) {
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
      .help("output LLVM IR file.");
  parser.add_argument("-g", "--generate-debug-info")
      .default_value(false)
      .implicit_value(true)
      .help("generate debug info with object file.");

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
    std::cerr << e.what() << std::endl;
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

  // Compiling...

  // Open input source file.
  FILE* p = freopen(parser.get<std::string>("-i").c_str(), "r", stdin);
  if (p == NULL) {
    std::cerr << "Failed to open C source file "
              << parser.get<std::string>("-i") << std::endl;
    return 3;
  }

  //  Lex & Syntax parsing.
  int ret = yyparse();
  if (ret != 0) {
    std::cerr << "yyparse failed with ret " << ret << std::endl;
    return 4;
  }

  fclose(p);
  p = NULL;

  // Generate AST file of GraphViz DOT format for visualization.
  try {
    if (!parser.get<std::string>("-v").empty()) {
      std::pair<std::string, std::string> tree = g_root->genGraph();
      std::string graph = "digraph {\n" + tree.second + "}\n";
      Utils::dumpAbstractSyntaxTree(parser.get<std::string>("-v"), graph);
      std::cout << "Generated AST graph file successfully!" << std::endl;
    }
  } catch (std::exception& e) {
    std::cerr << "Failed to generate AST graph file!" << std::endl;
    std::cerr << e.what() << std::endl;
    return 5;
  }

  // Semantic analysis.
  CodeGenerator generator;

  // Generate LLVM IR code.
  try {
    generator.genIrCode(g_root, optimizationLevel);
    std::cout << "Generated IR code successfully!" << std::endl;
  } catch (std::exception& e) {
    std::cerr << "Failed to generate IR code!" << std::endl;
    std::cerr << e.what() << std::endl;
    return 6;
  }

  // Generate object file.
  try {
    generator.genObjectCode(parser.get<std::string>("-o"));
    std::cout << "Generated object code successfully!" << std::endl;
  } catch (std::exception& e) {
    std::cerr << "Failed to generate object code!" << std::endl;
    std::cerr << e.what() << std::endl;
    return 7;
  }

  // Generate LLVM IR file.
  try {
    if (!parser.get<std::string>("-l").empty()) {
      generator.dumpIrCode(parser.get<std::string>("-l"));
      std::cout << "Dump IR code successfully!" << std::endl;
    }
  } catch (std::exception& e) {
    std::cerr << "Failed to dump IR code!" << std::endl;
    std::cerr << e.what() << std::endl;
    return 8;
  }

  std::cout << "lcc compiled " << parser.get<std::string>("-i")
            << " successfully!" << std::endl;
  return 0;
}
