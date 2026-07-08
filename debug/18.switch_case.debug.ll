; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1
@switch.table.gradeOfScore = private unnamed_addr constant [10 x i8] c"DDDDDCBBAA", align 1

declare i32 @printf(ptr, ...)

define i8 @gradeOfScore(i32 %0) !dbg !4 {
entry:
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !10, !DIExpression(), !11)
  %score = alloca i32, align 4
    #dbg_declare(ptr %score, !12, !DIExpression(), !13)
  store i32 %0, ptr %score, align 4, !dbg !13
  %1 = load i32, ptr %score, align 4, !dbg !14
  %switch.tableidx = sub i32 %1, 1, !dbg !14
  %2 = icmp ult i32 %switch.tableidx, 10, !dbg !14
  br i1 %2, label %switch.lookup, label %switch.end, !dbg !14

switch.lookup:                                    ; preds = %entry
  %switch.gep = getelementptr inbounds [10 x i8], ptr @switch.table.gradeOfScore, i32 0, i32 %switch.tableidx, !dbg !14
  %switch.load = load i8, ptr %switch.gep, align 1, !dbg !14
  br label %switch.end, !dbg !14

switch.end:                                       ; preds = %entry, %switch.lookup
  %.sink = phi i8 [ %switch.load, %switch.lookup ], [ 69, %entry ]
  store i8 %.sink, ptr %grade, align 1, !dbg !15
  %3 = load i8, ptr %grade, align 1, !dbg !15
  %4 = load i8, ptr %grade, align 1, !dbg !16
  ret i8 %4, !dbg !16
}

define i32 @main() !dbg !17 {
entry:
  %boundary = alloca i32, align 4
    #dbg_declare(ptr %boundary, !20, !DIExpression(), !21)
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !22, !DIExpression(), !23)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !24, !DIExpression(), !25)
  store i32 0, ptr %err, align 4, !dbg !25
  %0 = call i8 @gradeOfScore(i32 3), !dbg !26
  %1 = sext i8 %0 to i32, !dbg !26
  %2 = icmp ne i32 %1, 68, !dbg !26
  br i1 %2, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !27
  %3 = load i32, ptr %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %4 = call i8 @gradeOfScore(i32 5), !dbg !28
  %5 = sext i8 %4 to i32, !dbg !28
  %6 = icmp ne i32 %5, 68, !dbg !28
  br i1 %6, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !29
  %7 = load i32, ptr %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %8 = call i8 @gradeOfScore(i32 6), !dbg !30
  %9 = sext i8 %8 to i32, !dbg !30
  %10 = icmp ne i32 %9, 67, !dbg !30
  br i1 %10, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !31
  %11 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %12 = call i8 @gradeOfScore(i32 8), !dbg !32
  %13 = sext i8 %12 to i32, !dbg !32
  %14 = icmp ne i32 %13, 66, !dbg !32
  br i1 %14, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !33
  %15 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %16 = call i8 @gradeOfScore(i32 9), !dbg !34
  %17 = sext i8 %16 to i32, !dbg !34
  %18 = icmp ne i32 %17, 65, !dbg !34
  br i1 %18, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !35
  %19 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, ptr %boundary, align 4, !dbg !21
  %20 = load i32, ptr %boundary, align 4, !dbg !36
  store i8 69, ptr %grade, align 1, !dbg !37
  %21 = load i8, ptr %grade, align 1, !dbg !37
  %22 = load i8, ptr %grade, align 1, !dbg !38
  %23 = sext i8 %22 to i32, !dbg !38
  %24 = icmp ne i32 %23, 69, !dbg !38
  br i1 %24, label %then13, label %if.end15, !dbg !38

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !39
  %25 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end15, !dbg !39

if.end15:                                         ; preds = %if.end12, %then13
  %26 = load i32, ptr %err, align 4, !dbg !40
  %27 = icmp eq i32 %26, 0, !dbg !40
  %. = select i1 %27, ptr @0, ptr @1, !dbg !41
  %28 = call i32 (ptr, ...) @printf(ptr %.), !dbg !41
  %29 = load i32, ptr %err, align 4, !dbg !42
  ret i32 %29, !dbg !42
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "18.switch_case.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "gradeOfScore", linkageName: "gradeOfScore", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8}
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{}
!10 = !DILocalVariable(name: "grade", scope: !4, file: !1, line: 4, type: !7)
!11 = !DILocation(line: 4, column: 3, scope: !4)
!12 = !DILocalVariable(name: "score", arg: 1, scope: !4, file: !1, line: 3, type: !8)
!13 = !DILocation(line: 3, column: 6, scope: !4)
!14 = !DILocation(line: 5, column: 3, scope: !4)
!15 = !DILocation(line: 0, scope: !4)
!16 = !DILocation(line: 28, column: 3, scope: !4)
!17 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 31, type: !18, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!18 = !DISubroutineType(types: !19)
!19 = !{!8}
!20 = !DILocalVariable(name: "boundary", scope: !17, file: !1, line: 41, type: !8)
!21 = !DILocation(line: 41, column: 3, scope: !17)
!22 = !DILocalVariable(name: "grade", scope: !17, file: !1, line: 40, type: !7)
!23 = !DILocation(line: 40, column: 3, scope: !17)
!24 = !DILocalVariable(name: "err", scope: !17, file: !1, line: 32, type: !8)
!25 = !DILocation(line: 32, column: 3, scope: !17)
!26 = !DILocation(line: 34, column: 3, scope: !17)
!27 = !DILocation(line: 34, column: 31, scope: !17)
!28 = !DILocation(line: 35, column: 3, scope: !17)
!29 = !DILocation(line: 35, column: 31, scope: !17)
!30 = !DILocation(line: 36, column: 3, scope: !17)
!31 = !DILocation(line: 36, column: 31, scope: !17)
!32 = !DILocation(line: 37, column: 3, scope: !17)
!33 = !DILocation(line: 37, column: 31, scope: !17)
!34 = !DILocation(line: 38, column: 3, scope: !17)
!35 = !DILocation(line: 38, column: 31, scope: !17)
!36 = !DILocation(line: 42, column: 3, scope: !17)
!37 = !DILocation(line: 44, column: 7, scope: !17)
!38 = !DILocation(line: 47, column: 3, scope: !17)
!39 = !DILocation(line: 47, column: 21, scope: !17)
!40 = !DILocation(line: 49, column: 3, scope: !17)
!41 = !DILocation(line: 0, scope: !17)
!42 = !DILocation(line: 54, column: 3, scope: !17)
