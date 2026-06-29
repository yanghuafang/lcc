; ModuleID = 'lcc'
source_filename = "lcc"

@ga = local_unnamed_addr global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = local_unnamed_addr global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = local_unnamed_addr global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@str = private unnamed_addr constant [30 x i8] c"34.array_2d_brace_init.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [30 x i8] c"34.array_2d_brace_init.c PASS\00", align 1

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @ga, align 16
  %.not = icmp ne i32 %0, 1
  %1 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ga, i64 20), align 4
  %.not66 = icmp ne i32 %1, 6
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gb, i64 4), align 4
  %.not67 = icmp ne i32 %2, 1
  %3 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gb, i64 12), align 4
  %.not68 = icmp ne i32 %3, 3
  %4 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gc, i64 4), align 4
  %.not69 = icmp ne i32 %4, 11
  %5 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gc, i64 8), align 4
  %.not70 = icmp ne i32 %5, 20
  %6 = load i32, ptr getelementptr inbounds nuw (i8, ptr @gc, i64 12), align 4
  %.not71 = icmp ne i32 %6, 0
  %7 = select i1 %.not71, i1 true, i1 %.not70
  %8 = select i1 %7, i1 true, i1 %.not69
  %9 = select i1 %8, i1 true, i1 %.not68
  %10 = select i1 %9, i1 true, i1 %.not67
  %11 = select i1 %10, i1 true, i1 %.not66
  %narrow75 = select i1 %11, i1 true, i1 %.not
  %str.str.1 = select i1 %narrow75, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.15 = zext i1 %narrow75 to i32
  ret i32 %err.15
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
