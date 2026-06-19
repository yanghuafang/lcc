; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str = private unnamed_addr constant [19 x i8] c"21.continue.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [19 x i8] c"21.continue.c PASS\00", align 1

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @countEvenNumber(i32 %0) local_unnamed_addr #0 {
entry:
  %.not7 = icmp slt i32 %0, 1
  br i1 %.not7, label %for.end, label %for.loop.preheader

for.loop.preheader:                               ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.preheader, %for.loop
  %i.09 = phi i32 [ %3, %for.loop ], [ 1, %for.loop.preheader ]
  %count.08 = phi i32 [ %spec.select, %for.loop ], [ 0, %for.loop.preheader ]
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

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @countEvenNumber2(i32 %0) local_unnamed_addr #0 {
entry:
  %.not1013 = icmp slt i32 %0, 1
  br i1 %.not1013, label %while.end, label %while.loop.lr.ph.preheader

while.loop.lr.ph.preheader:                       ; preds = %entry
  br label %while.loop.lr.ph

while.loop.lr.ph:                                 ; preds = %while.loop.lr.ph.preheader, %if.end
  %i.0.ph15 = phi i32 [ %6, %if.end ], [ 1, %while.loop.lr.ph.preheader ]
  %count.0.ph14 = phi i32 [ %5, %if.end ], [ 0, %while.loop.lr.ph.preheader ]
  %1 = and i32 %i.0.ph15, 1
  %2 = add i32 %i.0.ph15, %1
  br label %while.loop

while.loop:                                       ; preds = %while.loop.lr.ph, %then
  %i.011 = phi i32 [ %i.0.ph15, %while.loop.lr.ph ], [ %4, %then ]
  %3 = and i32 %i.011, 1
  %.not8 = icmp eq i32 %3, 0
  br i1 %.not8, label %if.end, label %then

then:                                             ; preds = %while.loop
  %4 = add i32 %i.011, 1
  %.not = icmp sgt i32 %4, %0
  br i1 %.not, label %while.end, label %while.loop

if.end:                                           ; preds = %while.loop
  %5 = add i32 %count.0.ph14, 1
  %6 = add nuw i32 %2, 1
  %.not10 = icmp sgt i32 %6, %0
  br i1 %.not10, label %while.end, label %while.loop.lr.ph

while.end:                                        ; preds = %if.end, %then, %entry
  %count.0.ph.lcssa = phi i32 [ 0, %entry ], [ %count.0.ph14, %then ], [ %5, %if.end ]
  ret i32 %count.0.ph.lcssa
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @countEvenNumber3(i32 %0) local_unnamed_addr #0 {
entry:
  br label %do.loop

do.loop:                                          ; preds = %do.loop, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %count.1, %do.loop ]
  %i.0 = phi i32 [ 1, %entry ], [ %i.1, %do.loop ]
  %1 = and i32 %i.0, 1
  %2 = xor i32 %1, 1
  %count.1 = add i32 %2, %count.0
  %i.1 = add i32 %i.0, 1
  %.not8 = icmp sgt i32 %i.1, %0
  br i1 %.not8, label %do.end, label %do.loop

do.end:                                           ; preds = %do.loop
  ret i32 %count.1
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
entry:
  br label %while.loop.lr.ph.i

while.loop.lr.ph.i:                               ; preds = %if.end.i, %entry
  %i.0.ph15.i = phi i32 [ %8, %if.end.i ], [ 1, %entry ]
  %count.0.ph14.i = phi i32 [ %7, %if.end.i ], [ 0, %entry ]
  %0 = and i32 %i.0.ph15.i, 1
  %1 = and i32 %i.0.ph15.i, 1
  %2 = add nsw i32 %i.0.ph15.i, 1
  %smax = call i32 @llvm.smax.i32(i32 %2, i32 33)
  %3 = xor i32 %i.0.ph15.i, -1
  %4 = add i32 %smax, %3
  %umin = call i32 @llvm.umin.i32(i32 %4, i32 %0)
  br label %while.loop.i

while.loop.i:                                     ; preds = %then.i, %while.loop.lr.ph.i
  %i.011.i = phi i32 [ %i.0.ph15.i, %while.loop.lr.ph.i ], [ %6, %then.i ]
  %5 = icmp eq i32 %1, %umin
  br i1 %5, label %if.end.i, label %then.i

then.i:                                           ; preds = %while.loop.i
  %6 = add i32 %i.011.i, 1
  %.not.i27 = icmp sgt i32 %6, 32
  br i1 %.not.i27, label %countEvenNumber2.exit, label %while.loop.i

if.end.i:                                         ; preds = %while.loop.i
  %7 = add nuw nsw i32 %count.0.ph14.i, 1
  %8 = add i32 %2, %0
  %.not10.i = icmp sgt i32 %8, 32
  br i1 %.not10.i, label %if.end15, label %while.loop.lr.ph.i

countEvenNumber2.exit:                            ; preds = %then.i
  %.not22 = icmp ne i32 %count.0.ph14.i, 16
  %spec.select = select i1 %.not22, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.1, i64 0, i64 0)
  br label %if.end15

if.end15:                                         ; preds = %if.end.i, %countEvenNumber2.exit
  %.sink = phi i8* [ %spec.select, %countEvenNumber2.exit ], [ getelementptr inbounds ([19 x i8], [19 x i8]* @str.1, i64 0, i64 0), %if.end.i ]
  %.not2242 = phi i1 [ %.not22, %countEvenNumber2.exit ], [ false, %if.end.i ]
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.sink)
  %err.4 = zext i1 %.not2242 to i32
  ret i32 %err.4
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

attributes #0 = { nofree norecurse nosync nounwind readnone }
attributes #1 = { nofree nounwind }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
