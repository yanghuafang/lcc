#pragma once

#include <cstddef>

/// \file
/// The front end's diagnostic funnel: where an error is reported, and how many
/// have been.
///
/// The counting half is the point. The lexer recovers from a malformed or
/// out-of-range literal by reporting it, substituting 0, and returning a valid
/// token -- which is what lets one run name every bad literal in a file rather
/// than stopping at the first. Nothing recorded that it had happened, though,
/// so yyparse() returned 0, codegen ran on the substituted values, and lcc
/// exited 0 having miscompiled the program it had just complained about.
///
/// yyerror is the one funnel every front-end diagnostic passes through: the
/// literal checks in frontend/Lexer.l, and every syntax error bison
/// raises. Counting there covers all of them, and covers a call site added
/// later without that site having to remember -- the same reasoning
/// frontend/TokenStrings.hpp gives for owning token text centrally, where no
/// rule owns anything so no rule can leak.
///
/// The driver reads errorCount() once yyparse() returns and refuses to compile
/// when it is non-zero; see the exit-code table in driver/main.cpp.

/// \namespace frontend
/// The front end's diagnostic funnel: where an error is reported, and how many
/// have been.
namespace frontend {

/// Report one front-end error on stderr. yyerror forwards here and is the only
/// thing that should call it, so that reporting and counting cannot drift
/// apart.
void reportError(const char* message);

/// How many reportError() calls this process has made.
[[nodiscard]] std::size_t errorCount() noexcept;

}  // namespace frontend
