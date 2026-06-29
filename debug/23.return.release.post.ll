; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [17 x i8] c"23.return.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @checkAge1(i32 returned %0) local_unnamed_addr #0 {
entry:
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @checkAge2(i32 returned %0) local_unnamed_addr #0 {
entry:
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @checkAge3(i32 returned %0) local_unnamed_addr #0 {
entry:
  ret i32 %0
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end24:
  %puts41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
