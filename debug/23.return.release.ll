; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str.1 = private unnamed_addr constant [17 x i8] c"23.return.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @checkAge1(i32 returned %0) local_unnamed_addr #0 {
entry:
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @checkAge2(i32 returned %0) local_unnamed_addr #0 {
entry:
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @checkAge3(i32 returned %0) local_unnamed_addr #0 {
entry:
  ret i32 %0
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
if.end24:
  %puts41 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([17 x i8], [17 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { nofree nounwind }
