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
  call void @llvm.dbg.declare(metadata i32*** %p, metadata !10, metadata !DIExpression()), !dbg !11
  store i32** %0, i32*** %p, align 8, !dbg !11
  %1 = load i32**, i32*** %p, align 8, !dbg !12
  store i32* @g_data, i32** %1, align 8, !dbg !12
  %2 = load i32*, i32** %1, align 8, !dbg !12
  ret void, !dbg !12
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !13 {
entry:
  %p2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p2, metadata !16, metadata !DIExpression()), !dbg !17
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !18, metadata !DIExpression()), !dbg !19
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %err, align 4, !dbg !21
  store i32* @g_data, i32** %p, align 8, !dbg !19
  %0 = load i32*, i32** %p, align 8, !dbg !22
  store i32 1234, i32* %0, align 4, !dbg !22
  %1 = load i32, i32* %0, align 4, !dbg !22
  call void @getAddress(i32** %p2), !dbg !23
  %2 = load i32*, i32** %p2, align 8, !dbg !24
  store i32 5678, i32* %2, align 4, !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = load i32, i32* @g_data, align 4, !dbg !25
  %5 = icmp ne i32 %4, 5678, !dbg !25
  br i1 %5, label %then, label %if.end, !dbg !25

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !26
  %6 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end, !dbg !26

if.end:                                           ; preds = %entry, %then
  %7 = load i32*, i32** %p2, align 8, !dbg !27
  %8 = load i32, i32* %7, align 4, !dbg !27
  %9 = icmp ne i32 %8, 5678, !dbg !27
  br i1 %9, label %then1, label %if.end3, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !28
  %10 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32*, i32** %p, align 8, !dbg !29
  %12 = load i32, i32* %11, align 4, !dbg !29
  %13 = icmp ne i32 %12, 5678, !dbg !29
  br i1 %13, label %then4, label %if.end6, !dbg !29

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !30
  %14 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end6, !dbg !30

if.end6:                                          ; preds = %if.end3, %then4
  %15 = load i32*, i32** %p, align 8, !dbg !31
  store i32 0, i32* %15, align 4, !dbg !31
  %16 = load i32, i32* %15, align 4, !dbg !31
  %17 = load i32, i32* @g_data, align 4, !dbg !32
  %18 = icmp ne i32 %17, 0, !dbg !32
  br i1 %18, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !33
  %19 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %20 = load i32*, i32** %p2, align 8, !dbg !34
  store i32 -42, i32* %20, align 4, !dbg !34
  %21 = load i32, i32* %20, align 4, !dbg !34
  %22 = load i32, i32* @g_data, align 4, !dbg !35
  %23 = icmp ne i32 %22, -42, !dbg !35
  br i1 %23, label %then10, label %if.end12, !dbg !35

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !36
  %24 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end12, !dbg !36

if.end12:                                         ; preds = %if.end9, %then10
  %25 = load i32, i32* %err, align 4, !dbg !37
  %26 = icmp eq i32 %25, 0, !dbg !37
  %. = select i1 %26, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !38
  %27 = call i32 (i8*, ...) @printf(i8* %.), !dbg !38
  %28 = load i32, i32* %err, align 4, !dbg !39
  ret i32 %28, !dbg !39
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !DILocalVariable(name: "p", arg: 1, scope: !2, file: !1, line: 5, type: !6)
!11 = !DILocation(line: 5, column: 6, scope: !2)
!12 = !DILocation(line: 5, column: 28, scope: !2)
!13 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocalVariable(name: "p2", scope: !13, file: !1, line: 12, type: !7)
!17 = !DILocation(line: 12, column: 3, scope: !13)
!18 = !DILocalVariable(name: "p", scope: !13, file: !1, line: 9, type: !7)
!19 = !DILocation(line: 9, column: 3, scope: !13)
!20 = !DILocalVariable(name: "err", scope: !13, file: !1, line: 8, type: !8)
!21 = !DILocation(line: 8, column: 3, scope: !13)
!22 = !DILocation(line: 10, column: 3, scope: !13)
!23 = !DILocation(line: 13, column: 3, scope: !13)
!24 = !DILocation(line: 14, column: 3, scope: !13)
!25 = !DILocation(line: 16, column: 3, scope: !13)
!26 = !DILocation(line: 16, column: 23, scope: !13)
!27 = !DILocation(line: 17, column: 3, scope: !13)
!28 = !DILocation(line: 17, column: 20, scope: !13)
!29 = !DILocation(line: 18, column: 3, scope: !13)
!30 = !DILocation(line: 18, column: 19, scope: !13)
!31 = !DILocation(line: 20, column: 3, scope: !13)
!32 = !DILocation(line: 21, column: 3, scope: !13)
!33 = !DILocation(line: 21, column: 20, scope: !13)
!34 = !DILocation(line: 23, column: 3, scope: !13)
!35 = !DILocation(line: 24, column: 3, scope: !13)
!36 = !DILocation(line: 24, column: 22, scope: !13)
!37 = !DILocation(line: 26, column: 3, scope: !13)
!38 = !DILocation(line: 0, scope: !13)
!39 = !DILocation(line: 31, column: 3, scope: !13)
