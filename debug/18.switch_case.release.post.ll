; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [22 x i8] c"18.switch_case.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i8 65, 70) i8 @gradeOfScore(i32 %0) local_unnamed_addr #0 {
entry:
  switch i32 %0, label %case.10 [
    i32 1, label %switch.end
    i32 2, label %switch.end
    i32 3, label %switch.end
    i32 4, label %switch.end
    i32 5, label %switch.end
    i32 6, label %case.5
    i32 7, label %case.7
    i32 8, label %case.7
    i32 9, label %case.9
    i32 10, label %case.9
  ]

case.5:                                           ; preds = %entry
  br label %switch.end

case.7:                                           ; preds = %entry, %entry
  br label %switch.end

case.9:                                           ; preds = %entry, %entry
  br label %switch.end

case.10:                                          ; preds = %entry
  br label %switch.end

switch.end:                                       ; preds = %entry, %entry, %entry, %entry, %entry, %case.10, %case.9, %case.7, %case.5
  %grade.0 = phi i8 [ 69, %case.10 ], [ 65, %case.9 ], [ 66, %case.7 ], [ 67, %case.5 ], [ 68, %entry ], [ 68, %entry ], [ 68, %entry ], [ 68, %entry ], [ 68, %entry ]
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
