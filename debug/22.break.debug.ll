; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countNumber(i32 %0, i32 %1) !dbg !2 {
entry:
  %i = alloca i32, align 4
  %recordi = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, i32* %maxRange, align 4
  store i32 %1, i32* %smallRange, align 4
  store i32 0, i32* %count, align 4, !dbg !7
  store i32 0, i32* %recordi, align 4, !dbg !8
  store i32 1, i32* %i, align 4, !dbg !9
  br label %for.cond, !dbg !9

for.cond:                                         ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4, !dbg !9
  %3 = load i32, i32* %maxRange, align 4, !dbg !9
  %4 = icmp sle i32 %2, %3, !dbg !9
  br i1 %4, label %for.loop, label %for.end, !dbg !9

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !10
  %6 = load i32, i32* %smallRange, align 4, !dbg !10
  %7 = icmp sgt i32 %5, %6, !dbg !10
  br i1 %7, label %then, label %if.end, !dbg !10

then:                                             ; preds = %for.loop
  %8 = load i32, i32* %i, align 4, !dbg !11
  store i32 %8, i32* %recordi, align 4, !dbg !11
  %9 = load i32, i32* %recordi, align 4, !dbg !11
  br label %for.end, !dbg !12

if.end:                                           ; preds = %for.loop
  %10 = load i32, i32* %count, align 4, !dbg !13
  %11 = add i32 %10, 1, !dbg !13
  store i32 %11, i32* %count, align 4, !dbg !13
  %12 = load i32, i32* %count, align 4, !dbg !13
  %13 = load i32, i32* %i, align 4, !dbg !13
  %14 = add i32 %13, 1, !dbg !13
  store i32 %14, i32* %i, align 4, !dbg !13
  %15 = load i32, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.end:                                          ; preds = %for.cond, %then
  %16 = load i32, i32* %count, align 4, !dbg !14
  ret i32 %16, !dbg !14
}

define i32 @main() !dbg !15 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !18
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !19
  %1 = icmp ne i32 %0, 37, !dbg !19
  br i1 %1, label %then, label %if.end, !dbg !19

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !20
  %2 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countNumber(i32 10, i32 10), !dbg !21
  %4 = icmp ne i32 %3, 10, !dbg !21
  br i1 %4, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !22
  %5 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end3, !dbg !22

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countNumber(i32 5, i32 0), !dbg !23
  %7 = icmp ne i32 %6, 0, !dbg !23
  br i1 %7, label %then4, label %if.end6, !dbg !23

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !24
  %8 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end6, !dbg !24

if.end6:                                          ; preds = %if.end3, %then4
  %9 = load i32, i32* %err, align 4, !dbg !25
  %10 = icmp eq i32 %9, 0, !dbg !25
  %. = select i1 %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !26
  %11 = call i32 (i8*, ...) @printf(i8* %.), !dbg !26
  %12 = load i32, i32* %err, align 4, !dbg !27
  ret i32 %12, !dbg !27
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "22.break.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 8, scope: !2)
!10 = !DILocation(line: 7, column: 5, scope: !2)
!11 = !DILocation(line: 8, column: 7, scope: !2)
!12 = !DILocation(line: 9, column: 7, scope: !2)
!13 = !DILocation(line: 11, column: 5, scope: !2)
!14 = !DILocation(line: 13, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 16, type: !16, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!16 = !DISubroutineType(types: !17)
!17 = !{!5}
!18 = !DILocation(line: 17, column: 3, scope: !15)
!19 = !DILocation(line: 19, column: 3, scope: !15)
!20 = !DILocation(line: 19, column: 35, scope: !15)
!21 = !DILocation(line: 20, column: 3, scope: !15)
!22 = !DILocation(line: 20, column: 34, scope: !15)
!23 = !DILocation(line: 21, column: 3, scope: !15)
!24 = !DILocation(line: 21, column: 31, scope: !15)
!25 = !DILocation(line: 23, column: 3, scope: !15)
!26 = !DILocation(line: 0, scope: !15)
!27 = !DILocation(line: 28, column: 3, scope: !15)
