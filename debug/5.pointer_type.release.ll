; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@gc = local_unnamed_addr global i8 97
@gi = local_unnamed_addr global i32 1024
@str.1 = private unnamed_addr constant [22 x i8] c"5.pointer_type.c PASS\00", align 1

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
if.end21:
  store i8 98, ptr @gc, align 1
  store i32 2048, ptr @gi, align 4
  %puts40 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
