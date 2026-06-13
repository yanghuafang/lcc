; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@g3 = local_unnamed_addr global [2 x [3 x [4 x i32]]] zeroinitializer
@g4 = local_unnamed_addr global [2 x [2 x [2 x [2 x i32]]]] zeroinitializer
@str = private unnamed_addr constant [19 x i8] c"46.array_3d.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [19 x i8] c"46.array_3d.c PASS\00", align 1

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
entry:
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @g3, i64 92), align 4
  %0 = load i32, ptr @g3, align 16
  %.not128 = icmp ne i32 %0, 0
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @g4, i64 60), align 4
  %str.str.1 = select i1 %.not128, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.6 = zext i1 %.not128 to i32
  ret i32 %err.6
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
