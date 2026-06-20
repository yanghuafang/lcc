; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@counter_calls.count = internal unnamed_addr global i32 0
@counter_with_init.count = internal unnamed_addr global i32 10
@bump_runtime_static_decl.value = internal unnamed_addr global i32 0
@bump_runtime_static_decl.value.inited = private unnamed_addr global i1 false
@str = private unnamed_addr constant [23 x i8] c"38.static_local.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [23 x i8] c"38.static_local.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @get_seed() local_unnamed_addr #0 {
entry:
  ret i32 7
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none)
define i32 @counter_calls() local_unnamed_addr #1 {
entry:
  %0 = load i32, ptr @counter_calls.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter_calls.count, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none)
define i32 @counter_with_init() local_unnamed_addr #1 {
entry:
  %0 = load i32, ptr @counter_with_init.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @counter_with_init.count, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none)
define i32 @bump_runtime_static_decl() local_unnamed_addr #1 {
entry:
  %static.inited = load i1, ptr @bump_runtime_static_decl.value.inited, align 1
  br i1 %static.inited, label %entry.static.cont_crit_edge, label %static.init

entry.static.cont_crit_edge:                      ; preds = %entry
  %.pre = load i32, ptr @bump_runtime_static_decl.value, align 4
  %0 = add i32 %.pre, 1
  br label %static.cont

static.init:                                      ; preds = %entry
  store i1 true, ptr @bump_runtime_static_decl.value.inited, align 1
  br label %static.cont

static.cont:                                      ; preds = %entry.static.cont_crit_edge, %static.init
  %1 = phi i32 [ %0, %entry.static.cont_crit_edge ], [ 8, %static.init ]
  store i32 %1, ptr @bump_runtime_static_decl.value, align 4
  ret i32 %1
}

; Function Attrs: nofree nounwind
define range(i32 0, 2) i32 @main() local_unnamed_addr #2 {
entry:
  %0 = load i32, ptr @counter_calls.count, align 4
  %1 = add i32 %0, 3
  store i32 %1, ptr @counter_calls.count, align 4
  %.not31 = icmp ne i32 %0, 0
  %2 = load i32, ptr @counter_with_init.count, align 4
  %.not32 = icmp ne i32 %2, 10
  %3 = add i32 %2, 2
  store i32 %3, ptr @counter_with_init.count, align 4
  %narrow53 = select i1 %.not32, i1 true, i1 %.not31
  %err.4 = zext i1 %narrow53 to i32
  %static.inited.i = load i1, ptr @bump_runtime_static_decl.value.inited, align 1
  br i1 %static.inited.i, label %bump_runtime_static_decl.exit41, label %bump_runtime_static_decl.exit41.thread48

bump_runtime_static_decl.exit41.thread48:         ; preds = %entry
  store i1 true, ptr @bump_runtime_static_decl.value.inited, align 1
  store i32 9, ptr @bump_runtime_static_decl.value, align 4
  br label %5

bump_runtime_static_decl.exit41:                  ; preds = %entry
  %.pre.i = load i32, ptr @bump_runtime_static_decl.value, align 4
  %.pre.i.fr = freeze i32 %.pre.i
  %.not34 = icmp eq i32 %.pre.i.fr, 7
  %spec.select52 = select i1 %.not34, i32 %err.4, i32 1
  %4 = add i32 %.pre.i.fr, 2
  store i32 %4, ptr @bump_runtime_static_decl.value, align 4
  %.not35 = icmp eq i32 %4, 9
  br i1 %.not35, label %5, label %else20

5:                                                ; preds = %bump_runtime_static_decl.exit41, %bump_runtime_static_decl.exit41.thread48
  %6 = phi i32 [ %err.4, %bump_runtime_static_decl.exit41.thread48 ], [ %spec.select52, %bump_runtime_static_decl.exit41 ]
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %if.end21, label %else20

else20:                                           ; preds = %bump_runtime_static_decl.exit41, %5
  br label %if.end21

if.end21:                                         ; preds = %5, %else20
  %str.sink = phi ptr [ @str, %else20 ], [ @str.1, %5 ]
  %8 = phi i32 [ 1, %else20 ], [ 0, %5 ]
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) %str.sink)
  ret i32 %8
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) }
attributes #2 = { nofree nounwind }
