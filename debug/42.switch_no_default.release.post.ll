; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@str.1 = private unnamed_addr constant [28 x i8] c"42.switch_no_default.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 0, 21) i32 @grade(i32 %0) local_unnamed_addr #0 {
entry:
  %switch.selectcmp = icmp eq i32 %0, 2
  %switch.select = select i1 %switch.selectcmp, i32 20, i32 0
  %switch.selectcmp3 = icmp eq i32 %0, 1
  %switch.select4 = select i1 %switch.selectcmp3, i32 10, i32 %switch.select
  ret i32 %switch.select4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 100, 201) i32 @allReturn(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq i32 %0, 1
  %common.ret.op = select i1 %1, i32 100, i32 200
  ret i32 %common.ret.op
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end15:
  %puts26 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
