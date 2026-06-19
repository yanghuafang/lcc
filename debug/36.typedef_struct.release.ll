; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i32, i8 }

@str.1 = private unnamed_addr constant [25 x i8] c"36.typedef_struct.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn writeonly
define void @fill_employee(%struct.Employee* nocapture writeonly %0, i32 %1, i8 %2) local_unnamed_addr #0 {
entry:
  %3 = bitcast %struct.Employee* %0 to i32*
  store i32 %1, i32* %3, align 4
  %4 = getelementptr %struct.Employee, %struct.Employee* %0, i64 0, i32 1
  store i8 %2, i8* %4, align 1
  ret void
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #1 {
if.end30:
  %puts65 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn writeonly }
attributes #1 = { nofree nounwind }
