#include "frontend/Diagnostics.hpp"

#include <iostream>
#include <string>

namespace frontend {
namespace {

// Function-local rather than namespace-scope variables, for the reason
// frontend/TokenStrings.cpp holds its arena the same way: each comes into
// existence on first use, so neither needs an initialization order against
// anything else in the program -- including the lexer, which may report before
// main() has run a single statement of its own.
std::size_t& count() {
  static std::size_t errors = 0;
  return errors;
}

std::string& sourcePath() {
  static std::string path;
  return path;
}

}  // namespace

void setSourcePath(const std::string& path) { sourcePath() = path; }

void reportError(const char* message, int line, int column) {
  ++count();

  // Three shapes, narrowing as less is known: a full position, the file alone
  // when nothing has been read from it yet, and the bare message when the
  // driver has not named a file at all.
  if (!sourcePath().empty()) {
    std::cerr << sourcePath() << ':';
    if (line > 0) {
      std::cerr << line << ':' << column << ':';
    }
    std::cerr << ' ';
  }

  std::cerr << "error: " << message << '\n';
}

std::size_t errorCount() noexcept { return count(); }

}  // namespace frontend
