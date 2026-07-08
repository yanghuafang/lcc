; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @swap(i32* %0, i32* %1) !dbg !4 {
entry:
  %t = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %t, metadata !11, metadata !DIExpression()), !dbg !12
  %b = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %b, metadata !13, metadata !DIExpression()), !dbg !14
  %a = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %a, metadata !15, metadata !DIExpression()), !dbg !14
  store i32* %0, i32** %a, align 8, !dbg !14
  store i32* %1, i32** %b, align 8, !dbg !14
  %2 = load i32*, i32** %a, align 8, !dbg !12
  %3 = load i32, i32* %2, align 4, !dbg !12
  store i32 %3, i32* %t, align 4, !dbg !12
  %4 = load i32*, i32** %a, align 8, !dbg !16
  %5 = load i32*, i32** %b, align 8, !dbg !16
  %6 = load i32, i32* %5, align 4, !dbg !16
  store i32 %6, i32* %4, align 4, !dbg !16
  %7 = load i32, i32* %4, align 4, !dbg !16
  %8 = load i32*, i32** %b, align 8, !dbg !17
  %9 = load i32, i32* %t, align 4, !dbg !17
  store i32 %9, i32* %8, align 4, !dbg !17
  %10 = load i32, i32* %8, align 4, !dbg !17
  ret void, !dbg !17
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @partition(i32* %0, i32 %1, i32 %2) !dbg !18 {
entry:
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %j, metadata !21, metadata !DIExpression()), !dbg !22
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !24
  %pivot = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %pivot, metadata !25, metadata !DIExpression()), !dbg !26
  %high = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %high, metadata !27, metadata !DIExpression()), !dbg !28
  %low = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %low, metadata !29, metadata !DIExpression()), !dbg !28
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !30, metadata !DIExpression()), !dbg !28
  store i32* %0, i32** %arr, align 8, !dbg !28
  store i32 %1, i32* %low, align 4, !dbg !28
  store i32 %2, i32* %high, align 4, !dbg !28
  %3 = load i32*, i32** %arr, align 8, !dbg !26
  %4 = load i32, i32* %high, align 4, !dbg !26
  %5 = getelementptr i32, i32* %3, i32 %4, !dbg !26
  %6 = load i32, i32* %5, align 4, !dbg !26
  store i32 %6, i32* %pivot, align 4, !dbg !26
  %7 = load i32, i32* %low, align 4, !dbg !24
  %8 = sub i32 %7, 1, !dbg !24
  store i32 %8, i32* %i, align 4, !dbg !24
  %9 = load i32, i32* %low, align 4, !dbg !22
  store i32 %9, i32* %j, align 4, !dbg !22
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, i32* %j, align 4, !dbg !22
  %11 = load i32, i32* %high, align 4, !dbg !22
  %12 = sub i32 %11, 1, !dbg !22
  %13 = icmp sle i32 %10, %12, !dbg !22
  %14 = load i32*, i32** %arr, align 8, !dbg !31
  br i1 %13, label %for.loop, label %for.end, !dbg !22

for.loop:                                         ; preds = %for.cond
  %15 = load i32, i32* %j, align 4, !dbg !32
  %16 = getelementptr i32, i32* %14, i32 %15, !dbg !32
  %17 = load i32, i32* %16, align 4, !dbg !32
  %18 = load i32, i32* %pivot, align 4, !dbg !32
  %19 = icmp sle i32 %17, %18, !dbg !32
  br i1 %19, label %then, label %for.update, !dbg !32

then:                                             ; preds = %for.loop
  %20 = load i32, i32* %i, align 4, !dbg !34
  %21 = add i32 %20, 1, !dbg !34
  store i32 %21, i32* %i, align 4, !dbg !34
  %22 = load i32*, i32** %arr, align 8, !dbg !36
  %23 = load i32, i32* %i, align 4, !dbg !36
  %24 = getelementptr i32, i32* %22, i32 %23, !dbg !36
  %25 = load i32*, i32** %arr, align 8, !dbg !36
  %26 = load i32, i32* %j, align 4, !dbg !36
  %27 = getelementptr i32, i32* %25, i32 %26, !dbg !36
  call void @swap(i32* %24, i32* %27), !dbg !36
  br label %for.update, !dbg !36

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, i32* %j, align 4, !dbg !36
  %29 = add i32 %28, 1, !dbg !36
  store i32 %29, i32* %j, align 4, !dbg !36
  br label %for.cond, !dbg !36

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* %i, align 4, !dbg !37
  %31 = add i32 %30, 1, !dbg !37
  %32 = getelementptr i32, i32* %14, i32 %31, !dbg !37
  %33 = load i32*, i32** %arr, align 8, !dbg !37
  %34 = load i32, i32* %high, align 4, !dbg !37
  %35 = getelementptr i32, i32* %33, i32 %34, !dbg !37
  call void @swap(i32* %32, i32* %35), !dbg !37
  %36 = load i32, i32* %i, align 4, !dbg !38
  %37 = add i32 %36, 1, !dbg !38
  ret i32 %37, !dbg !38
}

define void @quickSort(i32* %0, i32 %1, i32 %2) !dbg !39 {
entry:
  %pi = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %pi, metadata !42, metadata !DIExpression()), !dbg !44
  %high = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %high, metadata !45, metadata !DIExpression()), !dbg !46
  %low = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %low, metadata !47, metadata !DIExpression()), !dbg !46
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !48, metadata !DIExpression()), !dbg !46
  store i32* %0, i32** %arr, align 8, !dbg !46
  store i32 %1, i32* %low, align 4, !dbg !46
  store i32 %2, i32* %high, align 4, !dbg !46
  %3 = load i32, i32* %low, align 4, !dbg !49
  %4 = load i32, i32* %high, align 4, !dbg !49
  %5 = icmp slt i32 %3, %4, !dbg !49
  br i1 %5, label %then, label %if.end, !dbg !49

then:                                             ; preds = %entry
  %6 = load i32*, i32** %arr, align 8, !dbg !44
  %7 = load i32, i32* %low, align 4, !dbg !44
  %8 = load i32, i32* %high, align 4, !dbg !44
  %9 = call i32 @partition(i32* %6, i32 %7, i32 %8), !dbg !44
  store i32 %9, i32* %pi, align 4, !dbg !44
  %10 = load i32*, i32** %arr, align 8, !dbg !50
  %11 = load i32, i32* %low, align 4, !dbg !50
  %12 = load i32, i32* %pi, align 4, !dbg !50
  %13 = sub i32 %12, 1, !dbg !50
  call void @quickSort(i32* %10, i32 %11, i32 %13), !dbg !50
  %14 = load i32*, i32** %arr, align 8, !dbg !51
  %15 = load i32, i32* %pi, align 4, !dbg !51
  %16 = add i32 %15, 1, !dbg !51
  %17 = load i32, i32* %high, align 4, !dbg !51
  call void @quickSort(i32* %14, i32 %16, i32 %17), !dbg !51
  br label %if.end, !dbg !51

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !51
}

define i32 @main() !dbg !52 {
entry:
  %single = alloca [1 x i32], align 4
  call void @llvm.dbg.declare(metadata [1 x i32]* %single, metadata !55, metadata !DIExpression()), !dbg !59
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !60, metadata !DIExpression()), !dbg !61
  %arr = alloca [6 x i32], align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %arr, metadata !62, metadata !DIExpression()), !dbg !66
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 0, i32* %err, align 4, !dbg !68
  %0 = bitcast [6 x i32]* %arr to i32*, !dbg !69
  %1 = bitcast i32* %0 to i32*, !dbg !69
  store i32 10, i32* %1, align 4, !dbg !69
  %2 = load i32, i32* %1, align 4, !dbg !69
  %3 = bitcast [6 x i32]* %arr to i32*, !dbg !70
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !70
  store i32 7, i32* %4, align 4, !dbg !70
  %5 = load i32, i32* %4, align 4, !dbg !70
  %6 = bitcast [6 x i32]* %arr to i32*, !dbg !71
  %7 = getelementptr i32, i32* %6, i32 2, !dbg !71
  store i32 8, i32* %7, align 4, !dbg !71
  %8 = load i32, i32* %7, align 4, !dbg !71
  %9 = bitcast [6 x i32]* %arr to i32*, !dbg !72
  %10 = getelementptr i32, i32* %9, i32 3, !dbg !72
  store i32 9, i32* %10, align 4, !dbg !72
  %11 = load i32, i32* %10, align 4, !dbg !72
  %12 = bitcast [6 x i32]* %arr to i32*, !dbg !73
  %13 = getelementptr i32, i32* %12, i32 4, !dbg !73
  store i32 1, i32* %13, align 4, !dbg !73
  %14 = load i32, i32* %13, align 4, !dbg !73
  %15 = bitcast [6 x i32]* %arr to i32*, !dbg !74
  %16 = getelementptr i32, i32* %15, i32 5, !dbg !74
  store i32 5, i32* %16, align 4, !dbg !74
  %17 = load i32, i32* %16, align 4, !dbg !74
  store i32 6, i32* %n, align 4, !dbg !61
  %18 = bitcast [6 x i32]* %arr to i32*, !dbg !75
  %19 = load i32, i32* %n, align 4, !dbg !75
  %20 = sub i32 %19, 1, !dbg !75
  call void @quickSort(i32* %18, i32 0, i32 %20), !dbg !75
  %21 = bitcast [6 x i32]* %arr to i32*, !dbg !76
  %22 = bitcast i32* %21 to i32*, !dbg !76
  %23 = load i32, i32* %22, align 4, !dbg !76
  %24 = icmp ne i32 %23, 1, !dbg !76
  br i1 %24, label %then, label %if.end, !dbg !76

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !77
  %25 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end, !dbg !77

if.end:                                           ; preds = %entry, %then
  %26 = bitcast [6 x i32]* %arr to i32*, !dbg !78
  %27 = getelementptr i32, i32* %26, i32 1, !dbg !78
  %28 = load i32, i32* %27, align 4, !dbg !78
  %29 = icmp ne i32 %28, 5, !dbg !78
  br i1 %29, label %then1, label %if.end3, !dbg !78

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !79
  %30 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end3, !dbg !79

if.end3:                                          ; preds = %if.end, %then1
  %31 = bitcast [6 x i32]* %arr to i32*, !dbg !80
  %32 = getelementptr i32, i32* %31, i32 2, !dbg !80
  %33 = load i32, i32* %32, align 4, !dbg !80
  %34 = icmp ne i32 %33, 7, !dbg !80
  br i1 %34, label %then4, label %if.end6, !dbg !80

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !81
  %35 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end6, !dbg !81

if.end6:                                          ; preds = %if.end3, %then4
  %36 = bitcast [6 x i32]* %arr to i32*, !dbg !82
  %37 = getelementptr i32, i32* %36, i32 3, !dbg !82
  %38 = load i32, i32* %37, align 4, !dbg !82
  %39 = icmp ne i32 %38, 8, !dbg !82
  br i1 %39, label %then7, label %if.end9, !dbg !82

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !83
  %40 = load i32, i32* %err, align 4, !dbg !83
  br label %if.end9, !dbg !83

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [6 x i32]* %arr to i32*, !dbg !84
  %42 = getelementptr i32, i32* %41, i32 4, !dbg !84
  %43 = load i32, i32* %42, align 4, !dbg !84
  %44 = icmp ne i32 %43, 9, !dbg !84
  br i1 %44, label %then10, label %if.end12, !dbg !84

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !85
  %45 = load i32, i32* %err, align 4, !dbg !85
  br label %if.end12, !dbg !85

if.end12:                                         ; preds = %if.end9, %then10
  %46 = bitcast [6 x i32]* %arr to i32*, !dbg !86
  %47 = getelementptr i32, i32* %46, i32 5, !dbg !86
  %48 = load i32, i32* %47, align 4, !dbg !86
  %49 = icmp ne i32 %48, 10, !dbg !86
  br i1 %49, label %then13, label %if.end15, !dbg !86

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !87
  %50 = load i32, i32* %err, align 4, !dbg !87
  br label %if.end15, !dbg !87

if.end15:                                         ; preds = %if.end12, %then13
  %51 = bitcast [1 x i32]* %single to i32*, !dbg !88
  %52 = bitcast i32* %51 to i32*, !dbg !88
  store i32 42, i32* %52, align 4, !dbg !88
  %53 = load i32, i32* %52, align 4, !dbg !88
  %54 = bitcast [1 x i32]* %single to i32*, !dbg !89
  call void @quickSort(i32* %54, i32 0, i32 0), !dbg !89
  %55 = bitcast [1 x i32]* %single to i32*, !dbg !90
  %56 = bitcast i32* %55 to i32*, !dbg !90
  %57 = load i32, i32* %56, align 4, !dbg !90
  %58 = icmp ne i32 %57, 42, !dbg !90
  br i1 %58, label %then16, label %if.end18, !dbg !90

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !91
  %59 = load i32, i32* %err, align 4, !dbg !91
  br label %if.end18, !dbg !91

if.end18:                                         ; preds = %if.end15, %then16
  %60 = load i32, i32* %err, align 4, !dbg !92
  %61 = icmp eq i32 %60, 0, !dbg !92
  %. = select i1 %61, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !93
  %62 = call i32 (i8*, ...) @printf(i8* %.), !dbg !93
  %63 = load i32, i32* %err, align 4, !dbg !94
  ret i32 %63, !dbg !94
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !8}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{}
!11 = !DILocalVariable(name: "t", scope: !4, file: !1, line: 4, type: !9)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !4, file: !1, line: 3, type: !8)
!14 = !DILocation(line: 3, column: 6, scope: !4)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !1, line: 3, type: !8)
!16 = !DILocation(line: 5, column: 3, scope: !4)
!17 = !DILocation(line: 6, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 9, type: !19, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!19 = !DISubroutineType(types: !20)
!20 = !{!9, !8, !9, !9}
!21 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 12, type: !9)
!22 = !DILocation(line: 12, column: 8, scope: !18)
!23 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 11, type: !9)
!24 = !DILocation(line: 11, column: 3, scope: !18)
!25 = !DILocalVariable(name: "pivot", scope: !18, file: !1, line: 10, type: !9)
!26 = !DILocation(line: 10, column: 3, scope: !18)
!27 = !DILocalVariable(name: "high", arg: 3, scope: !18, file: !1, line: 9, type: !9)
!28 = !DILocation(line: 9, column: 5, scope: !18)
!29 = !DILocalVariable(name: "low", arg: 2, scope: !18, file: !1, line: 9, type: !9)
!30 = !DILocalVariable(name: "arr", arg: 1, scope: !18, file: !1, line: 9, type: !8)
!31 = !DILocation(line: 0, scope: !18)
!32 = !DILocation(line: 13, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !1, line: 12, column: 41)
!34 = !DILocation(line: 14, column: 7, scope: !35)
!35 = distinct !DILexicalBlock(scope: !33, file: !1, line: 13, column: 26)
!36 = !DILocation(line: 15, column: 7, scope: !35)
!37 = !DILocation(line: 18, column: 3, scope: !18)
!38 = !DILocation(line: 19, column: 3, scope: !18)
!39 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 22, type: !40, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!40 = !DISubroutineType(types: !41)
!41 = !{!7, !8, !9, !9}
!42 = !DILocalVariable(name: "pi", scope: !43, file: !1, line: 24, type: !9)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 23, column: 19)
!44 = !DILocation(line: 24, column: 5, scope: !43)
!45 = !DILocalVariable(name: "high", arg: 3, scope: !39, file: !1, line: 22, type: !9)
!46 = !DILocation(line: 22, column: 6, scope: !39)
!47 = !DILocalVariable(name: "low", arg: 2, scope: !39, file: !1, line: 22, type: !9)
!48 = !DILocalVariable(name: "arr", arg: 1, scope: !39, file: !1, line: 22, type: !8)
!49 = !DILocation(line: 23, column: 3, scope: !39)
!50 = !DILocation(line: 25, column: 5, scope: !43)
!51 = !DILocation(line: 26, column: 5, scope: !43)
!52 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !53, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!53 = !DISubroutineType(types: !54)
!54 = !{!9}
!55 = !DILocalVariable(name: "single", scope: !52, file: !1, line: 50, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, align: 32, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 1, lowerBound: 0)
!59 = !DILocation(line: 50, column: 3, scope: !52)
!60 = !DILocalVariable(name: "n", scope: !52, file: !1, line: 39, type: !9)
!61 = !DILocation(line: 39, column: 3, scope: !52)
!62 = !DILocalVariable(name: "arr", scope: !52, file: !1, line: 32, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 6, lowerBound: 0)
!66 = !DILocation(line: 32, column: 3, scope: !52)
!67 = !DILocalVariable(name: "err", scope: !52, file: !1, line: 31, type: !9)
!68 = !DILocation(line: 31, column: 3, scope: !52)
!69 = !DILocation(line: 33, column: 3, scope: !52)
!70 = !DILocation(line: 34, column: 3, scope: !52)
!71 = !DILocation(line: 35, column: 3, scope: !52)
!72 = !DILocation(line: 36, column: 3, scope: !52)
!73 = !DILocation(line: 37, column: 3, scope: !52)
!74 = !DILocation(line: 38, column: 3, scope: !52)
!75 = !DILocation(line: 41, column: 3, scope: !52)
!76 = !DILocation(line: 43, column: 3, scope: !52)
!77 = !DILocation(line: 43, column: 20, scope: !52)
!78 = !DILocation(line: 44, column: 3, scope: !52)
!79 = !DILocation(line: 44, column: 20, scope: !52)
!80 = !DILocation(line: 45, column: 3, scope: !52)
!81 = !DILocation(line: 45, column: 20, scope: !52)
!82 = !DILocation(line: 46, column: 3, scope: !52)
!83 = !DILocation(line: 46, column: 20, scope: !52)
!84 = !DILocation(line: 47, column: 3, scope: !52)
!85 = !DILocation(line: 47, column: 20, scope: !52)
!86 = !DILocation(line: 48, column: 3, scope: !52)
!87 = !DILocation(line: 48, column: 21, scope: !52)
!88 = !DILocation(line: 51, column: 3, scope: !52)
!89 = !DILocation(line: 52, column: 3, scope: !52)
!90 = !DILocation(line: 53, column: 3, scope: !52)
!91 = !DILocation(line: 53, column: 24, scope: !52)
!92 = !DILocation(line: 55, column: 3, scope: !52)
!93 = !DILocation(line: 0, scope: !52)
!94 = !DILocation(line: 60, column: 3, scope: !52)
