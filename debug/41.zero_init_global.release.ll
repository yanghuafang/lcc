; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%struct.Point = type { i32, i32 }

@g_scalar = local_unnamed_addr global i32 0
@g_arr = local_unnamed_addr global [4 x i32] zeroinitializer
@g_matrix = local_unnamed_addr global [2 x [3 x i32]] zeroinitializer
@g_ptr = local_unnamed_addr global ptr null
@g_point = local_unnamed_addr global %struct.Point zeroinitializer
@str = private unnamed_addr constant [27 x i8] c"41.zero_init_global.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [27 x i8] c"41.zero_init_global.c PASS\00", align 1

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @g_scalar, align 4
  %.not = icmp ne i32 %0, 0
  %1 = load i32, ptr @g_arr, align 4
  %.not49 = icmp ne i32 %1, 0
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_arr, i64 4), align 4
  %.not50 = icmp ne i32 %2, 0
  %3 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_arr, i64 8), align 4
  %.not52 = icmp ne i32 %3, 0
  %4 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_arr, i64 12), align 4
  %.not53 = icmp ne i32 %4, 0
  %5 = load i32, ptr @g_matrix, align 16
  %.not55 = icmp ne i32 %5, 0
  %6 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_matrix, i64 8), align 8
  %.not56 = icmp ne i32 %6, 0
  %7 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_matrix, i64 16), align 16
  %.not58 = icmp ne i32 %7, 0
  %8 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_matrix, i64 20), align 4
  %.not59 = icmp ne i32 %8, 0
  %9 = load ptr, ptr @g_ptr, align 8
  %.not61 = icmp ne ptr %9, null
  %10 = load i32, ptr @g_point, align 8
  %.not62 = icmp ne i32 %10, 0
  %11 = load i32, ptr getelementptr inbounds nuw (i8, ptr @g_point, i64 4), align 4
  %.not64 = icmp ne i32 %11, 0
  %12 = select i1 %.not64, i1 true, i1 %.not62
  %13 = select i1 %12, i1 true, i1 %.not61
  %14 = select i1 %13, i1 true, i1 %.not59
  %15 = select i1 %14, i1 true, i1 %.not58
  %16 = select i1 %15, i1 true, i1 %.not56
  %17 = select i1 %16, i1 true, i1 %.not55
  %18 = select i1 %17, i1 true, i1 %.not53
  %19 = select i1 %18, i1 true, i1 %.not52
  %20 = select i1 %19, i1 true, i1 %.not50
  %21 = select i1 %20, i1 true, i1 %.not49
  %narrow = select i1 %21, i1 true, i1 %.not
  %str.str.1 = select i1 %narrow, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %spec.store.select47 = zext i1 %narrow to i32
  ret i32 %spec.store.select47
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
