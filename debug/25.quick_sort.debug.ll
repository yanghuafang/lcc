; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @swap(i32* %0, i32* %1) !dbg !2 {
entry:
  %t = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %t, metadata !9, metadata !DIExpression()), !dbg !10
  %b = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %b, metadata !11, metadata !DIExpression()), !dbg !12
  %a = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %a, metadata !13, metadata !DIExpression()), !dbg !12
  store i32* %0, i32** %a, align 8, !dbg !12
  store i32* %1, i32** %b, align 8, !dbg !12
  %2 = load i32*, i32** %a, align 8, !dbg !10
  %3 = load i32, i32* %2, align 4, !dbg !10
  store i32 %3, i32* %t, align 4, !dbg !10
  %4 = load i32*, i32** %a, align 8, !dbg !14
  %5 = load i32*, i32** %b, align 8, !dbg !14
  %6 = load i32, i32* %5, align 4, !dbg !14
  store i32 %6, i32* %4, align 4, !dbg !14
  %7 = load i32, i32* %4, align 4, !dbg !14
  %8 = load i32*, i32** %b, align 8, !dbg !15
  %9 = load i32, i32* %t, align 4, !dbg !15
  store i32 %9, i32* %8, align 4, !dbg !15
  %10 = load i32, i32* %8, align 4, !dbg !15
  ret void, !dbg !15
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @partition(i32* %0, i32 %1, i32 %2) !dbg !16 {
entry:
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !20
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  %pivot = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %pivot, metadata !23, metadata !DIExpression()), !dbg !24
  %high = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %high, metadata !25, metadata !DIExpression()), !dbg !26
  %low = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %low, metadata !27, metadata !DIExpression()), !dbg !26
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !28, metadata !DIExpression()), !dbg !26
  store i32* %0, i32** %arr, align 8, !dbg !26
  store i32 %1, i32* %low, align 4, !dbg !26
  store i32 %2, i32* %high, align 4, !dbg !26
  %3 = load i32*, i32** %arr, align 8, !dbg !24
  %4 = load i32, i32* %high, align 4, !dbg !24
  %5 = getelementptr i32, i32* %3, i32 %4, !dbg !24
  %6 = load i32, i32* %5, align 4, !dbg !24
  store i32 %6, i32* %pivot, align 4, !dbg !24
  %7 = load i32, i32* %low, align 4, !dbg !22
  %8 = sub i32 %7, 1, !dbg !22
  store i32 %8, i32* %i, align 4, !dbg !22
  %9 = load i32, i32* %low, align 4, !dbg !20
  store i32 %9, i32* %j, align 4, !dbg !20
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, i32* %j, align 4, !dbg !20
  %11 = load i32, i32* %high, align 4, !dbg !20
  %12 = sub i32 %11, 1, !dbg !20
  %13 = icmp sle i32 %10, %12, !dbg !20
  %14 = load i32*, i32** %arr, align 8, !dbg !29
  br i1 %13, label %for.loop, label %for.end, !dbg !20

for.loop:                                         ; preds = %for.cond
  %15 = load i32, i32* %j, align 4, !dbg !30
  %16 = getelementptr i32, i32* %14, i32 %15, !dbg !30
  %17 = load i32, i32* %16, align 4, !dbg !30
  %18 = load i32, i32* %pivot, align 4, !dbg !30
  %19 = icmp sle i32 %17, %18, !dbg !30
  br i1 %19, label %then, label %for.update, !dbg !30

then:                                             ; preds = %for.loop
  %20 = load i32, i32* %i, align 4, !dbg !32
  %21 = add i32 %20, 1, !dbg !32
  store i32 %21, i32* %i, align 4, !dbg !32
  %22 = load i32*, i32** %arr, align 8, !dbg !34
  %23 = load i32, i32* %i, align 4, !dbg !34
  %24 = getelementptr i32, i32* %22, i32 %23, !dbg !34
  %25 = load i32*, i32** %arr, align 8, !dbg !34
  %26 = load i32, i32* %j, align 4, !dbg !34
  %27 = getelementptr i32, i32* %25, i32 %26, !dbg !34
  call void @swap(i32* %24, i32* %27), !dbg !34
  br label %for.update, !dbg !34

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, i32* %j, align 4, !dbg !34
  %29 = add i32 %28, 1, !dbg !34
  store i32 %29, i32* %j, align 4, !dbg !34
  br label %for.cond, !dbg !34

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* %i, align 4, !dbg !35
  %31 = add i32 %30, 1, !dbg !35
  %32 = getelementptr i32, i32* %14, i32 %31, !dbg !35
  %33 = load i32*, i32** %arr, align 8, !dbg !35
  %34 = load i32, i32* %high, align 4, !dbg !35
  %35 = getelementptr i32, i32* %33, i32 %34, !dbg !35
  call void @swap(i32* %32, i32* %35), !dbg !35
  %36 = load i32, i32* %i, align 4, !dbg !36
  %37 = add i32 %36, 1, !dbg !36
  ret i32 %37, !dbg !36
}

define void @quickSort(i32* %0, i32 %1, i32 %2) !dbg !37 {
entry:
  %pi = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %pi, metadata !40, metadata !DIExpression()), !dbg !42
  %high = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %high, metadata !43, metadata !DIExpression()), !dbg !44
  %low = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %low, metadata !45, metadata !DIExpression()), !dbg !44
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !46, metadata !DIExpression()), !dbg !44
  store i32* %0, i32** %arr, align 8, !dbg !44
  store i32 %1, i32* %low, align 4, !dbg !44
  store i32 %2, i32* %high, align 4, !dbg !44
  %3 = load i32, i32* %low, align 4, !dbg !47
  %4 = load i32, i32* %high, align 4, !dbg !47
  %5 = icmp slt i32 %3, %4, !dbg !47
  br i1 %5, label %then, label %if.end, !dbg !47

then:                                             ; preds = %entry
  %6 = load i32*, i32** %arr, align 8, !dbg !42
  %7 = load i32, i32* %low, align 4, !dbg !42
  %8 = load i32, i32* %high, align 4, !dbg !42
  %9 = call i32 @partition(i32* %6, i32 %7, i32 %8), !dbg !42
  store i32 %9, i32* %pi, align 4, !dbg !42
  %10 = load i32*, i32** %arr, align 8, !dbg !48
  %11 = load i32, i32* %low, align 4, !dbg !48
  %12 = load i32, i32* %pi, align 4, !dbg !48
  %13 = sub i32 %12, 1, !dbg !48
  call void @quickSort(i32* %10, i32 %11, i32 %13), !dbg !48
  %14 = load i32*, i32** %arr, align 8, !dbg !49
  %15 = load i32, i32* %pi, align 4, !dbg !49
  %16 = add i32 %15, 1, !dbg !49
  %17 = load i32, i32* %high, align 4, !dbg !49
  call void @quickSort(i32* %14, i32 %16, i32 %17), !dbg !49
  br label %if.end, !dbg !49

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !49
}

define i32 @main() !dbg !50 {
entry:
  %single = alloca [1 x i32], align 4
  call void @llvm.dbg.declare(metadata [1 x i32]* %single, metadata !53, metadata !DIExpression()), !dbg !57
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !58, metadata !DIExpression()), !dbg !59
  %arr = alloca [6 x i32], align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %arr, metadata !60, metadata !DIExpression()), !dbg !64
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 0, i32* %err, align 4, !dbg !66
  %0 = bitcast [6 x i32]* %arr to i32*, !dbg !67
  %1 = bitcast i32* %0 to i32*, !dbg !67
  store i32 10, i32* %1, align 4, !dbg !67
  %2 = load i32, i32* %1, align 4, !dbg !67
  %3 = bitcast [6 x i32]* %arr to i32*, !dbg !68
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !68
  store i32 7, i32* %4, align 4, !dbg !68
  %5 = load i32, i32* %4, align 4, !dbg !68
  %6 = bitcast [6 x i32]* %arr to i32*, !dbg !69
  %7 = getelementptr i32, i32* %6, i32 2, !dbg !69
  store i32 8, i32* %7, align 4, !dbg !69
  %8 = load i32, i32* %7, align 4, !dbg !69
  %9 = bitcast [6 x i32]* %arr to i32*, !dbg !70
  %10 = getelementptr i32, i32* %9, i32 3, !dbg !70
  store i32 9, i32* %10, align 4, !dbg !70
  %11 = load i32, i32* %10, align 4, !dbg !70
  %12 = bitcast [6 x i32]* %arr to i32*, !dbg !71
  %13 = getelementptr i32, i32* %12, i32 4, !dbg !71
  store i32 1, i32* %13, align 4, !dbg !71
  %14 = load i32, i32* %13, align 4, !dbg !71
  %15 = bitcast [6 x i32]* %arr to i32*, !dbg !72
  %16 = getelementptr i32, i32* %15, i32 5, !dbg !72
  store i32 5, i32* %16, align 4, !dbg !72
  %17 = load i32, i32* %16, align 4, !dbg !72
  store i32 6, i32* %n, align 4, !dbg !59
  %18 = bitcast [6 x i32]* %arr to i32*, !dbg !73
  %19 = load i32, i32* %n, align 4, !dbg !73
  %20 = sub i32 %19, 1, !dbg !73
  call void @quickSort(i32* %18, i32 0, i32 %20), !dbg !73
  %21 = bitcast [6 x i32]* %arr to i32*, !dbg !74
  %22 = bitcast i32* %21 to i32*, !dbg !74
  %23 = load i32, i32* %22, align 4, !dbg !74
  %24 = icmp ne i32 %23, 1, !dbg !74
  br i1 %24, label %then, label %if.end, !dbg !74

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !75
  %25 = load i32, i32* %err, align 4, !dbg !75
  br label %if.end, !dbg !75

if.end:                                           ; preds = %entry, %then
  %26 = bitcast [6 x i32]* %arr to i32*, !dbg !76
  %27 = getelementptr i32, i32* %26, i32 1, !dbg !76
  %28 = load i32, i32* %27, align 4, !dbg !76
  %29 = icmp ne i32 %28, 5, !dbg !76
  br i1 %29, label %then1, label %if.end3, !dbg !76

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !77
  %30 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end3, !dbg !77

if.end3:                                          ; preds = %if.end, %then1
  %31 = bitcast [6 x i32]* %arr to i32*, !dbg !78
  %32 = getelementptr i32, i32* %31, i32 2, !dbg !78
  %33 = load i32, i32* %32, align 4, !dbg !78
  %34 = icmp ne i32 %33, 7, !dbg !78
  br i1 %34, label %then4, label %if.end6, !dbg !78

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !79
  %35 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end6, !dbg !79

if.end6:                                          ; preds = %if.end3, %then4
  %36 = bitcast [6 x i32]* %arr to i32*, !dbg !80
  %37 = getelementptr i32, i32* %36, i32 3, !dbg !80
  %38 = load i32, i32* %37, align 4, !dbg !80
  %39 = icmp ne i32 %38, 8, !dbg !80
  br i1 %39, label %then7, label %if.end9, !dbg !80

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !81
  %40 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end9, !dbg !81

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [6 x i32]* %arr to i32*, !dbg !82
  %42 = getelementptr i32, i32* %41, i32 4, !dbg !82
  %43 = load i32, i32* %42, align 4, !dbg !82
  %44 = icmp ne i32 %43, 9, !dbg !82
  br i1 %44, label %then10, label %if.end12, !dbg !82

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !83
  %45 = load i32, i32* %err, align 4, !dbg !83
  br label %if.end12, !dbg !83

if.end12:                                         ; preds = %if.end9, %then10
  %46 = bitcast [6 x i32]* %arr to i32*, !dbg !84
  %47 = getelementptr i32, i32* %46, i32 5, !dbg !84
  %48 = load i32, i32* %47, align 4, !dbg !84
  %49 = icmp ne i32 %48, 10, !dbg !84
  br i1 %49, label %then13, label %if.end15, !dbg !84

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !85
  %50 = load i32, i32* %err, align 4, !dbg !85
  br label %if.end15, !dbg !85

if.end15:                                         ; preds = %if.end12, %then13
  %51 = bitcast [1 x i32]* %single to i32*, !dbg !86
  %52 = bitcast i32* %51 to i32*, !dbg !86
  store i32 42, i32* %52, align 4, !dbg !86
  %53 = load i32, i32* %52, align 4, !dbg !86
  %54 = bitcast [1 x i32]* %single to i32*, !dbg !87
  call void @quickSort(i32* %54, i32 0, i32 0), !dbg !87
  %55 = bitcast [1 x i32]* %single to i32*, !dbg !88
  %56 = bitcast i32* %55 to i32*, !dbg !88
  %57 = load i32, i32* %56, align 4, !dbg !88
  %58 = icmp ne i32 %57, 42, !dbg !88
  br i1 %58, label %then16, label %if.end18, !dbg !88

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !89
  %59 = load i32, i32* %err, align 4, !dbg !89
  br label %if.end18, !dbg !89

if.end18:                                         ; preds = %if.end15, %then16
  %60 = load i32, i32* %err, align 4, !dbg !90
  %61 = icmp eq i32 %60, 0, !dbg !90
  %. = select i1 %61, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !91
  %62 = call i32 (i8*, ...) @printf(i8* %.), !dbg !91
  %63 = load i32, i32* %err, align 4, !dbg !92
  ret i32 %63, !dbg !92
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "t", scope: !2, file: !1, line: 4, type: !7)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !1, line: 3, type: !6)
!12 = !DILocation(line: 3, column: 6, scope: !2)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!14 = !DILocation(line: 5, column: 3, scope: !2)
!15 = !DILocation(line: 6, column: 3, scope: !2)
!16 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 9, type: !17, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!17 = !DISubroutineType(types: !18)
!18 = !{!7, !6, !7, !7}
!19 = !DILocalVariable(name: "j", scope: !16, file: !1, line: 12, type: !7)
!20 = !DILocation(line: 12, column: 8, scope: !16)
!21 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 11, type: !7)
!22 = !DILocation(line: 11, column: 3, scope: !16)
!23 = !DILocalVariable(name: "pivot", scope: !16, file: !1, line: 10, type: !7)
!24 = !DILocation(line: 10, column: 3, scope: !16)
!25 = !DILocalVariable(name: "high", arg: 3, scope: !16, file: !1, line: 9, type: !7)
!26 = !DILocation(line: 9, column: 5, scope: !16)
!27 = !DILocalVariable(name: "low", arg: 2, scope: !16, file: !1, line: 9, type: !7)
!28 = !DILocalVariable(name: "arr", arg: 1, scope: !16, file: !1, line: 9, type: !6)
!29 = !DILocation(line: 0, scope: !16)
!30 = !DILocation(line: 13, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !1, line: 12, column: 41)
!32 = !DILocation(line: 14, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !31, file: !1, line: 13, column: 26)
!34 = !DILocation(line: 15, column: 7, scope: !33)
!35 = !DILocation(line: 18, column: 3, scope: !16)
!36 = !DILocation(line: 19, column: 3, scope: !16)
!37 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 22, type: !38, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!38 = !DISubroutineType(types: !39)
!39 = !{!5, !6, !7, !7}
!40 = !DILocalVariable(name: "pi", scope: !41, file: !1, line: 24, type: !7)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 23, column: 19)
!42 = !DILocation(line: 24, column: 5, scope: !41)
!43 = !DILocalVariable(name: "high", arg: 3, scope: !37, file: !1, line: 22, type: !7)
!44 = !DILocation(line: 22, column: 6, scope: !37)
!45 = !DILocalVariable(name: "low", arg: 2, scope: !37, file: !1, line: 22, type: !7)
!46 = !DILocalVariable(name: "arr", arg: 1, scope: !37, file: !1, line: 22, type: !6)
!47 = !DILocation(line: 23, column: 3, scope: !37)
!48 = !DILocation(line: 25, column: 5, scope: !41)
!49 = !DILocation(line: 26, column: 5, scope: !41)
!50 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !51, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!51 = !DISubroutineType(types: !52)
!52 = !{!7}
!53 = !DILocalVariable(name: "single", scope: !50, file: !1, line: 50, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32, align: 32, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 1, lowerBound: 0)
!57 = !DILocation(line: 50, column: 3, scope: !50)
!58 = !DILocalVariable(name: "n", scope: !50, file: !1, line: 39, type: !7)
!59 = !DILocation(line: 39, column: 3, scope: !50)
!60 = !DILocalVariable(name: "arr", scope: !50, file: !1, line: 32, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, align: 32, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 6, lowerBound: 0)
!64 = !DILocation(line: 32, column: 3, scope: !50)
!65 = !DILocalVariable(name: "err", scope: !50, file: !1, line: 31, type: !7)
!66 = !DILocation(line: 31, column: 3, scope: !50)
!67 = !DILocation(line: 33, column: 3, scope: !50)
!68 = !DILocation(line: 34, column: 3, scope: !50)
!69 = !DILocation(line: 35, column: 3, scope: !50)
!70 = !DILocation(line: 36, column: 3, scope: !50)
!71 = !DILocation(line: 37, column: 3, scope: !50)
!72 = !DILocation(line: 38, column: 3, scope: !50)
!73 = !DILocation(line: 41, column: 3, scope: !50)
!74 = !DILocation(line: 43, column: 3, scope: !50)
!75 = !DILocation(line: 43, column: 20, scope: !50)
!76 = !DILocation(line: 44, column: 3, scope: !50)
!77 = !DILocation(line: 44, column: 20, scope: !50)
!78 = !DILocation(line: 45, column: 3, scope: !50)
!79 = !DILocation(line: 45, column: 20, scope: !50)
!80 = !DILocation(line: 46, column: 3, scope: !50)
!81 = !DILocation(line: 46, column: 20, scope: !50)
!82 = !DILocation(line: 47, column: 3, scope: !50)
!83 = !DILocation(line: 47, column: 20, scope: !50)
!84 = !DILocation(line: 48, column: 3, scope: !50)
!85 = !DILocation(line: 48, column: 21, scope: !50)
!86 = !DILocation(line: 51, column: 3, scope: !50)
!87 = !DILocation(line: 52, column: 3, scope: !50)
!88 = !DILocation(line: 53, column: 3, scope: !50)
!89 = !DILocation(line: 53, column: 24, scope: !50)
!90 = !DILocation(line: 55, column: 3, scope: !50)
!91 = !DILocation(line: 0, scope: !50)
!92 = !DILocation(line: 60, column: 3, scope: !50)
