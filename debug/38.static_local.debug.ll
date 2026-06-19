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
  %2 = load i32, i32* @counter_calls.count, align 4, !dbg !9
  ret i32 %2, !dbg !9
}

define i32 @counter_with_init() !dbg !10 {
entry:
  %0 = load i32, i32* @counter_with_init.count, align 4, !dbg !11
  %1 = add i32 %0, 1, !dbg !11
  store i32 %1, i32* @counter_with_init.count, align 4, !dbg !11
  %2 = load i32, i32* @counter_with_init.count, align 4, !dbg !11
  ret i32 %2, !dbg !11
}

define i32 @bump_runtime_static_decl() !dbg !12 {
entry:
  %static.inited = load i1, i1* @bump_runtime_static_decl.value.inited, align 1, !dbg !13
  br i1 %static.inited, label %static.cont, label %static.init, !dbg !13

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed(), !dbg !13
  store i32 %0, i32* @bump_runtime_static_decl.value, align 4, !dbg !13
  store i1 true, i1* @bump_runtime_static_decl.value.inited, align 1, !dbg !13
  br label %static.cont, !dbg !13

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, i32* @bump_runtime_static_decl.value, align 4, !dbg !13
  %2 = add i32 %1, 1, !dbg !13
  store i32 %2, i32* @bump_runtime_static_decl.value, align 4, !dbg !13
  %3 = load i32, i32* @bump_runtime_static_decl.value, align 4, !dbg !13
  ret i32 %3, !dbg !13
}

define i32 @main() !dbg !14 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !15
  %0 = call i32 @counter_calls(), !dbg !15
  %1 = icmp ne i32 %0, 1, !dbg !15
  br i1 %1, label %then, label %if.end, !dbg !15

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !15
  %2 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end, !dbg !15

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @counter_calls(), !dbg !15
  %4 = icmp ne i32 %3, 2, !dbg !15
  br i1 %4, label %then1, label %if.end3, !dbg !15

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %5 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @counter_calls(), !dbg !15
  %7 = icmp ne i32 %6, 3, !dbg !15
  br i1 %7, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !15
  %8 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end6, !dbg !15

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @counter_with_init(), !dbg !15
  %10 = icmp ne i32 %9, 11, !dbg !15
  br i1 %10, label %then7, label %if.end9, !dbg !15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !15
  %11 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end9, !dbg !15

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @counter_with_init(), !dbg !15
  %13 = icmp ne i32 %12, 12, !dbg !15
  br i1 %13, label %then10, label %if.end12, !dbg !15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !15
  %14 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end12, !dbg !15

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !15
  %16 = icmp ne i32 %15, 8, !dbg !15
  br i1 %16, label %then13, label %if.end15, !dbg !15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !15
  %17 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end15, !dbg !15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !15
  %19 = icmp ne i32 %18, 9, !dbg !15
  br i1 %19, label %then16, label %if.end18, !dbg !15

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !15
  %20 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end18, !dbg !15

if.end18:                                         ; preds = %if.end15, %then16
  %21 = load i32, i32* %err, align 4, !dbg !15
  %22 = icmp eq i32 %21, 0, !dbg !15
  %. = select i1 %22, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !15
  %23 = call i32 (i8*, ...) @printf(i8* %.), !dbg !15
  %24 = load i32, i32* %err, align 4, !dbg !15
  ret i32 %24, !dbg !15
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 1, column: 1, scope: !8)
!10 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DILocation(line: 1, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!13 = !DILocation(line: 1, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!15 = !DILocation(line: 1, column: 1, scope: !14)
