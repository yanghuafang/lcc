; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [19 x i8] c"19.for_loop.c PASS\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countSum(i32 %0) local_unnamed_addr #0 {
entry:
  %.not6 = icmp slt i32 %0, 1
  br i1 %.not6, label %for.end, label %for.loop

for.loop:                                         ; preds = %entry, %for.loop
  %i.08 = phi i32 [ %2, %for.loop ], [ 1, %entry ]
  %sum.07 = phi i32 [ %1, %for.loop ], [ 0, %entry ]
  %1 = add i32 %i.08, %sum.07
  %2 = add i32 %i.08, 1
  %.not = icmp sgt i32 %2, %0
  br i1 %.not, label %for.end, label %for.loop

for.end:                                          ; preds = %for.loop, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %1, %for.loop ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countSum2(i32 %0) local_unnamed_addr #0 {
entry:
  %.not6 = icmp slt i32 %0, 1
  br i1 %.not6, label %for.end, label %for.loop

for.loop:                                         ; preds = %entry, %for.loop
  %i.08 = phi i32 [ %2, %for.loop ], [ 1, %entry ]
  %sum.07 = phi i32 [ %1, %for.loop ], [ 0, %entry ]
  %1 = add i32 %i.08, %sum.07
  %2 = add i32 %i.08, 1
  %.not = icmp sgt i32 %2, %0
  br i1 %.not, label %for.end, label %for.loop

for.end:                                          ; preds = %for.loop, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %1, %for.loop ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countSum3(i32 %0) local_unnamed_addr #0 {
entry:
  %.not7 = icmp slt i32 %0, 1
  br i1 %.not7, label %for.end, label %for.loop

for.loop:                                         ; preds = %entry, %for.loop
  %i.09 = phi i32 [ %2, %for.loop ], [ 1, %entry ]
  %sum.08 = phi i32 [ %1, %for.loop ], [ 0, %entry ]
  %1 = add i32 %i.09, %sum.08
  %2 = add i32 %i.09, 1
  %.not = icmp sgt i32 %2, %0
  br i1 %.not, label %for.end, label %for.loop

for.end:                                          ; preds = %for.loop, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %1, %for.loop ]
  ret i32 %sum.0.lcssa
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
