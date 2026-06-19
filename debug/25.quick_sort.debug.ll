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
  %b = alloca i32*, align 8
  %a = alloca i32*, align 8
  store i32* %0, i32** %a, align 8
  store i32* %1, i32** %b, align 8
  %2 = load i32*, i32** %a, align 8, !dbg !9
  %3 = load i32, i32* %2, align 4, !dbg !9
  store i32 %3, i32* %t, align 4, !dbg !9
  %4 = load i32*, i32** %a, align 8, !dbg !10
  %5 = load i32*, i32** %b, align 8, !dbg !10
  %6 = load i32, i32* %5, align 4, !dbg !10
  store i32 %6, i32* %4, align 4, !dbg !10
  %7 = load i32, i32* %4, align 4, !dbg !10
  %8 = load i32*, i32** %b, align 8, !dbg !11
  %9 = load i32, i32* %t, align 4, !dbg !11
  store i32 %9, i32* %8, align 4, !dbg !11
  %10 = load i32, i32* %8, align 4, !dbg !11
  ret void, !dbg !11
}

define i32 @partition(i32* %0, i32 %1, i32 %2) !dbg !12 {
entry:
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pivot = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8, !dbg !11
  store i32 %1, i32* %low, align 4, !dbg !11
  store i32 %2, i32* %high, align 4, !dbg !11
  %3 = load i32*, i32** %arr, align 8, !dbg !15
  %4 = load i32, i32* %high, align 4, !dbg !15
  %5 = getelementptr i32, i32* %3, i32 %4, !dbg !15
  %6 = load i32, i32* %5, align 4, !dbg !15
  store i32 %6, i32* %pivot, align 4, !dbg !15
  %7 = load i32, i32* %low, align 4, !dbg !16
  %8 = sub i32 %7, 1, !dbg !16
  store i32 %8, i32* %i, align 4, !dbg !16
  %9 = load i32, i32* %low, align 4, !dbg !17
  store i32 %9, i32* %j, align 4, !dbg !17
  br label %for.cond, !dbg !17

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, i32* %j, align 4, !dbg !17
  %11 = load i32, i32* %high, align 4, !dbg !17
  %12 = sub i32 %11, 1, !dbg !17
  %13 = icmp sle i32 %10, %12, !dbg !17
  %14 = load i32*, i32** %arr, align 8, !dbg !18
  br i1 %13, label %for.loop, label %for.end, !dbg !17

for.loop:                                         ; preds = %for.cond
  %15 = load i32, i32* %j, align 4, !dbg !19
  %16 = getelementptr i32, i32* %14, i32 %15, !dbg !19
  %17 = load i32, i32* %16, align 4, !dbg !19
  %18 = load i32, i32* %pivot, align 4, !dbg !19
  %19 = icmp sle i32 %17, %18, !dbg !19
  br i1 %19, label %then, label %for.update, !dbg !19

then:                                             ; preds = %for.loop
  %20 = load i32, i32* %i, align 4, !dbg !20
  %21 = add i32 %20, 1, !dbg !20
  store i32 %21, i32* %i, align 4, !dbg !20
  %22 = load i32*, i32** %arr, align 8, !dbg !21
  %23 = load i32, i32* %i, align 4, !dbg !21
  %24 = getelementptr i32, i32* %22, i32 %23, !dbg !21
  %25 = load i32*, i32** %arr, align 8, !dbg !21
  %26 = load i32, i32* %j, align 4, !dbg !21
  %27 = getelementptr i32, i32* %25, i32 %26, !dbg !21
  call void @swap(i32* %24, i32* %27), !dbg !21
  br label %for.update, !dbg !21

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, i32* %j, align 4, !dbg !21
  %29 = add i32 %28, 1, !dbg !21
  store i32 %29, i32* %j, align 4, !dbg !21
  br label %for.cond, !dbg !21

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* %i, align 4, !dbg !22
  %31 = add i32 %30, 1, !dbg !22
  %32 = getelementptr i32, i32* %14, i32 %31, !dbg !22
  %33 = load i32*, i32** %arr, align 8, !dbg !22
  %34 = load i32, i32* %high, align 4, !dbg !22
  %35 = getelementptr i32, i32* %33, i32 %34, !dbg !22
  call void @swap(i32* %32, i32* %35), !dbg !22
  %36 = load i32, i32* %i, align 4, !dbg !23
  %37 = add i32 %36, 1, !dbg !23
  ret i32 %37, !dbg !23
}

define void @quickSort(i32* %0, i32 %1, i32 %2) !dbg !24 {
entry:
  %pi = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8, !dbg !23
  store i32 %1, i32* %low, align 4, !dbg !23
  store i32 %2, i32* %high, align 4, !dbg !23
  %3 = load i32, i32* %low, align 4, !dbg !27
  %4 = load i32, i32* %high, align 4, !dbg !27
  %5 = icmp slt i32 %3, %4, !dbg !27
  br i1 %5, label %then, label %if.end, !dbg !27

then:                                             ; preds = %entry
  %6 = load i32*, i32** %arr, align 8, !dbg !28
  %7 = load i32, i32* %low, align 4, !dbg !28
  %8 = load i32, i32* %high, align 4, !dbg !28
  %9 = call i32 @partition(i32* %6, i32 %7, i32 %8), !dbg !28
  store i32 %9, i32* %pi, align 4, !dbg !28
  %10 = load i32*, i32** %arr, align 8, !dbg !29
  %11 = load i32, i32* %low, align 4, !dbg !29
  %12 = load i32, i32* %pi, align 4, !dbg !29
  %13 = sub i32 %12, 1, !dbg !29
  call void @quickSort(i32* %10, i32 %11, i32 %13), !dbg !29
  %14 = load i32*, i32** %arr, align 8, !dbg !30
  %15 = load i32, i32* %pi, align 4, !dbg !30
  %16 = add i32 %15, 1, !dbg !30
  %17 = load i32, i32* %high, align 4, !dbg !30
  call void @quickSort(i32* %14, i32 %16, i32 %17), !dbg !30
  br label %if.end, !dbg !30

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !30
}

define i32 @main() !dbg !31 {
entry:
  %single = alloca [1 x i32], align 4
  %n = alloca i32, align 4
  %arr = alloca [6 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !34
  %0 = bitcast [6 x i32]* %arr to i32*, !dbg !35
  %1 = bitcast i32* %0 to i32*, !dbg !35
  store i32 10, i32* %1, align 4, !dbg !35
  %2 = load i32, i32* %1, align 4, !dbg !35
  %3 = bitcast [6 x i32]* %arr to i32*, !dbg !36
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !36
  store i32 7, i32* %4, align 4, !dbg !36
  %5 = load i32, i32* %4, align 4, !dbg !36
  %6 = bitcast [6 x i32]* %arr to i32*, !dbg !37
  %7 = getelementptr i32, i32* %6, i32 2, !dbg !37
  store i32 8, i32* %7, align 4, !dbg !37
  %8 = load i32, i32* %7, align 4, !dbg !37
  %9 = bitcast [6 x i32]* %arr to i32*, !dbg !38
  %10 = getelementptr i32, i32* %9, i32 3, !dbg !38
  store i32 9, i32* %10, align 4, !dbg !38
  %11 = load i32, i32* %10, align 4, !dbg !38
  %12 = bitcast [6 x i32]* %arr to i32*, !dbg !39
  %13 = getelementptr i32, i32* %12, i32 4, !dbg !39
  store i32 1, i32* %13, align 4, !dbg !39
  %14 = load i32, i32* %13, align 4, !dbg !39
  %15 = bitcast [6 x i32]* %arr to i32*, !dbg !40
  %16 = getelementptr i32, i32* %15, i32 5, !dbg !40
  store i32 5, i32* %16, align 4, !dbg !40
  %17 = load i32, i32* %16, align 4, !dbg !40
  %18 = bitcast [6 x i32]* %arr to i32*, !dbg !41
  %19 = bitcast i32* %18 to i32*, !dbg !41
  %20 = load i32, i32* %19, align 4, !dbg !41
  store i32 6, i32* %n, align 4, !dbg !41
  %21 = bitcast [6 x i32]* %arr to i32*, !dbg !42
  %22 = load i32, i32* %n, align 4, !dbg !42
  %23 = sub i32 %22, 1, !dbg !42
  call void @quickSort(i32* %21, i32 0, i32 %23), !dbg !42
  %24 = bitcast [6 x i32]* %arr to i32*, !dbg !43
  %25 = bitcast i32* %24 to i32*, !dbg !43
  %26 = load i32, i32* %25, align 4, !dbg !43
  %27 = icmp ne i32 %26, 1, !dbg !43
  br i1 %27, label %then, label %if.end, !dbg !43

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !44
  %28 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end, !dbg !44

if.end:                                           ; preds = %entry, %then
  %29 = bitcast [6 x i32]* %arr to i32*, !dbg !45
  %30 = getelementptr i32, i32* %29, i32 1, !dbg !45
  %31 = load i32, i32* %30, align 4, !dbg !45
  %32 = icmp ne i32 %31, 5, !dbg !45
  br i1 %32, label %then1, label %if.end3, !dbg !45

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !46
  %33 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end3, !dbg !46

if.end3:                                          ; preds = %if.end, %then1
  %34 = bitcast [6 x i32]* %arr to i32*, !dbg !47
  %35 = getelementptr i32, i32* %34, i32 2, !dbg !47
  %36 = load i32, i32* %35, align 4, !dbg !47
  %37 = icmp ne i32 %36, 7, !dbg !47
  br i1 %37, label %then4, label %if.end6, !dbg !47

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !48
  %38 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end6, !dbg !48

if.end6:                                          ; preds = %if.end3, %then4
  %39 = bitcast [6 x i32]* %arr to i32*, !dbg !49
  %40 = getelementptr i32, i32* %39, i32 3, !dbg !49
  %41 = load i32, i32* %40, align 4, !dbg !49
  %42 = icmp ne i32 %41, 8, !dbg !49
  br i1 %42, label %then7, label %if.end9, !dbg !49

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !50
  %43 = load i32, i32* %err, align 4, !dbg !50
  br label %if.end9, !dbg !50

if.end9:                                          ; preds = %if.end6, %then7
  %44 = bitcast [6 x i32]* %arr to i32*, !dbg !51
  %45 = getelementptr i32, i32* %44, i32 4, !dbg !51
  %46 = load i32, i32* %45, align 4, !dbg !51
  %47 = icmp ne i32 %46, 9, !dbg !51
  br i1 %47, label %then10, label %if.end12, !dbg !51

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !52
  %48 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end12, !dbg !52

if.end12:                                         ; preds = %if.end9, %then10
  %49 = bitcast [6 x i32]* %arr to i32*, !dbg !53
  %50 = getelementptr i32, i32* %49, i32 5, !dbg !53
  %51 = load i32, i32* %50, align 4, !dbg !53
  %52 = icmp ne i32 %51, 10, !dbg !53
  br i1 %52, label %then13, label %if.end15, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !54
  %53 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %if.end12, %then13
  %54 = bitcast [1 x i32]* %single to i32*, !dbg !55
  %55 = bitcast i32* %54 to i32*, !dbg !55
  store i32 42, i32* %55, align 4, !dbg !55
  %56 = load i32, i32* %55, align 4, !dbg !55
  %57 = bitcast [1 x i32]* %single to i32*, !dbg !56
  call void @quickSort(i32* %57, i32 0, i32 0), !dbg !56
  %58 = bitcast [1 x i32]* %single to i32*, !dbg !57
  %59 = bitcast i32* %58 to i32*, !dbg !57
  %60 = load i32, i32* %59, align 4, !dbg !57
  %61 = icmp ne i32 %60, 42, !dbg !57
  br i1 %61, label %then16, label %if.end18, !dbg !57

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !58
  %62 = load i32, i32* %err, align 4, !dbg !58
  br label %if.end18, !dbg !58

if.end18:                                         ; preds = %if.end15, %then16
  %63 = load i32, i32* %err, align 4, !dbg !59
  %64 = icmp eq i32 %63, 0, !dbg !59
  %. = select i1 %64, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !60
  %65 = call i32 (i8*, ...) @printf(i8* %.), !dbg !60
  %66 = load i32, i32* %err, align 4, !dbg !61
  ret i32 %66, !dbg !61
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
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocation(line: 5, column: 3, scope: !2)
!11 = !DILocation(line: 6, column: 3, scope: !2)
!12 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 9, type: !13, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!13 = !DISubroutineType(types: !14)
!14 = !{!7, !6, !7, !7}
!15 = !DILocation(line: 10, column: 3, scope: !12)
!16 = !DILocation(line: 11, column: 3, scope: !12)
!17 = !DILocation(line: 12, column: 8, scope: !12)
!18 = !DILocation(line: 0, scope: !12)
!19 = !DILocation(line: 13, column: 5, scope: !12)
!20 = !DILocation(line: 14, column: 7, scope: !12)
!21 = !DILocation(line: 15, column: 7, scope: !12)
!22 = !DILocation(line: 18, column: 3, scope: !12)
!23 = !DILocation(line: 19, column: 3, scope: !12)
!24 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 22, type: !25, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!25 = !DISubroutineType(types: !26)
!26 = !{!5, !6, !7, !7}
!27 = !DILocation(line: 23, column: 3, scope: !24)
!28 = !DILocation(line: 24, column: 5, scope: !24)
!29 = !DILocation(line: 25, column: 5, scope: !24)
!30 = !DILocation(line: 26, column: 5, scope: !24)
!31 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 30, type: !32, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!32 = !DISubroutineType(types: !33)
!33 = !{!7}
!34 = !DILocation(line: 31, column: 3, scope: !31)
!35 = !DILocation(line: 33, column: 3, scope: !31)
!36 = !DILocation(line: 34, column: 3, scope: !31)
!37 = !DILocation(line: 35, column: 3, scope: !31)
!38 = !DILocation(line: 36, column: 3, scope: !31)
!39 = !DILocation(line: 37, column: 3, scope: !31)
!40 = !DILocation(line: 38, column: 3, scope: !31)
!41 = !DILocation(line: 39, column: 3, scope: !31)
!42 = !DILocation(line: 41, column: 3, scope: !31)
!43 = !DILocation(line: 43, column: 3, scope: !31)
!44 = !DILocation(line: 43, column: 20, scope: !31)
!45 = !DILocation(line: 44, column: 3, scope: !31)
!46 = !DILocation(line: 44, column: 20, scope: !31)
!47 = !DILocation(line: 45, column: 3, scope: !31)
!48 = !DILocation(line: 45, column: 20, scope: !31)
!49 = !DILocation(line: 46, column: 3, scope: !31)
!50 = !DILocation(line: 46, column: 20, scope: !31)
!51 = !DILocation(line: 47, column: 3, scope: !31)
!52 = !DILocation(line: 47, column: 20, scope: !31)
!53 = !DILocation(line: 48, column: 3, scope: !31)
!54 = !DILocation(line: 48, column: 21, scope: !31)
!55 = !DILocation(line: 51, column: 3, scope: !31)
!56 = !DILocation(line: 52, column: 3, scope: !31)
!57 = !DILocation(line: 53, column: 3, scope: !31)
!58 = !DILocation(line: 53, column: 24, scope: !31)
!59 = !DILocation(line: 55, column: 3, scope: !31)
!60 = !DILocation(line: 0, scope: !31)
!61 = !DILocation(line: 60, column: 3, scope: !31)
!dbg attachment points at wrong subprogram for function
!12 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 9, type: !13, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
i32 (i32*, i32, i32)* @partition
  store i32* %0, i32** %arr, align 8, !dbg !11
!11 = !DILocation(line: 6, column: 3, scope: !2)
!2 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!2 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
