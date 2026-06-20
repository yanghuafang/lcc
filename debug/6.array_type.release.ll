; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@gs = local_unnamed_addr global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = local_unnamed_addr global ptr @0
@gi = local_unnamed_addr global [4 x i32] undef
@str.1 = private unnamed_addr constant [20 x i8] c"6.array_type.c PASS\00", align 1

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #0 {
if.end24:
  store i8 108, ptr @gs, align 1
  store i8 117, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 1), align 1
  store i8 99, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 2), align 1
  store i8 107, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 3), align 1
  store i8 121, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 4), align 1
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @gs, i64 5), align 1
  store i32 1024, ptr @gi, align 4
  store i32 2048, ptr getelementptr inbounds nuw (i8, ptr @gi, i64 4), align 4
  %puts41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #0

attributes #0 = { nofree nounwind }
