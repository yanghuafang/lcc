; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gm = local_unnamed_addr global [3 x [4 x i32]] undef
@str = private unnamed_addr constant [24 x i8] c"33.array_2d_decl.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [24 x i8] c"33.array_2d_decl.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  store i32 10, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i64 0, i64 0, i64 0), align 16
  store i32 20, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i64 0, i64 1, i64 2), align 8
  store i32 30, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i64 0, i64 2, i64 3), align 4
  %0 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i64 0, i64 0, i64 1), align 4
  %.not81 = icmp eq i32 %0, 0
  %. = select i1 %.not81, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @str.1, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @str, i64 0, i64 0)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %not..not81 = xor i1 %.not81, true
  %err.8 = zext i1 %not..not81 to i32
  ret i32 %err.8
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
