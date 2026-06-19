; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@counter_calls.count = internal unnamed_addr global i32 0
@counter_with_init.count = internal unnamed_addr global i32 10
@bump_runtime_static_decl.value = internal unnamed_addr global i32 0
@bump_runtime_static_decl.value.inited = private unnamed_addr global i1 false
@str = private unnamed_addr constant [23 x i8] c"38.static_local.c FAIL\00", align 1
@str.1 = private unnamed_addr constant [23 x i8] c"38.static_local.c PASS\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @get_seed() local_unnamed_addr #0 {
entry:
  ret i32 7
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define i32 @counter_calls() local_unnamed_addr #1 {
entry:
  %0 = load i32, i32* @counter_calls.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @counter_calls.count, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define i32 @counter_with_init() local_unnamed_addr #1 {
entry:
  %0 = load i32, i32* @counter_with_init.count, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @counter_with_init.count, align 4
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define i32 @bump_runtime_static_decl() local_unnamed_addr #1 {
entry:
  %static.inited = load i1, i1* @bump_runtime_static_decl.value.inited, align 1
  br i1 %static.inited, label %entry.static.cont_crit_edge, label %static.init

entry.static.cont_crit_edge:                      ; preds = %entry
  %.pre = load i32, i32* @bump_runtime_static_decl.value, align 4
  %phi.bo = add i32 %.pre, 1
  br label %static.cont

static.init:                                      ; preds = %entry
  store i1 true, i1* @bump_runtime_static_decl.value.inited, align 1
  br label %static.cont

static.cont:                                      ; preds = %entry.static.cont_crit_edge, %static.init
  %0 = phi i32 [ %phi.bo, %entry.static.cont_crit_edge ], [ 8, %static.init ]
  store i32 %0, i32* @bump_runtime_static_decl.value, align 4
  ret i32 %0
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #2 {
entry:
  %0 = load i32, i32* @counter_calls.count, align 4
  %.not = icmp eq i32 %0, 0
  %1 = add i32 %0, 3
  store i32 %1, i32* @counter_calls.count, align 4
  %2 = load i32, i32* @counter_with_init.count, align 4
  %3 = add i32 %2, 2
  store i32 %3, i32* @counter_with_init.count, align 4
  %4 = icmp eq i32 %2, 10
  %narrow45 = select i1 %4, i1 %.not, i1 false
  %static.inited.i = load i1, i1* @bump_runtime_static_decl.value.inited, align 1
  br i1 %static.inited.i, label %bump_runtime_static_decl.exit, label %bump_runtime_static_decl.exit.thread

bump_runtime_static_decl.exit.thread:             ; preds = %entry
  store i1 true, i1* @bump_runtime_static_decl.value.inited, align 1
  br label %bump_runtime_static_decl.exit42

bump_runtime_static_decl.exit:                    ; preds = %entry
  %.pre.i = load i32, i32* @bump_runtime_static_decl.value, align 4
  %.not34 = icmp eq i32 %.pre.i, 7
  br i1 %.not34, label %bump_runtime_static_decl.exit42, label %bump_runtime_static_decl.exit42.thread48

bump_runtime_static_decl.exit42.thread48:         ; preds = %bump_runtime_static_decl.exit
  %phi.bo.i3949 = add i32 %.pre.i, 2
  store i32 %phi.bo.i3949, i32* @bump_runtime_static_decl.value, align 4
  br label %else20

bump_runtime_static_decl.exit42:                  ; preds = %bump_runtime_static_decl.exit, %bump_runtime_static_decl.exit.thread
  store i32 9, i32* @bump_runtime_static_decl.value, align 4
  br i1 %narrow45, label %if.end21, label %else20

else20:                                           ; preds = %bump_runtime_static_decl.exit42.thread48, %bump_runtime_static_decl.exit42
  br label %if.end21

if.end21:                                         ; preds = %bump_runtime_static_decl.exit42, %else20
  %.sink = phi i8* [ getelementptr inbounds ([23 x i8], [23 x i8]* @str, i64 0, i64 0), %else20 ], [ getelementptr inbounds ([23 x i8], [23 x i8]* @str.1, i64 0, i64 0), %bump_runtime_static_decl.exit42 ]
  %5 = phi i32 [ 1, %else20 ], [ 0, %bump_runtime_static_decl.exit42 ]
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) %.sink)
  ret i32 %5
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn }
attributes #2 = { nofree nounwind }
