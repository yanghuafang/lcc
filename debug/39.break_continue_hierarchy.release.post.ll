; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [35 x i8] c"39.break_continue_hierarchy.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @for_break_continue() local_unnamed_addr #0 {
for.end:
  ret i32 18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @switch_break_fallthrough() local_unnamed_addr #0 {
entry:
  ret i32 11
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @switch_break_only() local_unnamed_addr #0 {
entry:
  ret i32 20
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @for_switch_break_continue() local_unnamed_addr #0 {
for.update.5:
  ret i32 106
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @switch_for_break_continue() local_unnamed_addr #0 {
switch.end:
  ret i32 4
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end15:
  %puts24 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
