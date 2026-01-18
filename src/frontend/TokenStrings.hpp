#pragma once

#include <cstddef>
#include <string>

/// \file
/// Ownership of the text the lexer captures for IDENTIFIER and STRING tokens.
///
/// Bison's %union holds only trivial types, so a token's text has to reach the
/// grammar as a pointer, and something has to own what that points at.
///
/// The obvious answer does not work. `%destructor { delete $$; } <idVal>` looks
/// like it hands the job to Bison, but a %destructor runs only for a
/// *discarded* symbol — one popped during error recovery, or left on the stack
/// when the parse aborts. Nothing destroys a symbol that a successful reduction
/// consumed: in the generated parser, yydestruct is reachable only from the
/// error and cleanup labels, never from yyreduce. A clean parse therefore frees
/// nothing, and each identifier occurrence leaks its std::string.
///
/// Per-action `delete $N` would fix it, but the grammar mentions IDENTIFIER in
/// dozens of places, and every rule added later would have to remember. So
/// the front end owns the strings instead: the lexer allocates through
/// create(), the grammar actions copy the text into AST nodes (which hold
/// std::string by value), and the driver calls releaseAll() once the parse is
/// over. No rule owns anything, so no rule can leak.

/// \namespace tokenstrings
/// Owns the text the lexer captures for IDENTIFIER and STRING tokens.
namespace tokenstrings {

/// Allocate a token string that stays valid until releaseAll(). Never null.
std::string* create(const char* text, std::size_t length);

/// Allocate an empty token string to be filled in by the caller (the STRING
/// rule decodes escapes character by character).
std::string* createEmpty();

/// Free everything created since the last call. Safe to call when nothing is
/// outstanding. Call it once yyparse() has returned — win or lose — since the
/// AST holds copies of this text rather than pointers into it.
void releaseAll();

}  // namespace tokenstrings
