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
  store i32 %0, i32* %n, align 4, !dbg !7
  store i32 0, i32* %sum, align 4, !dbg !7
  store i32 1, i32* %i, align 4, !dbg !7
  br label %while.cond, !dbg !7

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !7
  %2 = load i32, i32* %n, align 4, !dbg !7
  %3 = icmp sle i32 %1, %2, !dbg !7
  br i1 %3, label %while.loop, label %while.end, !dbg !7

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4, !dbg !7
  %5 = load i32, i32* %sum, align 4, !dbg !7
  %6 = add i32 %5, %4, !dbg !7
  store i32 %6, i32* %sum, align 4, !dbg !7
  %7 = load i32, i32* %sum, align 4, !dbg !7
  %8 = load i32, i32* %i, align 4, !dbg !7
  %9 = add i32 %8, 1, !dbg !7
  store i32 %9, i32* %i, align 4, !dbg !7
  %10 = load i32, i32* %i, align 4, !dbg !7
  br label %while.cond, !dbg !7

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %sum, align 4, !dbg !7
  ret i32 %11, !dbg !7
}

define i32 @countSum2(i32 %0) !dbg !8 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4, !dbg !9
  store i32 0, i32* %sum, align 4, !dbg !9
  store i32 0, i32* %i, align 4, !dbg !9
  br label %do.loop, !dbg !9

do.loop:                                          ; preds = %do.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !9
  %2 = load i32, i32* %sum, align 4, !dbg !9
  %3 = add i32 %2, %1, !dbg !9
  store i32 %3, i32* %sum, align 4, !dbg !9
  %4 = load i32, i32* %sum, align 4, !dbg !9
  %5 = load i32, i32* %i, align 4, !dbg !9
  %6 = add i32 %5, 1, !dbg !9
  store i32 %6, i32* %i, align 4, !dbg !9
  %7 = load i32, i32* %i, align 4, !dbg !9
  %8 = load i32, i32* %i, align 4, !dbg !9
  %9 = load i32, i32* %n, align 4, !dbg !9
  %10 = icmp sle i32 %8, %9, !dbg !9
  br i1 %10, label %do.loop, label %do.end, !dbg !9

do.end:                                           ; preds = %do.loop
  %11 = load i32, i32* %sum, align 4, !dbg !9
  ret i32 %11, !dbg !9
}

define i32 @main() !dbg !10 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !13
  %0 = call i32 @countSum(i32 100), !dbg !13
  %1 = icmp ne i32 %0, 5050, !dbg !13
  br i1 %1, label %then, label %if.end, !dbg !13

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !13
  %2 = load i32, i32* %err, align 4, !dbg !13
  br label %if.end, !dbg !13

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !13
  %4 = icmp ne i32 %3, 5050, !dbg !13
  br i1 %4, label %then1, label %if.end3, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !13
  %5 = load i32, i32* %err, align 4, !dbg !13
  br label %if.end3, !dbg !13

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum(i32 0), !dbg !13
  %7 = icmp ne i32 %6, 0, !dbg !13
  br i1 %7, label %then4, label %if.end6, !dbg !13

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !13
  %8 = load i32, i32* %err, align 4, !dbg !13
  br label %if.end6, !dbg !13

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !13
  %10 = icmp ne i32 %9, 0, !dbg !13
  br i1 %10, label %then7, label %if.end9, !dbg !13

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !13
  %11 = load i32, i32* %err, align 4, !dbg !13
  br label %if.end9, !dbg !13

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, i32* %err, align 4, !dbg !13
  %13 = icmp eq i32 %12, 0, !dbg !13
  %. = select i1 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !13
  %14 = call i32 (i8*, ...) @printf(i8* %.), !dbg !13
  %15 = load i32, i32* %err, align 4, !dbg !13
  ret i32 %15, !dbg !13
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "20.do_while.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 1, column: 1, scope: !8)
!10 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DISubroutineType(types: !12)
!12 = !{!5}
!13 = !DILocation(line: 1, column: 1, scope: !10)
