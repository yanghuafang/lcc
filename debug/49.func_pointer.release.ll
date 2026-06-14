; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@chosen = local_unnamed_addr global ptr null
@str.1 = private unnamed_addr constant [23 x i8] c"49.func_pointer.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @addOne(i32 %0) #0 {
entry:
  %1 = add i32 %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @square(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = mul i32 %0, %0
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @addTwo(i32 %0, i32 %1) local_unnamed_addr #0 {
entry:
  %2 = add i32 %1, %0
  ret i32 %2
}

define i32 @apply(ptr nocapture readonly %0, i32 %1) local_unnamed_addr {
entry:
  %2 = tail call i32 %0(i32 %1)
  ret i32 %2
}

define i32 @sumWith(ptr nocapture readonly %0, i32 %1, i32 %2) local_unnamed_addr {
entry:
  %.not6 = icmp sgt i32 %1, %2
  br i1 %.not6, label %while.end, label %while.loop.preheader

while.loop.preheader:                             ; preds = %entry
  br label %while.loop

while.loop:                                       ; preds = %while.loop.preheader, %while.loop
  %i.08 = phi i32 [ %5, %while.loop ], [ %1, %while.loop.preheader ]
  %total.07 = phi i32 [ %4, %while.loop ], [ 0, %while.loop.preheader ]
  %3 = tail call i32 %0(i32 %i.08)
  %4 = add i32 %3, %total.07
  %5 = add i32 %i.08, 1
  %.not = icmp sgt i32 %5, %2
  br i1 %.not, label %while.end, label %while.loop

while.end:                                        ; preds = %while.loop, %entry
  %total.0.lcssa = phi i32 [ 0, %entry ], [ %4, %while.loop ]
  ret i32 %total.0.lcssa
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
common.ret:
  store ptr @addOne, ptr @chosen, align 8
  %puts53 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
