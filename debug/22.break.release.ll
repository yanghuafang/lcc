; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [16 x i8] c"22.break.c PASS\00", align 1

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @countNumber(i32 %0, i32 %1) local_unnamed_addr #0 {
entry:
  %.not6 = icmp slt i32 %0, 1
  %2 = icmp slt i32 %1, 1
  %or.cond7 = select i1 %.not6, i1 true, i1 %2
  br i1 %or.cond7, label %for.end, label %if.end.preheader

if.end.preheader:                                 ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.end.preheader, %if.end
  %lsr.iv = phi i32 [ 2, %if.end.preheader ], [ %lsr.iv.next, %if.end ]
  %.not = icmp sgt i32 %lsr.iv, %0
  %3 = icmp sgt i32 %lsr.iv, %1
  %or.cond = select i1 %.not, i1 true, i1 %3
  %lsr.iv.next = add i32 %lsr.iv, 1
  br i1 %or.cond, label %for.end.loopexit, label %if.end

for.end.loopexit:                                 ; preds = %if.end
  %4 = add i32 %lsr.iv.next, -2
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %count.0.lcssa = phi i32 [ 0, %entry ], [ %4, %for.end.loopexit ]
  ret i32 %count.0.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @countNumber2(i32 %0, i32 %1) local_unnamed_addr #0 {
entry:
  %.not6 = icmp slt i32 %0, 1
  %2 = icmp slt i32 %1, 1
  %or.cond7 = select i1 %.not6, i1 true, i1 %2
  br i1 %or.cond7, label %while.end, label %if.end.preheader

if.end.preheader:                                 ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.end.preheader, %if.end
  %lsr.iv = phi i32 [ 2, %if.end.preheader ], [ %lsr.iv.next, %if.end ]
  %.not = icmp sgt i32 %lsr.iv, %0
  %3 = icmp sgt i32 %lsr.iv, %1
  %or.cond = select i1 %.not, i1 true, i1 %3
  %lsr.iv.next = add i32 %lsr.iv, 1
  br i1 %or.cond, label %while.end.loopexit, label %if.end

while.end.loopexit:                               ; preds = %if.end
  %4 = add i32 %lsr.iv.next, -2
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %count.0.lcssa = phi i32 [ 0, %entry ], [ %4, %while.end.loopexit ]
  ret i32 %count.0.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @countNumber3(i32 %0, i32 %1) local_unnamed_addr #0 {
entry:
  br label %do.loop

do.loop:                                          ; preds = %if.end, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %4, %if.end ]
  %2 = add i32 %count.0, 1
  %3 = icmp sgt i32 %2, %1
  br i1 %3, label %do.end, label %if.end

if.end:                                           ; preds = %do.loop
  %4 = add i32 %count.0, 1
  %5 = add i32 %4, 1
  %.not = icmp sgt i32 %5, %0
  br i1 %.not, label %do.end, label %do.loop

do.end:                                           ; preds = %if.end, %do.loop
  %count.1 = phi i32 [ %count.0, %do.loop ], [ %4, %if.end ]
  ret i32 %count.1
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
if.end27:
  %puts46 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { nofree norecurse nosync nounwind readnone }
attributes #1 = { nofree nounwind }
