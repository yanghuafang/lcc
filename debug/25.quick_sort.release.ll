; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str = private unnamed_addr constant [21 x i8] c"25.quick_sort.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [21 x i8] c"25.quick_sort.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define void @swap(i32* nocapture %0, i32* nocapture %1) local_unnamed_addr #0 {
entry:
  %2 = load i32, i32* %0, align 4
  %3 = load i32, i32* %1, align 4
  store i32 %3, i32* %0, align 4
  store i32 %2, i32* %1, align 4
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind
define i32 @partition(i32* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #1 {
entry:
  %3 = sext i32 %2 to i64
  %4 = getelementptr i32, i32* %0, i64 %3
  %5 = load i32, i32* %4, align 4
  %6 = add i32 %1, -1
  %7 = add i32 %2, -1
  %.not16 = icmp slt i32 %7, %1
  br i1 %.not16, label %for.end, label %for.loop.preheader

for.loop.preheader:                               ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.preheader, %for.update
  %j.018 = phi i32 [ %18, %for.update ], [ %1, %for.loop.preheader ]
  %i.017 = phi i32 [ %i.1, %for.update ], [ %6, %for.loop.preheader ]
  %8 = sext i32 %j.018 to i64
  %9 = getelementptr i32, i32* %0, i64 %8
  %10 = load i32, i32* %9, align 4
  %.not15 = icmp sgt i32 %10, %5
  br i1 %.not15, label %for.update, label %then

then:                                             ; preds = %for.loop
  %11 = add i32 %i.017, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr i32, i32* %0, i64 %12
  %14 = load i32, i32* %13, align 4
  store i32 %10, i32* %13, align 4
  %sunkaddr = mul i64 %8, 4
  %15 = bitcast i32* %0 to i8*
  %sunkaddr19 = getelementptr i8, i8* %15, i64 %sunkaddr
  %16 = bitcast i8* %sunkaddr19 to i32*
  store i32 %14, i32* %16, align 4
  br label %for.update

for.update:                                       ; preds = %then, %for.loop
  %i.1 = phi i32 [ %11, %then ], [ %i.017, %for.loop ]
  %17 = trunc i64 %8 to i32
  %18 = add i32 %17, 1
  %.not = icmp sgt i32 %18, %7
  br i1 %.not, label %for.end.loopexit, label %for.loop

for.end.loopexit:                                 ; preds = %for.update
  %sunkaddr20 = mul i64 %3, 4
  %19 = bitcast i32* %0 to i8*
  %sunkaddr21 = getelementptr i8, i8* %19, i64 %sunkaddr20
  %20 = bitcast i8* %sunkaddr21 to i32*
  %.pre = load i32, i32* %20, align 4
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %21 = phi i32 [ %5, %entry ], [ %.pre, %for.end.loopexit ]
  %i.0.lcssa = phi i32 [ %6, %entry ], [ %i.1, %for.end.loopexit ]
  %22 = add i32 %i.0.lcssa, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr i32, i32* %0, i64 %23
  %25 = load i32, i32* %24, align 4
  store i32 %21, i32* %24, align 4
  %sunkaddr22 = mul i64 %3, 4
  %26 = bitcast i32* %0 to i8*
  %sunkaddr23 = getelementptr i8, i8* %26, i64 %sunkaddr22
  %27 = bitcast i8* %sunkaddr23 to i32*
  store i32 %25, i32* %27, align 4
  ret i32 %22
}

; Function Attrs: nofree nosync nounwind
define void @quickSort(i32* %0, i32 %1, i32 %2) local_unnamed_addr #2 {
entry:
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %then.lr.ph, label %if.end

then.lr.ph:                                       ; preds = %entry
  %4 = sext i32 %2 to i64
  br label %then

then:                                             ; preds = %then.lr.ph, %for.end.loopexit.i
  %.tr911 = phi i32 [ %1, %then.lr.ph ], [ %24, %for.end.loopexit.i ]
  %sunkaddr = mul i64 %4, 4
  %5 = bitcast i32* %0 to i8*
  %sunkaddr12 = getelementptr i8, i8* %5, i64 %sunkaddr
  %6 = bitcast i8* %sunkaddr12 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = add i32 %.tr911, -1
  %9 = sext i32 %.tr911 to i64
  br label %for.loop.i

for.loop.i:                                       ; preds = %then, %for.update.i
  %lsr.iv = phi i64 [ %9, %then ], [ %lsr.iv.next, %for.update.i ]
  %i.017.i = phi i32 [ %i.1.i, %for.update.i ], [ %8, %then ]
  %scevgep = getelementptr i32, i32* %0, i64 %lsr.iv
  %10 = load i32, i32* %scevgep, align 4
  %.not15.i = icmp sgt i32 %10, %7
  br i1 %.not15.i, label %for.update.i, label %then.i

then.i:                                           ; preds = %for.loop.i
  %11 = add i32 %i.017.i, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr i32, i32* %0, i64 %12
  %14 = load i32, i32* %13, align 4
  store i32 %10, i32* %13, align 4
  %sunkaddr13 = mul i64 %lsr.iv, 4
  %15 = bitcast i32* %0 to i8*
  %sunkaddr14 = getelementptr i8, i8* %15, i64 %sunkaddr13
  %16 = bitcast i8* %sunkaddr14 to i32*
  store i32 %14, i32* %16, align 4
  br label %for.update.i

for.update.i:                                     ; preds = %then.i, %for.loop.i
  %i.1.i = phi i32 [ %11, %then.i ], [ %i.017.i, %for.loop.i ]
  %lsr.iv.next = add nsw i64 %lsr.iv, 1
  %tmp = trunc i64 %lsr.iv.next to i32
  %.not.i.not = icmp slt i32 %tmp, %2
  br i1 %.not.i.not, label %for.loop.i, label %for.end.loopexit.i

for.end.loopexit.i:                               ; preds = %for.update.i
  %17 = trunc i64 %9 to i32
  %sunkaddr15 = mul i64 %4, 4
  %18 = bitcast i32* %0 to i8*
  %sunkaddr16 = getelementptr i8, i8* %18, i64 %sunkaddr15
  %19 = bitcast i8* %sunkaddr16 to i32*
  %.pre.i = load i32, i32* %19, align 4
  %20 = add i32 %i.1.i, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr i32, i32* %0, i64 %21
  %23 = load i32, i32* %22, align 4
  store i32 %.pre.i, i32* %22, align 4
  store i32 %23, i32* %19, align 4
  tail call void @quickSort(i32* nonnull %0, i32 %17, i32 %i.1.i)
  %24 = add i32 %i.1.i, 2
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %then, label %if.end

if.end:                                           ; preds = %for.end.loopexit.i, %entry
  ret void
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #3 {
entry:
  %arr30 = alloca [6 x i32], align 4
  %arr30.sub40 = bitcast [6 x i32]* %arr30 to i32*
  store i32 10, i32* %arr30.sub40, align 4
  %0 = getelementptr inbounds [6 x i32], [6 x i32]* %arr30, i64 0, i64 1
  store i32 7, i32* %0, align 4
  %1 = getelementptr inbounds [6 x i32], [6 x i32]* %arr30, i64 0, i64 2
  store i32 8, i32* %1, align 4
  %2 = getelementptr inbounds [6 x i32], [6 x i32]* %arr30, i64 0, i64 3
  store i32 9, i32* %2, align 4
  %3 = getelementptr inbounds [6 x i32], [6 x i32]* %arr30, i64 0, i64 4
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds [6 x i32], [6 x i32]* %arr30, i64 0, i64 5
  store i32 5, i32* %4, align 4
  call void @quickSort(i32* nonnull %arr30.sub40, i32 0, i32 5)
  %5 = load i32, i32* %arr30.sub40, align 4
  %.not = icmp ne i32 %5, 1
  %6 = load i32, i32* %0, align 4
  %.not31 = icmp ne i32 %6, 5
  %7 = load i32, i32* %1, align 4
  %.not32 = icmp ne i32 %7, 7
  %8 = load i32, i32* %2, align 4
  %.not33 = icmp ne i32 %8, 8
  %9 = load i32, i32* %3, align 4
  %.not34 = icmp ne i32 %9, 9
  %10 = load i32, i32* %4, align 4
  %.not35 = icmp ne i32 %10, 10
  %11 = select i1 %.not35, i1 true, i1 %.not34
  %12 = select i1 %11, i1 true, i1 %.not33
  %13 = select i1 %12, i1 true, i1 %.not32
  %14 = select i1 %13, i1 true, i1 %.not31
  %narrow = select i1 %14, i1 true, i1 %.not
  %. = select i1 %narrow, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.1, i64 0, i64 0)
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %err.5 = zext i1 %narrow to i32
  ret i32 %err.5
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn }
attributes #1 = { nofree norecurse nosync nounwind }
attributes #2 = { nofree nosync nounwind }
attributes #3 = { nofree nounwind }
