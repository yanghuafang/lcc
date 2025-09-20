; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = local_unnamed_addr global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = local_unnamed_addr global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = local_unnamed_addr global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@gd = local_unnamed_addr global [2 x [2 x i32]] zeroinitializer
@str = private unnamed_addr constant [30 x i8] c"34.array_2d_brace_init.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [30 x i8] c"34.array_2d_brace_init.c PASS\00", align 1

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @ga, align 16
  %.not = icmp ne i32 %0, 1
  %1 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 20), align 4
  %.not98 = icmp ne i32 %1, 6
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gb, i64 4), align 4
  %.not99 = icmp ne i32 %2, 1
  %3 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gb, i64 12), align 4
  %.not100 = icmp ne i32 %3, 3
  %4 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gc, i64 4), align 4
  %.not101 = icmp ne i32 %4, 11
  %5 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gc, i64 8), align 4
  %.not102 = icmp ne i32 %5, 20
  %6 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gc, i64 12), align 4
  %.not103 = icmp ne i32 %6, 0
  %7 = load i32, ptr @gd, align 4
  %.not104 = icmp ne i32 %7, 0
  %8 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gd, i64 4), align 4
  %.not105 = icmp ne i32 %8, 0
  %9 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gd, i64 8), align 4
  %.not106 = icmp ne i32 %9, 0
  %10 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gd, i64 12), align 4
  %.not107 = icmp ne i32 %10, 0
  %11 = select i1 %.not107, i1 true, i1 %.not106
  %12 = select i1 %11, i1 true, i1 %.not105
  %13 = select i1 %12, i1 true, i1 %.not104
  %14 = select i1 %13, i1 true, i1 %.not103
  %15 = select i1 %14, i1 true, i1 %.not102
  %16 = select i1 %15, i1 true, i1 %.not101
  %17 = select i1 %16, i1 true, i1 %.not100
  %18 = select i1 %17, i1 true, i1 %.not99
  %19 = select i1 %18, i1 true, i1 %.not98
  %narrow113 = select i1 %19, i1 true, i1 %.not
  %str.str.1 = select i1 %narrow113, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.23 = zext i1 %narrow113 to i32
  ret i32 %err.23
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
