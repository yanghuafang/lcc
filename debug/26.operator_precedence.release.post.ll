; ModuleID = 'lcc'
source_filename = "lcc"

@str = private unnamed_addr constant [30 x i8] c"26.operator_precedence.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define void @subFunc(i32 %0) local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
entry:
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
