; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@g_scalar = local_unnamed_addr global i32 0
@g_arr = local_unnamed_addr global [4 x i32] zeroinitializer
@g_matrix = local_unnamed_addr global [2 x [3 x i32]] zeroinitializer
@g_ptr = local_unnamed_addr global i32* null
@str = private unnamed_addr constant [27 x i8] c"41.zero_init_global.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [27 x i8] c"41.zero_init_global.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @g_scalar, align 4
  %.not = icmp ne i32 %0, 0
  %1 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i64 0, i64 0), align 4
  %.not42 = icmp ne i32 %1, 0
  %2 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i64 0, i64 1), align 4
  %.not43 = icmp ne i32 %2, 0
  %3 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i64 0, i64 2), align 4
  %.not44 = icmp ne i32 %3, 0
  %4 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @g_arr, i64 0, i64 3), align 4
  %.not45 = icmp ne i32 %4, 0
  %5 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i64 0, i64 0, i64 0), align 16
  %.not46 = icmp ne i32 %5, 0
  %6 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i64 0, i64 0, i64 2), align 8
  %.not47 = icmp ne i32 %6, 0
  %7 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i64 0, i64 1, i64 1), align 16
  %.not48 = icmp ne i32 %7, 0
  %8 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @g_matrix, i64 0, i64 1, i64 2), align 4
  %.not49 = icmp ne i32 %8, 0
  %9 = load i32*, i32** @g_ptr, align 8
  %.not50 = icmp ne i32* %9, null
  %10 = select i1 %.not50, i1 true, i1 %.not49
  %11 = select i1 %10, i1 true, i1 %.not48
  %12 = select i1 %11, i1 true, i1 %.not47
  %13 = select i1 %12, i1 true, i1 %.not46
  %14 = select i1 %13, i1 true, i1 %.not45
  %15 = select i1 %14, i1 true, i1 %.not44
  %16 = select i1 %15, i1 true, i1 %.not43
  %17 = select i1 %16, i1 true, i1 %.not42
  %narrow = select i1 %17, i1 true, i1 %.not
  %. = select i1 %narrow, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.1, i64 0, i64 0)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %err.9 = zext i1 %narrow to i32
  ret i32 %err.9
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
