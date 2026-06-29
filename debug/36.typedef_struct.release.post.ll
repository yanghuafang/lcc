; ModuleID = 'lcc'
source_filename = "lcc"

@str.1 = private unnamed_addr constant [25 x i8] c"36.typedef_struct.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define void @fill_employee(ptr nocapture writeonly initializes((0, 5)) %0, i32 %1, i8 %2) local_unnamed_addr #0 {
entry:
  store i32 %1, ptr %0, align 4
  %3 = getelementptr i8, ptr %0, i64 4
  store i8 %2, ptr %3, align 1
  ret void
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end30:
  %puts65 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { nofree nounwind }
