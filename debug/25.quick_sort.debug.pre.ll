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
    #dbg_declare(ptr %t, !10, !DIExpression(), !11)
  %b = alloca ptr, align 8
    #dbg_declare(ptr %b, !12, !DIExpression(), !13)
  %a = alloca ptr, align 8
    #dbg_declare(ptr %a, !14, !DIExpression(), !13)
  store ptr %0, ptr %a, align 8, !dbg !13
  store ptr %1, ptr %b, align 8, !dbg !13
  %2 = load ptr, ptr %a, align 8, !dbg !11
  %3 = load i32, ptr %2, align 4, !dbg !11
  store i32 %3, ptr %t, align 4, !dbg !11
  %4 = load ptr, ptr %a, align 8, !dbg !15
  %5 = load ptr, ptr %b, align 8, !dbg !15
  %6 = load i32, ptr %5, align 4, !dbg !15
  store i32 %6, ptr %4, align 4, !dbg !15
  %7 = load i32, ptr %4, align 4, !dbg !15
  %8 = load ptr, ptr %b, align 8, !dbg !16
  %9 = load i32, ptr %t, align 4, !dbg !16
  store i32 %9, ptr %8, align 4, !dbg !16
  %10 = load i32, ptr %8, align 4, !dbg !16
  ret void, !dbg !16
}

define i32 @partition(ptr %0, i32 %1, i32 %2) !dbg !17 {
entry:
  %j = alloca i32, align 4
    #dbg_declare(ptr %j, !20, !DIExpression(), !21)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !22, !DIExpression(), !23)
  %pivot = alloca i32, align 4
    #dbg_declare(ptr %pivot, !24, !DIExpression(), !25)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !26, !DIExpression(), !27)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !28, !DIExpression(), !27)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !29, !DIExpression(), !27)
  store ptr %0, ptr %arr, align 8, !dbg !27
  store i32 %1, ptr %low, align 4, !dbg !27
  store i32 %2, ptr %high, align 4, !dbg !27
  %3 = load ptr, ptr %arr, align 8, !dbg !25
  %4 = load i32, ptr %high, align 4, !dbg !25
  %5 = getelementptr i32, ptr %3, i32 %4, !dbg !25
  %6 = load i32, ptr %5, align 4, !dbg !25
  store i32 %6, ptr %pivot, align 4, !dbg !25
  %7 = load i32, ptr %low, align 4, !dbg !23
  %8 = sub i32 %7, 1, !dbg !23
  store i32 %8, ptr %i, align 4, !dbg !23
  %9 = load i32, ptr %low, align 4, !dbg !21
  store i32 %9, ptr %j, align 4, !dbg !21
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, ptr %j, align 4, !dbg !21
  %11 = load i32, ptr %high, align 4, !dbg !21
  %12 = sub i32 %11, 1, !dbg !21
  %13 = icmp sle i32 %10, %12, !dbg !21
  br i1 %13, label %for.loop, label %for.end, !dbg !21

for.loop:                                         ; preds = %for.cond
  %14 = load ptr, ptr %arr, align 8, !dbg !30
  %15 = load i32, ptr %j, align 4, !dbg !30
  %16 = getelementptr i32, ptr %14, i32 %15, !dbg !30
  %17 = load i32, ptr %16, align 4, !dbg !30
  %18 = load i32, ptr %pivot, align 4, !dbg !30
  %19 = icmp sle i32 %17, %18, !dbg !30
  br i1 %19, label %then, label %else, !dbg !30

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
  br label %if.end, !dbg !34

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !34

if.end:                                           ; preds = %else, %then
  br label %for.update, !dbg !34

for.update:                                       ; preds = %if.end
  %28 = load i32, ptr %j, align 4, !dbg !34
  %29 = add i32 %28, 1, !dbg !34
  store i32 %29, ptr %j, align 4, !dbg !34
  br label %for.cond, !dbg !34

for.end:                                          ; preds = %for.cond
  %30 = load ptr, ptr %arr, align 8, !dbg !35
  %31 = load i32, ptr %i, align 4, !dbg !35
  %32 = add i32 %31, 1, !dbg !35
  %33 = getelementptr i32, ptr %30, i32 %32, !dbg !35
  %34 = load ptr, ptr %arr, align 8, !dbg !35
  %35 = load i32, ptr %high, align 4, !dbg !35
  %36 = getelementptr i32, ptr %34, i32 %35, !dbg !35
  call void @swap(ptr %33, ptr %36), !dbg !35
  %37 = load i32, ptr %i, align 4, !dbg !36
  %38 = add i32 %37, 1, !dbg !36
  ret i32 %38, !dbg !36
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
  br i1 %5, label %then, label %else, !dbg !47

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

else:                                             ; preds = %entry
  br label %if.end, !dbg !49

if.end:                                           ; preds = %else, %then
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
  %0 = getelementptr i32, ptr %arr, i32 0, !dbg !67
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
  store i32 6, ptr %n, align 4, !dbg !59
  %12 = load i32, ptr %n, align 4, !dbg !73
  %13 = sub i32 %12, 1, !dbg !73
  call void @quickSort(ptr %arr, i32 0, i32 %13), !dbg !73
  %14 = getelementptr i32, ptr %arr, i32 0, !dbg !74
  %15 = load i32, ptr %14, align 4, !dbg !74
  %16 = icmp ne i32 %15, 1, !dbg !74
  br i1 %16, label %then, label %else, !dbg !74

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !75
  %17 = load i32, ptr %err, align 4, !dbg !75
  br label %if.end, !dbg !75

else:                                             ; preds = %entry
  br label %if.end, !dbg !75

if.end:                                           ; preds = %else, %then
  %18 = getelementptr i32, ptr %arr, i32 1, !dbg !76
  %19 = load i32, ptr %18, align 4, !dbg !76
  %20 = icmp ne i32 %19, 5, !dbg !76
  br i1 %20, label %then1, label %else2, !dbg !76

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !77
  %21 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end3, !dbg !77

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !77

if.end3:                                          ; preds = %else2, %then1
  %22 = getelementptr i32, ptr %arr, i32 2, !dbg !78
  %23 = load i32, ptr %22, align 4, !dbg !78
  %24 = icmp ne i32 %23, 7, !dbg !78
  br i1 %24, label %then4, label %else5, !dbg !78

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !79
  %25 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end6, !dbg !79

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !79

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr i32, ptr %arr, i32 3, !dbg !80
  %27 = load i32, ptr %26, align 4, !dbg !80
  %28 = icmp ne i32 %27, 8, !dbg !80
  br i1 %28, label %then7, label %else8, !dbg !80

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !81
  %29 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end9, !dbg !81

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !81

if.end9:                                          ; preds = %else8, %then7
  %30 = getelementptr i32, ptr %arr, i32 4, !dbg !82
  %31 = load i32, ptr %30, align 4, !dbg !82
  %32 = icmp ne i32 %31, 9, !dbg !82
  br i1 %32, label %then10, label %else11, !dbg !82

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !83
  %33 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end12, !dbg !83

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !83

if.end12:                                         ; preds = %else11, %then10
  %34 = getelementptr i32, ptr %arr, i32 5, !dbg !84
  %35 = load i32, ptr %34, align 4, !dbg !84
  %36 = icmp ne i32 %35, 10, !dbg !84
  br i1 %36, label %then13, label %else14, !dbg !84

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !85
  %37 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end15, !dbg !85

else14:                                           ; preds = %if.end12
  br label %if.end15, !dbg !85

if.end15:                                         ; preds = %else14, %then13
  %38 = getelementptr i32, ptr %single, i32 0, !dbg !86
  store i32 42, ptr %38, align 4, !dbg !86
  %39 = load i32, ptr %38, align 4, !dbg !86
  call void @quickSort(ptr %single, i32 0, i32 0), !dbg !87
  %40 = getelementptr i32, ptr %single, i32 0, !dbg !88
  %41 = load i32, ptr %40, align 4, !dbg !88
  %42 = icmp ne i32 %41, 42, !dbg !88
  br i1 %42, label %then16, label %else17, !dbg !88

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !89
  %43 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end18, !dbg !89

else17:                                           ; preds = %if.end15
  br label %if.end18, !dbg !89

if.end18:                                         ; preds = %else17, %then16
  %44 = load i32, ptr %err, align 4, !dbg !90
  %45 = icmp eq i32 %44, 0, !dbg !90
  br i1 %45, label %then19, label %else20, !dbg !90

then19:                                           ; preds = %if.end18
  %46 = call i32 (ptr, ...) @printf(ptr @0), !dbg !91
  br label %if.end21, !dbg !91

else20:                                           ; preds = %if.end18
  %47 = call i32 (ptr, ...) @printf(ptr @1), !dbg !93
  br label %if.end21, !dbg !93

if.end21:                                         ; preds = %else20, %then19
  %48 = load i32, ptr %err, align 4, !dbg !95
  ret i32 %48, !dbg !95
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8, !8}
!7 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "t", scope: !4, file: !3, line: 7, type: !9)
!11 = !DILocation(line: 7, column: 3, scope: !4)
!12 = !DILocalVariable(name: "b", arg: 2, scope: !4, file: !3, line: 6, type: !8)
!13 = !DILocation(line: 6, column: 6, scope: !4)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !3, line: 6, type: !8)
!15 = !DILocation(line: 8, column: 3, scope: !4)
!16 = !DILocation(line: 9, column: 3, scope: !4)
!17 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !3, line: 12, type: !18, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!9, !8, !9, !9}
!20 = !DILocalVariable(name: "j", scope: !17, file: !3, line: 15, type: !9)
!21 = !DILocation(line: 15, column: 8, scope: !17)
!22 = !DILocalVariable(name: "i", scope: !17, file: !3, line: 14, type: !9)
!23 = !DILocation(line: 14, column: 3, scope: !17)
!24 = !DILocalVariable(name: "pivot", scope: !17, file: !3, line: 13, type: !9)
!25 = !DILocation(line: 13, column: 3, scope: !17)
!26 = !DILocalVariable(name: "high", arg: 3, scope: !17, file: !3, line: 12, type: !9)
!27 = !DILocation(line: 12, column: 5, scope: !17)
!28 = !DILocalVariable(name: "low", arg: 2, scope: !17, file: !3, line: 12, type: !9)
!29 = !DILocalVariable(name: "arr", arg: 1, scope: !17, file: !3, line: 12, type: !8)
!30 = !DILocation(line: 16, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !17, file: !3, line: 15, column: 41)
!32 = !DILocation(line: 17, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !31, file: !3, line: 16, column: 26)
!34 = !DILocation(line: 18, column: 7, scope: !33)
!35 = !DILocation(line: 21, column: 3, scope: !17)
!36 = !DILocation(line: 22, column: 3, scope: !17)
!37 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !3, line: 25, type: !38, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!7, !8, !9, !9}
!40 = !DILocalVariable(name: "pi", scope: !41, file: !3, line: 27, type: !9)
!41 = distinct !DILexicalBlock(scope: !37, file: !3, line: 26, column: 19)
!42 = !DILocation(line: 27, column: 5, scope: !41)
!43 = !DILocalVariable(name: "high", arg: 3, scope: !37, file: !3, line: 25, type: !9)
!44 = !DILocation(line: 25, column: 6, scope: !37)
!45 = !DILocalVariable(name: "low", arg: 2, scope: !37, file: !3, line: 25, type: !9)
!46 = !DILocalVariable(name: "arr", arg: 1, scope: !37, file: !3, line: 25, type: !8)
!47 = !DILocation(line: 26, column: 3, scope: !37)
!48 = !DILocation(line: 28, column: 5, scope: !41)
!49 = !DILocation(line: 29, column: 5, scope: !41)
!50 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 33, type: !51, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!9}
!53 = !DILocalVariable(name: "single", scope: !50, file: !3, line: 53, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, align: 32, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 1, lowerBound: 0)
!57 = !DILocation(line: 53, column: 3, scope: !50)
!58 = !DILocalVariable(name: "n", scope: !50, file: !3, line: 42, type: !9)
!59 = !DILocation(line: 42, column: 3, scope: !50)
!60 = !DILocalVariable(name: "arr", scope: !50, file: !3, line: 35, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 6, lowerBound: 0)
!64 = !DILocation(line: 35, column: 3, scope: !50)
!65 = !DILocalVariable(name: "err", scope: !50, file: !3, line: 34, type: !9)
!66 = !DILocation(line: 34, column: 3, scope: !50)
!67 = !DILocation(line: 36, column: 3, scope: !50)
!68 = !DILocation(line: 37, column: 3, scope: !50)
!69 = !DILocation(line: 38, column: 3, scope: !50)
!70 = !DILocation(line: 39, column: 3, scope: !50)
!71 = !DILocation(line: 40, column: 3, scope: !50)
!72 = !DILocation(line: 41, column: 3, scope: !50)
!73 = !DILocation(line: 44, column: 3, scope: !50)
!74 = !DILocation(line: 46, column: 3, scope: !50)
!75 = !DILocation(line: 46, column: 20, scope: !50)
!76 = !DILocation(line: 47, column: 3, scope: !50)
!77 = !DILocation(line: 47, column: 20, scope: !50)
!78 = !DILocation(line: 48, column: 3, scope: !50)
!79 = !DILocation(line: 48, column: 20, scope: !50)
!80 = !DILocation(line: 49, column: 3, scope: !50)
!81 = !DILocation(line: 49, column: 20, scope: !50)
!82 = !DILocation(line: 50, column: 3, scope: !50)
!83 = !DILocation(line: 50, column: 20, scope: !50)
!84 = !DILocation(line: 51, column: 3, scope: !50)
!85 = !DILocation(line: 51, column: 21, scope: !50)
!86 = !DILocation(line: 54, column: 3, scope: !50)
!87 = !DILocation(line: 55, column: 3, scope: !50)
!88 = !DILocation(line: 56, column: 3, scope: !50)
!89 = !DILocation(line: 56, column: 24, scope: !50)
!90 = !DILocation(line: 58, column: 3, scope: !50)
!91 = !DILocation(line: 59, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !50, file: !3, line: 58, column: 17)
!93 = !DILocation(line: 61, column: 5, scope: !94)
!94 = distinct !DILexicalBlock(scope: !50, file: !3, line: 60, column: 10)
!95 = !DILocation(line: 63, column: 3, scope: !50)
