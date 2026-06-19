; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %ternarySame = alloca i32, align 4
  %same = alloca i32, align 4
  %maxNeg = alloca i32, align 4
  %minNeg = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %maxVal = alloca i32, align 4
  %minVal = alloca i32, align 4
  %c = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i32 3, i32* %a, align 4, !dbg !8
  store i32 7, i32* %c, align 4, !dbg !9
  %0 = load i32, i32* %a, align 4, !dbg !10
  %1 = load i32, i32* %c, align 4, !dbg !10
  %2 = icmp slt i32 %0, %1, !dbg !10
  %3 = load i32, i32* %a, align 4, !dbg !10
  %4 = load i32, i32* %c, align 4, !dbg !10
  %5 = select i1 %2, i32 %3, i32 %4, !dbg !10
  store i32 %5, i32* %minVal, align 4, !dbg !10
  %6 = load i32, i32* %a, align 4, !dbg !11
  %7 = load i32, i32* %c, align 4, !dbg !11
  %8 = icmp slt i32 %6, %7, !dbg !11
  %9 = load i32, i32* %c, align 4, !dbg !11
  %10 = load i32, i32* %a, align 4, !dbg !11
  %11 = select i1 %8, i32 %9, i32 %10, !dbg !11
  store i32 %11, i32* %maxVal, align 4, !dbg !11
  %12 = load i32, i32* %minVal, align 4, !dbg !12
  %13 = icmp ne i32 %12, 3, !dbg !12
  br i1 %13, label %then, label %if.end, !dbg !12

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !13
  %14 = load i32, i32* %err, align 4, !dbg !13
  br label %if.end, !dbg !13

if.end:                                           ; preds = %entry, %then
  %15 = load i32, i32* %maxVal, align 4, !dbg !14
  %16 = icmp ne i32 %15, 7, !dbg !14
  br i1 %16, label %then1, label %if.end3, !dbg !14

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !15
  %17 = load i32, i32* %err, align 4, !dbg !15
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end, %then1
  store i32 -5, i32* %d, align 4, !dbg !16
  store i32 2, i32* %e, align 4, !dbg !17
  %18 = load i32, i32* %d, align 4, !dbg !18
  %19 = load i32, i32* %e, align 4, !dbg !18
  %20 = icmp slt i32 %18, %19, !dbg !18
  %21 = load i32, i32* %d, align 4, !dbg !18
  %22 = load i32, i32* %e, align 4, !dbg !18
  %23 = select i1 %20, i32 %21, i32 %22, !dbg !18
  store i32 %23, i32* %minNeg, align 4, !dbg !18
  %24 = load i32, i32* %d, align 4, !dbg !19
  %25 = load i32, i32* %e, align 4, !dbg !19
  %26 = icmp slt i32 %24, %25, !dbg !19
  %27 = load i32, i32* %e, align 4, !dbg !19
  %28 = load i32, i32* %d, align 4, !dbg !19
  %29 = select i1 %26, i32 %27, i32 %28, !dbg !19
  store i32 %29, i32* %maxNeg, align 4, !dbg !19
  %30 = load i32, i32* %minNeg, align 4, !dbg !20
  %31 = icmp ne i32 %30, -5, !dbg !20
  br i1 %31, label %then4, label %if.end6, !dbg !20

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !21
  %32 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end6, !dbg !21

if.end6:                                          ; preds = %if.end3, %then4
  %33 = load i32, i32* %maxNeg, align 4, !dbg !22
  %34 = icmp ne i32 %33, 2, !dbg !22
  br i1 %34, label %then7, label %if.end9, !dbg !22

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !23
  %35 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end9, !dbg !23

if.end9:                                          ; preds = %if.end6, %then7
  store i32 42, i32* %same, align 4, !dbg !24
  %36 = load i32, i32* %same, align 4, !dbg !25
  %37 = load i32, i32* %same, align 4, !dbg !25
  %38 = icmp slt i32 %36, %37, !dbg !25
  %39 = select i1 %38, i32 0, i32 1, !dbg !25
  store i32 %39, i32* %ternarySame, align 4, !dbg !25
  %40 = load i32, i32* %ternarySame, align 4, !dbg !26
  %41 = icmp ne i32 %40, 1, !dbg !26
  br i1 %41, label %then10, label %if.end12, !dbg !26

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !27
  %42 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end12, !dbg !27

if.end12:                                         ; preds = %if.end9, %then10
  %43 = load i32, i32* %err, align 4, !dbg !28
  %44 = icmp eq i32 %43, 0, !dbg !28
  %. = select i1 %44, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !29
  %45 = call i32 (i8*, ...) @printf(i8* %.), !dbg !29
  %46 = load i32, i32* %err, align 4, !dbg !30
  ret i32 %46, !dbg !30
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 8, column: 3, scope: !2)
!11 = !DILocation(line: 9, column: 3, scope: !2)
!12 = !DILocation(line: 10, column: 3, scope: !2)
!13 = !DILocation(line: 10, column: 20, scope: !2)
!14 = !DILocation(line: 11, column: 3, scope: !2)
!15 = !DILocation(line: 11, column: 20, scope: !2)
!16 = !DILocation(line: 13, column: 3, scope: !2)
!17 = !DILocation(line: 14, column: 3, scope: !2)
!18 = !DILocation(line: 15, column: 3, scope: !2)
!19 = !DILocation(line: 16, column: 3, scope: !2)
!20 = !DILocation(line: 17, column: 3, scope: !2)
!21 = !DILocation(line: 17, column: 21, scope: !2)
!22 = !DILocation(line: 18, column: 3, scope: !2)
!23 = !DILocation(line: 18, column: 20, scope: !2)
!24 = !DILocation(line: 20, column: 3, scope: !2)
!25 = !DILocation(line: 21, column: 3, scope: !2)
!26 = !DILocation(line: 22, column: 3, scope: !2)
!27 = !DILocation(line: 22, column: 25, scope: !2)
!28 = !DILocation(line: 24, column: 3, scope: !2)
!29 = !DILocation(line: 0, scope: !2)
!30 = !DILocation(line: 29, column: 3, scope: !2)
