; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [18 x i8] c"17.if_else.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 2, 14) i32 @accumulateFlags(i32 %0) local_unnamed_addr #0 {
entry:
  %.lobit = lshr i32 %0, 31
  %1 = icmp eq i32 %0, 0
  %2 = or disjoint i32 %.lobit, 4
  %flags.1 = select i1 %1, i32 2, i32 %2
  %3 = icmp sgt i32 %0, 10
  %4 = or disjoint i32 %flags.1, 8
  %flags.2 = select i1 %3, i32 %4, i32 %flags.1
  ret i32 %flags.2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 1, 4) i32 @signBucket(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = icmp slt i32 %0, 0
  %2 = icmp eq i32 %0, 0
  %. = select i1 %2, i32 2, i32 3
  %bucket.0 = select i1 %1, i32 1, i32 %.
  ret i32 %bucket.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 0, 4) i32 @decadeBucket(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = icmp slt i32 %0, 10
  br i1 %1, label %if.end6, label %else

else:                                             ; preds = %entry
  %2 = icmp samesign ult i32 %0, 20
  br i1 %2, label %if.end6, label %else2

else2:                                            ; preds = %else
  %3 = icmp samesign ult i32 %0, 30
  %. = select i1 %3, i32 2, i32 3
  br label %if.end6

if.end6:                                          ; preds = %else2, %else, %entry
  %bucket.0 = phi i32 [ 0, %entry ], [ 1, %else ], [ %., %else2 ]
  ret i32 %bucket.0
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end33:
  %puts56 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
