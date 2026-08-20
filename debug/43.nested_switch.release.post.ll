; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@str.1 = private unnamed_addr constant [24 x i8] c"43.nested_switch.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 100, 1001) i32 @nested(i32 %0, i32 %1) local_unnamed_addr #0 {
entry:
  switch i32 %0, label %case.25 [
    i32 1, label %case.0
    i32 2, label %switch.end6
  ]

case.0:                                           ; preds = %entry
  %switch.selectcmp = icmp eq i32 %1, 2
  %switch.select = select i1 %switch.selectcmp, i32 112, i32 114
  %switch.selectcmp19 = icmp eq i32 %1, 1
  %switch.select20 = select i1 %switch.selectcmp19, i32 111, i32 %switch.select
  br label %switch.end6

case.25:                                          ; preds = %entry
  br label %switch.end6

switch.end6:                                      ; preds = %case.0, %entry, %case.25
  %r.2 = phi i32 [ 1000, %case.25 ], [ 100, %entry ], [ %switch.select20, %case.0 ]
  ret i32 %r.2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define range(i32 15, 17) i32 @threeDeep(i32 %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq i32 %0, 1
  %r.3 = select i1 %1, i32 15, i32 16
  ret i32 %r.3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @loopWithNestedSwitch() local_unnamed_addr #0 {
for.update.4:
  ret i32 431
}

; Function Attrs: nofree nounwind
define noundef range(i32 0, 2) i32 @main() local_unnamed_addr #1 {
if.end24:
  %puts41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
