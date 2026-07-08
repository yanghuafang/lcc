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

define i32 @get_seed() !dbg !4 {
entry:
  ret i32 7, !dbg !9
}

define i32 @counter_calls() !dbg !10 {
entry:
  %0 = load i32, i32* @counter_calls.count, align 4, !dbg !11
  %1 = add i32 %0, 1, !dbg !11
  store i32 %1, i32* @counter_calls.count, align 4, !dbg !11
  %2 = load i32, i32* @counter_calls.count, align 4, !dbg !12
  ret i32 %2, !dbg !12
}

define i32 @counter_with_init() !dbg !13 {
entry:
  %0 = load i32, i32* @counter_with_init.count, align 4, !dbg !14
  %1 = add i32 %0, 1, !dbg !14
  store i32 %1, i32* @counter_with_init.count, align 4, !dbg !14
  %2 = load i32, i32* @counter_with_init.count, align 4, !dbg !15
  ret i32 %2, !dbg !15
}

define i32 @bump_runtime_static_decl() !dbg !16 {
entry:
  %static.inited = load i1, i1* @bump_runtime_static_decl.value.inited, align 1, !dbg !17
  br i1 %static.inited, label %static.cont, label %static.init, !dbg !17

static.init:                                      ; preds = %entry
  %0 = call i32 @get_seed(), !dbg !17
  store i32 %0, i32* @bump_runtime_static_decl.value, align 4, !dbg !17
  store i1 true, i1* @bump_runtime_static_decl.value.inited, align 1, !dbg !17
  br label %static.cont, !dbg !17

static.cont:                                      ; preds = %static.init, %entry
  %1 = load i32, i32* @bump_runtime_static_decl.value, align 4, !dbg !18
  %2 = add i32 %1, 1, !dbg !18
  store i32 %2, i32* @bump_runtime_static_decl.value, align 4, !dbg !18
  %3 = load i32, i32* @bump_runtime_static_decl.value, align 4, !dbg !19
  ret i32 %3, !dbg !19
}

define i32 @main() !dbg !20 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %err, align 4, !dbg !22
  %0 = call i32 @counter_calls(), !dbg !23
  %1 = icmp ne i32 %0, 1, !dbg !23
  br i1 %1, label %then, label %if.end, !dbg !23

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !24
  %2 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end, !dbg !24

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @counter_calls(), !dbg !25
  %4 = icmp ne i32 %3, 2, !dbg !25
  br i1 %4, label %then1, label %if.end3, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !26
  %5 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @counter_calls(), !dbg !27
  %7 = icmp ne i32 %6, 3, !dbg !27
  br i1 %7, label %then4, label %if.end6, !dbg !27

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !28
  %8 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end6, !dbg !28

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @counter_with_init(), !dbg !29
  %10 = icmp ne i32 %9, 11, !dbg !29
  br i1 %10, label %then7, label %if.end9, !dbg !29

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !30
  %11 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end9, !dbg !30

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @counter_with_init(), !dbg !31
  %13 = icmp ne i32 %12, 12, !dbg !31
  br i1 %13, label %then10, label %if.end12, !dbg !31

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !32
  %14 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end12, !dbg !32

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @bump_runtime_static_decl(), !dbg !33
  %16 = icmp ne i32 %15, 8, !dbg !33
  br i1 %16, label %then13, label %if.end15, !dbg !33

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !34
  %17 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end15, !dbg !34

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @bump_runtime_static_decl(), !dbg !35
  %19 = icmp ne i32 %18, 9, !dbg !35
  br i1 %19, label %then16, label %if.end18, !dbg !35

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !36
  %20 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end18, !dbg !36

if.end18:                                         ; preds = %if.end15, %then16
  %21 = load i32, i32* %err, align 4, !dbg !37
  %22 = icmp eq i32 %21, 0, !dbg !37
  %. = select i1 %22, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !38
  %23 = call i32 (i8*, ...) @printf(i8* %.), !dbg !38
  %24 = load i32, i32* %err, align 4, !dbg !39
  ret i32 %24, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "38.static_local.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "get_seed", linkageName: "get_seed", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocation(line: 4, column: 3, scope: !4)
!10 = distinct !DISubprogram(name: "counter_calls", linkageName: "counter_calls", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!11 = !DILocation(line: 9, column: 3, scope: !10)
!12 = !DILocation(line: 10, column: 3, scope: !10)
!13 = distinct !DISubprogram(name: "counter_with_init", linkageName: "counter_with_init", scope: null, file: !1, line: 13, type: !5, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!14 = !DILocation(line: 15, column: 3, scope: !13)
!15 = !DILocation(line: 16, column: 3, scope: !13)
!16 = distinct !DISubprogram(name: "bump_runtime_static_decl", linkageName: "bump_runtime_static_decl", scope: null, file: !1, line: 19, type: !5, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!17 = !DILocation(line: 20, column: 10, scope: !16)
!18 = !DILocation(line: 21, column: 3, scope: !16)
!19 = !DILocation(line: 22, column: 3, scope: !16)
!20 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 25, type: !5, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!21 = !DILocalVariable(name: "err", scope: !20, file: !1, line: 26, type: !7)
!22 = !DILocation(line: 26, column: 3, scope: !20)
!23 = !DILocation(line: 28, column: 3, scope: !20)
!24 = !DILocation(line: 28, column: 29, scope: !20)
!25 = !DILocation(line: 29, column: 3, scope: !20)
!26 = !DILocation(line: 29, column: 29, scope: !20)
!27 = !DILocation(line: 30, column: 3, scope: !20)
!28 = !DILocation(line: 30, column: 29, scope: !20)
!29 = !DILocation(line: 32, column: 3, scope: !20)
!30 = !DILocation(line: 32, column: 34, scope: !20)
!31 = !DILocation(line: 33, column: 3, scope: !20)
!32 = !DILocation(line: 33, column: 34, scope: !20)
!33 = !DILocation(line: 35, column: 3, scope: !20)
!34 = !DILocation(line: 35, column: 40, scope: !20)
!35 = !DILocation(line: 36, column: 3, scope: !20)
!36 = !DILocation(line: 36, column: 40, scope: !20)
!37 = !DILocation(line: 38, column: 3, scope: !20)
!38 = !DILocation(line: 0, scope: !20)
!39 = !DILocation(line: 43, column: 3, scope: !20)
