; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [15 x i8] c"charVal %c %c\0A\00", align 1
@1 = private unnamed_addr constant [16 x i8] c"ucharVal %d %d\0A\00", align 1
@2 = private unnamed_addr constant [14 x i8] c"intVal %d %d\0A\00", align 1
@3 = private unnamed_addr constant [15 x i8] c"uintVal %u %u\0A\00", align 1
@4 = private unnamed_addr constant [17 x i8] c"longVal %ld %ld\0A\00", align 1
@5 = private unnamed_addr constant [18 x i8] c"ulongVal %lu %lu\0A\00", align 1
@6 = private unnamed_addr constant [16 x i8] c"floatVal %f %f\0A\00", align 1
@7 = private unnamed_addr constant [17 x i8] c"doubleVal %f %f\0A\00", align 1
@8 = private unnamed_addr constant [31 x i8] c"doubleVal %.15f floatVal %.7f\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %floatVal3 = alloca float, align 4
  %doubleVal3 = alloca double, align 8
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
  store i8 65, i8* %charVal, align 1
  %0 = load i8, i8* %charVal, align 1
  store i8 %0, i8* %ucharVal, align 1
  %1 = load i8, i8* %charVal, align 1
  store i8 %1, i8* %ucharVal2, align 1
  %2 = load i8, i8* %ucharVal2, align 1
  %3 = load i8, i8* %ucharVal, align 1
  store i8 %3, i8* %charVal2, align 1
  %4 = load i8, i8* %charVal, align 1
  %5 = sext i8 %4 to i32
  store i32 %5, i32* %intVal, align 4
  %6 = load i32, i32* %intVal, align 4
  store i32 %6, i32* %uintVal, align 4
  %7 = load i32, i32* %intVal, align 4
  store i32 %7, i32* %uintVal2, align 4
  %8 = load i32, i32* %uintVal2, align 4
  %9 = load i32, i32* %uintVal, align 4
  store i32 %9, i32* %intVal2, align 4
  %10 = load i32, i32* %intVal2, align 4
  %11 = load i32, i32* %intVal, align 4
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %longVal, align 4
  %13 = load i64, i64* %longVal, align 4
  store i64 %13, i64* %ulongVal, align 4
  %14 = load i64, i64* %longVal, align 4
  store i64 %14, i64* %ulongVal2, align 4
  %15 = load i64, i64* %ulongVal2, align 4
  %16 = load i64, i64* %ulongVal2, align 4
  store i64 %16, i64* %longVal2, align 4
  %17 = load i64, i64* %longVal2, align 4
  store float 0x400921FB40000000, float* %floatVal, align 4
  %18 = load float, float* %floatVal, align 4
  %19 = fpext float %18 to double
  store double %19, double* %doubleVal, align 8
  %20 = load float, float* %floatVal, align 4
  %21 = fpext float %20 to double
  store double %21, double* %doubleVal2, align 8
  %22 = load double, double* %doubleVal2, align 8
  %23 = load double, double* %doubleVal, align 8
  %24 = fptrunc double %23 to float
  store float %24, float* %floatVal2, align 4
  %25 = load float, float* %floatVal2, align 4
  %26 = load i8, i8* %charVal, align 1
  %27 = sext i8 %26 to i32
  %28 = load i8, i8* %charVal2, align 1
  %29 = sext i8 %28 to i32
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @0, i32 0, i32 0), i32 %27, i32 %29)
  %31 = load i8, i8* %ucharVal, align 1
  %32 = sext i8 %31 to i32
  %33 = load i8, i8* %ucharVal2, align 1
  %34 = sext i8 %33 to i32
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @1, i32 0, i32 0), i32 %32, i32 %34)
  %36 = load i32, i32* %intVal, align 4
  %37 = load i32, i32* %intVal2, align 4
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @2, i32 0, i32 0), i32 %36, i32 %37)
  %39 = load i32, i32* %uintVal, align 4
  %40 = load i32, i32* %uintVal2, align 4
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @3, i32 0, i32 0), i32 %39, i32 %40)
  %42 = load i64, i64* %longVal, align 4
  %43 = load i64, i64* %longVal2, align 4
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @4, i32 0, i32 0), i64 %42, i64 %43)
  %45 = load i64, i64* %ulongVal, align 4
  %46 = load i64, i64* %ulongVal2, align 4
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @5, i32 0, i32 0), i64 %45, i64 %46)
  %48 = load float, float* %floatVal, align 4
  %49 = fpext float %48 to double
  %50 = load float, float* %floatVal2, align 4
  %51 = fpext float %50 to double
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @6, i32 0, i32 0), double %49, double %51)
  %53 = load double, double* %doubleVal, align 8
  %54 = load double, double* %doubleVal2, align 8
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @7, i32 0, i32 0), double %53, double %54)
  store double 0x400921FB54442D18, double* %doubleVal3, align 8
  %56 = load double, double* %doubleVal3, align 8
  %57 = fptrunc double %56 to float
  store float %57, float* %floatVal3, align 4
  %58 = load double, double* %doubleVal3, align 8
  %59 = load float, float* %floatVal3, align 4
  %60 = fpext float %59 to double
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @8, i32 0, i32 0), double %58, double %60)
  ret i32 undef
}
