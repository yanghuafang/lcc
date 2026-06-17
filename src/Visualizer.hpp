#pragma once

#include <string>

class Visualizer {
 public:
  static void dumpAbstractSyntaxTree(const std::string& fileName,
                                     const std::string& graph);
};
