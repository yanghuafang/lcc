; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@str = private unnamed_addr constant [21 x i8] c"25.quick_sort.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [21 x i8] c"25.quick_sort.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @swap(ptr nocapture %0, ptr nocapture %1) local_unnamed_addr #0 {
entry:
  %2 = load i32, ptr %0, align 4
  %3 = load i32, ptr %1, align 4
  store i32 %3, ptr %0, align 4
  store i32 %2, ptr %1, align 4
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define i32 @partition(ptr nocapture %0, i32 %1, i32 %2) local_unnamed_addr #1 {
entry:
  %3 = sext i32 %2 to i64
  %4 = getelementptr i32, ptr %0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = add i32 %2, -1
  %.not16 = icmp sgt i32 %1, %6
  br i1 %.not16, label %for.end, label %for.loop.preheader

for.loop.preheader:                               ; preds = %entry
  %7 = add i32 %1, -1
  br label %for.loop

for.loop:                                         ; preds = %for.loop.preheader, %for.update
  %j.018 = phi i32 [ %16, %for.update ], [ %1, %for.loop.preheader ]
  %i.017 = phi i32 [ %i.1, %for.update ], [ %7, %for.loop.preheader ]
  %8 = sext i32 %j.018 to i64
  %9 = getelementptr i32, ptr %0, i64 %8
  %10 = load i32, ptr %9, align 4
  %.not15 = icmp sgt i32 %10, %5
  br i1 %.not15, label %for.update, label %then

then:                                             ; preds = %for.loop
  %11 = add i32 %i.017, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4
  store i32 %10, ptr %13, align 4
  %sunkaddr = mul i64 %8, 4
  %sunkaddr19 = getelementptr i8, ptr %0, i64 %sunkaddr
  store i32 %14, ptr %sunkaddr19, align 4
  br label %for.update

for.update:                                       ; preds = %then, %for.loop
  %i.1 = phi i32 [ %11, %then ], [ %i.017, %for.loop ]
  %15 = trunc i64 %8 to i32
  %16 = add i32 %15, 1
  %.not = icmp sgt i32 %16, %6
  br i1 %.not, label %for.end.loopexit, label %for.loop

for.end.loopexit:                                 ; preds = %for.update
  %sunkaddr20 = mul i64 %3, 4
  %sunkaddr21 = getelementptr i8, ptr %0, i64 %sunkaddr20
  %.pre = load i32, ptr %sunkaddr21, align 4
  %17 = add i32 %i.1, 1
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %18 = phi i32 [ %5, %entry ], [ %.pre, %for.end.loopexit ]
  %i.0.lcssa = phi i32 [ %1, %entry ], [ %17, %for.end.loopexit ]
  %19 = sext i32 %i.0.lcssa to i64
  %20 = getelementptr i32, ptr %0, i64 %19
  %21 = load i32, ptr %20, align 4
  store i32 %18, ptr %20, align 4
  %sunkaddr22 = mul i64 %3, 4
  %sunkaddr23 = getelementptr i8, ptr %0, i64 %sunkaddr22
  store i32 %21, ptr %sunkaddr23, align 4
  ret i32 %i.0.lcssa
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @quickSort(ptr nocapture %0, i32 %1, i32 %2) local_unnamed_addr #2 {
entry:
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %then.lr.ph, label %if.end

then.lr.ph:                                       ; preds = %entry
  %4 = sext i32 %2 to i64
  br label %then

then:                                             ; preds = %then.lr.ph, %for.end.loopexit.i
  %.tr911 = phi i32 [ %1, %then.lr.ph ], [ %.reass, %for.end.loopexit.i ]
  %sunkaddr = mul i64 %4, 4
  %sunkaddr12 = getelementptr i8, ptr %0, i64 %sunkaddr
  %5 = load i32, ptr %sunkaddr12, align 4
  %6 = add i32 %.tr911, -1
  %7 = sext i32 %.tr911 to i64
  %8 = shl nsw i64 %7, 2
  br label %for.loop.i

for.loop.i:                                       ; preds = %for.update.i, %then
  %lsr.iv = phi i64 [ %lsr.iv.next, %for.update.i ], [ %8, %then ]
  %j.018.i = phi i32 [ %14, %for.update.i ], [ %.tr911, %then ]
  %i.017.i = phi i32 [ %i.1.i, %for.update.i ], [ %6, %then ]
  %scevgep = getelementptr i8, ptr %0, i64 %lsr.iv
  %9 = load i32, ptr %scevgep, align 4
  %.not15.i = icmp sgt i32 %9, %5
  br i1 %.not15.i, label %for.update.i, label %then.i

then.i:                                           ; preds = %for.loop.i
  %10 = add i32 %i.017.i, 1
  %11 = sext i32 %10 to i64
  %12 = getelementptr i32, ptr %0, i64 %11
  %13 = load i32, ptr %12, align 4
  store i32 %9, ptr %12, align 4
  %sunkaddr13 = getelementptr i8, ptr %0, i64 %lsr.iv
  store i32 %13, ptr %sunkaddr13, align 4
  br label %for.update.i

for.update.i:                                     ; preds = %then.i, %for.loop.i
  %i.1.i = phi i32 [ %10, %then.i ], [ %i.017.i, %for.loop.i ]
  %14 = add nsw i32 %j.018.i, 1
  %lsr.iv.next = add nsw i64 %lsr.iv, 4
  %.not.i.not = icmp slt i32 %14, %2
  br i1 %.not.i.not, label %for.loop.i, label %for.end.loopexit.i

for.end.loopexit.i:                               ; preds = %for.update.i
  %sunkaddr14 = mul i64 %4, 4
  %sunkaddr15 = getelementptr i8, ptr %0, i64 %sunkaddr14
  %.pre.i = load i32, ptr %sunkaddr15, align 4
  %15 = add i32 %i.1.i, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr i32, ptr %0, i64 %16
  %18 = load i32, ptr %17, align 4
  store i32 %.pre.i, ptr %17, align 4
  store i32 %18, ptr %sunkaddr15, align 4
  tail call void @quickSort(ptr nonnull %0, i32 %.tr911, i32 %i.1.i)
  %.reass = add i32 %i.1.i, 2
  %19 = icmp slt i32 %.reass, %2
  br i1 %19, label %then, label %if.end

if.end:                                           ; preds = %for.end.loopexit.i, %entry
  ret void
}

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #3 {
entry:
  %arr = alloca [6 x i32], align 4
  store i32 10, ptr %arr, align 4
  %0 = getelementptr inbounds nuw i8, ptr %arr, i64 4
  store i32 7, ptr %0, align 4
  %1 = getelementptr inbounds nuw i8, ptr %arr, i64 8
  store i32 8, ptr %1, align 4
  %2 = getelementptr inbounds nuw i8, ptr %arr, i64 12
  store i32 9, ptr %2, align 4
  %3 = getelementptr inbounds nuw i8, ptr %arr, i64 16
  store i32 1, ptr %3, align 4
  %4 = getelementptr inbounds nuw i8, ptr %arr, i64 20
  store i32 5, ptr %4, align 4
  call void @quickSort(ptr nonnull %arr, i32 0, i32 5)
  %5 = load i32, ptr %arr, align 4
  %.not = icmp ne i32 %5, 1
  %6 = load i32, ptr %0, align 4
  %.not30 = icmp ne i32 %6, 5
  %7 = load i32, ptr %1, align 4
  %.not31 = icmp ne i32 %7, 7
  %8 = load i32, ptr %2, align 4
  %.not32 = icmp ne i32 %8, 8
  %9 = load i32, ptr %3, align 4
  %.not33 = icmp ne i32 %9, 9
  %10 = load i32, ptr %4, align 4
  %.not34 = icmp ne i32 %10, 10
  %11 = select i1 %.not34, i1 true, i1 %.not33
  %12 = select i1 %11, i1 true, i1 %.not32
  %13 = select i1 %12, i1 true, i1 %.not31
  %14 = select i1 %13, i1 true, i1 %.not30
  %narrow = select i1 %14, i1 true, i1 %.not
  %str.str.1 = select i1 %narrow, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.5 = zext i1 %narrow to i32
  ret i32 %err.5
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #2 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #3 = { nofree nounwind }
