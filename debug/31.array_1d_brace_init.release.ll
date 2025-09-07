; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@ga = local_unnamed_addr global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = local_unnamed_addr global [2 x i32] [i32 10, i32 20]
@gc = local_unnamed_addr global [3 x i32] zeroinitializer
@str = private unnamed_addr constant [30 x i8] c"31.array_1d_brace_init.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [30 x i8] c"31.array_1d_brace_init.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 0), align 4
  %.not = icmp ne i32 %0, 1
  %1 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 1), align 4
  %.not74 = icmp ne i32 %1, 2
  %2 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 2), align 4
  %.not75 = icmp ne i32 %2, 3
  %3 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 3), align 4
  %.not76 = icmp ne i32 %3, 0
  %4 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i64 0, i64 0), align 4
  %.not77 = icmp ne i32 %4, 10
  %5 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i64 0, i64 1), align 4
  %.not78 = icmp ne i32 %5, 20
  %6 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @gc, i64 0, i64 0), align 4
  %.not79 = icmp ne i32 %6, 0
  %7 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @gc, i64 0, i64 1), align 4
  %.not80 = icmp ne i32 %7, 0
  %8 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @gc, i64 0, i64 2), align 4
  %.not81 = icmp ne i32 %8, 0
  %9 = select i1 %.not81, i1 true, i1 %.not80
  %10 = select i1 %9, i1 true, i1 %.not79
  %11 = select i1 %10, i1 true, i1 %.not78
  %12 = select i1 %11, i1 true, i1 %.not77
  %13 = select i1 %12, i1 true, i1 %.not76
  %14 = select i1 %13, i1 true, i1 %.not75
  %15 = select i1 %14, i1 true, i1 %.not74
  %narrow86 = select i1 %15, i1 true, i1 %.not
  %. = select i1 %narrow86, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str.1, i64 0, i64 0)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %err.17 = zext i1 %narrow86 to i32
  ret i32 %err.17
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
