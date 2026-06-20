; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@0 = private unnamed_addr constant [24 x i8] c"38.static_local.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"38.static_local.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @get_seed() !dbg !2 {
entry:
  ret i32 7, !dbg !6
}

define i32 @counter_calls() !dbg !7 {
entry:
  %0 = load i32, ptr @counter_calls.count, align 4, !dbg !8
  %1 = add i32 %0, 1, !dbg !8
  store i32 %1, ptr @counter_calls.count, align 4, !dbg !8
  %2 = load i32, ptr @counter_calls.count, align 4, !dbg !9
  ret i32 %2, !dbg !9
}

define i32 @counter_with_init() !dbg !10 {
entry:
  %0 = load i32, ptr @counter_with_init.count, align 4, !dbg !11
  %1 = add i32 %0, 1, !dbg !11
  store i32 %1, ptr @counter_with_init.count, align 4, !dbg !11
  %2 = load i32, ptr @counter_with_init.count, align 4, !dbg !12
  ret i32 %2, !dbg !12
}

define i32 @bump_runtime_static_decl() !dbg !13 {
entry:
  %static.inited = load i1, ptr @bump_runtime_static_decl.value.inited, align 1, !dbg !14
  br i1 %static.inited, label %static.cont, label %static.init, !dbg !14

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed(), !dbg !14
  store i32 %0, ptr @bump_runtime_static_decl.value, align 4, !dbg !14
  store i1 true, ptr @bump_runtime_static_decl.value.inited, align 1, !dbg !14
  br label %static.cont, !dbg !14

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, ptr @bump_runtime_static_decl.value, align 4, !dbg !15
  %2 = add i32 %1, 1, !dbg !15
  store i32 %2, ptr @bump_runtime_static_decl.value, align 4, !dbg !15
  %3 = load i32, ptr @bump_runtime_static_decl.value, align 4, !dbg !16
  ret i32 %3, !dbg !16
}

define i32 @main() !dbg !17 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !19, !DIExpression(), !20)
  store i32 0, ptr %err, align 4, !dbg !20
  %0 = call i32 @counter_calls(), !dbg !21
  %1 = icmp ne i32 %0, 1, !dbg !21
  br i1 %1, label %then, label %if.end, !dbg !21

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !22
  %2 = load i32, ptr %err, align 4, !dbg !22
  br label %if.end, !dbg !22

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @counter_calls(), !dbg !23
  %4 = icmp ne i32 %3, 2, !dbg !23
  br i1 %4, label %then1, label %if.end3, !dbg !23

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !24
  %5 = load i32, ptr %err, align 4, !dbg !24
  br label %if.end3, !dbg !24

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @counter_calls(), !dbg !25
  %7 = icmp ne i32 %6, 3, !dbg !25
  br i1 %7, label %then4, label %if.end6, !dbg !25

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !26
  %8 = load i32, ptr %err, align 4, !dbg !26
  br label %if.end6, !dbg !26

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @counter_with_init(), !dbg !27
  %10 = icmp ne i32 %9, 11, !dbg !27
  br i1 %10, label %then7, label %if.end9, !dbg !27

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !28
  %11 = load i32, ptr %err, align 4, !dbg !28
  br label %if.end9, !dbg !28

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @counter_with_init(), !dbg !29
  %13 = icmp ne i32 %12, 12, !dbg !29
  br i1 %13, label %then10, label %if.end12, !dbg !29

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !30
  %14 = load i32, ptr %err, align 4, !dbg !30
  br label %if.end12, !dbg !30

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !31
  %16 = icmp ne i32 %15, 8, !dbg !31
  br i1 %16, label %then13, label %if.end15, !dbg !31

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !32
  %17 = load i32, ptr %err, align 4, !dbg !32
  br label %if.end15, !dbg !32

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !33
  %19 = icmp ne i32 %18, 9, !dbg !33
  br i1 %19, label %then16, label %if.end18, !dbg !33

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !34
  %20 = load i32, ptr %err, align 4, !dbg !34
  br label %if.end18, !dbg !34

if.end18:                                         ; preds = %if.end15, %then16
  %21 = load i32, ptr %err, align 4, !dbg !35
  %22 = icmp eq i32 %21, 0, !dbg !35
  %. = select i1 %22, ptr @0, ptr @1, !dbg !36
  %23 = call i32 (ptr, ...) @printf(ptr %.), !dbg !36
  %24 = load i32, ptr %err, align 4, !dbg !37
  ret i32 %24, !dbg !37
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocation(line: 4, column: 3, scope: !2)
!7 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!8 = !DILocation(line: 9, column: 3, scope: !7)
!9 = !DILocation(line: 10, column: 3, scope: !7)
!10 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0)
!11 = !DILocation(line: 15, column: 3, scope: !10)
!12 = !DILocation(line: 16, column: 3, scope: !10)
!13 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !1, line: 19, type: !3, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0)
!14 = !DILocation(line: 20, column: 10, scope: !13)
!15 = !DILocation(line: 21, column: 3, scope: !13)
!16 = !DILocation(line: 22, column: 3, scope: !13)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 25, type: !3, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!18 = !{}
!19 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 26, type: !5)
!20 = !DILocation(line: 26, column: 3, scope: !17)
!21 = !DILocation(line: 28, column: 3, scope: !17)
!22 = !DILocation(line: 28, column: 29, scope: !17)
!23 = !DILocation(line: 29, column: 3, scope: !17)
!24 = !DILocation(line: 29, column: 29, scope: !17)
!25 = !DILocation(line: 30, column: 3, scope: !17)
!26 = !DILocation(line: 30, column: 29, scope: !17)
!27 = !DILocation(line: 32, column: 3, scope: !17)
!28 = !DILocation(line: 32, column: 34, scope: !17)
!29 = !DILocation(line: 33, column: 3, scope: !17)
!30 = !DILocation(line: 33, column: 34, scope: !17)
!31 = !DILocation(line: 35, column: 3, scope: !17)
!32 = !DILocation(line: 35, column: 40, scope: !17)
!33 = !DILocation(line: 36, column: 3, scope: !17)
!34 = !DILocation(line: 36, column: 40, scope: !17)
!35 = !DILocation(line: 38, column: 3, scope: !17)
!36 = !DILocation(line: 0, scope: !17)
!37 = !DILocation(line: 43, column: 3, scope: !17)
