; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %pgi = alloca i32*, align 8
  %pgc = alloca i8*, align 8
  %pi = alloca i32*, align 8
  %pc = alloca i8*, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i8 65, i8* %c, align 1, !dbg !8
  store i32 128, i32* %i, align 4, !dbg !9
  store i8* %c, i8** %pc, align 8, !dbg !10
  store i32* %i, i32** %pi, align 8, !dbg !11
  %0 = load i8*, i8** %pc, align 8, !dbg !12
  store i8 66, i8* %0, align 1, !dbg !12
  %1 = load i8, i8* %0, align 1, !dbg !12
  %2 = load i32*, i32** %pi, align 8, !dbg !13
  store i32 256, i32* %2, align 4, !dbg !13
  %3 = load i32, i32* %2, align 4, !dbg !13
  store i8* @gc, i8** %pgc, align 8, !dbg !14
  store i32* @gi, i32** %pgi, align 8, !dbg !15
  %4 = load i8*, i8** %pgc, align 8, !dbg !16
  store i8 98, i8* %4, align 1, !dbg !16
  %5 = load i8, i8* %4, align 1, !dbg !16
  %6 = load i32*, i32** %pgi, align 8, !dbg !17
  store i32 2048, i32* %6, align 4, !dbg !17
  %7 = load i32, i32* %6, align 4, !dbg !17
  %8 = load i8, i8* %c, align 1, !dbg !18
  %9 = sext i8 %8 to i32, !dbg !18
  %10 = icmp ne i32 %9, 66, !dbg !18
  br i1 %10, label %then, label %if.end, !dbg !18

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !19
  %11 = load i32, i32* %err, align 4, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %entry, %then
  %12 = load i8*, i8** %pc, align 8, !dbg !20
  %13 = load i8, i8* %12, align 1, !dbg !20
  %14 = sext i8 %13 to i32, !dbg !20
  %15 = icmp ne i32 %14, 66, !dbg !20
  br i1 %15, label %then1, label %if.end3, !dbg !20

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !21
  %16 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end3, !dbg !21

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %i, align 4, !dbg !22
  %18 = icmp ne i32 %17, 256, !dbg !22
  br i1 %18, label %then4, label %if.end6, !dbg !22

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !23
  %19 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end6, !dbg !23

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32*, i32** %pi, align 8, !dbg !24
  %21 = load i32, i32* %20, align 4, !dbg !24
  %22 = icmp ne i32 %21, 256, !dbg !24
  br i1 %22, label %then7, label %if.end9, !dbg !24

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !25
  %23 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end9, !dbg !25

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i8, i8* @gc, align 1, !dbg !26
  %25 = sext i8 %24 to i32, !dbg !26
  %26 = icmp ne i32 %25, 98, !dbg !26
  br i1 %26, label %then10, label %if.end12, !dbg !26

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !27
  %27 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end12, !dbg !27

if.end12:                                         ; preds = %if.end9, %then10
  %28 = load i32, i32* @gi, align 4, !dbg !28
  %29 = icmp ne i32 %28, 2048, !dbg !28
  br i1 %29, label %then13, label %if.end15, !dbg !28

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !29
  %30 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end15, !dbg !29

if.end15:                                         ; preds = %if.end12, %then13
  %31 = load i32*, i32** %pi, align 8, !dbg !30
  store i32 0, i32* %31, align 4, !dbg !30
  %32 = load i32, i32* %31, align 4, !dbg !30
  %33 = load i32, i32* %i, align 4, !dbg !31
  %34 = icmp ne i32 %33, 0, !dbg !31
  br i1 %34, label %then16, label %if.end18, !dbg !31

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !32
  %35 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end18, !dbg !32

if.end18:                                         ; preds = %if.end15, %then16
  %36 = load i32, i32* %err, align 4, !dbg !33
  %37 = icmp eq i32 %36, 0, !dbg !33
  %. = select i1 %37, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0), !dbg !34
  %38 = call i32 (i8*, ...) @printf(i8* %.), !dbg !34
  %39 = load i32, i32* %err, align 4, !dbg !35
  ret i32 %39, !dbg !35
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "5.pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 7, column: 3, scope: !2)
!8 = !DILocation(line: 8, column: 3, scope: !2)
!9 = !DILocation(line: 9, column: 3, scope: !2)
!10 = !DILocation(line: 10, column: 3, scope: !2)
!11 = !DILocation(line: 11, column: 3, scope: !2)
!12 = !DILocation(line: 13, column: 3, scope: !2)
!13 = !DILocation(line: 14, column: 3, scope: !2)
!14 = !DILocation(line: 16, column: 3, scope: !2)
!15 = !DILocation(line: 17, column: 3, scope: !2)
!16 = !DILocation(line: 18, column: 3, scope: !2)
!17 = !DILocation(line: 19, column: 3, scope: !2)
!18 = !DILocation(line: 21, column: 3, scope: !2)
!19 = !DILocation(line: 21, column: 17, scope: !2)
!20 = !DILocation(line: 22, column: 3, scope: !2)
!21 = !DILocation(line: 22, column: 19, scope: !2)
!22 = !DILocation(line: 23, column: 3, scope: !2)
!23 = !DILocation(line: 23, column: 17, scope: !2)
!24 = !DILocation(line: 24, column: 3, scope: !2)
!25 = !DILocation(line: 24, column: 19, scope: !2)
!26 = !DILocation(line: 25, column: 3, scope: !2)
!27 = !DILocation(line: 25, column: 18, scope: !2)
!28 = !DILocation(line: 26, column: 3, scope: !2)
!29 = !DILocation(line: 26, column: 19, scope: !2)
!30 = !DILocation(line: 28, column: 3, scope: !2)
!31 = !DILocation(line: 29, column: 3, scope: !2)
!32 = !DILocation(line: 29, column: 15, scope: !2)
!33 = !DILocation(line: 31, column: 3, scope: !2)
!34 = !DILocation(line: 0, scope: !2)
!35 = !DILocation(line: 36, column: 3, scope: !2)
