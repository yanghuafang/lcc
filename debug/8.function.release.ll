; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@str.2 = private unnamed_addr constant [18 x i8] c"8.function.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @sum(i32 %0, i32 %1) local_unnamed_addr #0 {
entry:
  %2 = add i32 %1, %0
  ret i32 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readonly willreturn
define i32 @sum2(i32* nocapture readonly %0, i32* nocapture readonly %1) local_unnamed_addr #1 {
entry:
  %2 = load i32, i32* %0, align 4
  %3 = load i32, i32* %1, align 4
  %4 = add i32 %3, %2
  ret i32 %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn writeonly
define void @sum3(i32 %0, i32 %1, i32* nocapture writeonly %2) local_unnamed_addr #2 {
entry:
  %3 = add i32 %1, %0
  store i32 %3, i32* %2, align 4
  ret void
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #3 {
if.end21:
  %puts36 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([18 x i8], [18 x i8]* @str.2, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind readonly willreturn }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn writeonly }
attributes #3 = { nofree nounwind }
