; ModuleID = 'lcc'
source_filename = "lcc"

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
  %j.018 = phi i32 [ %15, %for.update ], [ %1, %for.loop.preheader ]
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
  store i32 %14, ptr %9, align 4
  br label %for.update

for.update:                                       ; preds = %then, %for.loop
  %i.1 = phi i32 [ %11, %then ], [ %i.017, %for.loop ]
  %15 = add i32 %j.018, 1
  %.not = icmp sgt i32 %15, %6
  br i1 %.not, label %for.end.loopexit, label %for.loop

for.end.loopexit:                                 ; preds = %for.update
  %.pre = load i32, ptr %4, align 4
  %16 = add i32 %i.1, 1
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %17 = phi i32 [ %5, %entry ], [ %.pre, %for.end.loopexit ]
  %i.0.lcssa = phi i32 [ %1, %entry ], [ %16, %for.end.loopexit ]
  %18 = sext i32 %i.0.lcssa to i64
  %19 = getelementptr i32, ptr %0, i64 %18
  %20 = load i32, ptr %19, align 4
  store i32 %17, ptr %19, align 4
  store i32 %20, ptr %4, align 4
  ret i32 %i.0.lcssa
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @quickSort(ptr nocapture %0, i32 %1, i32 %2) local_unnamed_addr #2 {
entry:
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %then.lr.ph, label %if.end

then.lr.ph:                                       ; preds = %entry
  %4 = sext i32 %2 to i64
  %5 = getelementptr i32, ptr %0, i64 %4
  br label %then

then:                                             ; preds = %then.lr.ph, %for.end.loopexit.i
  %.tr911 = phi i32 [ %1, %then.lr.ph ], [ %.reass, %for.end.loopexit.i ]
  %6 = load i32, ptr %5, align 4
  %7 = add i32 %.tr911, -1
  br label %for.loop.i

for.loop.i:                                       ; preds = %for.update.i, %then
  %j.018.i = phi i32 [ %15, %for.update.i ], [ %.tr911, %then ]
  %i.017.i = phi i32 [ %i.1.i, %for.update.i ], [ %7, %then ]
  %8 = sext i32 %j.018.i to i64
  %9 = getelementptr i32, ptr %0, i64 %8
  %10 = load i32, ptr %9, align 4
  %.not15.i = icmp sgt i32 %10, %6
  br i1 %.not15.i, label %for.update.i, label %then.i

then.i:                                           ; preds = %for.loop.i
  %11 = add i32 %i.017.i, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4
  store i32 %10, ptr %13, align 4
  store i32 %14, ptr %9, align 4
  br label %for.update.i

for.update.i:                                     ; preds = %then.i, %for.loop.i
  %i.1.i = phi i32 [ %11, %then.i ], [ %i.017.i, %for.loop.i ]
  %15 = add nsw i32 %j.018.i, 1
  %.not.i.not = icmp slt i32 %15, %2
  br i1 %.not.i.not, label %for.loop.i, label %for.end.loopexit.i

for.end.loopexit.i:                               ; preds = %for.update.i
  %.pre.i = load i32, ptr %5, align 4
  %16 = add i32 %i.1.i, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr i32, ptr %0, i64 %17
  %19 = load i32, ptr %18, align 4
  store i32 %.pre.i, ptr %18, align 4
  store i32 %19, ptr %5, align 4
  tail call void @quickSort(ptr nonnull %0, i32 %.tr911, i32 %i.1.i)
  %.reass = add i32 %i.1.i, 2
  %20 = icmp slt i32 %.reass, %2
  br i1 %20, label %then, label %if.end

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
