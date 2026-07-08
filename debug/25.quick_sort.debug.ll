; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

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
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.update, %entry
  %.sink = phi i32 [ %29, %for.update ], [ %9, %entry ]
  store i32 %.sink, ptr %j, align 4, !dbg !31
  %10 = load i32, ptr %j, align 4, !dbg !22
  %11 = load i32, ptr %high, align 4, !dbg !22
  %12 = sub i32 %11, 1, !dbg !22
  %13 = icmp sle i32 %10, %12, !dbg !22
  %14 = load ptr, ptr %arr, align 8, !dbg !31
  br i1 %13, label %for.loop, label %for.end, !dbg !22

for.loop:                                         ; preds = %for.cond
  %15 = load i32, ptr %j, align 4, !dbg !32
  %16 = getelementptr i32, ptr %14, i32 %15, !dbg !32
  %17 = load i32, ptr %16, align 4, !dbg !32
  %18 = load i32, ptr %pivot, align 4, !dbg !32
  %19 = icmp sle i32 %17, %18, !dbg !32
  br i1 %19, label %then, label %for.update, !dbg !32

then:                                             ; preds = %for.loop
  %20 = load i32, ptr %i, align 4, !dbg !34
  %21 = add i32 %20, 1, !dbg !34
  store i32 %21, ptr %i, align 4, !dbg !34
  %22 = load ptr, ptr %arr, align 8, !dbg !36
  %23 = load i32, ptr %i, align 4, !dbg !36
  %24 = getelementptr i32, ptr %22, i32 %23, !dbg !36
  %25 = load ptr, ptr %arr, align 8, !dbg !36
  %26 = load i32, ptr %j, align 4, !dbg !36
  %27 = getelementptr i32, ptr %25, i32 %26, !dbg !36
  call void @swap(ptr %24, ptr %27), !dbg !36
  br label %for.update, !dbg !36

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, ptr %j, align 4, !dbg !36
  %29 = add i32 %28, 1, !dbg !36
  br label %for.cond, !dbg !36

for.end:                                          ; preds = %for.cond
  %30 = load i32, ptr %i, align 4, !dbg !37
  %31 = add i32 %30, 1, !dbg !37
  %32 = getelementptr i32, ptr %14, i32 %31, !dbg !37
  %33 = load ptr, ptr %arr, align 8, !dbg !37
  %34 = load i32, ptr %high, align 4, !dbg !37
  %35 = getelementptr i32, ptr %33, i32 %34, !dbg !37
  call void @swap(ptr %32, ptr %35), !dbg !37
  %36 = load i32, ptr %i, align 4, !dbg !38
  %37 = add i32 %36, 1, !dbg !38
  ret i32 %37, !dbg !38
}

define void @quickSort(ptr %0, i32 %1, i32 %2) !dbg !39 {
entry:
  %pi = alloca i32, align 4
    #dbg_declare(ptr %pi, !42, !DIExpression(), !44)
  %high = alloca i32, align 4
    #dbg_declare(ptr %high, !45, !DIExpression(), !46)
  %low = alloca i32, align 4
    #dbg_declare(ptr %low, !47, !DIExpression(), !46)
  %arr = alloca ptr, align 8
    #dbg_declare(ptr %arr, !48, !DIExpression(), !46)
  store ptr %0, ptr %arr, align 8, !dbg !46
  store i32 %1, ptr %low, align 4, !dbg !46
  store i32 %2, ptr %high, align 4, !dbg !46
  %3 = load i32, ptr %low, align 4, !dbg !49
  %4 = load i32, ptr %high, align 4, !dbg !49
  %5 = icmp slt i32 %3, %4, !dbg !49
  br i1 %5, label %then, label %if.end, !dbg !49

then:                                             ; preds = %entry
  %6 = load ptr, ptr %arr, align 8, !dbg !44
  %7 = load i32, ptr %low, align 4, !dbg !44
  %8 = load i32, ptr %high, align 4, !dbg !44
  %9 = call i32 @partition(ptr %6, i32 %7, i32 %8), !dbg !44
  store i32 %9, ptr %pi, align 4, !dbg !44
  %10 = load ptr, ptr %arr, align 8, !dbg !50
  %11 = load i32, ptr %low, align 4, !dbg !50
  %12 = load i32, ptr %pi, align 4, !dbg !50
  %13 = sub i32 %12, 1, !dbg !50
  call void @quickSort(ptr %10, i32 %11, i32 %13), !dbg !50
  %14 = load ptr, ptr %arr, align 8, !dbg !51
  %15 = load i32, ptr %pi, align 4, !dbg !51
  %16 = add i32 %15, 1, !dbg !51
  %17 = load i32, ptr %high, align 4, !dbg !51
  call void @quickSort(ptr %14, i32 %16, i32 %17), !dbg !51
  br label %if.end, !dbg !51

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !51
}

define i32 @main() !dbg !52 {
entry:
  %single = alloca [1 x i32], align 4
    #dbg_declare(ptr %single, !55, !DIExpression(), !59)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !60, !DIExpression(), !61)
  %arr = alloca [6 x i32], align 4
    #dbg_declare(ptr %arr, !62, !DIExpression(), !66)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !67, !DIExpression(), !68)
  store i32 0, ptr %err, align 4, !dbg !68
  %0 = bitcast ptr %arr to ptr, !dbg !69
  store i32 10, ptr %0, align 4, !dbg !69
  %1 = load i32, ptr %0, align 4, !dbg !69
  %2 = getelementptr i32, ptr %arr, i32 1, !dbg !70
  store i32 7, ptr %2, align 4, !dbg !70
  %3 = load i32, ptr %2, align 4, !dbg !70
  %4 = getelementptr i32, ptr %arr, i32 2, !dbg !71
  store i32 8, ptr %4, align 4, !dbg !71
  %5 = load i32, ptr %4, align 4, !dbg !71
  %6 = getelementptr i32, ptr %arr, i32 3, !dbg !72
  store i32 9, ptr %6, align 4, !dbg !72
  %7 = load i32, ptr %6, align 4, !dbg !72
  %8 = getelementptr i32, ptr %arr, i32 4, !dbg !73
  store i32 1, ptr %8, align 4, !dbg !73
  %9 = load i32, ptr %8, align 4, !dbg !73
  %10 = getelementptr i32, ptr %arr, i32 5, !dbg !74
  store i32 5, ptr %10, align 4, !dbg !74
  %11 = load i32, ptr %10, align 4, !dbg !74
  store i32 6, ptr %n, align 4, !dbg !61
  %12 = load i32, ptr %n, align 4, !dbg !75
  %13 = sub i32 %12, 1, !dbg !75
  call void @quickSort(ptr %arr, i32 0, i32 %13), !dbg !75
  %14 = bitcast ptr %arr to ptr, !dbg !76
  %15 = load i32, ptr %14, align 4, !dbg !76
  %16 = icmp ne i32 %15, 1, !dbg !76
  br i1 %16, label %then, label %if.end, !dbg !76

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !77
  %17 = load i32, ptr %err, align 4, !dbg !77
  br label %if.end, !dbg !77

if.end:                                           ; preds = %entry, %then
  %18 = getelementptr i32, ptr %arr, i32 1, !dbg !78
  %19 = load i32, ptr %18, align 4, !dbg !78
  %20 = icmp ne i32 %19, 5, !dbg !78
  br i1 %20, label %then1, label %if.end3, !dbg !78

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !79
  %21 = load i32, ptr %err, align 4, !dbg !79
  br label %if.end3, !dbg !79

if.end3:                                          ; preds = %if.end, %then1
  %22 = getelementptr i32, ptr %arr, i32 2, !dbg !80
  %23 = load i32, ptr %22, align 4, !dbg !80
  %24 = icmp ne i32 %23, 7, !dbg !80
  br i1 %24, label %then4, label %if.end6, !dbg !80

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !81
  %25 = load i32, ptr %err, align 4, !dbg !81
  br label %if.end6, !dbg !81

if.end6:                                          ; preds = %if.end3, %then4
  %26 = getelementptr i32, ptr %arr, i32 3, !dbg !82
  %27 = load i32, ptr %26, align 4, !dbg !82
  %28 = icmp ne i32 %27, 8, !dbg !82
  br i1 %28, label %then7, label %if.end9, !dbg !82

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !83
  %29 = load i32, ptr %err, align 4, !dbg !83
  br label %if.end9, !dbg !83

if.end9:                                          ; preds = %if.end6, %then7
  %30 = getelementptr i32, ptr %arr, i32 4, !dbg !84
  %31 = load i32, ptr %30, align 4, !dbg !84
  %32 = icmp ne i32 %31, 9, !dbg !84
  br i1 %32, label %then10, label %if.end12, !dbg !84

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !85
  %33 = load i32, ptr %err, align 4, !dbg !85
  br label %if.end12, !dbg !85

if.end12:                                         ; preds = %if.end9, %then10
  %34 = getelementptr i32, ptr %arr, i32 5, !dbg !86
  %35 = load i32, ptr %34, align 4, !dbg !86
  %36 = icmp ne i32 %35, 10, !dbg !86
  br i1 %36, label %then13, label %if.end15, !dbg !86

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4, !dbg !87
  %37 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end15, !dbg !87

if.end15:                                         ; preds = %if.end12, %then13
  %38 = bitcast ptr %single to ptr, !dbg !88
  store i32 42, ptr %38, align 4, !dbg !88
  %39 = load i32, ptr %38, align 4, !dbg !88
  call void @quickSort(ptr %single, i32 0, i32 0), !dbg !89
  %40 = bitcast ptr %single to ptr, !dbg !90
  %41 = load i32, ptr %40, align 4, !dbg !90
  %42 = icmp ne i32 %41, 42, !dbg !90
  br i1 %42, label %then16, label %if.end18, !dbg !90

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4, !dbg !91
  %43 = load i32, ptr %err, align 4, !dbg !91
  br label %if.end18, !dbg !91

if.end18:                                         ; preds = %if.end15, %then16
  %44 = load i32, ptr %err, align 4, !dbg !92
  %45 = icmp eq i32 %44, 0, !dbg !92
  %. = select i1 %45, ptr @0, ptr @1, !dbg !93
  %46 = call i32 (ptr, ...) @printf(ptr %.), !dbg !93
  %47 = load i32, ptr %err, align 4, !dbg !94
  ret i32 %47, !dbg !94
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
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
