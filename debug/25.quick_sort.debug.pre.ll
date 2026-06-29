; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @swap(ptr %0, ptr %1) !dbg !2 {
entry:
  %t = alloca i32, align 4
    #dbg_declare(ptr %t, !8, !DIExpression(), !9)
  %b = alloca ptr, align 8
    #dbg_declare(ptr %b, !10, !DIExpression(), !11)
  %a = alloca ptr, align 8
    #dbg_declare(ptr %a, !12, !DIExpression(), !11)
  store ptr %0, ptr %a, align 8, !dbg !11
  store ptr %1, ptr %b, align 8, !dbg !11
  %2 = load ptr, ptr %a, align 8, !dbg !9
  %3 = load i32, ptr %2, align 4, !dbg !9
  store i32 %3, ptr %t, align 4, !dbg !9
  %4 = load ptr, ptr %a, align 8, !dbg !13
  %5 = load ptr, ptr %b, align 8, !dbg !13
  %6 = load i32, ptr %5, align 4, !dbg !13
  store i32 %6, ptr %4, align 4, !dbg !13
  %7 = load i32, ptr %4, align 4, !dbg !13
  %8 = load ptr, ptr %b, align 8, !dbg !14
  %9 = load i32, ptr %t, align 4, !dbg !14
  store i32 %9, ptr %8, align 4, !dbg !14
  %10 = load i32, ptr %8, align 4, !dbg !14
  ret void, !dbg !14
}

define i32 @partition(ptr %0, i32 %1, i32 %2) !dbg !15 {
entry:
  %j = alloca i32, align 4
    #dbg_declare(ptr %j, !18, !DIExpression(), !19)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !20, !DIExpression(), !21)
  %pivot = alloca i32, align 4
    #dbg_declare(ptr %pivot, !22, !DIExpression(), !23)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !24, !DIExpression(), !25)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !26, !DIExpression(), !25)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !27, !DIExpression(), !25)
  store ptr %0, ptr %arr, align 8, !dbg !25
  store i32 %1, ptr %low, align 4, !dbg !25
  store i32 %2, ptr %high, align 4, !dbg !25
  %3 = load ptr, ptr %arr, align 8, !dbg !23
  %4 = load i32, ptr %high, align 4, !dbg !23
  %5 = getelementptr i32, ptr %3, i32 %4, !dbg !23
  %6 = load i32, ptr %5, align 4, !dbg !23
  store i32 %6, ptr %pivot, align 4, !dbg !23
  %7 = load i32, ptr %low, align 4, !dbg !21
  %8 = sub i32 %7, 1, !dbg !21
  store i32 %8, ptr %i, align 4, !dbg !21
  %9 = load i32, ptr %low, align 4, !dbg !19
  store i32 %9, ptr %j, align 4, !dbg !19
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, ptr %j, align 4, !dbg !19
  %11 = load i32, ptr %high, align 4, !dbg !19
  %12 = sub i32 %11, 1, !dbg !19
  %13 = icmp sle i32 %10, %12, !dbg !19
  br i1 %13, label %for.loop, label %for.end, !dbg !19

for.loop:                                         ; preds = %for.cond
  %14 = load ptr, ptr %arr, align 8, !dbg !28
  %15 = load i32, ptr %j, align 4, !dbg !28
  %16 = getelementptr i32, ptr %14, i32 %15, !dbg !28
  %17 = load i32, ptr %16, align 4, !dbg !28
  %18 = load i32, ptr %pivot, align 4, !dbg !28
  %19 = icmp sle i32 %17, %18, !dbg !28
  br i1 %19, label %then, label %else, !dbg !28

then:                                             ; preds = %for.loop
  %20 = load i32, ptr %i, align 4, !dbg !30
  %21 = add i32 %20, 1, !dbg !30
  store i32 %21, ptr %i, align 4, !dbg !30
  %22 = load ptr, ptr %arr, align 8, !dbg !32
  %23 = load i32, ptr %i, align 4, !dbg !32
  %24 = getelementptr i32, ptr %22, i32 %23, !dbg !32
  %25 = load ptr, ptr %arr, align 8, !dbg !32
  %26 = load i32, ptr %j, align 4, !dbg !32
  %27 = getelementptr i32, ptr %25, i32 %26, !dbg !32
  call void @swap(ptr %24, ptr %27), !dbg !32
  br label %if.end, !dbg !32

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !32

if.end:                                           ; preds = %else, %then
  br label %for.update, !dbg !32

for.update:                                       ; preds = %if.end
  %28 = load i32, ptr %j, align 4, !dbg !32
  %29 = add i32 %28, 1, !dbg !32
  store i32 %29, ptr %j, align 4, !dbg !32
  br label %for.cond, !dbg !32

for.end:                                          ; preds = %for.cond
  %30 = load ptr, ptr %arr, align 8, !dbg !33
  %31 = load i32, ptr %i, align 4, !dbg !33
  %32 = add i32 %31, 1, !dbg !33
  %33 = getelementptr i32, ptr %30, i32 %32, !dbg !33
  %34 = load ptr, ptr %arr, align 8, !dbg !33
  %35 = load i32, ptr %high, align 4, !dbg !33
  %36 = getelementptr i32, ptr %34, i32 %35, !dbg !33
  call void @swap(ptr %33, ptr %36), !dbg !33
  %37 = load i32, ptr %i, align 4, !dbg !34
  %38 = add i32 %37, 1, !dbg !34
  ret i32 %38, !dbg !34
}

define void @quickSort(ptr %0, i32 %1, i32 %2) !dbg !35 {
entry:
  %pi = alloca i32, align 4
    #dbg_declare(ptr %pi, !38, !DIExpression(), !40)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !41, !DIExpression(), !42)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !43, !DIExpression(), !42)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !44, !DIExpression(), !42)
  store ptr %0, ptr %arr, align 8, !dbg !42
  store i32 %1, ptr %low, align 4, !dbg !42
  store i32 %2, ptr %high, align 4, !dbg !42
  %3 = load i32, ptr %low, align 4, !dbg !45
  %4 = load i32, ptr %high, align 4, !dbg !45
  %5 = icmp slt i32 %3, %4, !dbg !45
  br i1 %5, label %then, label %else, !dbg !45

then:                                             ; preds = %entry
  %6 = load ptr, ptr %arr, align 8, !dbg !40
  %7 = load i32, ptr %low, align 4, !dbg !40
  %8 = load i32, ptr %high, align 4, !dbg !40
  %9 = call i32 @partition(ptr %6, i32 %7, i32 %8), !dbg !40
  store i32 %9, ptr %pi, align 4, !dbg !40
  %10 = load ptr, ptr %arr, align 8, !dbg !46
  %11 = load i32, ptr %low, align 4, !dbg !46
  %12 = load i32, ptr %pi, align 4, !dbg !46
  %13 = sub i32 %12, 1, !dbg !46
  call void @quickSort(ptr %10, i32 %11, i32 %13), !dbg !46
  %14 = load ptr, ptr %arr, align 8, !dbg !47
  %15 = load i32, ptr %pi, align 4, !dbg !47
  %16 = add i32 %15, 1, !dbg !47
  %17 = load i32, ptr %high, align 4, !dbg !47
  call void @quickSort(ptr %14, i32 %16, i32 %17), !dbg !47
  br label %if.end, !dbg !47

else:                                             ; preds = %entry
  br label %if.end, !dbg !47

if.end:                                           ; preds = %else, %then
  ret void, !dbg !47
}

define i32 @main() !dbg !48 {
entry:
  %single = alloca [1 x i32], align 4
    #dbg_declare(ptr %single, !51, !DIExpression(), !55)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !56, !DIExpression(), !57)
  %arr = alloca [6 x i32], align 4
    #dbg_declare(ptr %arr, !58, !DIExpression(), !62)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !63, !DIExpression(), !64)
  store i32 0, ptr %err, align 4, !dbg !64
  %0 = getelementptr i32, ptr %arr, i32 0, !dbg !65
  store i32 10, ptr %0, align 4, !dbg !65
  %1 = load i32, ptr %0, align 4, !dbg !65
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !66
  store i32 7, ptr %2, align 4, !dbg !66
  %3 = load i32, ptr %2, align 4, !dbg !66
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !67
  store i32 8, ptr %4, align 4, !dbg !67
  %5 = load i32, ptr %4, align 4, !dbg !67
  %6 = getelementptr i32, ptr %arr, i32 3, !dbg !68
  store i32 9, ptr %6, align 4, !dbg !68
  %7 = load i32, ptr %6, align 4, !dbg !68
  %8 = getelementptr i32, ptr %arr, i32 4, !dbg !69
  store i32 1, ptr %8, align 4, !dbg !69
  %9 = load i32, ptr %8, align 4, !dbg !69
  %10 = getelementptr i32, ptr %arr, i32 5, !dbg !70
  store i32 5, ptr %10, align 4, !dbg !70
  %11 = load i32, ptr %10, align 4, !dbg !70
  store i32 6, ptr %n, align 4, !dbg !57
  %12 = load i32, ptr %n, align 4, !dbg !71
  %13 = sub i32 %12, 1, !dbg !71
  call void @quickSort(ptr %arr, i32 0, i32 %13), !dbg !71
  %14 = getelementptr i32, ptr %arr, i32 0, !dbg !72
  %15 = load i32, ptr %14, align 4, !dbg !72
  %16 = icmp ne i32 %15, 1, !dbg !72
  br i1 %16, label %then, label %else, !dbg !72

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !73
  %17 = load i32, ptr %err, align 4, !dbg !73
  br label %if.end, !dbg !73

else:                                             ; preds = %entry
  br label %if.end, !dbg !73

if.end:                                           ; preds = %else, %then
  %18 = getelementptr i32, ptr %arr, i32 1, !dbg !74
  %19 = load i32, ptr %18, align 4, !dbg !74
  %20 = icmp ne i32 %19, 5, !dbg !74
  br i1 %20, label %then1, label %else2, !dbg !74

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !75
  %21 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end3, !dbg !75

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !75

if.end3:                                          ; preds = %else2, %then1
  %22 = getelementptr i32, ptr %arr, i32 2, !dbg !76
  %23 = load i32, ptr %22, align 4, !dbg !76
  %24 = icmp ne i32 %23, 7, !dbg !76
  br i1 %24, label %then4, label %else5, !dbg !76

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !77
  %25 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end6, !dbg !77

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !77

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr i32, ptr %arr, i32 3, !dbg !78
  %27 = load i32, ptr %26, align 4, !dbg !78
  %28 = icmp ne i32 %27, 8, !dbg !78
  br i1 %28, label %then7, label %else8, !dbg !78

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !79
  %29 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end9, !dbg !79

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !79

if.end9:                                          ; preds = %else8, %then7
  %30 = getelementptr i32, ptr %arr, i32 4, !dbg !80
  %31 = load i32, ptr %30, align 4, !dbg !80
  %32 = icmp ne i32 %31, 9, !dbg !80
  br i1 %32, label %then10, label %else11, !dbg !80

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !81
  %33 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end12, !dbg !81

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !81

if.end12:                                         ; preds = %else11, %then10
  %34 = getelementptr i32, ptr %arr, i32 5, !dbg !82
  %35 = load i32, ptr %34, align 4, !dbg !82
  %36 = icmp ne i32 %35, 10, !dbg !82
  br i1 %36, label %then13, label %else14, !dbg !82

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !83
  %37 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end15, !dbg !83

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !83

if.end15:                                         ; preds = %else14, %then13
  %38 = getelementptr i32, ptr %single, i32 0, !dbg !84
  store i32 42, ptr %38, align 4, !dbg !84
  %39 = load i32, ptr %38, align 4, !dbg !84
  call void @quickSort(ptr %single, i32 0, i32 0), !dbg !85
  %40 = getelementptr i32, ptr %single, i32 0, !dbg !86
  %41 = load i32, ptr %40, align 4, !dbg !86
  %42 = icmp ne i32 %41, 42, !dbg !86
  br i1 %42, label %then16, label %else17, !dbg !86

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !87
  %43 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end18, !dbg !87

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !87

if.end18:                                         ; preds = %else17, %then16
  %44 = load i32, ptr %err, align 4, !dbg !88
  %45 = icmp eq i32 %44, 0, !dbg !88
  br i1 %45, label %then19, label %else20, !dbg !88

then19:                                           ; preds = %if.end18
  %46 = call i32 (ptr, ...) @printf(ptr @0), !dbg !89
  br label %if.end21, !dbg !89

else20:                                           ; preds = %if.end18
  %47 = call i32 (ptr, ...) @printf(ptr @1), !dbg !91
  br label %if.end21, !dbg !91

if.end21:                                         ; preds = %else20, %then19
  %48 = load i32, ptr %err, align 4, !dbg !93
  ret i32 %48, !dbg !93
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "t", scope: !2, file: !1, line: 4, type: !7)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !1, line: 3, type: !6)
!11 = !DILocation(line: 3, column: 6, scope: !2)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!13 = !DILocation(line: 5, column: 3, scope: !2)
!14 = !DILocation(line: 6, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 9, type: !16, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DISubroutineType(types: !17)
!17 = !{!7, !6, !7, !7}
!18 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 12, type: !7)
!19 = !DILocation(line: 12, column: 8, scope: !15)
!20 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 11, type: !7)
!21 = !DILocation(line: 11, column: 3, scope: !15)
!22 = !DILocalVariable(name: "pivot", scope: !15, file: !1, line: 10, type: !7)
!23 = !DILocation(line: 10, column: 3, scope: !15)
!24 = !DILocalVariable(name: "high", arg: 3, scope: !15, file: !1, line: 9, type: !7)
!25 = !DILocation(line: 9, column: 5, scope: !15)
!26 = !DILocalVariable(name: "low", arg: 2, scope: !15, file: !1, line: 9, type: !7)
!27 = !DILocalVariable(name: "arr", arg: 1, scope: !15, file: !1, line: 9, type: !6)
!28 = !DILocation(line: 13, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !15, file: !1, line: 12, column: 41)
!30 = !DILocation(line: 14, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !29, file: !1, line: 13, column: 26)
!32 = !DILocation(line: 15, column: 7, scope: !31)
!33 = !DILocation(line: 18, column: 3, scope: !15)
!34 = !DILocation(line: 19, column: 3, scope: !15)
!35 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 22, type: !36, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0)
!36 = !DISubroutineType(types: !37)
!37 = !{!5, !6, !7, !7}
!38 = !DILocalVariable(name: "pi", scope: !39, file: !1, line: 24, type: !7)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 23, column: 19)
!40 = !DILocation(line: 24, column: 5, scope: !39)
!41 = !DILocalVariable(name: "high", arg: 3, scope: !35, file: !1, line: 22, type: !7)
!42 = !DILocation(line: 22, column: 6, scope: !35)
!43 = !DILocalVariable(name: "low", arg: 2, scope: !35, file: !1, line: 22, type: !7)
!44 = !DILocalVariable(name: "arr", arg: 1, scope: !35, file: !1, line: 22, type: !6)
!45 = !DILocation(line: 23, column: 3, scope: !35)
!46 = !DILocation(line: 25, column: 5, scope: !39)
!47 = !DILocation(line: 26, column: 5, scope: !39)
!48 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !49, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0)
!49 = !DISubroutineType(types: !50)
!50 = !{!7}
!51 = !DILocalVariable(name: "single", scope: !48, file: !1, line: 50, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32, align: 32, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 1, lowerBound: 0)
!55 = !DILocation(line: 50, column: 3, scope: !48)
!56 = !DILocalVariable(name: "n", scope: !48, file: !1, line: 39, type: !7)
!57 = !DILocation(line: 39, column: 3, scope: !48)
!58 = !DILocalVariable(name: "arr", scope: !48, file: !1, line: 32, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, align: 32, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 6, lowerBound: 0)
!62 = !DILocation(line: 32, column: 3, scope: !48)
!63 = !DILocalVariable(name: "err", scope: !48, file: !1, line: 31, type: !7)
!64 = !DILocation(line: 31, column: 3, scope: !48)
!65 = !DILocation(line: 33, column: 3, scope: !48)
!66 = !DILocation(line: 34, column: 3, scope: !48)
!67 = !DILocation(line: 35, column: 3, scope: !48)
!68 = !DILocation(line: 36, column: 3, scope: !48)
!69 = !DILocation(line: 37, column: 3, scope: !48)
!70 = !DILocation(line: 38, column: 3, scope: !48)
!71 = !DILocation(line: 41, column: 3, scope: !48)
!72 = !DILocation(line: 43, column: 3, scope: !48)
!73 = !DILocation(line: 43, column: 20, scope: !48)
!74 = !DILocation(line: 44, column: 3, scope: !48)
!75 = !DILocation(line: 44, column: 20, scope: !48)
!76 = !DILocation(line: 45, column: 3, scope: !48)
!77 = !DILocation(line: 45, column: 20, scope: !48)
!78 = !DILocation(line: 46, column: 3, scope: !48)
!79 = !DILocation(line: 46, column: 20, scope: !48)
!80 = !DILocation(line: 47, column: 3, scope: !48)
!81 = !DILocation(line: 47, column: 20, scope: !48)
!82 = !DILocation(line: 48, column: 3, scope: !48)
!83 = !DILocation(line: 48, column: 21, scope: !48)
!84 = !DILocation(line: 51, column: 3, scope: !48)
!85 = !DILocation(line: 52, column: 3, scope: !48)
!86 = !DILocation(line: 53, column: 3, scope: !48)
!87 = !DILocation(line: 53, column: 24, scope: !48)
!88 = !DILocation(line: 55, column: 3, scope: !48)
!89 = !DILocation(line: 56, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !48, file: !1, line: 55, column: 17)
!91 = !DILocation(line: 58, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !48, file: !1, line: 57, column: 10)
!93 = !DILocation(line: 60, column: 3, scope: !48)
