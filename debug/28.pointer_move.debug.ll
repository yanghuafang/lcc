; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %pc = alloca i8*, align 8
  %c = alloca [4 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [4 x i8]* %c to i8*, !dbg !8
  %1 = bitcast i8* %0 to i8*, !dbg !8
  store i8 65, i8* %1, align 1, !dbg !8
  %2 = load i8, i8* %1, align 1, !dbg !8
  %3 = bitcast [4 x i8]* %c to i8*, !dbg !9
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !9
  store i8 66, i8* %4, align 1, !dbg !9
  %5 = load i8, i8* %4, align 1, !dbg !9
  %6 = bitcast [4 x i8]* %c to i8*, !dbg !10
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !10
  store i8 67, i8* %7, align 1, !dbg !10
  %8 = load i8, i8* %7, align 1, !dbg !10
  %9 = bitcast [4 x i8]* %c to i8*, !dbg !11
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !11
  store i8 68, i8* %10, align 1, !dbg !11
  %11 = load i8, i8* %10, align 1, !dbg !11
  %12 = bitcast [4 x i8]* %c to i8*, !dbg !12
  store i8* %12, i8** %pc, align 8, !dbg !12
  %13 = load i8*, i8** %pc, align 8, !dbg !13
  %14 = load i8, i8* %13, align 1, !dbg !13
  %15 = sext i8 %14 to i32, !dbg !13
  %16 = icmp ne i32 %15, 65, !dbg !13
  br i1 %16, label %then, label %if.end, !dbg !13

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !14
  %17 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end, !dbg !14

if.end:                                           ; preds = %entry, %then
  %18 = load i8*, i8** %pc, align 8, !dbg !15
  %19 = getelementptr i8, i8* %18, i32 1, !dbg !15
  store i8* %19, i8** %pc, align 8, !dbg !15
  %20 = load i8*, i8** %pc, align 8, !dbg !15
  %21 = load i8*, i8** %pc, align 8, !dbg !16
  %22 = load i8, i8* %21, align 1, !dbg !16
  %23 = sext i8 %22 to i32, !dbg !16
  %24 = icmp ne i32 %23, 66, !dbg !16
  br i1 %24, label %then1, label %if.end3, !dbg !16

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !17
  %25 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end3, !dbg !17

if.end3:                                          ; preds = %if.end, %then1
  %26 = load i8*, i8** %pc, align 8, !dbg !18
  %27 = getelementptr i8, i8* %26, i32 1, !dbg !18
  store i8* %27, i8** %pc, align 8, !dbg !18
  %28 = load i8*, i8** %pc, align 8, !dbg !18
  %29 = load i8*, i8** %pc, align 8, !dbg !19
  %30 = load i8, i8* %29, align 1, !dbg !19
  %31 = sext i8 %30 to i32, !dbg !19
  %32 = icmp ne i32 %31, 67, !dbg !19
  br i1 %32, label %then4, label %if.end6, !dbg !19

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !20
  %33 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end6, !dbg !20

if.end6:                                          ; preds = %if.end3, %then4
  %34 = load i8*, i8** %pc, align 8, !dbg !21
  %35 = getelementptr i8, i8* %34, i32 1, !dbg !21
  store i8* %35, i8** %pc, align 8, !dbg !21
  %36 = load i8*, i8** %pc, align 8, !dbg !22
  %37 = load i8, i8* %36, align 1, !dbg !22
  %38 = sext i8 %37 to i32, !dbg !22
  %39 = icmp ne i32 %38, 68, !dbg !22
  br i1 %39, label %then7, label %if.end9, !dbg !22

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !23
  %40 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end9, !dbg !23

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [4 x i8]* %c to i8*, !dbg !24
  %42 = getelementptr i8, i8* %41, i32 3, !dbg !24
  store i8* %42, i8** %pc, align 8, !dbg !24
  %43 = load i8*, i8** %pc, align 8, !dbg !24
  %44 = load i8*, i8** %pc, align 8, !dbg !25
  %45 = load i8, i8* %44, align 1, !dbg !25
  %46 = sext i8 %45 to i32, !dbg !25
  %47 = icmp ne i32 %46, 68, !dbg !25
  br i1 %47, label %then10, label %if.end12, !dbg !25

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !26
  %48 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end12, !dbg !26

if.end12:                                         ; preds = %if.end9, %then10
  %49 = load i8*, i8** %pc, align 8, !dbg !27
  %50 = getelementptr i8, i8* %49, i32 -1, !dbg !27
  store i8* %50, i8** %pc, align 8, !dbg !27
  %51 = load i8*, i8** %pc, align 8, !dbg !27
  %52 = load i8*, i8** %pc, align 8, !dbg !28
  %53 = load i8, i8* %52, align 1, !dbg !28
  %54 = sext i8 %53 to i32, !dbg !28
  %55 = icmp ne i32 %54, 67, !dbg !28
  br i1 %55, label %then13, label %if.end15, !dbg !28

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !29
  %56 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end15, !dbg !29

if.end15:                                         ; preds = %if.end12, %then13
  %57 = load i8*, i8** %pc, align 8, !dbg !30
  %58 = getelementptr i8, i8* %57, i32 -1, !dbg !30
  store i8* %58, i8** %pc, align 8, !dbg !30
  %59 = load i8*, i8** %pc, align 8, !dbg !30
  %60 = load i8*, i8** %pc, align 8, !dbg !31
  %61 = load i8, i8* %60, align 1, !dbg !31
  %62 = sext i8 %61 to i32, !dbg !31
  %63 = icmp ne i32 %62, 66, !dbg !31
  br i1 %63, label %then16, label %if.end18, !dbg !31

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !32
  %64 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end18, !dbg !32

if.end18:                                         ; preds = %if.end15, %then16
  %65 = load i8*, i8** %pc, align 8, !dbg !33
  %66 = getelementptr i8, i8* %65, i32 -1, !dbg !33
  store i8* %66, i8** %pc, align 8, !dbg !33
  %67 = load i8*, i8** %pc, align 8, !dbg !34
  %68 = load i8, i8* %67, align 1, !dbg !34
  %69 = sext i8 %68 to i32, !dbg !34
  %70 = icmp ne i32 %69, 65, !dbg !34
  br i1 %70, label %then19, label %if.end21, !dbg !34

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !35
  %71 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end21, !dbg !35

if.end21:                                         ; preds = %if.end18, %then19
  %72 = load i32, i32* %err, align 4, !dbg !36
  %73 = icmp eq i32 %72, 0, !dbg !36
  %. = select i1 %73, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !37
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !37
  %75 = load i32, i32* %err, align 4, !dbg !38
  ret i32 %75, !dbg !38
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "28.pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 6, column: 3, scope: !2)
!9 = !DILocation(line: 7, column: 3, scope: !2)
!10 = !DILocation(line: 8, column: 3, scope: !2)
!11 = !DILocation(line: 9, column: 3, scope: !2)
!12 = !DILocation(line: 11, column: 3, scope: !2)
!13 = !DILocation(line: 12, column: 3, scope: !2)
!14 = !DILocation(line: 12, column: 19, scope: !2)
!15 = !DILocation(line: 13, column: 3, scope: !2)
!16 = !DILocation(line: 14, column: 3, scope: !2)
!17 = !DILocation(line: 14, column: 19, scope: !2)
!18 = !DILocation(line: 15, column: 3, scope: !2)
!19 = !DILocation(line: 16, column: 3, scope: !2)
!20 = !DILocation(line: 16, column: 19, scope: !2)
!21 = !DILocation(line: 17, column: 3, scope: !2)
!22 = !DILocation(line: 18, column: 3, scope: !2)
!23 = !DILocation(line: 18, column: 19, scope: !2)
!24 = !DILocation(line: 20, column: 3, scope: !2)
!25 = !DILocation(line: 21, column: 3, scope: !2)
!26 = !DILocation(line: 21, column: 19, scope: !2)
!27 = !DILocation(line: 22, column: 3, scope: !2)
!28 = !DILocation(line: 23, column: 3, scope: !2)
!29 = !DILocation(line: 23, column: 19, scope: !2)
!30 = !DILocation(line: 24, column: 3, scope: !2)
!31 = !DILocation(line: 25, column: 3, scope: !2)
!32 = !DILocation(line: 25, column: 19, scope: !2)
!33 = !DILocation(line: 26, column: 3, scope: !2)
!34 = !DILocation(line: 27, column: 3, scope: !2)
!35 = !DILocation(line: 27, column: 19, scope: !2)
!36 = !DILocation(line: 29, column: 3, scope: !2)
!37 = !DILocation(line: 0, scope: !2)
!38 = !DILocation(line: 34, column: 3, scope: !2)
