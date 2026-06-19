; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = local_unnamed_addr global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = local_unnamed_addr global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = local_unnamed_addr global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@str = private unnamed_addr constant [30 x i8] c"34.array_2d_brace_init.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [30 x i8] c"34.array_2d_brace_init.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i64 0, i64 0, i64 0), align 16
  %.not = icmp ne i32 %0, 1
  %1 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i64 0, i64 1, i64 2), align 4
  %.not66 = icmp ne i32 %1, 6
  %2 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i64 0, i64 0, i64 1), align 4
  %.not67 = icmp ne i32 %2, 1
  %3 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i64 0, i64 1, i64 0), align 4
  %.not68 = icmp ne i32 %3, 3
  %4 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i64 0, i64 0, i64 1), align 4
  %.not69 = icmp ne i32 %4, 11
  %5 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i64 0, i64 1, i64 0), align 4
  %.not70 = icmp ne i32 %5, 20
  %6 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i64 0, i64 1, i64 1), align 4
  %.not71 = icmp ne i32 %6, 0
  %7 = select i1 %.not71, i1 true, i1 %.not70
  %8 = select i1 %7, i1 true, i1 %.not69
  %9 = select i1 %8, i1 true, i1 %.not68
  %10 = select i1 %9, i1 true, i1 %.not67
  %11 = select i1 %10, i1 true, i1 %.not66
  %narrow75 = select i1 %11, i1 true, i1 %.not
  %. = select i1 %narrow75, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str.1, i64 0, i64 0)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %err.15 = zext i1 %narrow75 to i32
  ret i32 %err.15
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
