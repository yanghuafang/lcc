; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %u expected %u\0A\00", align 1
@2 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %c expected %c\0A\00", align 1
@3 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@4 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@5 = private unnamed_addr constant [26 x i8] c"**** 11.type_cast.c ****\0A\00", align 1
@6 = private unnamed_addr constant [15 x i8] c"charVal %c %c\0A\00", align 1
@7 = private unnamed_addr constant [16 x i8] c"ucharVal %d %d\0A\00", align 1
@8 = private unnamed_addr constant [14 x i8] c"intVal %d %d\0A\00", align 1
@9 = private unnamed_addr constant [15 x i8] c"uintVal %u %u\0A\00", align 1
@10 = private unnamed_addr constant [17 x i8] c"longVal %ld %ld\0A\00", align 1
@11 = private unnamed_addr constant [18 x i8] c"ulongVal %lu %lu\0A\00", align 1
@12 = private unnamed_addr constant [16 x i8] c"floatVal %f %f\0A\00", align 1
@13 = private unnamed_addr constant [17 x i8] c"doubleVal %f %f\0A\00", align 1
@14 = private unnamed_addr constant [31 x i8] c"doubleVal %.15f floatVal %.7f\0A\00", align 1
@15 = private unnamed_addr constant [16 x i8] c"char round-trip\00", align 1
@16 = private unnamed_addr constant [16 x i8] c"uchar from char\00", align 1
@17 = private unnamed_addr constant [14 x i8] c"int from char\00", align 1
@18 = private unnamed_addr constant [14 x i8] c"uint from int\00", align 1
@19 = private unnamed_addr constant [14 x i8] c"int from uint\00", align 1
@20 = private unnamed_addr constant [14 x i8] c"long from int\00", align 1
@21 = private unnamed_addr constant [16 x i8] c"ulong from long\00", align 1
@22 = private unnamed_addr constant [16 x i8] c"long from ulong\00", align 1
@23 = private unnamed_addr constant [31 x i8] c"boundary uchar 250 -> int: %d\0A\00", align 1
@24 = private unnamed_addr constant [32 x i8] c"unsigned char 250 widens to 250\00", align 1
@25 = private unnamed_addr constant [25 x i8] c"int 250 narrows to uchar\00", align 1
@26 = private unnamed_addr constant [25 x i8] c"cast (unsigned)(-1): %u\0A\00", align 1
@27 = private unnamed_addr constant [25 x i8] c"negative int to unsigned\00", align 1

declare i32 @printf(i8*, ...)

define void @check_int(i8* %0, i32 %1, i32 %2) {
entry:
  %expected = alloca i32, align 4
  %actual = alloca i32, align 4
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i32 %1, i32* %actual, align 4
  store i32 %2, i32* %expected, align 4
  %3 = load i32, i32* %actual, align 4
  %4 = load i32, i32* %expected, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i32, i32* %actual, align 4
  %8 = load i32, i32* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @0, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
  %10 = load i32, i32* @test_errors, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* @test_errors, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @check_uint(i8* %0, i32 %1, i32 %2) {
entry:
  %expected = alloca i32, align 4
  %actual = alloca i32, align 4
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i32 %1, i32* %actual, align 4
  store i32 %2, i32* %expected, align 4
  %3 = load i32, i32* %actual, align 4
  %4 = load i32, i32* %expected, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i32, i32* %actual, align 4
  %8 = load i32, i32* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @1, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
  %10 = load i32, i32* @test_errors, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* @test_errors, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @check_char(i8* %0, i8 %1, i8 %2) {
entry:
  %expected = alloca i8, align 1
  %actual = alloca i8, align 1
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i8 %1, i8* %actual, align 1
  store i8 %2, i8* %expected, align 1
  %3 = load i8, i8* %actual, align 1
  %4 = load i8, i8* %expected, align 1
  %5 = sext i8 %3 to i32
  %6 = sext i8 %4 to i32
  %7 = icmp ne i32 %5, %6
  br i1 %7, label %then, label %if.end

then:                                             ; preds = %entry
  %8 = load i8*, i8** %name, align 8
  %9 = load i8, i8* %actual, align 1
  %10 = sext i8 %9 to i32
  %11 = load i8, i8* %expected, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @2, i32 0, i32 0), i8* %8, i32 %10, i32 %12)
  %14 = load i32, i32* @test_errors, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* @test_errors, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @report_result() {
entry:
  %0 = load i32, i32* @test_errors, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @3, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @4, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @main() {
entry:
  %negToUint = alloca i32, align 4
  %ucharFromInt = alloca i8, align 1
  %intFromUchar = alloca i32, align 4
  %ucharBoundary = alloca i8, align 1
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
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @5, i32 0, i32 0))
  store i8 65, i8* %charVal, align 1
  %1 = load i8, i8* %charVal, align 1
  store i8 %1, i8* %ucharVal, align 1
  %2 = load i8, i8* %charVal, align 1
  store i8 %2, i8* %ucharVal2, align 1
  %3 = load i8, i8* %ucharVal2, align 1
  %4 = load i8, i8* %ucharVal, align 1
  store i8 %4, i8* %charVal2, align 1
  %5 = load i8, i8* %charVal, align 1
  %6 = sext i8 %5 to i32
  store i32 %6, i32* %intVal, align 4
  %7 = load i32, i32* %intVal, align 4
  store i32 %7, i32* %uintVal, align 4
  %8 = load i32, i32* %intVal, align 4
  store i32 %8, i32* %uintVal2, align 4
  %9 = load i32, i32* %uintVal2, align 4
  %10 = load i32, i32* %uintVal, align 4
  store i32 %10, i32* %intVal2, align 4
  %11 = load i32, i32* %intVal2, align 4
  %12 = load i32, i32* %intVal, align 4
  %13 = sext i32 %12 to i64
  store i64 %13, i64* %longVal, align 4
  %14 = load i64, i64* %longVal, align 4
  store i64 %14, i64* %ulongVal, align 4
  %15 = load i64, i64* %longVal, align 4
  store i64 %15, i64* %ulongVal2, align 4
  %16 = load i64, i64* %ulongVal2, align 4
  %17 = load i64, i64* %ulongVal2, align 4
  store i64 %17, i64* %longVal2, align 4
  %18 = load i64, i64* %longVal2, align 4
  store float 0x400921FB40000000, float* %floatVal, align 4
  %19 = load float, float* %floatVal, align 4
  %20 = fpext float %19 to double
  store double %20, double* %doubleVal, align 8
  %21 = load float, float* %floatVal, align 4
  %22 = fpext float %21 to double
  store double %22, double* %doubleVal2, align 8
  %23 = load double, double* %doubleVal2, align 8
  %24 = load double, double* %doubleVal, align 8
  %25 = fptrunc double %24 to float
  store float %25, float* %floatVal2, align 4
  %26 = load float, float* %floatVal2, align 4
  %27 = load i8, i8* %charVal, align 1
  %28 = sext i8 %27 to i32
  %29 = load i8, i8* %charVal2, align 1
  %30 = sext i8 %29 to i32
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0), i32 %28, i32 %30)
  %32 = load i8, i8* %ucharVal, align 1
  %33 = zext i8 %32 to i32
  %34 = load i8, i8* %ucharVal2, align 1
  %35 = zext i8 %34 to i32
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @7, i32 0, i32 0), i32 %33, i32 %35)
  %37 = load i32, i32* %intVal, align 4
  %38 = load i32, i32* %intVal2, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @8, i32 0, i32 0), i32 %37, i32 %38)
  %40 = load i32, i32* %uintVal, align 4
  %41 = load i32, i32* %uintVal2, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @9, i32 0, i32 0), i32 %40, i32 %41)
  %43 = load i64, i64* %longVal, align 4
  %44 = load i64, i64* %longVal2, align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @10, i32 0, i32 0), i64 %43, i64 %44)
  %46 = load i64, i64* %ulongVal, align 4
  %47 = load i64, i64* %ulongVal2, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @11, i32 0, i32 0), i64 %46, i64 %47)
  %49 = load float, float* %floatVal, align 4
  %50 = fpext float %49 to double
  %51 = load float, float* %floatVal2, align 4
  %52 = fpext float %51 to double
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @12, i32 0, i32 0), double %50, double %52)
  %54 = load double, double* %doubleVal, align 8
  %55 = load double, double* %doubleVal2, align 8
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @13, i32 0, i32 0), double %54, double %55)
  store double 0x400921FB54442D18, double* %doubleVal3, align 8
  %57 = load double, double* %doubleVal3, align 8
  %58 = fptrunc double %57 to float
  store float %58, float* %floatVal3, align 4
  %59 = load double, double* %doubleVal3, align 8
  %60 = load float, float* %floatVal3, align 4
  %61 = fpext float %60 to double
  %62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @14, i32 0, i32 0), double %59, double %61)
  %63 = load i8, i8* %charVal2, align 1
  call void @check_char(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @15, i32 0, i32 0), i8 %63, i8 65)
  %64 = load i8, i8* %ucharVal, align 1
  %65 = zext i8 %64 to i32
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @16, i32 0, i32 0), i32 %65, i32 65)
  %66 = load i32, i32* %intVal, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @17, i32 0, i32 0), i32 %66, i32 65)
  %67 = load i32, i32* %uintVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @18, i32 0, i32 0), i32 %67, i32 65)
  %68 = load i32, i32* %intVal2, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @19, i32 0, i32 0), i32 %68, i32 65)
  %69 = load i64, i64* %longVal, align 4
  %70 = trunc i64 %69 to i32
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @20, i32 0, i32 0), i32 %70, i32 65)
  %71 = load i64, i64* %ulongVal, align 4
  %72 = trunc i64 %71 to i32
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @21, i32 0, i32 0), i32 %72, i32 65)
  %73 = load i64, i64* %longVal2, align 4
  %74 = trunc i64 %73 to i32
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @22, i32 0, i32 0), i32 %74, i32 65)
  store i8 -6, i8* %ucharBoundary, align 1
  %75 = load i8, i8* %ucharBoundary, align 1
  %76 = zext i8 %75 to i32
  store i32 %76, i32* %intFromUchar, align 4
  %77 = load i32, i32* %intFromUchar, align 4
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @23, i32 0, i32 0), i32 %77)
  %79 = load i32, i32* %intFromUchar, align 4
  call void @check_int(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @24, i32 0, i32 0), i32 %79, i32 250)
  %80 = load i32, i32* %intFromUchar, align 4
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* %ucharFromInt, align 1
  %82 = load i8, i8* %ucharFromInt, align 1
  %83 = zext i8 %82 to i32
  call void @check_uint(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @25, i32 0, i32 0), i32 %83, i32 250)
  store i32 -1, i32* %negToUint, align 4
  %84 = load i32, i32* %negToUint, align 4
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @26, i32 0, i32 0), i32 %84)
  %86 = load i32, i32* %negToUint, align 4
  call void @check_uint(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @27, i32 0, i32 0), i32 %86, i32 -1)
  call void @report_result()
  %87 = load i32, i32* @test_errors, align 4
  ret i32 %87
}
