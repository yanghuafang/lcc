; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [18 x i8] c"17.if_else.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @accumulateFlags(i32 %0) local_unnamed_addr #0 {
entry:
  %.lobit = lshr i32 %0, 31
  %1 = icmp eq i32 %0, 0
  %flags.1.v = select i1 %1, i32 2, i32 4
  %flags.1 = or i32 %flags.1.v, %.lobit
  %2 = icmp sgt i32 %0, 10
  %3 = or i32 %flags.1, 8
  %flags.2 = select i1 %2, i32 %3, i32 %flags.1
  ret i32 %flags.2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @signBucket(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = icmp slt i32 %0, 0
  %2 = icmp eq i32 %0, 0
  %. = select i1 %2, i32 2, i32 3
  %bucket.0 = select i1 %1, i32 1, i32 %.
  ret i32 %bucket.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @decadeBucket(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = icmp slt i32 %0, 10
  br i1 %1, label %if.end6, label %else

else:                                             ; preds = %entry
  %2 = icmp ult i32 %0, 20
  br i1 %2, label %if.end6, label %else2

else2:                                            ; preds = %else
  %3 = icmp ult i32 %0, 30
  %. = select i1 %3, i32 2, i32 3
  br label %if.end6

if.end6:                                          ; preds = %else2, %else, %entry
  %bucket.0 = phi i32 [ 0, %entry ], [ 1, %else ], [ %., %else2 ]
  ret i32 %bucket.0
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
if.end33:
  %puts56 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([18 x i8], [18 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { nofree nounwind }
