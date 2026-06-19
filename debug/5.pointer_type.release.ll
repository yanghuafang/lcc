; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gc = local_unnamed_addr global i8 97
@gi = local_unnamed_addr global i32 1024
@str.1 = private unnamed_addr constant [22 x i8] c"5.pointer_type.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
if.end21:
  store i8 98, i8* @gc, align 1
  store i32 2048, i32* @gi, align 4
  %puts40 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
