#pragma once

#include <string>

// Writes Graphviz DOT for the parsed AST. Each node implements genGraph()
// returning (rootId, dotFragment); main assembles the full graph and calls here.
class Visualizer {
 public:
  static void dumpAbstractSyntaxTree(const std::string& fileName,
                                     const std::string& graph);
};
