; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@gm = local_unnamed_addr global [3 x [4 x i32]] undef
@str = private unnamed_addr constant [24 x i8] c"33.array_2d_decl.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [24 x i8] c"33.array_2d_decl.c PASS\00", align 1

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
entry:
  store i32 10, ptr @gm, align 16
  store i32 20, ptr getelementptr inbounds nuw (i8, ptr @gm, i64 24), align 8
  store i32 30, ptr getelementptr inbounds nuw (i8, ptr @gm, i64 44), align 4
  %0 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gm, i64 4), align 4
  %.not81 = icmp ne i32 %0, 0
  %str.str.1 = select i1 %.not81, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.8 = zext i1 %.not81 to i32
  ret i32 %err.8
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
