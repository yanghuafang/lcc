; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [35 x i8] c"39.break_continue_hierarchy.c PASS\00", align 1

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @for_break_continue() local_unnamed_addr #0 {
for.end:
  ret i32 18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @switch_break_fallthrough() local_unnamed_addr #1 {
entry:
  ret i32 11
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @switch_break_only() local_unnamed_addr #1 {
entry:
  ret i32 20
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @for_switch_break_continue() local_unnamed_addr #0 {
for.update.5:
  ret i32 106
}

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @switch_for_break_continue() local_unnamed_addr #0 {
switch.end:
  ret i32 4
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #2 {
if.end15:
  %puts24 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #2

attributes #0 = { nofree norecurse nosync nounwind readnone }
attributes #1 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #2 = { nofree nounwind }
