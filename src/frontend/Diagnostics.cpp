#include "frontend/Diagnostics.hpp"

#include <iostream>

namespace frontend {
namespace {

// Function-local rather than a namespace-scope variable, for the reason
// frontend/TokenStrings.cpp holds its arena the same way: the count comes into
// existence on first use, so it needs no initialization order against anything
// else in the program -- including the lexer, which may report before main()
// has run a single statement of its own.
std::size_t& count() {
  static std::size_t errors = 0;
  return errors;
}

}  // namespace

void reportError(const char* message) {
  ++count();
  std::cerr << "ERROR: " << message << '\n';
}

std::size_t errorCount() noexcept { return count(); }

}  // namespace frontend
