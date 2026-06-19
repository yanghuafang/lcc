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
  store i8 65, i8* %charVal, align 1, !dbg !7
  %0 = load i8, i8* %charVal, align 1, !dbg !7
  store i8 %0, i8* %ucharVal, align 1, !dbg !7
  %1 = load i8, i8* %charVal, align 1, !dbg !7
  store i8 %1, i8* %ucharVal2, align 1, !dbg !7
  %2 = load i8, i8* %ucharVal, align 1, !dbg !7
  store i8 %2, i8* %charVal2, align 1, !dbg !7
  %3 = load i8, i8* %charVal, align 1, !dbg !7
  %4 = sext i8 %3 to i32, !dbg !7
  store i32 %4, i32* %intVal, align 4, !dbg !7
  %5 = load i32, i32* %intVal, align 4, !dbg !7
  store i32 %5, i32* %uintVal, align 4, !dbg !7
  %6 = load i32, i32* %intVal, align 4, !dbg !7
  store i32 %6, i32* %uintVal2, align 4, !dbg !7
  %7 = load i32, i32* %uintVal, align 4, !dbg !7
  store i32 %7, i32* %intVal2, align 4, !dbg !7
  %8 = load i32, i32* %intVal, align 4, !dbg !7
  %9 = sext i32 %8 to i64, !dbg !7
  store i64 %9, i64* %longVal, align 4, !dbg !7
  %10 = load i64, i64* %longVal, align 4, !dbg !7
  store i64 %10, i64* %ulongVal, align 4, !dbg !7
  %11 = load i64, i64* %longVal, align 4, !dbg !7
  store i64 %11, i64* %ulongVal2, align 4, !dbg !7
  %12 = load i64, i64* %ulongVal2, align 4, !dbg !7
  store i64 %12, i64* %longVal2, align 4, !dbg !7
  store float 0x400921FB40000000, float* %floatVal, align 4, !dbg !7
  %13 = load float, float* %floatVal, align 4, !dbg !7
  %14 = fpext float %13 to double, !dbg !7
  store double %14, double* %doubleVal, align 8, !dbg !7
  %15 = load float, float* %floatVal, align 4, !dbg !7
  %16 = fpext float %15 to double, !dbg !7
  store double %16, double* %doubleVal2, align 8, !dbg !7
  %17 = load double, double* %doubleVal, align 8, !dbg !7
  %18 = fptrunc double %17 to float, !dbg !7
  store float %18, float* %floatVal2, align 4, !dbg !7
  %19 = load i8, i8* %charVal2, align 1, !dbg !7
  %20 = sext i8 %19 to i32, !dbg !7
  %21 = icmp ne i32 %20, 65, !dbg !7
  br i1 %21, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %22 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %23 = load i8, i8* %ucharVal, align 1, !dbg !7
  %24 = zext i8 %23 to i32, !dbg !7
  %25 = icmp ne i32 %24, 65, !dbg !7
  br i1 %25, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %26 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %27 = load i32, i32* %intVal, align 4, !dbg !7
  %28 = icmp ne i32 %27, 65, !dbg !7
  br i1 %28, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %29 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %30 = load i32, i32* %uintVal, align 4, !dbg !7
  %31 = icmp ne i32 %30, 65, !dbg !7
  br i1 %31, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %32 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %33 = load i32, i32* %intVal2, align 4, !dbg !7
  %34 = icmp ne i32 %33, 65, !dbg !7
  br i1 %34, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %35 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %36 = load i64, i64* %longVal, align 4, !dbg !7
  %37 = trunc i64 %36 to i32, !dbg !7
  %38 = icmp ne i32 %37, 65, !dbg !7
  br i1 %38, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %39 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %40 = load i64, i64* %ulongVal, align 4, !dbg !7
  %41 = trunc i64 %40 to i32, !dbg !7
  %42 = icmp ne i32 %41, 65, !dbg !7
  br i1 %42, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %43 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %44 = load i64, i64* %longVal2, align 4, !dbg !7
  %45 = trunc i64 %44 to i32, !dbg !7
  %46 = icmp ne i32 %45, 65, !dbg !7
  br i1 %46, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %47 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  store i8 -6, i8* %ucharBoundary, align 1, !dbg !7
  %48 = load i8, i8* %ucharBoundary, align 1, !dbg !7
  %49 = zext i8 %48 to i32, !dbg !7
  store i32 %49, i32* %intFromUchar, align 4, !dbg !7
  %50 = load i32, i32* %intFromUchar, align 4, !dbg !7
  %51 = icmp ne i32 %50, 250, !dbg !7
  br i1 %51, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %52 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %53 = load i32, i32* %intFromUchar, align 4, !dbg !7
  %54 = trunc i32 %53 to i8, !dbg !7
  store i8 %54, i8* %ucharFromInt, align 1, !dbg !7
  %55 = load i8, i8* %ucharFromInt, align 1, !dbg !7
  %56 = zext i8 %55 to i32, !dbg !7
  %57 = icmp ne i32 %56, 250, !dbg !7
  br i1 %57, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %58 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  store i32 -1, i32* %negToUint, align 4, !dbg !7
  %59 = load i32, i32* %negToUint, align 4, !dbg !7
  %60 = icmp ne i32 %59, -1, !dbg !7
  br i1 %60, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %61 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  %62 = load i32, i32* %err, align 4, !dbg !7
  %63 = icmp eq i32 %62, 0, !dbg !7
  %. = select i1 %63, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), !dbg !7
  %64 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %65 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %65, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "11.type_cast.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
