; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@g_data = global i32 0
@0 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @getAddress(i32** %0) !dbg !2 {
entry:
  %p = alloca i32**, align 8
  store i32** %0, i32*** %p, align 8
  %1 = load i32**, i32*** %p, align 8, !dbg !10
  store i32* @g_data, i32** %1, align 8, !dbg !10
  %2 = load i32*, i32** %1, align 8, !dbg !10
  ret void, !dbg !10
}

define i32 @main() !dbg !11 {
entry:
  %p2 = alloca i32*, align 8
  %p = alloca i32*, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !14
  store i32* @g_data, i32** %p, align 8, !dbg !15
  %0 = load i32*, i32** %p, align 8, !dbg !16
  store i32 1234, i32* %0, align 4, !dbg !16
  %1 = load i32, i32* %0, align 4, !dbg !16
  call void @getAddress(i32** %p2), !dbg !17
  %2 = load i32*, i32** %p2, align 8, !dbg !18
  store i32 5678, i32* %2, align 4, !dbg !18
  %3 = load i32, i32* %2, align 4, !dbg !18
  %4 = load i32, i32* @g_data, align 4, !dbg !19
  %5 = icmp ne i32 %4, 5678, !dbg !19
  br i1 %5, label %then, label %if.end, !dbg !19

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !20
  %6 = load i32, i32* %err, align 4, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %entry, %then
  %7 = load i32*, i32** %p2, align 8, !dbg !21
  %8 = load i32, i32* %7, align 4, !dbg !21
  %9 = icmp ne i32 %8, 5678, !dbg !21
  br i1 %9, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !22
  %10 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end3, !dbg !22

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32*, i32** %p, align 8, !dbg !23
  %12 = load i32, i32* %11, align 4, !dbg !23
  %13 = icmp ne i32 %12, 5678, !dbg !23
  br i1 %13, label %then4, label %if.end6, !dbg !23

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !24
  %14 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end6, !dbg !24

if.end6:                                          ; preds = %if.end3, %then4
  %15 = load i32*, i32** %p, align 8, !dbg !25
  store i32 0, i32* %15, align 4, !dbg !25
  %16 = load i32, i32* %15, align 4, !dbg !25
  %17 = load i32, i32* @g_data, align 4, !dbg !26
  %18 = icmp ne i32 %17, 0, !dbg !26
  br i1 %18, label %then7, label %if.end9, !dbg !26

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !27
  %19 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end9, !dbg !27

if.end9:                                          ; preds = %if.end6, %then7
  %20 = load i32*, i32** %p2, align 8, !dbg !28
  store i32 -42, i32* %20, align 4, !dbg !28
  %21 = load i32, i32* %20, align 4, !dbg !28
  %22 = load i32, i32* @g_data, align 4, !dbg !29
  %23 = icmp ne i32 %22, -42, !dbg !29
  br i1 %23, label %then10, label %if.end12, !dbg !29

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !30
  %24 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end12, !dbg !30

if.end12:                                         ; preds = %if.end9, %then10
  %25 = load i32, i32* %err, align 4, !dbg !31
  %26 = icmp eq i32 %25, 0, !dbg !31
  %. = select i1 %26, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !32
  %27 = call i32 (i8*, ...) @printf(i8* %.), !dbg !32
  %28 = load i32, i32* %err, align 4, !dbg !33
  ret i32 %28, !dbg !33
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "10.double_pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "getAddress", linkageName: "getAddress", scope: null, file: !1, line: 5, type: !3, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{}
!10 = !DILocation(line: 5, column: 28, scope: !2)
!11 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !12, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!12 = !DISubroutineType(types: !13)
!13 = !{!8}
!14 = !DILocation(line: 8, column: 3, scope: !11)
!15 = !DILocation(line: 9, column: 3, scope: !11)
!16 = !DILocation(line: 10, column: 3, scope: !11)
!17 = !DILocation(line: 13, column: 3, scope: !11)
!18 = !DILocation(line: 14, column: 3, scope: !11)
!19 = !DILocation(line: 16, column: 3, scope: !11)
!20 = !DILocation(line: 16, column: 23, scope: !11)
!21 = !DILocation(line: 17, column: 3, scope: !11)
!22 = !DILocation(line: 17, column: 20, scope: !11)
!23 = !DILocation(line: 18, column: 3, scope: !11)
!24 = !DILocation(line: 18, column: 19, scope: !11)
!25 = !DILocation(line: 20, column: 3, scope: !11)
!26 = !DILocation(line: 21, column: 3, scope: !11)
!27 = !DILocation(line: 21, column: 20, scope: !11)
!28 = !DILocation(line: 23, column: 3, scope: !11)
!29 = !DILocation(line: 24, column: 3, scope: !11)
!30 = !DILocation(line: 24, column: 22, scope: !11)
!31 = !DILocation(line: 26, column: 3, scope: !11)
!32 = !DILocation(line: 0, scope: !11)
!33 = !DILocation(line: 31, column: 3, scope: !11)
