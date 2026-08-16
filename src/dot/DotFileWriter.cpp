#include "dot/DotFileWriter.hpp"

#include <fstream>
#include <iostream>

namespace dotfile {

void write(const std::string& fileName, const std::string& graph) {
  if (fileName.empty()) {
    return;
  }

  std::ofstream graphFile(fileName);
  if (graphFile.is_open()) {
    graphFile << graph;
  } else {
    std::cerr << "Failed to open file " << fileName << '\n';
  }
}

}  // namespace dotfile
