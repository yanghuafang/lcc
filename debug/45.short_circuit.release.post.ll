; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@gTernary = local_unnamed_addr global i32 2
@gAnd = local_unnamed_addr global i32 0
@gOr = local_unnamed_addr global i32 1
@calls = local_unnamed_addr global i32 0
@trueRan = local_unnamed_addr global i32 0
@falseRan = local_unnamed_addr global i32 0
@str = private unnamed_addr constant [24 x i8] c"45.short_circuit.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [24 x i8] c"45.short_circuit.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none)
define noundef i32 @bump() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @calls, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @calls, align 4
  ret i32 1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none)
define noundef i32 @trueArm() local_unnamed_addr #1 {
entry:
  store i32 1, ptr @trueRan, align 4
  ret i32 10
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none)
define noundef i32 @falseArm() local_unnamed_addr #1 {
entry:
  store i32 1, ptr @falseRan, align 4
  ret i32 20
}

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #2 {
entry:
  store i32 0, ptr @trueRan, align 4
  store i32 1, ptr @falseRan, align 4
  store i32 3, ptr @calls, align 4
  %0 = load i32, ptr @gTernary, align 4
  %.not193 = icmp ne i32 %0, 2
  %1 = load i32, ptr @gAnd, align 4
  %.not194 = icmp ne i32 %1, 0
  %2 = load i32, ptr @gOr, align 4
  %.not195 = icmp ne i32 %2, 1
  %3 = select i1 %.not195, i1 true, i1 %.not194
  %4 = select i1 %3, i1 true, i1 %.not193
  %str.str.1 = select i1 %4, ptr @str, ptr @str.1
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.str.1)
  %err.27 = zext i1 %4 to i32
  ret i32 %err.27
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) }
attributes #2 = { nofree nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
