; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = local_unnamed_addr global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = local_unnamed_addr global [2 x i32] [i32 10, i32 20]
@str = private unnamed_addr constant [30 x i8] c"31.array_1d_brace_init.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [30 x i8] c"31.array_1d_brace_init.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 0), align 4
  %.not = icmp ne i32 %0, 1
  %1 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 1), align 4
  %.not62 = icmp ne i32 %1, 2
  %2 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 2), align 4
  %.not63 = icmp ne i32 %2, 3
  %3 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i64 0, i64 3), align 4
  %.not64 = icmp ne i32 %3, 0
  %4 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i64 0, i64 0), align 4
  %.not65 = icmp ne i32 %4, 10
  %5 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i64 0, i64 1), align 4
  %.not66 = icmp ne i32 %5, 20
  %6 = select i1 %.not66, i1 true, i1 %.not65
  %7 = select i1 %6, i1 true, i1 %.not64
  %8 = select i1 %7, i1 true, i1 %.not63
  %9 = select i1 %8, i1 true, i1 %.not62
  %narrow = select i1 %9, i1 true, i1 %.not
  %. = select i1 %narrow, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str.1, i64 0, i64 0)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %err.14 = zext i1 %narrow to i32
  ret i32 %err.14
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
