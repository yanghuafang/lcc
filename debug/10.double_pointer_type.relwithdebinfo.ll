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
  store i32** %0, i32*** %p, align 8, !dbg !10
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
  store i32* @g_data, i32** %p, align 8, !dbg !14
  %0 = load i32*, i32** %p, align 8, !dbg !14
  store i32 1234, i32* %0, align 4, !dbg !14
  %1 = load i32, i32* %0, align 4, !dbg !14
  call void @getAddress(i32** %p2), !dbg !14
  %2 = load i32*, i32** %p2, align 8, !dbg !14
  store i32 5678, i32* %2, align 4, !dbg !14
  %3 = load i32, i32* %2, align 4, !dbg !14
  %4 = load i32, i32* @g_data, align 4, !dbg !14
  %5 = icmp ne i32 %4, 5678, !dbg !14
  br i1 %5, label %then, label %if.end, !dbg !14

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !14
  %6 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end, !dbg !14

if.end:                                           ; preds = %entry, %then
  %7 = load i32*, i32** %p2, align 8, !dbg !14
  %8 = load i32, i32* %7, align 4, !dbg !14
  %9 = icmp ne i32 %8, 5678, !dbg !14
  br i1 %9, label %then1, label %if.end3, !dbg !14

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !14
  %10 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32*, i32** %p, align 8, !dbg !14
  %12 = load i32, i32* %11, align 4, !dbg !14
  %13 = icmp ne i32 %12, 5678, !dbg !14
  br i1 %13, label %then4, label %if.end6, !dbg !14

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !14
  %14 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end6, !dbg !14

if.end6:                                          ; preds = %if.end3, %then4
  %15 = load i32*, i32** %p, align 8, !dbg !14
  store i32 0, i32* %15, align 4, !dbg !14
  %16 = load i32, i32* %15, align 4, !dbg !14
  %17 = load i32, i32* @g_data, align 4, !dbg !14
  %18 = icmp ne i32 %17, 0, !dbg !14
  br i1 %18, label %then7, label %if.end9, !dbg !14

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !14
  %19 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end9, !dbg !14

if.end9:                                          ; preds = %if.end6, %then7
  %20 = load i32*, i32** %p2, align 8, !dbg !14
  store i32 -42, i32* %20, align 4, !dbg !14
  %21 = load i32, i32* %20, align 4, !dbg !14
  %22 = load i32, i32* @g_data, align 4, !dbg !14
  %23 = icmp ne i32 %22, -42, !dbg !14
  br i1 %23, label %then10, label %if.end12, !dbg !14

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !14
  %24 = load i32, i32* %err, align 4, !dbg !14
  br label %if.end12, !dbg !14

if.end12:                                         ; preds = %if.end9, %then10
  %25 = load i32, i32* %err, align 4, !dbg !14
  %26 = icmp eq i32 %25, 0, !dbg !14
  %. = select i1 %26, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !14
  %27 = call i32 (i8*, ...) @printf(i8* %.), !dbg !14
  %28 = load i32, i32* %err, align 4, !dbg !14
  ret i32 %28, !dbg !14
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "10.double_pointer_type.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "getAddress", linkageName: "getAddress", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{}
!10 = !DILocation(line: 1, column: 1, scope: !2)
!11 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !12, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!12 = !DISubroutineType(types: !13)
!13 = !{!8}
!14 = !DILocation(line: 1, column: 1, scope: !11)
