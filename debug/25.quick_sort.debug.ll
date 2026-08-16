; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @swap(ptr %0, ptr %1) !dbg !4 {
entry:
  %t = alloca i32, align 4
    #dbg_declare(ptr %t, !11, !DIExpression(), !12)
  %b = alloca ptr, align 8
    #dbg_declare(ptr %b, !13, !DIExpression(), !14)
  %a = alloca ptr, align 8
    #dbg_declare(ptr %a, !15, !DIExpression(), !14)
  store ptr %0, ptr %a, align 8, !dbg !14
  store ptr %1, ptr %b, align 8, !dbg !14
  %2 = load ptr, ptr %a, align 8, !dbg !12
  %3 = load i32, ptr %2, align 4, !dbg !12
  store i32 %3, ptr %t, align 4, !dbg !12
  %4 = load ptr, ptr %a, align 8, !dbg !16
  %5 = load ptr, ptr %b, align 8, !dbg !16
  %6 = load i32, ptr %5, align 4, !dbg !16
  store i32 %6, ptr %4, align 4, !dbg !16
  %7 = load i32, ptr %4, align 4, !dbg !16
  %8 = load ptr, ptr %b, align 8, !dbg !17
  %9 = load i32, ptr %t, align 4, !dbg !17
  store i32 %9, ptr %8, align 4, !dbg !17
  %10 = load i32, ptr %8, align 4, !dbg !17
  ret void, !dbg !17
}

define i32 @partition(ptr %0, i32 %1, i32 %2) !dbg !18 {
entry:
  %j = alloca i32, align 4
    #dbg_declare(ptr %j, !21, !DIExpression(), !22)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !23, !DIExpression(), !24)
  %pivot = alloca i32, align 4
    #dbg_declare(ptr %pivot, !25, !DIExpression(), !26)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !27, !DIExpression(), !28)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !29, !DIExpression(), !28)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !30, !DIExpression(), !28)
  store ptr %0, ptr %arr, align 8, !dbg !28
  store i32 %1, ptr %low, align 4, !dbg !28
  store i32 %2, ptr %high, align 4, !dbg !28
  %3 = load ptr, ptr %arr, align 8, !dbg !26
  %4 = load i32, ptr %high, align 4, !dbg !26
  %5 = getelementptr i32, ptr %3, i32 %4, !dbg !26
  %6 = load i32, ptr %5, align 4, !dbg !26
  store i32 %6, ptr %pivot, align 4, !dbg !26
  %7 = load i32, ptr %low, align 4, !dbg !24
  %8 = sub i32 %7, 1, !dbg !24
  store i32 %8, ptr %i, align 4, !dbg !24
  %9 = load i32, ptr %low, align 4, !dbg !22
  store i32 %9, ptr %j, align 4, !dbg !22
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, ptr %j, align 4, !dbg !22
  %11 = load i32, ptr %high, align 4, !dbg !22
  %12 = sub i32 %11, 1, !dbg !22
  %13 = icmp sle i32 %10, %12, !dbg !22
  br i1 %13, label %for.loop, label %for.end, !dbg !22

for.loop:                                         ; preds = %for.cond
  %14 = load ptr, ptr %arr, align 8, !dbg !31
  %15 = load i32, ptr %j, align 4, !dbg !31
  %16 = getelementptr i32, ptr %14, i32 %15, !dbg !31
  %17 = load i32, ptr %16, align 4, !dbg !31
  %18 = load i32, ptr %pivot, align 4, !dbg !31
  %19 = icmp sle i32 %17, %18, !dbg !31
  br i1 %19, label %then, label %else, !dbg !31

then:                                             ; preds = %for.loop
  %20 = load i32, ptr %i, align 4, !dbg !33
  %21 = add i32 %20, 1, !dbg !33
  store i32 %21, ptr %i, align 4, !dbg !33
  %22 = load ptr, ptr %arr, align 8, !dbg !35
  %23 = load i32, ptr %i, align 4, !dbg !35
  %24 = getelementptr i32, ptr %22, i32 %23, !dbg !35
  %25 = load ptr, ptr %arr, align 8, !dbg !35
  %26 = load i32, ptr %j, align 4, !dbg !35
  %27 = getelementptr i32, ptr %25, i32 %26, !dbg !35
  call void @swap(ptr %24, ptr %27), !dbg !35
  br label %if.end, !dbg !35

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !35

if.end:                                           ; preds = %else, %then
  br label %for.update, !dbg !35

for.update:                                       ; preds = %if.end
  %28 = load i32, ptr %j, align 4, !dbg !35
  %29 = add i32 %28, 1, !dbg !35
  store i32 %29, ptr %j, align 4, !dbg !35
  br label %for.cond, !dbg !35

for.end:                                          ; preds = %for.cond
  %30 = load ptr, ptr %arr, align 8, !dbg !36
  %31 = load i32, ptr %i, align 4, !dbg !36
  %32 = add i32 %31, 1, !dbg !36
  %33 = getelementptr i32, ptr %30, i32 %32, !dbg !36
  %34 = load ptr, ptr %arr, align 8, !dbg !36
  %35 = load i32, ptr %high, align 4, !dbg !36
  %36 = getelementptr i32, ptr %34, i32 %35, !dbg !36
  call void @swap(ptr %33, ptr %36), !dbg !36
  %37 = load i32, ptr %i, align 4, !dbg !37
  %38 = add i32 %37, 1, !dbg !37
  ret i32 %38, !dbg !37
}

define void @quickSort(ptr %0, i32 %1, i32 %2) !dbg !38 {
entry:
  %pi = alloca i32, align 4
    #dbg_declare(ptr %pi, !41, !DIExpression(), !43)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !44, !DIExpression(), !45)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !46, !DIExpression(), !45)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !47, !DIExpression(), !45)
  store ptr %0, ptr %arr, align 8, !dbg !45
  store i32 %1, ptr %low, align 4, !dbg !45
  store i32 %2, ptr %high, align 4, !dbg !45
  %3 = load i32, ptr %low, align 4, !dbg !48
  %4 = load i32, ptr %high, align 4, !dbg !48
  %5 = icmp slt i32 %3, %4, !dbg !48
  br i1 %5, label %then, label %else, !dbg !48

then:                                             ; preds = %entry
  %6 = load ptr, ptr %arr, align 8, !dbg !43
  %7 = load i32, ptr %low, align 4, !dbg !43
  %8 = load i32, ptr %high, align 4, !dbg !43
  %9 = call i32 @partition(ptr %6, i32 %7, i32 %8), !dbg !43
  store i32 %9, ptr %pi, align 4, !dbg !43
  %10 = load ptr, ptr %arr, align 8, !dbg !49
  %11 = load i32, ptr %low, align 4, !dbg !49
  %12 = load i32, ptr %pi, align 4, !dbg !49
  %13 = sub i32 %12, 1, !dbg !49
  call void @quickSort(ptr %10, i32 %11, i32 %13), !dbg !49
  %14 = load ptr, ptr %arr, align 8, !dbg !50
  %15 = load i32, ptr %pi, align 4, !dbg !50
  %16 = add i32 %15, 1, !dbg !50
  %17 = load i32, ptr %high, align 4, !dbg !50
  call void @quickSort(ptr %14, i32 %16, i32 %17), !dbg !50
  br label %if.end, !dbg !50

else:                                             ; preds = %entry
  br label %if.end, !dbg !50

if.end:                                           ; preds = %else, %then
  ret void, !dbg !50
}

define i32 @main() !dbg !51 {
entry:
  %single = alloca [1 x i32], align 4
    #dbg_declare(ptr %single, !54, !DIExpression(), !58)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !59, !DIExpression(), !60)
  %arr = alloca [6 x i32], align 4
    #dbg_declare(ptr %arr, !61, !DIExpression(), !65)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !66, !DIExpression(), !67)
  store i32 0, ptr %err, align 4, !dbg !67
  %0 = getelementptr i32, ptr %arr, i32 0, !dbg !68
  store i32 10, ptr %0, align 4, !dbg !68
  %1 = load i32, ptr %0, align 4, !dbg !68
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !69
  store i32 7, ptr %2, align 4, !dbg !69
  %3 = load i32, ptr %2, align 4, !dbg !69
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !70
  store i32 8, ptr %4, align 4, !dbg !70
  %5 = load i32, ptr %4, align 4, !dbg !70
  %6 = getelementptr i32, ptr %arr, i32 3, !dbg !71
  store i32 9, ptr %6, align 4, !dbg !71
  %7 = load i32, ptr %6, align 4, !dbg !71
  %8 = getelementptr i32, ptr %arr, i32 4, !dbg !72
  store i32 1, ptr %8, align 4, !dbg !72
  %9 = load i32, ptr %8, align 4, !dbg !72
  %10 = getelementptr i32, ptr %arr, i32 5, !dbg !73
  store i32 5, ptr %10, align 4, !dbg !73
  %11 = load i32, ptr %10, align 4, !dbg !73
  store i32 6, ptr %n, align 4, !dbg !60
  %12 = load i32, ptr %n, align 4, !dbg !74
  %13 = sub i32 %12, 1, !dbg !74
  call void @quickSort(ptr %arr, i32 0, i32 %13), !dbg !74
  %14 = getelementptr i32, ptr %arr, i32 0, !dbg !75
  %15 = load i32, ptr %14, align 4, !dbg !75
  %16 = icmp ne i32 %15, 1, !dbg !75
  br i1 %16, label %then, label %else, !dbg !75

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !76
  %17 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end, !dbg !76

else:                                             ; preds = %entry
  br label %if.end, !dbg !76

if.end:                                           ; preds = %else, %then
  %18 = getelementptr i32, ptr %arr, i32 1, !dbg !77
  %19 = load i32, ptr %18, align 4, !dbg !77
  %20 = icmp ne i32 %19, 5, !dbg !77
  br i1 %20, label %then1, label %else2, !dbg !77

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !78
  %21 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end3, !dbg !78

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !78

if.end3:                                          ; preds = %else2, %then1
  %22 = getelementptr i32, ptr %arr, i32 2, !dbg !79
  %23 = load i32, ptr %22, align 4, !dbg !79
  %24 = icmp ne i32 %23, 7, !dbg !79
  br i1 %24, label %then4, label %else5, !dbg !79

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !80
  %25 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end6, !dbg !80

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !80

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr i32, ptr %arr, i32 3, !dbg !81
  %27 = load i32, ptr %26, align 4, !dbg !81
  %28 = icmp ne i32 %27, 8, !dbg !81
  br i1 %28, label %then7, label %else8, !dbg !81

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !82
  %29 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end9, !dbg !82

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !82

if.end9:                                          ; preds = %else8, %then7
  %30 = getelementptr i32, ptr %arr, i32 4, !dbg !83
  %31 = load i32, ptr %30, align 4, !dbg !83
  %32 = icmp ne i32 %31, 9, !dbg !83
  br i1 %32, label %then10, label %else11, !dbg !83

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !84
  %33 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end12, !dbg !84

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !84

if.end12:                                         ; preds = %else11, %then10
  %34 = getelementptr i32, ptr %arr, i32 5, !dbg !85
  %35 = load i32, ptr %34, align 4, !dbg !85
  %36 = icmp ne i32 %35, 10, !dbg !85
  br i1 %36, label %then13, label %else14, !dbg !85

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !86
  %37 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end15, !dbg !86

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !86

if.end15:                                         ; preds = %else14, %then13
  %38 = getelementptr i32, ptr %single, i32 0, !dbg !87
  store i32 42, ptr %38, align 4, !dbg !87
  %39 = load i32, ptr %38, align 4, !dbg !87
  call void @quickSort(ptr %single, i32 0, i32 0), !dbg !88
  %40 = getelementptr i32, ptr %single, i32 0, !dbg !89
  %41 = load i32, ptr %40, align 4, !dbg !89
  %42 = icmp ne i32 %41, 42, !dbg !89
  br i1 %42, label %then16, label %else17, !dbg !89

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !90
  %43 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end18, !dbg !90

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !90

if.end18:                                         ; preds = %else17, %then16
  %44 = load i32, ptr %err, align 4, !dbg !91
  %45 = icmp eq i32 %44, 0, !dbg !91
  br i1 %45, label %then19, label %else20, !dbg !91

then19:                                           ; preds = %if.end18
  %46 = call i32 (ptr, ...) @printf(ptr @0), !dbg !92
  br label %if.end21, !dbg !92

else20:                                           ; preds = %if.end18
  %47 = call i32 (ptr, ...) @printf(ptr @1), !dbg !94
  br label %if.end21, !dbg !94

if.end21:                                         ; preds = %else20, %then19
  %48 = load i32, ptr %err, align 4, !dbg !96
  ret i32 %48, !dbg !96
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !8}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{}
!11 = !DILocalVariable(name: "t", scope: !4, file: !1, line: 7, type: !9)
!12 = !DILocation(line: 7, column: 3, scope: !4)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !4, file: !1, line: 6, type: !8)
!14 = !DILocation(line: 6, column: 6, scope: !4)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !1, line: 6, type: !8)
!16 = !DILocation(line: 8, column: 3, scope: !4)
!17 = !DILocation(line: 9, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 12, type: !19, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!19 = !DISubroutineType(types: !20)
!20 = !{!9, !8, !9, !9}
!21 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 15, type: !9)
!22 = !DILocation(line: 15, column: 8, scope: !18)
!23 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 14, type: !9)
!24 = !DILocation(line: 14, column: 3, scope: !18)
!25 = !DILocalVariable(name: "pivot", scope: !18, file: !1, line: 13, type: !9)
!26 = !DILocation(line: 13, column: 3, scope: !18)
!27 = !DILocalVariable(name: "high", arg: 3, scope: !18, file: !1, line: 12, type: !9)
!28 = !DILocation(line: 12, column: 5, scope: !18)
!29 = !DILocalVariable(name: "low", arg: 2, scope: !18, file: !1, line: 12, type: !9)
!30 = !DILocalVariable(name: "arr", arg: 1, scope: !18, file: !1, line: 12, type: !8)
!31 = !DILocation(line: 16, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !1, line: 15, column: 41)
!33 = !DILocation(line: 17, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !32, file: !1, line: 16, column: 26)
!35 = !DILocation(line: 18, column: 7, scope: !34)
!36 = !DILocation(line: 21, column: 3, scope: !18)
!37 = !DILocation(line: 22, column: 3, scope: !18)
!38 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 25, type: !39, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!39 = !DISubroutineType(types: !40)
!40 = !{!7, !8, !9, !9}
!41 = !DILocalVariable(name: "pi", scope: !42, file: !1, line: 27, type: !9)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 26, column: 19)
!43 = !DILocation(line: 27, column: 5, scope: !42)
!44 = !DILocalVariable(name: "high", arg: 3, scope: !38, file: !1, line: 25, type: !9)
!45 = !DILocation(line: 25, column: 6, scope: !38)
!46 = !DILocalVariable(name: "low", arg: 2, scope: !38, file: !1, line: 25, type: !9)
!47 = !DILocalVariable(name: "arr", arg: 1, scope: !38, file: !1, line: 25, type: !8)
!48 = !DILocation(line: 26, column: 3, scope: !38)
!49 = !DILocation(line: 28, column: 5, scope: !42)
!50 = !DILocation(line: 29, column: 5, scope: !42)
!51 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 33, type: !52, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !10)
!52 = !DISubroutineType(types: !53)
!53 = !{!9}
!54 = !DILocalVariable(name: "single", scope: !51, file: !1, line: 53, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, align: 32, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 1, lowerBound: 0)
!58 = !DILocation(line: 53, column: 3, scope: !51)
!59 = !DILocalVariable(name: "n", scope: !51, file: !1, line: 42, type: !9)
!60 = !DILocation(line: 42, column: 3, scope: !51)
!61 = !DILocalVariable(name: "arr", scope: !51, file: !1, line: 35, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 6, lowerBound: 0)
!65 = !DILocation(line: 35, column: 3, scope: !51)
!66 = !DILocalVariable(name: "err", scope: !51, file: !1, line: 34, type: !9)
!67 = !DILocation(line: 34, column: 3, scope: !51)
!68 = !DILocation(line: 36, column: 3, scope: !51)
!69 = !DILocation(line: 37, column: 3, scope: !51)
!70 = !DILocation(line: 38, column: 3, scope: !51)
!71 = !DILocation(line: 39, column: 3, scope: !51)
!72 = !DILocation(line: 40, column: 3, scope: !51)
!73 = !DILocation(line: 41, column: 3, scope: !51)
!74 = !DILocation(line: 44, column: 3, scope: !51)
!75 = !DILocation(line: 46, column: 3, scope: !51)
!76 = !DILocation(line: 46, column: 20, scope: !51)
!77 = !DILocation(line: 47, column: 3, scope: !51)
!78 = !DILocation(line: 47, column: 20, scope: !51)
!79 = !DILocation(line: 48, column: 3, scope: !51)
!80 = !DILocation(line: 48, column: 20, scope: !51)
!81 = !DILocation(line: 49, column: 3, scope: !51)
!82 = !DILocation(line: 49, column: 20, scope: !51)
!83 = !DILocation(line: 50, column: 3, scope: !51)
!84 = !DILocation(line: 50, column: 20, scope: !51)
!85 = !DILocation(line: 51, column: 3, scope: !51)
!86 = !DILocation(line: 51, column: 21, scope: !51)
!87 = !DILocation(line: 54, column: 3, scope: !51)
!88 = !DILocation(line: 55, column: 3, scope: !51)
!89 = !DILocation(line: 56, column: 3, scope: !51)
!90 = !DILocation(line: 56, column: 24, scope: !51)
!91 = !DILocation(line: 58, column: 3, scope: !51)
!92 = !DILocation(line: 59, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !51, file: !1, line: 58, column: 17)
!94 = !DILocation(line: 61, column: 5, scope: !95)
!95 = distinct !DILexicalBlock(scope: !51, file: !1, line: 60, column: 10)
!96 = !DILocation(line: 63, column: 3, scope: !51)
