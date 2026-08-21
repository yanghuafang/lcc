#pragma once

#include <cstddef>
#include <string>

/// \file
/// The front end's diagnostic funnel: where an error is reported, where it
/// happened, and how many have been.
///
/// The counting half is what makes a diagnostic more than a message. The lexer
/// recovers from a malformed or out-of-range literal by reporting it,
/// substituting 0, and returning a valid token -- which is what lets one run
/// name every bad literal in a file rather than stopping at the first. Nothing
/// recorded that it had happened, though, so yyparse() returned 0, codegen ran
/// on the substituted values, and lcc exited 0 having miscompiled the program
/// it had just complained about.
///
/// yyerror is the one funnel every front-end diagnostic passes through: the
/// thirteen literal checks in frontend/Lexer.l, and every syntax error bison
/// raises. Counting there covers all of them, and covers a call site added
/// later without that site having to remember -- the same reasoning
/// frontend/TokenStrings.hpp gives for owning token text centrally, where no
/// rule owns anything so no rule can leak. It is also why every one of them
/// gained a source location at once: yyerror reads yylloc, so no call site
/// passes a position of its own.
///
/// The driver reads errorCount() once yyparse() returns and refuses to compile
/// when it is non-zero; see the exit-code table in driver/main.cpp.
namespace frontend {

/// The path diagnostics name. The driver sets it once before yyparse, since
/// the front end reads its source through stdin and so never learns the name
/// on its own.
void setSourcePath(const std::string& path);

/// Report one front-end error on stderr as `file:line:column: error: message`
/// -- the shape clang and gcc emit, which editors and CI log parsers already
/// know how to jump from. yyerror forwards here and is the only thing that
/// should call it, so that reporting and counting cannot drift apart.
///
/// A line of 0 or less means no token had been read yet; the position is left
/// off rather than printed as a location that does not exist.
void reportError(const char* message, int line, int column);

/// How many reportError() calls this process has made.
[[nodiscard]] std::size_t errorCount() noexcept;

}  // namespace frontend
