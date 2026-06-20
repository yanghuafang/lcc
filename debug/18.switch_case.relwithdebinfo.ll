; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1
@switch.table.gradeOfScore = private unnamed_addr constant [10 x i8] c"DDDDDCBBAA", align 1

declare i32 @printf(ptr, ...)

define i8 @gradeOfScore(i32 %0) !dbg !2 {
entry:
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !8, !DIExpression(), !9)
  %score = alloca i32, align 4
    #dbg_declare(ptr %score, !10, !DIExpression(), !11)
  store i32 %0, ptr %score, align 4, !dbg !11
  %1 = load i32, ptr %score, align 4, !dbg !12
  %switch.tableidx = sub i32 %1, 1, !dbg !12
  %2 = icmp ult i32 %switch.tableidx, 10, !dbg !12
  br i1 %2, label %switch.lookup, label %switch.end, !dbg !12

switch.lookup:                                    ; preds = %entry
  %switch.gep = getelementptr inbounds [10 x i8], ptr @switch.table.gradeOfScore, i32 0, i32 %switch.tableidx, !dbg !12
  %switch.load = load i8, ptr %switch.gep, align 1, !dbg !12
  br label %switch.end, !dbg !12

switch.end:                                       ; preds = %entry, %switch.lookup
  %.sink = phi i8 [ %switch.load, %switch.lookup ], [ 69, %entry ]
  store i8 %.sink, ptr %grade, align 1, !dbg !13
  %3 = load i8, ptr %grade, align 1, !dbg !13
  %4 = load i8, ptr %grade, align 1, !dbg !14
  ret i8 %4, !dbg !14
}

define i32 @main() !dbg !15 {
entry:
  %boundary = alloca i32, align 4
    #dbg_declare(ptr %boundary, !18, !DIExpression(), !19)
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !20, !DIExpression(), !21)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !22, !DIExpression(), !23)
  store i32 0, ptr %err, align 4, !dbg !23
  %0 = call i8 @gradeOfScore(i32 3), !dbg !24
  %1 = sext i8 %0 to i32, !dbg !24
  %2 = icmp ne i32 %1, 68, !dbg !24
  br i1 %2, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !25
  %3 = load i32, ptr %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %4 = call i8 @gradeOfScore(i32 5), !dbg !26
  %5 = sext i8 %4 to i32, !dbg !26
  %6 = icmp ne i32 %5, 68, !dbg !26
  br i1 %6, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !27
  %7 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  %8 = call i8 @gradeOfScore(i32 6), !dbg !28
  %9 = sext i8 %8 to i32, !dbg !28
  %10 = icmp ne i32 %9, 67, !dbg !28
  br i1 %10, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !29
  %11 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %12 = call i8 @gradeOfScore(i32 8), !dbg !30
  %13 = sext i8 %12 to i32, !dbg !30
  %14 = icmp ne i32 %13, 66, !dbg !30
  br i1 %14, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !31
  %15 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  %16 = call i8 @gradeOfScore(i32 9), !dbg !32
  %17 = sext i8 %16 to i32, !dbg !32
  %18 = icmp ne i32 %17, 65, !dbg !32
  br i1 %18, label %then10, label %if.end12, !dbg !32

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !33
  %19 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end12, !dbg !33

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, ptr %boundary, align 4, !dbg !19
  %20 = load i32, ptr %boundary, align 4, !dbg !34
  store i8 69, ptr %grade, align 1, !dbg !35
  %21 = load i8, ptr %grade, align 1, !dbg !35
  %22 = load i8, ptr %grade, align 1, !dbg !36
  %23 = sext i8 %22 to i32, !dbg !36
  %24 = icmp ne i32 %23, 69, !dbg !36
  br i1 %24, label %then13, label %if.end15, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !37
  %25 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %if.end12, %then13
  %26 = load i32, ptr %err, align 4, !dbg !38
  %27 = icmp eq i32 %26, 0, !dbg !38
  %. = select i1 %27, ptr @0, ptr @1, !dbg !39
  %28 = call i32 (ptr, ...) @printf(ptr %.), !dbg !39
  %29 = load i32, ptr %err, align 4, !dbg !40
  ret i32 %29, !dbg !40
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "18.switch_case.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "gradeOfScore", linkageName: "gradeOfScore", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{}
!8 = !DILocalVariable(name: "grade", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "score", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!11 = !DILocation(line: 3, column: 6, scope: !2)
!12 = !DILocation(line: 5, column: 3, scope: !2)
!13 = !DILocation(line: 0, scope: !2)
!14 = !DILocation(line: 28, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 31, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!16 = !DISubroutineType(types: !17)
!17 = !{!6}
!18 = !DILocalVariable(name: "boundary", scope: !15, file: !1, line: 41, type: !6)
!19 = !DILocation(line: 41, column: 3, scope: !15)
!20 = !DILocalVariable(name: "grade", scope: !15, file: !1, line: 40, type: !5)
!21 = !DILocation(line: 40, column: 3, scope: !15)
!22 = !DILocalVariable(name: "err", scope: !15, file: !1, line: 32, type: !6)
!23 = !DILocation(line: 32, column: 3, scope: !15)
!24 = !DILocation(line: 34, column: 3, scope: !15)
!25 = !DILocation(line: 34, column: 31, scope: !15)
!26 = !DILocation(line: 35, column: 3, scope: !15)
!27 = !DILocation(line: 35, column: 31, scope: !15)
!28 = !DILocation(line: 36, column: 3, scope: !15)
!29 = !DILocation(line: 36, column: 31, scope: !15)
!30 = !DILocation(line: 37, column: 3, scope: !15)
!31 = !DILocation(line: 37, column: 31, scope: !15)
!32 = !DILocation(line: 38, column: 3, scope: !15)
!33 = !DILocation(line: 38, column: 31, scope: !15)
!34 = !DILocation(line: 42, column: 3, scope: !15)
!35 = !DILocation(line: 44, column: 7, scope: !15)
!36 = !DILocation(line: 47, column: 3, scope: !15)
!37 = !DILocation(line: 47, column: 21, scope: !15)
!38 = !DILocation(line: 49, column: 3, scope: !15)
!39 = !DILocation(line: 0, scope: !15)
!40 = !DILocation(line: 54, column: 3, scope: !15)
