; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countSum(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %sum, align 4, !dbg !7
  store i32 1, i32* %i, align 4, !dbg !8
  br label %while.cond, !dbg !9

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !9
  %2 = load i32, i32* %n, align 4, !dbg !9
  %3 = icmp sle i32 %1, %2, !dbg !9
  br i1 %3, label %while.loop, label %while.end, !dbg !9

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4, !dbg !10
  %5 = load i32, i32* %sum, align 4, !dbg !10
  %6 = add i32 %5, %4, !dbg !10
  store i32 %6, i32* %sum, align 4, !dbg !10
  %7 = load i32, i32* %sum, align 4, !dbg !10
  %8 = load i32, i32* %i, align 4, !dbg !11
  %9 = add i32 %8, 1, !dbg !11
  store i32 %9, i32* %i, align 4, !dbg !11
  %10 = load i32, i32* %i, align 4, !dbg !11
  br label %while.cond, !dbg !11

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %sum, align 4, !dbg !12
  ret i32 %11, !dbg !12
}

define i32 @countSum2(i32 %0) !dbg !13 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !12
  store i32 0, i32* %sum, align 4, !dbg !14
  store i32 0, i32* %i, align 4, !dbg !15
  br label %do.loop, !dbg !16

do.loop:                                          ; preds = %do.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !17
  %2 = load i32, i32* %sum, align 4, !dbg !17
  %3 = add i32 %2, %1, !dbg !17
  store i32 %3, i32* %sum, align 4, !dbg !17
  %4 = load i32, i32* %sum, align 4, !dbg !17
  %5 = load i32, i32* %i, align 4, !dbg !18
  %6 = add i32 %5, 1, !dbg !18
  store i32 %6, i32* %i, align 4, !dbg !18
  %7 = load i32, i32* %i, align 4, !dbg !18
  %8 = load i32, i32* %i, align 4, !dbg !18
  %9 = load i32, i32* %n, align 4, !dbg !18
  %10 = icmp sle i32 %8, %9, !dbg !18
  br i1 %10, label %do.loop, label %do.end, !dbg !18

do.end:                                           ; preds = %do.loop
  %11 = load i32, i32* %sum, align 4, !dbg !19
  ret i32 %11, !dbg !19
}

define i32 @main() !dbg !20 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !23
  %0 = call i32 @countSum(i32 100), !dbg !24
  %1 = icmp ne i32 %0, 5050, !dbg !24
  br i1 %1, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !25
  %2 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !26
  %4 = icmp ne i32 %3, 5050, !dbg !26
  br i1 %4, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !27
  %5 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum(i32 0), !dbg !28
  %7 = icmp ne i32 %6, 0, !dbg !28
  br i1 %7, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %8 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !30
  %10 = icmp ne i32 %9, 0, !dbg !30
  br i1 %10, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !31
  %11 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, i32* %err, align 4, !dbg !32
  %13 = icmp eq i32 %12, 0, !dbg !32
  %. = select i1 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !33
  %14 = call i32 (i8*, ...) @printf(i8* %.), !dbg !33
  %15 = load i32, i32* %err, align 4, !dbg !34
  ret i32 %15, !dbg !34
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "20.do_while.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 7, column: 5, scope: !2)
!11 = !DILocation(line: 8, column: 5, scope: !2)
!12 = !DILocation(line: 10, column: 3, scope: !2)
!13 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!14 = !DILocation(line: 14, column: 3, scope: !13)
!15 = !DILocation(line: 15, column: 3, scope: !13)
!16 = !DILocation(line: 16, column: 3, scope: !13)
!17 = !DILocation(line: 17, column: 5, scope: !13)
!18 = !DILocation(line: 18, column: 5, scope: !13)
!19 = !DILocation(line: 20, column: 3, scope: !13)
!20 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 23, type: !21, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!21 = !DISubroutineType(types: !22)
!22 = !{!5}
!23 = !DILocation(line: 24, column: 3, scope: !20)
!24 = !DILocation(line: 26, column: 3, scope: !20)
!25 = !DILocation(line: 26, column: 30, scope: !20)
!26 = !DILocation(line: 27, column: 3, scope: !20)
!27 = !DILocation(line: 27, column: 31, scope: !20)
!28 = !DILocation(line: 28, column: 3, scope: !20)
!29 = !DILocation(line: 28, column: 25, scope: !20)
!30 = !DILocation(line: 29, column: 3, scope: !20)
!31 = !DILocation(line: 29, column: 26, scope: !20)
!32 = !DILocation(line: 31, column: 3, scope: !20)
!33 = !DILocation(line: 0, scope: !20)
!34 = !DILocation(line: 36, column: 3, scope: !20)
!dbg attachment points at wrong subprogram for function
!13 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
i32 (i32)* @countSum2
  store i32 %0, i32* %n, align 4, !dbg !12
!12 = !DILocation(line: 10, column: 3, scope: !2)
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
