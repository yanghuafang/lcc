#include "frontend/TokenStrings.hpp"

#include <memory>
#include <vector>

namespace tokenstrings {
namespace {

// One translation unit's worth of token text.
//
// The indirection through unique_ptr is load-bearing: the parser holds raw
// pointers into this arena for as long as the parse runs, and a plain
// vector<std::string> would move its elements out from under them when it
// grows. Holding pointers keeps every std::string at a fixed address no matter
// how often the vector reallocates.
std::vector<std::unique_ptr<std::string>>& pool() {
  static std::vector<std::unique_ptr<std::string>> strings;
  return strings;
}

}  // namespace

std::string* create(const char* text, std::size_t length) {
  pool().push_back(std::make_unique<std::string>(text, length));
  return pool().back().get();
}

std::string* createEmpty() {
  pool().push_back(std::make_unique<std::string>());
  return pool().back().get();
}

void releaseAll() {
  pool().clear();
  pool().shrink_to_fit();
}

}  // namespace tokenstrings
