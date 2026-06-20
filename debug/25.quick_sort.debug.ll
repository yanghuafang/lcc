; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @swap(ptr %0, ptr %1) !dbg !2 {
entry:
  %t = alloca i32, align 4
    #dbg_declare(ptr %t, !9, !DIExpression(), !10)
  %b = alloca ptr, align 8
    #dbg_declare(ptr %b, !11, !DIExpression(), !12)
  %a = alloca ptr, align 8
    #dbg_declare(ptr %a, !13, !DIExpression(), !12)
  store ptr %0, ptr %a, align 8, !dbg !12
  store ptr %1, ptr %b, align 8, !dbg !12
  %2 = load ptr, ptr %a, align 8, !dbg !10
  %3 = load i32, ptr %2, align 4, !dbg !10
  store i32 %3, ptr %t, align 4, !dbg !10
  %4 = load ptr, ptr %a, align 8, !dbg !14
  %5 = load ptr, ptr %b, align 8, !dbg !14
  %6 = load i32, ptr %5, align 4, !dbg !14
  store i32 %6, ptr %4, align 4, !dbg !14
  %7 = load i32, ptr %4, align 4, !dbg !14
  %8 = load ptr, ptr %b, align 8, !dbg !15
  %9 = load i32, ptr %t, align 4, !dbg !15
  store i32 %9, ptr %8, align 4, !dbg !15
  %10 = load i32, ptr %8, align 4, !dbg !15
  ret void, !dbg !15
}

define i32 @partition(ptr %0, i32 %1, i32 %2) !dbg !16 {
entry:
  %j = alloca i32, align 4
    #dbg_declare(ptr %j, !19, !DIExpression(), !20)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !21, !DIExpression(), !22)
  %pivot = alloca i32, align 4
    #dbg_declare(ptr %pivot, !23, !DIExpression(), !24)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !25, !DIExpression(), !26)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !27, !DIExpression(), !26)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !28, !DIExpression(), !26)
  store ptr %0, ptr %arr, align 8, !dbg !26
  store i32 %1, ptr %low, align 4, !dbg !26
  store i32 %2, ptr %high, align 4, !dbg !26
  %3 = load ptr, ptr %arr, align 8, !dbg !24
  %4 = load i32, ptr %high, align 4, !dbg !24
  %5 = getelementptr i32, ptr %3, i32 %4, !dbg !24
  %6 = load i32, ptr %5, align 4, !dbg !24
  store i32 %6, ptr %pivot, align 4, !dbg !24
  %7 = load i32, ptr %low, align 4, !dbg !22
  %8 = sub i32 %7, 1, !dbg !22
  store i32 %8, ptr %i, align 4, !dbg !22
  %9 = load i32, ptr %low, align 4, !dbg !20
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.update, %entry
  %.sink = phi i32 [ %29, %for.update ], [ %9, %entry ]
  store i32 %.sink, ptr %j, align 4, !dbg !29
  %10 = load i32, ptr %j, align 4, !dbg !20
  %11 = load i32, ptr %high, align 4, !dbg !20
  %12 = sub i32 %11, 1, !dbg !20
  %13 = icmp sle i32 %10, %12, !dbg !20
  %14 = load ptr, ptr %arr, align 8, !dbg !29
  br i1 %13, label %for.loop, label %for.end, !dbg !20

for.loop:                                         ; preds = %for.cond
  %15 = load i32, ptr %j, align 4, !dbg !30
  %16 = getelementptr i32, ptr %14, i32 %15, !dbg !30
  %17 = load i32, ptr %16, align 4, !dbg !30
  %18 = load i32, ptr %pivot, align 4, !dbg !30
  %19 = icmp sle i32 %17, %18, !dbg !30
  br i1 %19, label %then, label %for.update, !dbg !30

then:                                             ; preds = %for.loop
  %20 = load i32, ptr %i, align 4, !dbg !32
  %21 = add i32 %20, 1, !dbg !32
  store i32 %21, ptr %i, align 4, !dbg !32
  %22 = load ptr, ptr %arr, align 8, !dbg !34
  %23 = load i32, ptr %i, align 4, !dbg !34
  %24 = getelementptr i32, ptr %22, i32 %23, !dbg !34
  %25 = load ptr, ptr %arr, align 8, !dbg !34
  %26 = load i32, ptr %j, align 4, !dbg !34
  %27 = getelementptr i32, ptr %25, i32 %26, !dbg !34
  call void @swap(ptr %24, ptr %27), !dbg !34
  br label %for.update, !dbg !34

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, ptr %j, align 4, !dbg !34
  %29 = add i32 %28, 1, !dbg !34
  br label %for.cond, !dbg !34

for.end:                                          ; preds = %for.cond
  %30 = load i32, ptr %i, align 4, !dbg !35
  %31 = add i32 %30, 1, !dbg !35
  %32 = getelementptr i32, ptr %14, i32 %31, !dbg !35
  %33 = load ptr, ptr %arr, align 8, !dbg !35
  %34 = load i32, ptr %high, align 4, !dbg !35
  %35 = getelementptr i32, ptr %33, i32 %34, !dbg !35
  call void @swap(ptr %32, ptr %35), !dbg !35
  %36 = load i32, ptr %i, align 4, !dbg !36
  %37 = add i32 %36, 1, !dbg !36
  ret i32 %37, !dbg !36
}

define void @quickSort(ptr %0, i32 %1, i32 %2) !dbg !37 {
entry:
  %pi = alloca i32, align 4
    #dbg_declare(ptr %pi, !40, !DIExpression(), !42)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !43, !DIExpression(), !44)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !45, !DIExpression(), !44)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !46, !DIExpression(), !44)
  store ptr %0, ptr %arr, align 8, !dbg !44
  store i32 %1, ptr %low, align 4, !dbg !44
  store i32 %2, ptr %high, align 4, !dbg !44
  %3 = load i32, ptr %low, align 4, !dbg !47
  %4 = load i32, ptr %high, align 4, !dbg !47
  %5 = icmp slt i32 %3, %4, !dbg !47
  br i1 %5, label %then, label %if.end, !dbg !47

then:                                             ; preds = %entry
  %6 = load ptr, ptr %arr, align 8, !dbg !42
  %7 = load i32, ptr %low, align 4, !dbg !42
  %8 = load i32, ptr %high, align 4, !dbg !42
  %9 = call i32 @partition(ptr %6, i32 %7, i32 %8), !dbg !42
  store i32 %9, ptr %pi, align 4, !dbg !42
  %10 = load ptr, ptr %arr, align 8, !dbg !48
  %11 = load i32, ptr %low, align 4, !dbg !48
  %12 = load i32, ptr %pi, align 4, !dbg !48
  %13 = sub i32 %12, 1, !dbg !48
  call void @quickSort(ptr %10, i32 %11, i32 %13), !dbg !48
  %14 = load ptr, ptr %arr, align 8, !dbg !49
  %15 = load i32, ptr %pi, align 4, !dbg !49
  %16 = add i32 %15, 1, !dbg !49
  %17 = load i32, ptr %high, align 4, !dbg !49
  call void @quickSort(ptr %14, i32 %16, i32 %17), !dbg !49
  br label %if.end, !dbg !49

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !49
}

define i32 @main() !dbg !50 {
entry:
  %single = alloca [1 x i32], align 4
    #dbg_declare(ptr %single, !53, !DIExpression(), !57)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !58, !DIExpression(), !59)
  %arr = alloca [6 x i32], align 4
    #dbg_declare(ptr %arr, !60, !DIExpression(), !64)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !65, !DIExpression(), !66)
  store i32 0, ptr %err, align 4, !dbg !66
  %0 = bitcast ptr %arr to ptr, !dbg !67
  store i32 10, ptr %0, align 4, !dbg !67
  %1 = load i32, ptr %0, align 4, !dbg !67
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !68
  store i32 7, ptr %2, align 4, !dbg !68
  %3 = load i32, ptr %2, align 4, !dbg !68
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !69
  store i32 8, ptr %4, align 4, !dbg !69
  %5 = load i32, ptr %4, align 4, !dbg !69
  %6 = getelementptr i32, ptr %arr, i32 3, !dbg !70
  store i32 9, ptr %6, align 4, !dbg !70
  %7 = load i32, ptr %6, align 4, !dbg !70
  %8 = getelementptr i32, ptr %arr, i32 4, !dbg !71
  store i32 1, ptr %8, align 4, !dbg !71
  %9 = load i32, ptr %8, align 4, !dbg !71
  %10 = getelementptr i32, ptr %arr, i32 5, !dbg !72
  store i32 5, ptr %10, align 4, !dbg !72
  %11 = load i32, ptr %10, align 4, !dbg !72
  %12 = bitcast ptr %arr to ptr, !dbg !59
  %13 = load i32, ptr %12, align 4, !dbg !59
  store i32 6, ptr %n, align 4, !dbg !59
  %14 = load i32, ptr %n, align 4, !dbg !73
  %15 = sub i32 %14, 1, !dbg !73
  call void @quickSort(ptr %arr, i32 0, i32 %15), !dbg !73
  %16 = bitcast ptr %arr to ptr, !dbg !74
  %17 = load i32, ptr %16, align 4, !dbg !74
  %18 = icmp ne i32 %17, 1, !dbg !74
  br i1 %18, label %then, label %if.end, !dbg !74

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !75
  %19 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end, !dbg !75

if.end:                                           ; preds = %entry, %then
  %20 = getelementptr i32, ptr %arr, i32 1, !dbg !76
  %21 = load i32, ptr %20, align 4, !dbg !76
  %22 = icmp ne i32 %21, 5, !dbg !76
  br i1 %22, label %then1, label %if.end3, !dbg !76

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !77
  %23 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end3, !dbg !77

if.end3:                                          ; preds = %if.end, %then1
  %24 = getelementptr i32, ptr %arr, i32 2, !dbg !78
  %25 = load i32, ptr %24, align 4, !dbg !78
  %26 = icmp ne i32 %25, 7, !dbg !78
  br i1 %26, label %then4, label %if.end6, !dbg !78

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !79
  %27 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end6, !dbg !79

if.end6:                                          ; preds = %if.end3, %then4
  %28 = getelementptr i32, ptr %arr, i32 3, !dbg !80
  %29 = load i32, ptr %28, align 4, !dbg !80
  %30 = icmp ne i32 %29, 8, !dbg !80
  br i1 %30, label %then7, label %if.end9, !dbg !80

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !81
  %31 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end9, !dbg !81

if.end9:                                          ; preds = %if.end6, %then7
  %32 = getelementptr i32, ptr %arr, i32 4, !dbg !82
  %33 = load i32, ptr %32, align 4, !dbg !82
  %34 = icmp ne i32 %33, 9, !dbg !82
  br i1 %34, label %then10, label %if.end12, !dbg !82

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !83
  %35 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end12, !dbg !83

if.end12:                                         ; preds = %if.end9, %then10
  %36 = getelementptr i32, ptr %arr, i32 5, !dbg !84
  %37 = load i32, ptr %36, align 4, !dbg !84
  %38 = icmp ne i32 %37, 10, !dbg !84
  br i1 %38, label %then13, label %if.end15, !dbg !84

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !85
  %39 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end15, !dbg !85

if.end15:                                         ; preds = %if.end12, %then13
  %40 = bitcast ptr %single to ptr, !dbg !86
  store i32 42, ptr %40, align 4, !dbg !86
  %41 = load i32, ptr %40, align 4, !dbg !86
  call void @quickSort(ptr %single, i32 0, i32 0), !dbg !87
  %42 = bitcast ptr %single to ptr, !dbg !88
  %43 = load i32, ptr %42, align 4, !dbg !88
  %44 = icmp ne i32 %43, 42, !dbg !88
  br i1 %44, label %then16, label %if.end18, !dbg !88

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !89
  %45 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end18, !dbg !89

if.end18:                                         ; preds = %if.end15, %then16
  %46 = load i32, ptr %err, align 4, !dbg !90
  %47 = icmp eq i32 %46, 0, !dbg !90
  %. = select i1 %47, ptr @0, ptr @1, !dbg !91
  %48 = call i32 (ptr, ...) @printf(ptr %.), !dbg !91
  %49 = load i32, ptr %err, align 4, !dbg !92
  ret i32 %49, !dbg !92
}

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
