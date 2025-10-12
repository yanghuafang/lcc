; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [19 x i8] c"20.do_while.c PASS\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countSum(i32 %0) local_unnamed_addr #0 {
entry:
  %.not6 = icmp slt i32 %0, 1
  br i1 %.not6, label %while.end, label %while.loop

while.loop:                                       ; preds = %entry, %while.loop
  %i.08 = phi i32 [ %2, %while.loop ], [ 1, %entry ]
  %sum.07 = phi i32 [ %1, %while.loop ], [ 0, %entry ]
  %1 = add i32 %i.08, %sum.07
  %2 = add i32 %i.08, 1
  %.not = icmp sgt i32 %2, %0
  br i1 %.not, label %while.end, label %while.loop

while.end:                                        ; preds = %while.loop, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %1, %while.loop ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define i32 @countSum2(i32 %0) local_unnamed_addr #0 {
entry:
  br label %do.loop

do.loop:                                          ; preds = %do.loop, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %1, %do.loop ]
  %i.0 = phi i32 [ 0, %entry ], [ %2, %do.loop ]
  %1 = add i32 %i.0, %sum.0
  %2 = add i32 %i.0, 1
  %.not = icmp sgt i32 %2, %0
  br i1 %.not, label %do.end, label %do.loop

do.end:                                           ; preds = %do.loop
  ret i32 %1
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end12:
  %puts21 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { nofree norecurse nosync nounwind memory(none) }
attributes #1 = { nofree nounwind }
