; ModuleID = 'lcc'
source_filename = "lcc"

@counter = internal unnamed_addr global i32 0
@str = private unnamed_addr constant [22 x i8] c"37.static_file.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [22 x i8] c"37.static_file.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none)
define i32 @bump() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none)
define range(i32 0, -1) i32 @bump_with_helper() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter, align 4
  %2 = shl i32 %1, 1
  ret i32 %2
}

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
entry:
  %0 = load i32, ptr @counter, align 4
  %.not24 = icmp ne i32 %0, 0
  %1 = add i32 %0, 3
  store i32 %1, ptr @counter, align 4
  %str.str.1 = select i1 %.not24, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.4 = zext i1 %.not24 to i32
  ret i32 %err.4
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) }
attributes #1 = { nofree nounwind }
