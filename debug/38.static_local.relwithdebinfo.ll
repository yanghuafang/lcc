; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@counter_calls.count = internal global i32 0
@counter_with_init.count = internal global i32 10
@bump_runtime_static_decl.value = internal global i32 0
@bump_runtime_static_decl.value.inited = private global i1 false
@0 = private unnamed_addr constant [24 x i8] c"38.static_local.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"38.static_local.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @get_seed() !dbg !2 {
entry:
  ret i32 7, !dbg !7
}

define i32 @counter_calls() !dbg !8 {
entry:
  %0 = load i32, i32* @counter_calls.count, align 4, !dbg !9
  %1 = add i32 %0, 1, !dbg !9
  store i32 %1, i32* @counter_calls.count, align 4, !dbg !9
  %2 = load i32, i32* @counter_calls.count, align 4, !dbg !10
  ret i32 %2, !dbg !10
}

define i32 @counter_with_init() !dbg !11 {
entry:
  %0 = load i32, i32* @counter_with_init.count, align 4, !dbg !12
  %1 = add i32 %0, 1, !dbg !12
  store i32 %1, i32* @counter_with_init.count, align 4, !dbg !12
  %2 = load i32, i32* @counter_with_init.count, align 4, !dbg !13
  ret i32 %2, !dbg !13
}

define i32 @bump_runtime_static_decl() !dbg !14 {
entry:
  %static.inited = load i1, i1* @bump_runtime_static_decl.value.inited, align 1, !dbg !15
  br i1 %static.inited, label %static.cont, label %static.init, !dbg !15

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed(), !dbg !15
  store i32 %0, i32* @bump_runtime_static_decl.value, align 4, !dbg !15
  store i1 true, i1* @bump_runtime_static_decl.value.inited, align 1, !dbg !15
  br label %static.cont, !dbg !15

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, i32* @bump_runtime_static_decl.value, align 4, !dbg !16
  %2 = add i32 %1, 1, !dbg !16
  store i32 %2, i32* @bump_runtime_static_decl.value, align 4, !dbg !16
  %3 = load i32, i32* @bump_runtime_static_decl.value, align 4, !dbg !17
  ret i32 %3, !dbg !17
}

define i32 @main() !dbg !18 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !19
  %0 = call i32 @counter_calls(), !dbg !20
  %1 = icmp ne i32 %0, 1, !dbg !20
  br i1 %1, label %then, label %if.end, !dbg !20

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !21
  %2 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end, !dbg !21

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @counter_calls(), !dbg !22
  %4 = icmp ne i32 %3, 2, !dbg !22
  br i1 %4, label %then1, label %if.end3, !dbg !22

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !23
  %5 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end3, !dbg !23

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @counter_calls(), !dbg !24
  %7 = icmp ne i32 %6, 3, !dbg !24
  br i1 %7, label %then4, label %if.end6, !dbg !24

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !25
  %8 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end6, !dbg !25

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @counter_with_init(), !dbg !26
  %10 = icmp ne i32 %9, 11, !dbg !26
  br i1 %10, label %then7, label %if.end9, !dbg !26

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !27
  %11 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end9, !dbg !27

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @counter_with_init(), !dbg !28
  %13 = icmp ne i32 %12, 12, !dbg !28
  br i1 %13, label %then10, label %if.end12, !dbg !28

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !29
  %14 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end12, !dbg !29

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !30
  %16 = icmp ne i32 %15, 8, !dbg !30
  br i1 %16, label %then13, label %if.end15, !dbg !30

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !31
  %17 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end15, !dbg !31

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !32
  %19 = icmp ne i32 %18, 9, !dbg !32
  br i1 %19, label %then16, label %if.end18, !dbg !32

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !33
  %20 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end18, !dbg !33

if.end18:                                         ; preds = %if.end15, %then16
  %21 = load i32, i32* %err, align 4, !dbg !34
  %22 = icmp eq i32 %21, 0, !dbg !34
  %. = select i1 %22, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !35
  %23 = call i32 (i8*, ...) @printf(i8* %.), !dbg !35
  %24 = load i32, i32* %err, align 4, !dbg !36
  ret i32 %24, !dbg !36
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 9, column: 3, scope: !8)
!10 = !DILocation(line: 10, column: 3, scope: !8)
!11 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!12 = !DILocation(line: 15, column: 3, scope: !11)
!13 = !DILocation(line: 16, column: 3, scope: !11)
!14 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !1, line: 19, type: !3, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!15 = !DILocation(line: 20, column: 10, scope: !14)
!16 = !DILocation(line: 21, column: 3, scope: !14)
!17 = !DILocation(line: 22, column: 3, scope: !14)
!18 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 25, type: !3, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!19 = !DILocation(line: 26, column: 3, scope: !18)
!20 = !DILocation(line: 28, column: 3, scope: !18)
!21 = !DILocation(line: 28, column: 29, scope: !18)
!22 = !DILocation(line: 29, column: 3, scope: !18)
!23 = !DILocation(line: 29, column: 29, scope: !18)
!24 = !DILocation(line: 30, column: 3, scope: !18)
!25 = !DILocation(line: 30, column: 29, scope: !18)
!26 = !DILocation(line: 32, column: 3, scope: !18)
!27 = !DILocation(line: 32, column: 34, scope: !18)
!28 = !DILocation(line: 33, column: 3, scope: !18)
!29 = !DILocation(line: 33, column: 34, scope: !18)
!30 = !DILocation(line: 35, column: 3, scope: !18)
!31 = !DILocation(line: 35, column: 40, scope: !18)
!32 = !DILocation(line: 36, column: 3, scope: !18)
!33 = !DILocation(line: 36, column: 40, scope: !18)
!34 = !DILocation(line: 38, column: 3, scope: !18)
!35 = !DILocation(line: 0, scope: !18)
!36 = !DILocation(line: 43, column: 3, scope: !18)
