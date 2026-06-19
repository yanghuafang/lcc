; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@counter = internal unnamed_addr global i32 0
@str = private unnamed_addr constant [22 x i8] c"37.static_file.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [22 x i8] c"37.static_file.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define i32 @bump() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @counter, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define i32 @bump_with_helper() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @counter, align 4
  %2 = shl i32 %1, 1
  ret i32 %2
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
entry:
  %0 = load i32, i32* @counter, align 4
  %.not = icmp ne i32 %0, 0
  %1 = add i32 %0, 3
  store i32 %1, i32* @counter, align 4
  %.mask = and i32 %1, 2147483647
  %.not25 = icmp ne i32 %.mask, 3
  %narrow = select i1 %.not25, i1 true, i1 %.not
  %. = select i1 %narrow, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @str, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @str.1, i64 0, i64 0)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.)
  %err.4 = zext i1 %narrow to i32
  ret i32 %err.4
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn }
attributes #1 = { nofree nounwind }
