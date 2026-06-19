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
  %20 = load i32, i32* %i, align 4, !dbg !31
  %21 = add i32 %20, 1, !dbg !31
  store i32 %21, i32* %i, align 4, !dbg !31
  %22 = load i32*, i32** %arr, align 8, !dbg !32
  %23 = load i32, i32* %i, align 4, !dbg !32
  %24 = getelementptr i32, i32* %22, i32 %23, !dbg !32
  %25 = load i32*, i32** %arr, align 8, !dbg !32
  %26 = load i32, i32* %j, align 4, !dbg !32
  %27 = getelementptr i32, i32* %25, i32 %26, !dbg !32
  call void @swap(i32* %24, i32* %27), !dbg !32
  br label %for.update, !dbg !32

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, i32* %j, align 4, !dbg !32
  %29 = add i32 %28, 1, !dbg !32
  store i32 %29, i32* %j, align 4, !dbg !32
  br label %for.cond, !dbg !32

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* %i, align 4, !dbg !33
  %31 = add i32 %30, 1, !dbg !33
  %32 = getelementptr i32, i32* %14, i32 %31, !dbg !33
  %33 = load i32*, i32** %arr, align 8, !dbg !33
  %34 = load i32, i32* %high, align 4, !dbg !33
  %35 = getelementptr i32, i32* %33, i32 %34, !dbg !33
  call void @swap(i32* %32, i32* %35), !dbg !33
  %36 = load i32, i32* %i, align 4, !dbg !34
  %37 = add i32 %36, 1, !dbg !34
  ret i32 %37, !dbg !34
}

define void @quickSort(i32* %0, i32 %1, i32 %2) !dbg !35 {
entry:
  %pi = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %pi, metadata !38, metadata !DIExpression()), !dbg !39
  %high = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %high, metadata !40, metadata !DIExpression()), !dbg !41
  %low = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %low, metadata !42, metadata !DIExpression()), !dbg !41
  %arr = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %arr, metadata !43, metadata !DIExpression()), !dbg !41
  store i32* %0, i32** %arr, align 8, !dbg !41
  store i32 %1, i32* %low, align 4, !dbg !41
  store i32 %2, i32* %high, align 4, !dbg !41
  %3 = load i32, i32* %low, align 4, !dbg !44
  %4 = load i32, i32* %high, align 4, !dbg !44
  %5 = icmp slt i32 %3, %4, !dbg !44
  br i1 %5, label %then, label %if.end, !dbg !44

then:                                             ; preds = %entry
  %6 = load i32*, i32** %arr, align 8, !dbg !39
  %7 = load i32, i32* %low, align 4, !dbg !39
  %8 = load i32, i32* %high, align 4, !dbg !39
  %9 = call i32 @partition(i32* %6, i32 %7, i32 %8), !dbg !39
  store i32 %9, i32* %pi, align 4, !dbg !39
  %10 = load i32*, i32** %arr, align 8, !dbg !45
  %11 = load i32, i32* %low, align 4, !dbg !45
  %12 = load i32, i32* %pi, align 4, !dbg !45
  %13 = sub i32 %12, 1, !dbg !45
  call void @quickSort(i32* %10, i32 %11, i32 %13), !dbg !45
  %14 = load i32*, i32** %arr, align 8, !dbg !46
  %15 = load i32, i32* %pi, align 4, !dbg !46
  %16 = add i32 %15, 1, !dbg !46
  %17 = load i32, i32* %high, align 4, !dbg !46
  call void @quickSort(i32* %14, i32 %16, i32 %17), !dbg !46
  br label %if.end, !dbg !46

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !46
}

define i32 @main() !dbg !47 {
entry:
  %single = alloca [1 x i32], align 4
  call void @llvm.dbg.declare(metadata [1 x i32]* %single, metadata !50, metadata !DIExpression()), !dbg !54
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !55, metadata !DIExpression()), !dbg !56
  %arr = alloca [6 x i32], align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %arr, metadata !57, metadata !DIExpression()), !dbg !61
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 0, i32* %err, align 4, !dbg !63
  %0 = bitcast [6 x i32]* %arr to i32*, !dbg !64
  %1 = bitcast i32* %0 to i32*, !dbg !64
  store i32 10, i32* %1, align 4, !dbg !64
  %2 = load i32, i32* %1, align 4, !dbg !64
  %3 = bitcast [6 x i32]* %arr to i32*, !dbg !65
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !65
  store i32 7, i32* %4, align 4, !dbg !65
  %5 = load i32, i32* %4, align 4, !dbg !65
  %6 = bitcast [6 x i32]* %arr to i32*, !dbg !66
  %7 = getelementptr i32, i32* %6, i32 2, !dbg !66
  store i32 8, i32* %7, align 4, !dbg !66
  %8 = load i32, i32* %7, align 4, !dbg !66
  %9 = bitcast [6 x i32]* %arr to i32*, !dbg !67
  %10 = getelementptr i32, i32* %9, i32 3, !dbg !67
  store i32 9, i32* %10, align 4, !dbg !67
  %11 = load i32, i32* %10, align 4, !dbg !67
  %12 = bitcast [6 x i32]* %arr to i32*, !dbg !68
  %13 = getelementptr i32, i32* %12, i32 4, !dbg !68
  store i32 1, i32* %13, align 4, !dbg !68
  %14 = load i32, i32* %13, align 4, !dbg !68
  %15 = bitcast [6 x i32]* %arr to i32*, !dbg !69
  %16 = getelementptr i32, i32* %15, i32 5, !dbg !69
  store i32 5, i32* %16, align 4, !dbg !69
  %17 = load i32, i32* %16, align 4, !dbg !69
  %18 = bitcast [6 x i32]* %arr to i32*, !dbg !56
  %19 = bitcast i32* %18 to i32*, !dbg !56
  %20 = load i32, i32* %19, align 4, !dbg !56
  store i32 6, i32* %n, align 4, !dbg !56
  %21 = bitcast [6 x i32]* %arr to i32*, !dbg !70
  %22 = load i32, i32* %n, align 4, !dbg !70
  %23 = sub i32 %22, 1, !dbg !70
  call void @quickSort(i32* %21, i32 0, i32 %23), !dbg !70
  %24 = bitcast [6 x i32]* %arr to i32*, !dbg !71
  %25 = bitcast i32* %24 to i32*, !dbg !71
  %26 = load i32, i32* %25, align 4, !dbg !71
  %27 = icmp ne i32 %26, 1, !dbg !71
  br i1 %27, label %then, label %if.end, !dbg !71

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !72
  %28 = load i32, i32* %err, align 4, !dbg !72
  br label %if.end, !dbg !72

if.end:                                           ; preds = %entry, %then
  %29 = bitcast [6 x i32]* %arr to i32*, !dbg !73
  %30 = getelementptr i32, i32* %29, i32 1, !dbg !73
  %31 = load i32, i32* %30, align 4, !dbg !73
  %32 = icmp ne i32 %31, 5, !dbg !73
  br i1 %32, label %then1, label %if.end3, !dbg !73

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !74
  %33 = load i32, i32* %err, align 4, !dbg !74
  br label %if.end3, !dbg !74

if.end3:                                          ; preds = %if.end, %then1
  %34 = bitcast [6 x i32]* %arr to i32*, !dbg !75
  %35 = getelementptr i32, i32* %34, i32 2, !dbg !75
  %36 = load i32, i32* %35, align 4, !dbg !75
  %37 = icmp ne i32 %36, 7, !dbg !75
  br i1 %37, label %then4, label %if.end6, !dbg !75

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !76
  %38 = load i32, i32* %err, align 4, !dbg !76
  br label %if.end6, !dbg !76

if.end6:                                          ; preds = %if.end3, %then4
  %39 = bitcast [6 x i32]* %arr to i32*, !dbg !77
  %40 = getelementptr i32, i32* %39, i32 3, !dbg !77
  %41 = load i32, i32* %40, align 4, !dbg !77
  %42 = icmp ne i32 %41, 8, !dbg !77
  br i1 %42, label %then7, label %if.end9, !dbg !77

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !78
  %43 = load i32, i32* %err, align 4, !dbg !78
  br label %if.end9, !dbg !78

if.end9:                                          ; preds = %if.end6, %then7
  %44 = bitcast [6 x i32]* %arr to i32*, !dbg !79
  %45 = getelementptr i32, i32* %44, i32 4, !dbg !79
  %46 = load i32, i32* %45, align 4, !dbg !79
  %47 = icmp ne i32 %46, 9, !dbg !79
  br i1 %47, label %then10, label %if.end12, !dbg !79

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !80
  %48 = load i32, i32* %err, align 4, !dbg !80
  br label %if.end12, !dbg !80

if.end12:                                         ; preds = %if.end9, %then10
  %49 = bitcast [6 x i32]* %arr to i32*, !dbg !81
  %50 = getelementptr i32, i32* %49, i32 5, !dbg !81
  %51 = load i32, i32* %50, align 4, !dbg !81
  %52 = icmp ne i32 %51, 10, !dbg !81
  br i1 %52, label %then13, label %if.end15, !dbg !81

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !82
  %53 = load i32, i32* %err, align 4, !dbg !82
  br label %if.end15, !dbg !82

if.end15:                                         ; preds = %if.end12, %then13
  %54 = bitcast [1 x i32]* %single to i32*, !dbg !83
  %55 = bitcast i32* %54 to i32*, !dbg !83
  store i32 42, i32* %55, align 4, !dbg !83
  %56 = load i32, i32* %55, align 4, !dbg !83
  %57 = bitcast [1 x i32]* %single to i32*, !dbg !84
  call void @quickSort(i32* %57, i32 0, i32 0), !dbg !84
  %58 = bitcast [1 x i32]* %single to i32*, !dbg !85
  %59 = bitcast i32* %58 to i32*, !dbg !85
  %60 = load i32, i32* %59, align 4, !dbg !85
  %61 = icmp ne i32 %60, 42, !dbg !85
  br i1 %61, label %then16, label %if.end18, !dbg !85

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !86
  %62 = load i32, i32* %err, align 4, !dbg !86
  br label %if.end18, !dbg !86

if.end18:                                         ; preds = %if.end15, %then16
  %63 = load i32, i32* %err, align 4, !dbg !87
  %64 = icmp eq i32 %63, 0, !dbg !87
  %. = select i1 %64, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !88
  %65 = call i32 (i8*, ...) @printf(i8* %.), !dbg !88
  %66 = load i32, i32* %err, align 4, !dbg !89
  ret i32 %66, !dbg !89
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
!30 = !DILocation(line: 13, column: 5, scope: !16)
!31 = !DILocation(line: 14, column: 7, scope: !16)
!32 = !DILocation(line: 15, column: 7, scope: !16)
!33 = !DILocation(line: 18, column: 3, scope: !16)
!34 = !DILocation(line: 19, column: 3, scope: !16)
!35 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 22, type: !36, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!36 = !DISubroutineType(types: !37)
!37 = !{!5, !6, !7, !7}
!38 = !DILocalVariable(name: "pi", scope: !35, file: !1, line: 24, type: !7)
!39 = !DILocation(line: 24, column: 5, scope: !35)
!40 = !DILocalVariable(name: "high", arg: 3, scope: !35, file: !1, line: 22, type: !7)
!41 = !DILocation(line: 22, column: 6, scope: !35)
!42 = !DILocalVariable(name: "low", arg: 2, scope: !35, file: !1, line: 22, type: !7)
!43 = !DILocalVariable(name: "arr", arg: 1, scope: !35, file: !1, line: 22, type: !6)
!44 = !DILocation(line: 23, column: 3, scope: !35)
!45 = !DILocation(line: 25, column: 5, scope: !35)
!46 = !DILocation(line: 26, column: 5, scope: !35)
!47 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !48, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!48 = !DISubroutineType(types: !49)
!49 = !{!7}
!50 = !DILocalVariable(name: "single", scope: !47, file: !1, line: 50, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32, align: 32, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 1, lowerBound: 0)
!54 = !DILocation(line: 50, column: 3, scope: !47)
!55 = !DILocalVariable(name: "n", scope: !47, file: !1, line: 39, type: !7)
!56 = !DILocation(line: 39, column: 3, scope: !47)
!57 = !DILocalVariable(name: "arr", scope: !47, file: !1, line: 32, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, align: 32, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 6, lowerBound: 0)
!61 = !DILocation(line: 32, column: 3, scope: !47)
!62 = !DILocalVariable(name: "err", scope: !47, file: !1, line: 31, type: !7)
!63 = !DILocation(line: 31, column: 3, scope: !47)
!64 = !DILocation(line: 33, column: 3, scope: !47)
!65 = !DILocation(line: 34, column: 3, scope: !47)
!66 = !DILocation(line: 35, column: 3, scope: !47)
!67 = !DILocation(line: 36, column: 3, scope: !47)
!68 = !DILocation(line: 37, column: 3, scope: !47)
!69 = !DILocation(line: 38, column: 3, scope: !47)
!70 = !DILocation(line: 41, column: 3, scope: !47)
!71 = !DILocation(line: 43, column: 3, scope: !47)
!72 = !DILocation(line: 43, column: 20, scope: !47)
!73 = !DILocation(line: 44, column: 3, scope: !47)
!74 = !DILocation(line: 44, column: 20, scope: !47)
!75 = !DILocation(line: 45, column: 3, scope: !47)
!76 = !DILocation(line: 45, column: 20, scope: !47)
!77 = !DILocation(line: 46, column: 3, scope: !47)
!78 = !DILocation(line: 46, column: 20, scope: !47)
!79 = !DILocation(line: 47, column: 3, scope: !47)
!80 = !DILocation(line: 47, column: 20, scope: !47)
!81 = !DILocation(line: 48, column: 3, scope: !47)
!82 = !DILocation(line: 48, column: 21, scope: !47)
!83 = !DILocation(line: 51, column: 3, scope: !47)
!84 = !DILocation(line: 52, column: 3, scope: !47)
!85 = !DILocation(line: 53, column: 3, scope: !47)
!86 = !DILocation(line: 53, column: 24, scope: !47)
!87 = !DILocation(line: 55, column: 3, scope: !47)
!88 = !DILocation(line: 0, scope: !47)
!89 = !DILocation(line: 60, column: 3, scope: !47)
