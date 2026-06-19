; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [21 x i8] c"11.type_cast.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"11.type_cast.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %negToUint = alloca i32, align 4
  %ucharFromInt = alloca i8, align 1
  %intFromUchar = alloca i32, align 4
  %ucharBoundary = alloca i8, align 1
  %floatVal2 = alloca float, align 4
  %doubleVal2 = alloca double, align 8
  %doubleVal = alloca double, align 8
  %floatVal = alloca float, align 4
  %longVal2 = alloca i64, align 8
  %ulongVal2 = alloca i64, align 8
  %ulongVal = alloca i64, align 8
  %longVal = alloca i64, align 8
  %intVal2 = alloca i32, align 4
  %uintVal2 = alloca i32, align 4
  %uintVal = alloca i32, align 4
  %intVal = alloca i32, align 4
  %charVal2 = alloca i8, align 1
  %ucharVal2 = alloca i8, align 1
  %ucharVal = alloca i8, align 1
  %charVal = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i8 65, i8* %charVal, align 1, !dbg !8
  %0 = load i8, i8* %charVal, align 1, !dbg !9
  store i8 %0, i8* %ucharVal, align 1, !dbg !9
  %1 = load i8, i8* %charVal, align 1, !dbg !10
  store i8 %1, i8* %ucharVal2, align 1, !dbg !10
  %2 = load i8, i8* %ucharVal, align 1, !dbg !11
  store i8 %2, i8* %charVal2, align 1, !dbg !11
  %3 = load i8, i8* %charVal, align 1, !dbg !12
  %4 = sext i8 %3 to i32, !dbg !12
  store i32 %4, i32* %intVal, align 4, !dbg !12
  %5 = load i32, i32* %intVal, align 4, !dbg !13
  store i32 %5, i32* %uintVal, align 4, !dbg !13
  %6 = load i32, i32* %intVal, align 4, !dbg !14
  store i32 %6, i32* %uintVal2, align 4, !dbg !14
  %7 = load i32, i32* %uintVal, align 4, !dbg !15
  store i32 %7, i32* %intVal2, align 4, !dbg !15
  %8 = load i32, i32* %intVal, align 4, !dbg !16
  %9 = sext i32 %8 to i64, !dbg !16
  store i64 %9, i64* %longVal, align 4, !dbg !16
  %10 = load i64, i64* %longVal, align 4, !dbg !17
  store i64 %10, i64* %ulongVal, align 4, !dbg !17
  %11 = load i64, i64* %longVal, align 4, !dbg !18
  store i64 %11, i64* %ulongVal2, align 4, !dbg !18
  %12 = load i64, i64* %ulongVal2, align 4, !dbg !19
  store i64 %12, i64* %longVal2, align 4, !dbg !19
  store float 0x400921FB40000000, float* %floatVal, align 4, !dbg !20
  %13 = load float, float* %floatVal, align 4, !dbg !21
  %14 = fpext float %13 to double, !dbg !21
  store double %14, double* %doubleVal, align 8, !dbg !21
  %15 = load float, float* %floatVal, align 4, !dbg !22
  %16 = fpext float %15 to double, !dbg !22
  store double %16, double* %doubleVal2, align 8, !dbg !22
  %17 = load double, double* %doubleVal, align 8, !dbg !23
  %18 = fptrunc double %17 to float, !dbg !23
  store float %18, float* %floatVal2, align 4, !dbg !23
  %19 = load i8, i8* %charVal2, align 1, !dbg !24
  %20 = sext i8 %19 to i32, !dbg !24
  %21 = icmp ne i32 %20, 65, !dbg !24
  br i1 %21, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !25
  %22 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %23 = load i8, i8* %ucharVal, align 1, !dbg !26
  %24 = zext i8 %23 to i32, !dbg !26
  %25 = icmp ne i32 %24, 65, !dbg !26
  br i1 %25, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !27
  %26 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  %27 = load i32, i32* %intVal, align 4, !dbg !28
  %28 = icmp ne i32 %27, 65, !dbg !28
  br i1 %28, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %29 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %30 = load i32, i32* %uintVal, align 4, !dbg !30
  %31 = icmp ne i32 %30, 65, !dbg !30
  br i1 %31, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !31
  %32 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  %33 = load i32, i32* %intVal2, align 4, !dbg !32
  %34 = icmp ne i32 %33, 65, !dbg !32
  br i1 %34, label %then10, label %if.end12, !dbg !32

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !33
  %35 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end12, !dbg !33

if.end12:                                         ; preds = %if.end9, %then10
  %36 = load i64, i64* %longVal, align 4, !dbg !34
  %37 = trunc i64 %36 to i32, !dbg !34
  %38 = icmp ne i32 %37, 65, !dbg !34
  br i1 %38, label %then13, label %if.end15, !dbg !34

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !35
  %39 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end15, !dbg !35

if.end15:                                         ; preds = %if.end12, %then13
  %40 = load i64, i64* %ulongVal, align 4, !dbg !36
  %41 = trunc i64 %40 to i32, !dbg !36
  %42 = icmp ne i32 %41, 65, !dbg !36
  br i1 %42, label %then16, label %if.end18, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !37
  %43 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %if.end15, %then16
  %44 = load i64, i64* %longVal2, align 4, !dbg !38
  %45 = trunc i64 %44 to i32, !dbg !38
  %46 = icmp ne i32 %45, 65, !dbg !38
  br i1 %46, label %then19, label %if.end21, !dbg !38

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !39
  %47 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %if.end18, %then19
  store i8 -6, i8* %ucharBoundary, align 1, !dbg !40
  %48 = load i8, i8* %ucharBoundary, align 1, !dbg !41
  %49 = zext i8 %48 to i32, !dbg !41
  store i32 %49, i32* %intFromUchar, align 4, !dbg !41
  %50 = load i32, i32* %intFromUchar, align 4, !dbg !42
  %51 = icmp ne i32 %50, 250, !dbg !42
  br i1 %51, label %then22, label %if.end24, !dbg !42

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !43
  %52 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %if.end21, %then22
  %53 = load i32, i32* %intFromUchar, align 4, !dbg !44
  %54 = trunc i32 %53 to i8, !dbg !44
  store i8 %54, i8* %ucharFromInt, align 1, !dbg !44
  %55 = load i8, i8* %ucharFromInt, align 1, !dbg !45
  %56 = zext i8 %55 to i32, !dbg !45
  %57 = icmp ne i32 %56, 250, !dbg !45
  br i1 %57, label %then25, label %if.end27, !dbg !45

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !46
  %58 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end27, !dbg !46

if.end27:                                         ; preds = %if.end24, %then25
  store i32 -1, i32* %negToUint, align 4, !dbg !47
  %59 = load i32, i32* %negToUint, align 4, !dbg !48
  %60 = icmp ne i32 %59, -1, !dbg !48
  br i1 %60, label %then28, label %if.end30, !dbg !48

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !49
  %61 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end30, !dbg !49

if.end30:                                         ; preds = %if.end27, %then28
  %62 = load i32, i32* %err, align 4, !dbg !50
  %63 = icmp eq i32 %62, 0, !dbg !50
  %. = select i1 %63, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), !dbg !51
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !51
  %65 = load i32, i32* %err, align 4, !dbg !52
  ret i32 %65, !dbg !52
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "11.type_cast.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocation(line: 6, column: 3, scope: !2)
!10 = !DILocation(line: 7, column: 3, scope: !2)
!11 = !DILocation(line: 8, column: 3, scope: !2)
!12 = !DILocation(line: 10, column: 3, scope: !2)
!13 = !DILocation(line: 11, column: 3, scope: !2)
!14 = !DILocation(line: 12, column: 3, scope: !2)
!15 = !DILocation(line: 13, column: 3, scope: !2)
!16 = !DILocation(line: 15, column: 3, scope: !2)
!17 = !DILocation(line: 16, column: 3, scope: !2)
!18 = !DILocation(line: 17, column: 3, scope: !2)
!19 = !DILocation(line: 18, column: 3, scope: !2)
!20 = !DILocation(line: 20, column: 3, scope: !2)
!21 = !DILocation(line: 21, column: 3, scope: !2)
!22 = !DILocation(line: 22, column: 3, scope: !2)
!23 = !DILocation(line: 23, column: 3, scope: !2)
!24 = !DILocation(line: 25, column: 3, scope: !2)
!25 = !DILocation(line: 25, column: 24, scope: !2)
!26 = !DILocation(line: 26, column: 3, scope: !2)
!27 = !DILocation(line: 26, column: 23, scope: !2)
!28 = !DILocation(line: 27, column: 3, scope: !2)
!29 = !DILocation(line: 27, column: 21, scope: !2)
!30 = !DILocation(line: 28, column: 3, scope: !2)
!31 = !DILocation(line: 28, column: 22, scope: !2)
!32 = !DILocation(line: 29, column: 3, scope: !2)
!33 = !DILocation(line: 29, column: 22, scope: !2)
!34 = !DILocation(line: 30, column: 3, scope: !2)
!35 = !DILocation(line: 30, column: 27, scope: !2)
!36 = !DILocation(line: 31, column: 3, scope: !2)
!37 = !DILocation(line: 31, column: 28, scope: !2)
!38 = !DILocation(line: 32, column: 3, scope: !2)
!39 = !DILocation(line: 32, column: 28, scope: !2)
!40 = !DILocation(line: 34, column: 3, scope: !2)
!41 = !DILocation(line: 35, column: 3, scope: !2)
!42 = !DILocation(line: 36, column: 3, scope: !2)
!43 = !DILocation(line: 36, column: 28, scope: !2)
!44 = !DILocation(line: 38, column: 3, scope: !2)
!45 = !DILocation(line: 39, column: 3, scope: !2)
!46 = !DILocation(line: 39, column: 28, scope: !2)
!47 = !DILocation(line: 41, column: 3, scope: !2)
!48 = !DILocation(line: 42, column: 3, scope: !2)
!49 = !DILocation(line: 42, column: 32, scope: !2)
!50 = !DILocation(line: 44, column: 3, scope: !2)
!51 = !DILocation(line: 0, scope: !2)
!52 = !DILocation(line: 49, column: 3, scope: !2)
