; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@str.1 = private unnamed_addr constant [19 x i8] c"21.continue.c PASS\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countEvenNumber(i32 %0) local_unnamed_addr #0 {
entry:
  %.not7 = icmp slt i32 %0, 1
  br i1 %.not7, label %for.end, label %for.loop

for.loop:                                         ; preds = %entry, %for.loop
  %i.09 = phi i32 [ %3, %for.loop ], [ 1, %entry ]
  %count.08 = phi i32 [ %spec.select, %for.loop ], [ 0, %entry ]
  %1 = and i32 %i.09, 1
  %2 = xor i32 %1, 1
  %spec.select = add i32 %2, %count.08
  %3 = add i32 %i.09, 1
  %.not = icmp sgt i32 %3, %0
  br i1 %.not, label %for.end, label %for.loop

for.end:                                          ; preds = %for.loop, %entry
  %count.0.lcssa = phi i32 [ 0, %entry ], [ %spec.select, %for.loop ]
  ret i32 %count.0.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countEvenNumber2(i32 %0) local_unnamed_addr #0 {
entry:
  %.not1013 = icmp slt i32 %0, 1
  br i1 %.not1013, label %while.end, label %while.loop.lr.ph

while.loop.lr.ph:                                 ; preds = %entry, %if.end
  %i.0.ph15 = phi i32 [ %4, %if.end ], [ 1, %entry ]
  %count.0.ph14 = phi i32 [ %3, %if.end ], [ 0, %entry ]
  %1 = add i32 %i.0.ph15, 1
  br label %while.loop

while.loop:                                       ; preds = %while.loop.lr.ph, %then
  %i.011 = phi i32 [ %i.0.ph15, %while.loop.lr.ph ], [ %2, %then ]
  %lftr.wideiv = trunc i32 %i.011 to i1
  br i1 %lftr.wideiv, label %then, label %if.end

then:                                             ; preds = %while.loop
  %2 = add i32 %i.011, 1
  %.not = icmp sgt i32 %2, %0
  br i1 %.not, label %while.end, label %while.loop

if.end:                                           ; preds = %while.loop
  %3 = add i32 %count.0.ph14, 1
  %4 = or disjoint i32 %1, 1
  %.not10.not = icmp slt i32 %1, %0
  br i1 %.not10.not, label %while.loop.lr.ph, label %while.end

while.end:                                        ; preds = %if.end, %then, %entry
  %count.0.ph.lcssa = phi i32 [ 0, %entry ], [ %count.0.ph14, %then ], [ %3, %if.end ]
  ret i32 %count.0.ph.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countEvenNumber3(i32 %0) local_unnamed_addr #0 {
entry:
  br label %do.loop

do.loop:                                          ; preds = %do.loop, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %count.1, %do.loop ]
  %i.0 = phi i32 [ 1, %entry ], [ %i.1, %do.loop ]
  %1 = and i32 %i.0, 1
  %.not = icmp eq i32 %1, 0
  %2 = add i32 %i.0, 1
  %3 = or disjoint i32 %i.0, 1
  %4 = xor i32 %1, 1
  %count.1 = add i32 %4, %count.0
  %i.1 = select i1 %.not, i32 %3, i32 %2
  %.not8 = icmp sgt i32 %i.1, %0
  br i1 %.not8, label %do.end, label %do.loop

do.end:                                           ; preds = %do.loop
  ret i32 %count.1
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end15:
  %puts26 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { nofree norecurse nosync nounwind memory(none) }
attributes #1 = { nofree nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
