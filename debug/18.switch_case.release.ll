; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [22 x i8] c"18.switch_case.c PASS\00", align 1
@switch.table.gradeOfScore = private unnamed_addr constant [10 x i8] c"DDDDDCBBAA", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i8 65, 70) i8 @gradeOfScore(i32 %0) local_unnamed_addr #0 {
entry:
  %switch.tableidx = sub i32 %0, 1
  %1 = icmp ult i32 %switch.tableidx, 10
  br i1 %1, label %switch.lookup, label %switch.end

switch.lookup:                                    ; preds = %entry
  %switch.gep = getelementptr inbounds [10 x i8], ptr @switch.table.gradeOfScore, i32 0, i32 %switch.tableidx
  %switch.load = load i8, ptr %switch.gep, align 1
  br label %switch.end

switch.end:                                       ; preds = %entry, %switch.lookup
  %grade.0 = phi i8 [ %switch.load, %switch.lookup ], [ 69, %entry ]
  ret i8 %grade.0
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end18:
  %puts31 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
