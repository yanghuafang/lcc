; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@ga = local_unnamed_addr global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = local_unnamed_addr global [3 x i8] c"hi\00"
@gt = local_unnamed_addr global [4 x i8] c"hey\00"
@str = private unnamed_addr constant [40 x i8] c"32.array_1d_inferred_string_init.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [40 x i8] c"32.array_1d_inferred_string_init.c PASS\00", align 1

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @ga, align 16
  %.not = icmp ne i32 %0, 10
  %1 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 4), align 4
  %.not98 = icmp ne i32 %1, 7
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 8), align 8
  %.not99 = icmp ne i32 %2, 8
  %3 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 12), align 4
  %.not100 = icmp ne i32 %3, 9
  %4 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 16), align 16
  %.not101 = icmp ne i32 %4, 1
  %5 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 20), align 4
  %.not102 = icmp ne i32 %5, 5
  %6 = load i8, ptr @gs, align 1
  %.not103 = icmp ne i8 %6, 104
  %7 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 1), align 1
  %.not104 = icmp ne i8 %7, 105
  %8 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 2), align 1
  %.not105 = icmp ne i8 %8, 0
  %9 = load i8, ptr @gt, align 1
  %.not106 = icmp ne i8 %9, 104
  %10 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gt, i64 1), align 1
  %.not107 = icmp ne i8 %10, 101
  %11 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gt, i64 2), align 1
  %.not108 = icmp ne i8 %11, 121
  %12 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gt, i64 3), align 1
  %.not109 = icmp ne i8 %12, 0
  %13 = select i1 %.not109, i1 true, i1 %.not108
  %14 = select i1 %13, i1 true, i1 %.not107
  %15 = select i1 %14, i1 true, i1 %.not106
  %16 = select i1 %15, i1 true, i1 %.not105
  %17 = select i1 %16, i1 true, i1 %.not104
  %18 = select i1 %17, i1 true, i1 %.not103
  %19 = select i1 %18, i1 true, i1 %.not102
  %20 = select i1 %19, i1 true, i1 %.not101
  %21 = select i1 %20, i1 true, i1 %.not100
  %22 = select i1 %21, i1 true, i1 %.not99
  %23 = select i1 %22, i1 true, i1 %.not98
  %narrow116 = select i1 %23, i1 true, i1 %.not
  %str.str.1 = select i1 %narrow116, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.23 = zext i1 %narrow116 to i32
  ret i32 %err.23
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
