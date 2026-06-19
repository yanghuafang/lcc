; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countSum(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %sum, align 4, !dbg !7
  store i32 1, i32* %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !8
  %2 = load i32, i32* %n, align 4, !dbg !8
  %3 = icmp sle i32 %1, %2, !dbg !8
  br i1 %3, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !9
  %5 = load i32, i32* %sum, align 4, !dbg !9
  %6 = add i32 %5, %4, !dbg !9
  store i32 %6, i32* %sum, align 4, !dbg !9
  %7 = load i32, i32* %sum, align 4, !dbg !9
  %8 = load i32, i32* %i, align 4, !dbg !9
  %9 = add i32 %8, 1, !dbg !9
  store i32 %9, i32* %i, align 4, !dbg !9
  %10 = load i32, i32* %i, align 4, !dbg !9
  br label %for.cond, !dbg !9

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %sum, align 4, !dbg !10
  ret i32 %11, !dbg !10
}

define i32 @countSum2(i32 %0) !dbg !11 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !10
  store i32 0, i32* %sum, align 4, !dbg !12
  store i32 1, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !14
  %2 = load i32, i32* %n, align 4, !dbg !14
  %3 = icmp sle i32 %1, %2, !dbg !14
  br i1 %3, label %for.loop, label %for.end, !dbg !14

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !15
  %5 = load i32, i32* %sum, align 4, !dbg !15
  %6 = add i32 %5, %4, !dbg !15
  store i32 %6, i32* %sum, align 4, !dbg !15
  %7 = load i32, i32* %sum, align 4, !dbg !15
  %8 = load i32, i32* %i, align 4, !dbg !15
  %9 = add i32 %8, 1, !dbg !15
  store i32 %9, i32* %i, align 4, !dbg !15
  %10 = load i32, i32* %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %sum, align 4, !dbg !16
  ret i32 %11, !dbg !16
}

define i32 @countSum3(i32 %0) !dbg !17 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !16
  store i32 0, i32* %sum, align 4, !dbg !18
  store i32 1, i32* %i, align 4, !dbg !19
  %1 = load i32, i32* %i, align 4, !dbg !19
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.loop, %entry
  %2 = load i32, i32* %i, align 4, !dbg !19
  %3 = load i32, i32* %n, align 4, !dbg !19
  %4 = icmp sle i32 %2, %3, !dbg !19
  br i1 %4, label %for.loop, label %for.end, !dbg !19

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !20
  %6 = load i32, i32* %sum, align 4, !dbg !20
  %7 = add i32 %6, %5, !dbg !20
  store i32 %7, i32* %sum, align 4, !dbg !20
  %8 = load i32, i32* %sum, align 4, !dbg !20
  %9 = load i32, i32* %i, align 4, !dbg !20
  %10 = add i32 %9, 1, !dbg !20
  store i32 %10, i32* %i, align 4, !dbg !20
  %11 = load i32, i32* %i, align 4, !dbg !20
  br label %for.cond, !dbg !20

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !21
  ret i32 %12, !dbg !21
}

define i32 @main() !dbg !22 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !25
  %0 = call i32 @countSum(i32 100), !dbg !26
  %1 = icmp ne i32 %0, 5050, !dbg !26
  br i1 %1, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !27
  %2 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !28
  %4 = icmp ne i32 %3, 5050, !dbg !28
  br i1 %4, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !29
  %5 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !30
  %7 = icmp ne i32 %6, 5050, !dbg !30
  br i1 %7, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !31
  %8 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum(i32 0), !dbg !32
  %10 = icmp ne i32 %9, 0, !dbg !32
  br i1 %10, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !33
  %11 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countSum(i32 1), !dbg !34
  %13 = icmp ne i32 %12, 1, !dbg !34
  br i1 %13, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !35
  %14 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !36
  %16 = icmp eq i32 %15, 0, !dbg !36
  %. = select i1 %16, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !37
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !37
  %18 = load i32, i32* %err, align 4, !dbg !38
  ret i32 %18, !dbg !38
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocation(line: 6, column: 5, scope: !2)
!10 = !DILocation(line: 8, column: 3, scope: !2)
!11 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!12 = !DILocation(line: 12, column: 3, scope: !11)
!13 = !DILocation(line: 13, column: 3, scope: !11)
!14 = !DILocation(line: 14, column: 3, scope: !11)
!15 = !DILocation(line: 15, column: 5, scope: !11)
!16 = !DILocation(line: 17, column: 3, scope: !11)
!17 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !1, line: 20, type: !3, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!18 = !DILocation(line: 21, column: 3, scope: !17)
!19 = !DILocation(line: 23, column: 3, scope: !17)
!20 = !DILocation(line: 24, column: 5, scope: !17)
!21 = !DILocation(line: 26, column: 3, scope: !17)
!22 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!23 = !DISubroutineType(types: !24)
!24 = !{!5}
!25 = !DILocation(line: 30, column: 3, scope: !22)
!26 = !DILocation(line: 32, column: 3, scope: !22)
!27 = !DILocation(line: 32, column: 30, scope: !22)
!28 = !DILocation(line: 33, column: 3, scope: !22)
!29 = !DILocation(line: 33, column: 31, scope: !22)
!30 = !DILocation(line: 34, column: 3, scope: !22)
!31 = !DILocation(line: 34, column: 31, scope: !22)
!32 = !DILocation(line: 35, column: 3, scope: !22)
!33 = !DILocation(line: 35, column: 25, scope: !22)
!34 = !DILocation(line: 36, column: 3, scope: !22)
!35 = !DILocation(line: 36, column: 25, scope: !22)
!36 = !DILocation(line: 38, column: 3, scope: !22)
!37 = !DILocation(line: 0, scope: !22)
!38 = !DILocation(line: 43, column: 3, scope: !22)
!dbg attachment points at wrong subprogram for function
!11 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
i32 (i32)* @countSum2
  store i32 %0, i32* %n, align 4, !dbg !10
!10 = !DILocation(line: 8, column: 3, scope: !2)
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
