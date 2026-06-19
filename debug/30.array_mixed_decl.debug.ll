; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %b = alloca i32, align 4
  %a = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [4 x i32]* %a to i32*, !dbg !8
  %1 = bitcast i32* %0 to i32*, !dbg !8
  store i32 10, i32* %1, align 4, !dbg !8
  %2 = load i32, i32* %1, align 4, !dbg !8
  %3 = bitcast [4 x i32]* %a to i32*, !dbg !9
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !9
  store i32 20, i32* %4, align 4, !dbg !9
  %5 = load i32, i32* %4, align 4, !dbg !9
  store i32 30, i32* %b, align 4, !dbg !10
  %6 = load i32, i32* %b, align 4, !dbg !10
  %7 = bitcast [4 x i32]* %a to i32*, !dbg !11
  %8 = bitcast i32* %7 to i32*, !dbg !11
  %9 = load i32, i32* %8, align 4, !dbg !11
  %10 = icmp ne i32 %9, 10, !dbg !11
  br i1 %10, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !12
  %11 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %12 = bitcast [4 x i32]* %a to i32*, !dbg !13
  %13 = getelementptr i32, i32* %12, i32 1, !dbg !13
  %14 = load i32, i32* %13, align 4, !dbg !13
  %15 = icmp ne i32 %14, 20, !dbg !13
  br i1 %15, label %then1, label %if.end3, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %16 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %b, align 4, !dbg !15
  %18 = icmp ne i32 %17, 30, !dbg !15
  br i1 %18, label %then4, label %if.end6, !dbg !15

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !16
  %19 = load i32, i32* %err, align 4, !dbg !16
  br label %if.end6, !dbg !16

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32, i32* %err, align 4, !dbg !17
  %21 = icmp eq i32 %20, 0, !dbg !17
  %. = select i1 %21, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @1, i32 0, i32 0), !dbg !18
  %22 = call i32 (i8*, ...) @printf(i8* %.), !dbg !18
  %23 = load i32, i32* %err, align 4, !dbg !19
  ret i32 %23, !dbg !19
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "30.array_mixed_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 6, column: 3, scope: !2)
!9 = !DILocation(line: 7, column: 3, scope: !2)
!10 = !DILocation(line: 8, column: 3, scope: !2)
!11 = !DILocation(line: 10, column: 3, scope: !2)
!12 = !DILocation(line: 10, column: 19, scope: !2)
!13 = !DILocation(line: 11, column: 3, scope: !2)
!14 = !DILocation(line: 11, column: 19, scope: !2)
!15 = !DILocation(line: 12, column: 3, scope: !2)
!16 = !DILocation(line: 12, column: 16, scope: !2)
!17 = !DILocation(line: 14, column: 3, scope: !2)
!18 = !DILocation(line: 0, scope: !2)
!19 = !DILocation(line: 19, column: 3, scope: !2)
