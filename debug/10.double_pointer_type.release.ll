; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@g_data = global i32 0
@str.1 = private unnamed_addr constant [30 x i8] c"10.double_pointer_type.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn writeonly
define void @getAddress(i32** nocapture writeonly %0) local_unnamed_addr #0 {
entry:
  store i32* @g_data, i32** %0, align 8
  ret void
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
if.end15:
  store i32 -42, i32* @g_data, align 4
  %puts27 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([30 x i8], [30 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn writeonly }
attributes #1 = { nofree nounwind }
