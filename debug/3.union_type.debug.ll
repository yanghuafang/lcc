; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %const = bitcast i32 313249076 to i32
  %byte = alloca i8, align 1
  %ip = alloca i32, align 4
  %ipv4 = alloca %union.IPv4, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !8
  store i32 %const, i32* %0, align 4, !dbg !8
  %1 = load i32, i32* %0, align 4, !dbg !8
  %2 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !9
  %3 = load i32, i32* %2, align 4, !dbg !9
  store i32 %3, i32* %ip, align 4, !dbg !9
  %4 = load i32, i32* %ip, align 4, !dbg !9
  %5 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !10
  %6 = load i8, i8* %5, align 1, !dbg !10
  store i8 %6, i8* %byte, align 1, !dbg !10
  %7 = load i8, i8* %byte, align 1, !dbg !10
  %8 = load i32, i32* %ip, align 4, !dbg !11
  %9 = icmp ne i32 %8, %const, !dbg !11
  br i1 %9, label %then, label %if.end, !dbg !11

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !12
  %10 = load i32, i32* %err, align 4, !dbg !12
  br label %if.end, !dbg !12

if.end:                                           ; preds = %entry, %then
  %11 = load i8, i8* %byte, align 1, !dbg !13
  %12 = zext i8 %11 to i32, !dbg !13
  %13 = icmp ne i32 %12, 52, !dbg !13
  br i1 %13, label %then1, label %if.end3, !dbg !13

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %14 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %15 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !15
  store i8 86, i8* %15, align 1, !dbg !15
  %16 = load i8, i8* %15, align 1, !dbg !15
  %17 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !16
  %18 = load i32, i32* %17, align 4, !dbg !16
  store i32 %18, i32* %ip, align 4, !dbg !16
  %19 = load i32, i32* %ip, align 4, !dbg !16
  %20 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !17
  %21 = load i8, i8* %20, align 1, !dbg !17
  store i8 %21, i8* %byte, align 1, !dbg !17
  %22 = load i8, i8* %byte, align 1, !dbg !17
  %23 = load i32, i32* %ip, align 4, !dbg !18
  %const_mat = add i32 %const, 34, !dbg !18
  %24 = icmp ne i32 %23, %const_mat, !dbg !18
  br i1 %24, label %then4, label %if.end6, !dbg !18

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !19
  %25 = load i32, i32* %err, align 4, !dbg !19
  br label %if.end6, !dbg !19

if.end6:                                          ; preds = %if.end3, %then4
  %26 = load i8, i8* %byte, align 1, !dbg !20
  %27 = zext i8 %26 to i32, !dbg !20
  %28 = icmp ne i32 %27, 86, !dbg !20
  br i1 %28, label %then7, label %if.end9, !dbg !20

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !21
  %29 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end9, !dbg !21

if.end9:                                          ; preds = %if.end6, %then7
  %30 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !22
  store i32 -1, i32* %30, align 4, !dbg !22
  %31 = load i32, i32* %30, align 4, !dbg !22
  %32 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !23
  %33 = load i32, i32* %32, align 4, !dbg !23
  store i32 %33, i32* %ip, align 4, !dbg !23
  %34 = load i32, i32* %ip, align 4, !dbg !23
  %35 = load i32, i32* %ip, align 4, !dbg !24
  %36 = icmp ne i32 %35, -1, !dbg !24
  br i1 %36, label %then10, label %if.end12, !dbg !24

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !25
  %37 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end12, !dbg !25

if.end12:                                         ; preds = %if.end9, %then10
  %38 = bitcast %union.IPv4* %ipv4 to i8*, !dbg !26
  store i8 0, i8* %38, align 1, !dbg !26
  %39 = load i8, i8* %38, align 1, !dbg !26
  %40 = bitcast %union.IPv4* %ipv4 to i32*, !dbg !27
  %41 = load i32, i32* %40, align 4, !dbg !27
  store i32 %41, i32* %ip, align 4, !dbg !27
  %42 = load i32, i32* %ip, align 4, !dbg !27
  %43 = load i32, i32* %ip, align 4, !dbg !28
  %44 = icmp ne i32 %43, -256, !dbg !28
  br i1 %44, label %then13, label %if.end15, !dbg !28

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !29
  %45 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end15, !dbg !29

if.end15:                                         ; preds = %if.end12, %then13
  %46 = load i32, i32* %err, align 4, !dbg !30
  %47 = icmp eq i32 %46, 0, !dbg !30
  %. = select i1 %47, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), !dbg !31
  %48 = call i32 (i8*, ...) @printf(i8* %.), !dbg !31
  %49 = load i32, i32* %err, align 4, !dbg !32
  ret i32 %49, !dbg !32
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "3.union_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 9, column: 3, scope: !2)
!8 = !DILocation(line: 14, column: 3, scope: !2)
!9 = !DILocation(line: 15, column: 3, scope: !2)
!10 = !DILocation(line: 16, column: 3, scope: !2)
!11 = !DILocation(line: 17, column: 3, scope: !2)
!12 = !DILocation(line: 17, column: 25, scope: !2)
!13 = !DILocation(line: 18, column: 3, scope: !2)
!14 = !DILocation(line: 18, column: 21, scope: !2)
!15 = !DILocation(line: 20, column: 3, scope: !2)
!16 = !DILocation(line: 21, column: 3, scope: !2)
!17 = !DILocation(line: 22, column: 3, scope: !2)
!18 = !DILocation(line: 23, column: 3, scope: !2)
!19 = !DILocation(line: 23, column: 25, scope: !2)
!20 = !DILocation(line: 24, column: 3, scope: !2)
!21 = !DILocation(line: 24, column: 21, scope: !2)
!22 = !DILocation(line: 26, column: 3, scope: !2)
!23 = !DILocation(line: 27, column: 3, scope: !2)
!24 = !DILocation(line: 28, column: 3, scope: !2)
!25 = !DILocation(line: 28, column: 25, scope: !2)
!26 = !DILocation(line: 30, column: 3, scope: !2)
!27 = !DILocation(line: 31, column: 3, scope: !2)
!28 = !DILocation(line: 32, column: 3, scope: !2)
!29 = !DILocation(line: 32, column: 25, scope: !2)
!30 = !DILocation(line: 34, column: 3, scope: !2)
!31 = !DILocation(line: 0, scope: !2)
!32 = !DILocation(line: 39, column: 3, scope: !2)
