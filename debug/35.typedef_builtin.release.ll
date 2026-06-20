; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [26 x i8] c"35.typedef_builtin.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @helper(i64 %0, i32 %1, ptr nocapture writeonly initializes((0, 4)) %2) local_unnamed_addr #0 {
entry:
  %3 = trunc i64 %0 to i32
  %4 = add i32 %1, %3
  store i32 %4, ptr %2, align 4
  ret void
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end9:
  %puts17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { nofree nounwind }
