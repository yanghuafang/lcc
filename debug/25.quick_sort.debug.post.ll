; ModuleID = 'lcc'
source_filename = "lcc"

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
  store i32 %9, ptr %j, align 4, !dbg !20
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, ptr %j, align 4, !dbg !20
  %11 = load i32, ptr %high, align 4, !dbg !20
  %12 = sub i32 %11, 1, !dbg !20
  %13 = icmp sle i32 %10, %12, !dbg !20
  br i1 %13, label %for.loop, label %for.end, !dbg !20

for.loop:                                         ; preds = %for.cond
  %14 = load ptr, ptr %arr, align 8, !dbg !29
  %15 = load i32, ptr %j, align 4, !dbg !29
  %16 = getelementptr i32, ptr %14, i32 %15, !dbg !29
  %17 = load i32, ptr %16, align 4, !dbg !29
  %18 = load i32, ptr %pivot, align 4, !dbg !29
  %19 = icmp sle i32 %17, %18, !dbg !29
  br i1 %19, label %then, label %else, !dbg !29

then:                                             ; preds = %for.loop
  %20 = load i32, ptr %i, align 4, !dbg !31
  %21 = add i32 %20, 1, !dbg !31
  store i32 %21, ptr %i, align 4, !dbg !31
  %22 = load ptr, ptr %arr, align 8, !dbg !33
  %23 = load i32, ptr %i, align 4, !dbg !33
  %24 = getelementptr i32, ptr %22, i32 %23, !dbg !33
  %25 = load ptr, ptr %arr, align 8, !dbg !33
  %26 = load i32, ptr %j, align 4, !dbg !33
  %27 = getelementptr i32, ptr %25, i32 %26, !dbg !33
  call void @swap(ptr %24, ptr %27), !dbg !33
  br label %if.end, !dbg !33

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !33

if.end:                                           ; preds = %else, %then
  br label %for.update, !dbg !33

for.update:                                       ; preds = %if.end
  %28 = load i32, ptr %j, align 4, !dbg !33
  %29 = add i32 %28, 1, !dbg !33
  store i32 %29, ptr %j, align 4, !dbg !33
  br label %for.cond, !dbg !33

for.end:                                          ; preds = %for.cond
  %30 = load ptr, ptr %arr, align 8, !dbg !34
  %31 = load i32, ptr %i, align 4, !dbg !34
  %32 = add i32 %31, 1, !dbg !34
  %33 = getelementptr i32, ptr %30, i32 %32, !dbg !34
  %34 = load ptr, ptr %arr, align 8, !dbg !34
  %35 = load i32, ptr %high, align 4, !dbg !34
  %36 = getelementptr i32, ptr %34, i32 %35, !dbg !34
  call void @swap(ptr %33, ptr %36), !dbg !34
  %37 = load i32, ptr %i, align 4, !dbg !35
  %38 = add i32 %37, 1, !dbg !35
  ret i32 %38, !dbg !35
}

define void @quickSort(ptr %0, i32 %1, i32 %2) !dbg !36 {
entry:
  %pi = alloca i32, align 4
    #dbg_declare(ptr %pi, !39, !DIExpression(), !41)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !42, !DIExpression(), !43)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !44, !DIExpression(), !43)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !45, !DIExpression(), !43)
  store ptr %0, ptr %arr, align 8, !dbg !43
  store i32 %1, ptr %low, align 4, !dbg !43
  store i32 %2, ptr %high, align 4, !dbg !43
  %3 = load i32, ptr %low, align 4, !dbg !46
  %4 = load i32, ptr %high, align 4, !dbg !46
  %5 = icmp slt i32 %3, %4, !dbg !46
  br i1 %5, label %then, label %else, !dbg !46

then:                                             ; preds = %entry
  %6 = load ptr, ptr %arr, align 8, !dbg !41
  %7 = load i32, ptr %low, align 4, !dbg !41
  %8 = load i32, ptr %high, align 4, !dbg !41
  %9 = call i32 @partition(ptr %6, i32 %7, i32 %8), !dbg !41
  store i32 %9, ptr %pi, align 4, !dbg !41
  %10 = load ptr, ptr %arr, align 8, !dbg !47
  %11 = load i32, ptr %low, align 4, !dbg !47
  %12 = load i32, ptr %pi, align 4, !dbg !47
  %13 = sub i32 %12, 1, !dbg !47
  call void @quickSort(ptr %10, i32 %11, i32 %13), !dbg !47
  %14 = load ptr, ptr %arr, align 8, !dbg !48
  %15 = load i32, ptr %pi, align 4, !dbg !48
  %16 = add i32 %15, 1, !dbg !48
  %17 = load i32, ptr %high, align 4, !dbg !48
  call void @quickSort(ptr %14, i32 %16, i32 %17), !dbg !48
  br label %if.end, !dbg !48

else:                                             ; preds = %entry
  br label %if.end, !dbg !48

if.end:                                           ; preds = %else, %then
  ret void, !dbg !48
}

define i32 @main() !dbg !49 {
entry:
  %single = alloca [1 x i32], align 4
    #dbg_declare(ptr %single, !52, !DIExpression(), !56)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !57, !DIExpression(), !58)
  %arr = alloca [6 x i32], align 4
    #dbg_declare(ptr %arr, !59, !DIExpression(), !63)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !64, !DIExpression(), !65)
  store i32 0, ptr %err, align 4, !dbg !65
  %0 = getelementptr i32, ptr %arr, i32 0, !dbg !66
  store i32 10, ptr %0, align 4, !dbg !66
  %1 = load i32, ptr %0, align 4, !dbg !66
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !67
  store i32 7, ptr %2, align 4, !dbg !67
  %3 = load i32, ptr %2, align 4, !dbg !67
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !68
  store i32 8, ptr %4, align 4, !dbg !68
  %5 = load i32, ptr %4, align 4, !dbg !68
  %6 = getelementptr i32, ptr %arr, i32 3, !dbg !69
  store i32 9, ptr %6, align 4, !dbg !69
  %7 = load i32, ptr %6, align 4, !dbg !69
  %8 = getelementptr i32, ptr %arr, i32 4, !dbg !70
  store i32 1, ptr %8, align 4, !dbg !70
  %9 = load i32, ptr %8, align 4, !dbg !70
  %10 = getelementptr i32, ptr %arr, i32 5, !dbg !71
  store i32 5, ptr %10, align 4, !dbg !71
  %11 = load i32, ptr %10, align 4, !dbg !71
  store i32 6, ptr %n, align 4, !dbg !58
  %12 = load i32, ptr %n, align 4, !dbg !72
  %13 = sub i32 %12, 1, !dbg !72
  call void @quickSort(ptr %arr, i32 0, i32 %13), !dbg !72
  %14 = getelementptr i32, ptr %arr, i32 0, !dbg !73
  %15 = load i32, ptr %14, align 4, !dbg !73
  %16 = icmp ne i32 %15, 1, !dbg !73
  br i1 %16, label %then, label %else, !dbg !73

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !74
  %17 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end, !dbg !74

else:                                             ; preds = %entry
  br label %if.end, !dbg !74

if.end:                                           ; preds = %else, %then
  %18 = getelementptr i32, ptr %arr, i32 1, !dbg !75
  %19 = load i32, ptr %18, align 4, !dbg !75
  %20 = icmp ne i32 %19, 5, !dbg !75
  br i1 %20, label %then1, label %else2, !dbg !75

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !76
  %21 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end3, !dbg !76

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !76

if.end3:                                          ; preds = %else2, %then1
  %22 = getelementptr i32, ptr %arr, i32 2, !dbg !77
  %23 = load i32, ptr %22, align 4, !dbg !77
  %24 = icmp ne i32 %23, 7, !dbg !77
  br i1 %24, label %then4, label %else5, !dbg !77

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !78
  %25 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end6, !dbg !78

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !78

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr i32, ptr %arr, i32 3, !dbg !79
  %27 = load i32, ptr %26, align 4, !dbg !79
  %28 = icmp ne i32 %27, 8, !dbg !79
  br i1 %28, label %then7, label %else8, !dbg !79

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !80
  %29 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end9, !dbg !80

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !80

if.end9:                                          ; preds = %else8, %then7
  %30 = getelementptr i32, ptr %arr, i32 4, !dbg !81
  %31 = load i32, ptr %30, align 4, !dbg !81
  %32 = icmp ne i32 %31, 9, !dbg !81
  br i1 %32, label %then10, label %else11, !dbg !81

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !82
  %33 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end12, !dbg !82

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !82

if.end12:                                         ; preds = %else11, %then10
  %34 = getelementptr i32, ptr %arr, i32 5, !dbg !83
  %35 = load i32, ptr %34, align 4, !dbg !83
  %36 = icmp ne i32 %35, 10, !dbg !83
  br i1 %36, label %then13, label %else14, !dbg !83

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !84
  %37 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end15, !dbg !84

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !84

if.end15:                                         ; preds = %else14, %then13
  %38 = getelementptr i32, ptr %single, i32 0, !dbg !85
  store i32 42, ptr %38, align 4, !dbg !85
  %39 = load i32, ptr %38, align 4, !dbg !85
  call void @quickSort(ptr %single, i32 0, i32 0), !dbg !86
  %40 = getelementptr i32, ptr %single, i32 0, !dbg !87
  %41 = load i32, ptr %40, align 4, !dbg !87
  %42 = icmp ne i32 %41, 42, !dbg !87
  br i1 %42, label %then16, label %else17, !dbg !87

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !88
  %43 = load i32, ptr %err, align 4, !dbg !88
  br label %if.end18, !dbg !88

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !88

if.end18:                                         ; preds = %else17, %then16
  %44 = load i32, ptr %err, align 4, !dbg !89
  %45 = icmp eq i32 %44, 0, !dbg !89
  br i1 %45, label %then19, label %else20, !dbg !89

then19:                                           ; preds = %if.end18
  %46 = call i32 (ptr, ...) @printf(ptr @0), !dbg !90
  br label %if.end21, !dbg !90

else20:                                           ; preds = %if.end18
  %47 = call i32 (ptr, ...) @printf(ptr @1), !dbg !92
  br label %if.end21, !dbg !92

if.end21:                                         ; preds = %else20, %then19
  %48 = load i32, ptr %err, align 4, !dbg !94
  ret i32 %48, !dbg !94
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
!29 = !DILocation(line: 13, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !1, line: 12, column: 41)
!31 = !DILocation(line: 14, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !30, file: !1, line: 13, column: 26)
!33 = !DILocation(line: 15, column: 7, scope: !32)
!34 = !DILocation(line: 18, column: 3, scope: !16)
!35 = !DILocation(line: 19, column: 3, scope: !16)
!36 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 22, type: !37, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!37 = !DISubroutineType(types: !38)
!38 = !{!5, !6, !7, !7}
!39 = !DILocalVariable(name: "pi", scope: !40, file: !1, line: 24, type: !7)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 23, column: 19)
!41 = !DILocation(line: 24, column: 5, scope: !40)
!42 = !DILocalVariable(name: "high", arg: 3, scope: !36, file: !1, line: 22, type: !7)
!43 = !DILocation(line: 22, column: 6, scope: !36)
!44 = !DILocalVariable(name: "low", arg: 2, scope: !36, file: !1, line: 22, type: !7)
!45 = !DILocalVariable(name: "arr", arg: 1, scope: !36, file: !1, line: 22, type: !6)
!46 = !DILocation(line: 23, column: 3, scope: !36)
!47 = !DILocation(line: 25, column: 5, scope: !40)
!48 = !DILocation(line: 26, column: 5, scope: !40)
!49 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !50, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!50 = !DISubroutineType(types: !51)
!51 = !{!7}
!52 = !DILocalVariable(name: "single", scope: !49, file: !1, line: 50, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32, align: 32, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 1, lowerBound: 0)
!56 = !DILocation(line: 50, column: 3, scope: !49)
!57 = !DILocalVariable(name: "n", scope: !49, file: !1, line: 39, type: !7)
!58 = !DILocation(line: 39, column: 3, scope: !49)
!59 = !DILocalVariable(name: "arr", scope: !49, file: !1, line: 32, type: !60)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, align: 32, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 6, lowerBound: 0)
!63 = !DILocation(line: 32, column: 3, scope: !49)
!64 = !DILocalVariable(name: "err", scope: !49, file: !1, line: 31, type: !7)
!65 = !DILocation(line: 31, column: 3, scope: !49)
!66 = !DILocation(line: 33, column: 3, scope: !49)
!67 = !DILocation(line: 34, column: 3, scope: !49)
!68 = !DILocation(line: 35, column: 3, scope: !49)
!69 = !DILocation(line: 36, column: 3, scope: !49)
!70 = !DILocation(line: 37, column: 3, scope: !49)
!71 = !DILocation(line: 38, column: 3, scope: !49)
!72 = !DILocation(line: 41, column: 3, scope: !49)
!73 = !DILocation(line: 43, column: 3, scope: !49)
!74 = !DILocation(line: 43, column: 20, scope: !49)
!75 = !DILocation(line: 44, column: 3, scope: !49)
!76 = !DILocation(line: 44, column: 20, scope: !49)
!77 = !DILocation(line: 45, column: 3, scope: !49)
!78 = !DILocation(line: 45, column: 20, scope: !49)
!79 = !DILocation(line: 46, column: 3, scope: !49)
!80 = !DILocation(line: 46, column: 20, scope: !49)
!81 = !DILocation(line: 47, column: 3, scope: !49)
!82 = !DILocation(line: 47, column: 20, scope: !49)
!83 = !DILocation(line: 48, column: 3, scope: !49)
!84 = !DILocation(line: 48, column: 21, scope: !49)
!85 = !DILocation(line: 51, column: 3, scope: !49)
!86 = !DILocation(line: 52, column: 3, scope: !49)
!87 = !DILocation(line: 53, column: 3, scope: !49)
!88 = !DILocation(line: 53, column: 24, scope: !49)
!89 = !DILocation(line: 55, column: 3, scope: !49)
!90 = !DILocation(line: 56, column: 5, scope: !91)
!91 = distinct !DILexicalBlock(scope: !49, file: !1, line: 55, column: 17)
!92 = !DILocation(line: 58, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !49, file: !1, line: 57, column: 10)
!94 = !DILocation(line: 60, column: 3, scope: !49)
