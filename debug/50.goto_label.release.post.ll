; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@str.1 = private unnamed_addr constant [21 x i8] c"50.goto_label.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 1, -2147483648) i32 @countTo(i32 %0) local_unnamed_addr #0 {
entry:
  %smax = tail call i32 @llvm.smax.i32(i32 %0, i32 1)
  ret i32 %smax
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 1, 3) i32 @skip(i32 %0) local_unnamed_addr #0 {
entry:
  %.not = icmp eq i32 %0, 0
  %spec.store.select = select i1 %.not, i32 2, i32 1
  ret i32 %spec.store.select
}

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @firstPair(i32 %0, i32 %1) local_unnamed_addr #1 {
entry:
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %while.loop2.lr.ph, label %label.out

while.loop2.lr.ph:                                ; preds = %entry, %while.end
  %i.018 = phi i32 [ %7, %while.end ], [ 0, %entry ]
  %3 = mul i32 %i.018, 10
  br label %while.loop2

while.cond1:                                      ; preds = %while.loop2
  %4 = add nuw nsw i32 %j.017, 1
  %exitcond.not = icmp eq i32 %4, %0
  br i1 %exitcond.not, label %while.end, label %while.loop2

while.loop2:                                      ; preds = %while.loop2.lr.ph, %while.cond1
  %j.017 = phi i32 [ 0, %while.loop2.lr.ph ], [ %4, %while.cond1 ]
  %5 = add i32 %j.017, %3
  %6 = icmp eq i32 %5, %1
  br i1 %6, label %label.out, label %while.cond1

while.end:                                        ; preds = %while.cond1
  %7 = add nuw nsw i32 %i.018, 1
  %exitcond21.not = icmp eq i32 %7, %0
  br i1 %exitcond21.not, label %label.out, label %while.loop2.lr.ph

label.out:                                        ; preds = %while.end, %while.loop2, %entry
  %found.0 = phi i32 [ -1, %entry ], [ %1, %while.loop2 ], [ -1, %while.end ]
  ret i32 %found.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 1, 3) i32 @afterReturn(i32 %0) local_unnamed_addr #0 {
entry:
  %.not = icmp eq i32 %0, 0
  %common.ret.op = select i1 %.not, i32 1, i32 2
  ret i32 %common.ret.op
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 0, 21) i32 @fromSwitch(i32 %0) local_unnamed_addr #0 {
entry:
  %switch.selectcmp = icmp eq i32 %0, 2
  %switch.select = select i1 %switch.selectcmp, i32 20, i32 0
  %switch.selectcmp1 = icmp eq i32 %0, 1
  %switch.select2 = select i1 %switch.selectcmp1, i32 10, i32 %switch.select
  ret i32 %switch.select2
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #2 {
common.ret:
  %puts38 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree norecurse nosync nounwind memory(none) }
attributes #2 = { nofree nounwind }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
