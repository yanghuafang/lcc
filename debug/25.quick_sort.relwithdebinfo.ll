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
  store i32* %0, i32** %a, align 8, !dbg !9
  store i32* %1, i32** %b, align 8, !dbg !9
  %2 = load i32*, i32** %a, align 8, !dbg !9
  %3 = load i32, i32* %2, align 4, !dbg !9
  store i32 %3, i32* %t, align 4, !dbg !9
  %4 = load i32*, i32** %a, align 8, !dbg !9
  %5 = load i32*, i32** %b, align 8, !dbg !9
  %6 = load i32, i32* %5, align 4, !dbg !9
  store i32 %6, i32* %4, align 4, !dbg !9
  %7 = load i32, i32* %4, align 4, !dbg !9
  %8 = load i32*, i32** %b, align 8, !dbg !9
  %9 = load i32, i32* %t, align 4, !dbg !9
  store i32 %9, i32* %8, align 4, !dbg !9
  %10 = load i32, i32* %8, align 4, !dbg !9
  ret void, !dbg !9
}

define i32 @partition(i32* %0, i32 %1, i32 %2) !dbg !10 {
entry:
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pivot = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8, !dbg !13
  store i32 %1, i32* %low, align 4, !dbg !13
  store i32 %2, i32* %high, align 4, !dbg !13
  %3 = load i32*, i32** %arr, align 8, !dbg !13
  %4 = load i32, i32* %high, align 4, !dbg !13
  %5 = getelementptr i32, i32* %3, i32 %4, !dbg !13
  %6 = load i32, i32* %5, align 4, !dbg !13
  store i32 %6, i32* %pivot, align 4, !dbg !13
  %7 = load i32, i32* %low, align 4, !dbg !13
  %8 = sub i32 %7, 1, !dbg !13
  store i32 %8, i32* %i, align 4, !dbg !13
  %9 = load i32, i32* %low, align 4, !dbg !13
  store i32 %9, i32* %j, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, i32* %j, align 4, !dbg !13
  %11 = load i32, i32* %high, align 4, !dbg !13
  %12 = sub i32 %11, 1, !dbg !13
  %13 = icmp sle i32 %10, %12, !dbg !13
  %14 = load i32*, i32** %arr, align 8, !dbg !13
  br i1 %13, label %for.loop, label %for.end, !dbg !13

for.loop:                                         ; preds = %for.cond
  %15 = load i32, i32* %j, align 4, !dbg !13
  %16 = getelementptr i32, i32* %14, i32 %15, !dbg !13
  %17 = load i32, i32* %16, align 4, !dbg !13
  %18 = load i32, i32* %pivot, align 4, !dbg !13
  %19 = icmp sle i32 %17, %18, !dbg !13
  br i1 %19, label %then, label %for.update, !dbg !13

then:                                             ; preds = %for.loop
  %20 = load i32, i32* %i, align 4, !dbg !13
  %21 = add i32 %20, 1, !dbg !13
  store i32 %21, i32* %i, align 4, !dbg !13
  %22 = load i32*, i32** %arr, align 8, !dbg !13
  %23 = load i32, i32* %i, align 4, !dbg !13
  %24 = getelementptr i32, i32* %22, i32 %23, !dbg !13
  %25 = load i32*, i32** %arr, align 8, !dbg !13
  %26 = load i32, i32* %j, align 4, !dbg !13
  %27 = getelementptr i32, i32* %25, i32 %26, !dbg !13
  call void @swap(i32* %24, i32* %27), !dbg !13
  br label %for.update, !dbg !13

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, i32* %j, align 4, !dbg !13
  %29 = add i32 %28, 1, !dbg !13
  store i32 %29, i32* %j, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* %i, align 4, !dbg !13
  %31 = add i32 %30, 1, !dbg !13
  %32 = getelementptr i32, i32* %14, i32 %31, !dbg !13
  %33 = load i32*, i32** %arr, align 8, !dbg !13
  %34 = load i32, i32* %high, align 4, !dbg !13
  %35 = getelementptr i32, i32* %33, i32 %34, !dbg !13
  call void @swap(i32* %32, i32* %35), !dbg !13
  %36 = load i32, i32* %i, align 4, !dbg !13
  %37 = add i32 %36, 1, !dbg !13
  ret i32 %37, !dbg !13
}

define void @quickSort(i32* %0, i32 %1, i32 %2) !dbg !14 {
entry:
  %pi = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8, !dbg !17
  store i32 %1, i32* %low, align 4, !dbg !17
  store i32 %2, i32* %high, align 4, !dbg !17
  %3 = load i32, i32* %low, align 4, !dbg !17
  %4 = load i32, i32* %high, align 4, !dbg !17
  %5 = icmp slt i32 %3, %4, !dbg !17
  br i1 %5, label %then, label %if.end, !dbg !17

then:                                             ; preds = %entry
  %6 = load i32*, i32** %arr, align 8, !dbg !17
  %7 = load i32, i32* %low, align 4, !dbg !17
  %8 = load i32, i32* %high, align 4, !dbg !17
  %9 = call i32 @partition(i32* %6, i32 %7, i32 %8), !dbg !17
  store i32 %9, i32* %pi, align 4, !dbg !17
  %10 = load i32*, i32** %arr, align 8, !dbg !17
  %11 = load i32, i32* %low, align 4, !dbg !17
  %12 = load i32, i32* %pi, align 4, !dbg !17
  %13 = sub i32 %12, 1, !dbg !17
  call void @quickSort(i32* %10, i32 %11, i32 %13), !dbg !17
  %14 = load i32*, i32** %arr, align 8, !dbg !17
  %15 = load i32, i32* %pi, align 4, !dbg !17
  %16 = add i32 %15, 1, !dbg !17
  %17 = load i32, i32* %high, align 4, !dbg !17
  call void @quickSort(i32* %14, i32 %16, i32 %17), !dbg !17
  br label %if.end, !dbg !17

if.end:                                           ; preds = %entry, %then
  ret void, !dbg !17
}

define i32 @main() !dbg !18 {
entry:
  %single = alloca [1 x i32], align 4
  %n = alloca i32, align 4
  %arr = alloca [6 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !21
  %0 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %1 = bitcast i32* %0 to i32*, !dbg !21
  store i32 10, i32* %1, align 4, !dbg !21
  %2 = load i32, i32* %1, align 4, !dbg !21
  %3 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %4 = getelementptr i32, i32* %3, i32 1, !dbg !21
  store i32 7, i32* %4, align 4, !dbg !21
  %5 = load i32, i32* %4, align 4, !dbg !21
  %6 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %7 = getelementptr i32, i32* %6, i32 2, !dbg !21
  store i32 8, i32* %7, align 4, !dbg !21
  %8 = load i32, i32* %7, align 4, !dbg !21
  %9 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %10 = getelementptr i32, i32* %9, i32 3, !dbg !21
  store i32 9, i32* %10, align 4, !dbg !21
  %11 = load i32, i32* %10, align 4, !dbg !21
  %12 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %13 = getelementptr i32, i32* %12, i32 4, !dbg !21
  store i32 1, i32* %13, align 4, !dbg !21
  %14 = load i32, i32* %13, align 4, !dbg !21
  %15 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %16 = getelementptr i32, i32* %15, i32 5, !dbg !21
  store i32 5, i32* %16, align 4, !dbg !21
  %17 = load i32, i32* %16, align 4, !dbg !21
  %18 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %19 = bitcast i32* %18 to i32*, !dbg !21
  %20 = load i32, i32* %19, align 4, !dbg !21
  store i32 6, i32* %n, align 4, !dbg !21
  %21 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %22 = load i32, i32* %n, align 4, !dbg !21
  %23 = sub i32 %22, 1, !dbg !21
  call void @quickSort(i32* %21, i32 0, i32 %23), !dbg !21
  %24 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %25 = bitcast i32* %24 to i32*, !dbg !21
  %26 = load i32, i32* %25, align 4, !dbg !21
  %27 = icmp ne i32 %26, 1, !dbg !21
  br i1 %27, label %then, label %if.end, !dbg !21

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !21
  %28 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end, !dbg !21

if.end:                                           ; preds = %entry, %then
  %29 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %30 = getelementptr i32, i32* %29, i32 1, !dbg !21
  %31 = load i32, i32* %30, align 4, !dbg !21
  %32 = icmp ne i32 %31, 5, !dbg !21
  br i1 %32, label %then1, label %if.end3, !dbg !21

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !21
  %33 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end3, !dbg !21

if.end3:                                          ; preds = %if.end, %then1
  %34 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %35 = getelementptr i32, i32* %34, i32 2, !dbg !21
  %36 = load i32, i32* %35, align 4, !dbg !21
  %37 = icmp ne i32 %36, 7, !dbg !21
  br i1 %37, label %then4, label %if.end6, !dbg !21

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !21
  %38 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end6, !dbg !21

if.end6:                                          ; preds = %if.end3, %then4
  %39 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %40 = getelementptr i32, i32* %39, i32 3, !dbg !21
  %41 = load i32, i32* %40, align 4, !dbg !21
  %42 = icmp ne i32 %41, 8, !dbg !21
  br i1 %42, label %then7, label %if.end9, !dbg !21

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !21
  %43 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end9, !dbg !21

if.end9:                                          ; preds = %if.end6, %then7
  %44 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %45 = getelementptr i32, i32* %44, i32 4, !dbg !21
  %46 = load i32, i32* %45, align 4, !dbg !21
  %47 = icmp ne i32 %46, 9, !dbg !21
  br i1 %47, label %then10, label %if.end12, !dbg !21

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !21
  %48 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end12, !dbg !21

if.end12:                                         ; preds = %if.end9, %then10
  %49 = bitcast [6 x i32]* %arr to i32*, !dbg !21
  %50 = getelementptr i32, i32* %49, i32 5, !dbg !21
  %51 = load i32, i32* %50, align 4, !dbg !21
  %52 = icmp ne i32 %51, 10, !dbg !21
  br i1 %52, label %then13, label %if.end15, !dbg !21

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !21
  %53 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end15, !dbg !21

if.end15:                                         ; preds = %if.end12, %then13
  %54 = bitcast [1 x i32]* %single to i32*, !dbg !21
  %55 = bitcast i32* %54 to i32*, !dbg !21
  store i32 42, i32* %55, align 4, !dbg !21
  %56 = load i32, i32* %55, align 4, !dbg !21
  %57 = bitcast [1 x i32]* %single to i32*, !dbg !21
  call void @quickSort(i32* %57, i32 0, i32 0), !dbg !21
  %58 = bitcast [1 x i32]* %single to i32*, !dbg !21
  %59 = bitcast i32* %58 to i32*, !dbg !21
  %60 = load i32, i32* %59, align 4, !dbg !21
  %61 = icmp ne i32 %60, 42, !dbg !21
  br i1 %61, label %then16, label %if.end18, !dbg !21

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !21
  %62 = load i32, i32* %err, align 4, !dbg !21
  br label %if.end18, !dbg !21

if.end18:                                         ; preds = %if.end15, %then16
  %63 = load i32, i32* %err, align 4, !dbg !21
  %64 = icmp eq i32 %63, 0, !dbg !21
  %. = select i1 %64, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), !dbg !21
  %65 = call i32 (i8*, ...) @printf(i8* %.), !dbg !21
  %66 = load i32, i32* %err, align 4, !dbg !21
  ret i32 %66, !dbg !21
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "25.quick_sort.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "swap", linkageName: "swap", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6, !6}
!5 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocation(line: 1, column: 1, scope: !2)
!10 = distinct !DISubprogram(name: "partition", linkageName: "partition", scope: null, file: !1, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!11 = !DISubroutineType(types: !12)
!12 = !{!7, !6, !7, !7}
!13 = !DILocation(line: 1, column: 1, scope: !10)
!14 = distinct !DISubprogram(name: "quickSort", linkageName: "quickSort", scope: null, file: !1, line: 1, type: !15, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!15 = !DISubroutineType(types: !16)
!16 = !{!5, !6, !7, !7}
!17 = !DILocation(line: 1, column: 1, scope: !14)
!18 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !19, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!19 = !DISubroutineType(types: !20)
!20 = !{!7}
!21 = !DILocation(line: 1, column: 1, scope: !18)
