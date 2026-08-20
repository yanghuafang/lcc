#pragma once

#include <string>

/// \file
/// Writes an assembled Graphviz DOT graph to disk for -v. The graph itself is
/// built by each AST node's genGraph() in dot/AstToDot.cpp; main concatenates
/// the fragments and passes the result here.
namespace dotfile {

void write(const std::string& fileName, const std::string& graph);

}  // namespace dotfile
