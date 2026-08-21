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
    // Reported, not thrown: main wraps this call in a try/catch that returns
    // exit 5, so an unwritable path here still prints success and exits 0.
    // See the exit-code table in driver/main.cpp.
    std::cerr << "Failed to open file " << fileName << '\n';
  }
}

}  // namespace dotfile
