; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [22 x i8] c"18.switch_case.c PASS\00", align 1
@switch.table.gradeOfScore = private unnamed_addr constant [10 x i8] c"DDDDDCBBAA", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i8 @gradeOfScore(i32 %0) local_unnamed_addr #0 {
entry:
  %switch.tableidx = sub i32 %0, 1
  %1 = icmp ult i32 %switch.tableidx, 10
  br i1 %1, label %switch.lookup, label %switch.end

switch.lookup:                                    ; preds = %entry
  %switch.gep = getelementptr inbounds [10 x i8], [10 x i8]* @switch.table.gradeOfScore, i32 0, i32 %switch.tableidx
  %switch.load = load i8, i8* %switch.gep, align 1
  br label %switch.end

switch.end:                                       ; preds = %entry, %switch.lookup
  %grade.0 = phi i8 [ %switch.load, %switch.lookup ], [ 69, %entry ]
  ret i8 %grade.0
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
if.end18:
  %puts31 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { nofree nounwind }
