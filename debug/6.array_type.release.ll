; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gs = local_unnamed_addr global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = local_unnamed_addr global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i64 0, i64 0)
@gi = local_unnamed_addr global [4 x i32] undef
@str.1 = private unnamed_addr constant [20 x i8] c"6.array_type.c PASS\00", align 1

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
if.end24:
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i64 0, i64 0), align 1
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i64 0, i64 1), align 1
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i64 0, i64 2), align 1
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i64 0, i64 3), align 1
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i64 0, i64 4), align 1
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i64 0, i64 5), align 1
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i64 0, i64 0), align 4
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i64 0, i64 1), align 4
  %puts41 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
