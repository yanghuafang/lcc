; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %u expected %u\0A\00", align 1
@2 = private unnamed_addr constant [34 x i8] c"ERROR [%s]: got %lu expected %lu\0A\00", align 1
@3 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %c expected %c\0A\00", align 1
@4 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@5 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@charVal = global i8 65
@shortVal = global i16 1024
@shortVal2 = global i16 -1024
@intVal = global i32 12345678
@intVal2 = global i32 -12345678
@intVal3 = global i32 12345678
@intVal4 = global i32 -162254319
@longVal = global i64 1234567890
@longVal2 = global i64 -1234567890
@longVal3 = global i64 1234567890
@longVal4 = global i64 -1234567890
@ucharVal = global i8 -6
@ushortVal = global i16 2048
@uintVal = global i32 87654321
@uintVal2 = global i32 87654321
@uintVal3 = global i32 87654321
@uintVal4 = global i32 180150000
@ulongVal = global i64 9876043210
@ulongVal2 = global i64 9876043210
@floatVal = global float 0x400921FB40000000
@floatVal2 = global float 0x400921FB40000000
@doubleVal = global double 0x400921FB54442D11
@boolVal = global i1 true
@boolVal2 = global i1 false
@6 = private unnamed_addr constant [29 x i8] c"**** 1.builtin_types.c ****\0A\00", align 1
@7 = private unnamed_addr constant [13 x i8] c"charVal: %c\0A\00", align 1
@8 = private unnamed_addr constant [15 x i8] c"shortVal: %hd\0A\00", align 1
@9 = private unnamed_addr constant [15 x i8] c"shortVal: %hd\0A\00", align 1
@10 = private unnamed_addr constant [12 x i8] c"intVal: %d\0A\00", align 1
@11 = private unnamed_addr constant [13 x i8] c"intVal2: %d\0A\00", align 1
@12 = private unnamed_addr constant [13 x i8] c"intVal3: %d\0A\00", align 1
@13 = private unnamed_addr constant [16 x i8] c"intVal4: -0x%x\0A\00", align 1
@14 = private unnamed_addr constant [14 x i8] c"longVal: %ld\0A\00", align 1
@15 = private unnamed_addr constant [15 x i8] c"longVal2: %ld\0A\00", align 1
@16 = private unnamed_addr constant [15 x i8] c"longVal3: %ld\0A\00", align 1
@17 = private unnamed_addr constant [15 x i8] c"longVal4: %ld\0A\00", align 1
@18 = private unnamed_addr constant [14 x i8] c"ucharVal: %u\0A\00", align 1
@19 = private unnamed_addr constant [16 x i8] c"ushortVal: %hu\0A\00", align 1
@20 = private unnamed_addr constant [13 x i8] c"uintVal: %u\0A\00", align 1
@21 = private unnamed_addr constant [14 x i8] c"uintVal2: %u\0A\00", align 1
@22 = private unnamed_addr constant [14 x i8] c"uintVal3: %u\0A\00", align 1
@23 = private unnamed_addr constant [16 x i8] c"uintVal4: 0x%x\0A\00", align 1
@24 = private unnamed_addr constant [15 x i8] c"ulongVal: %lu\0A\00", align 1
@25 = private unnamed_addr constant [16 x i8] c"ulongVal2: %lu\0A\00", align 1
@26 = private unnamed_addr constant [14 x i8] c"floatVal: %f\0A\00", align 1
@27 = private unnamed_addr constant [15 x i8] c"floatVal2: %f\0A\00", align 1
@28 = private unnamed_addr constant [18 x i8] c"doubleVal: %.15f\0A\00", align 1
@29 = private unnamed_addr constant [13 x i8] c"boolVal: %d\0A\00", align 1
@30 = private unnamed_addr constant [14 x i8] c"boolVal2: %d\0A\00", align 1
@31 = private unnamed_addr constant [8 x i8] c"charVal\00", align 1
@32 = private unnamed_addr constant [9 x i8] c"shortVal\00", align 1
@33 = private unnamed_addr constant [10 x i8] c"shortVal2\00", align 1
@34 = private unnamed_addr constant [7 x i8] c"intVal\00", align 1
@35 = private unnamed_addr constant [8 x i8] c"intVal2\00", align 1
@36 = private unnamed_addr constant [8 x i8] c"intVal3\00", align 1
@37 = private unnamed_addr constant [8 x i8] c"intVal4\00", align 1
@38 = private unnamed_addr constant [8 x i8] c"longVal\00", align 1
@39 = private unnamed_addr constant [9 x i8] c"longVal2\00", align 1
@40 = private unnamed_addr constant [18 x i8] c"ucharVal boundary\00", align 1
@41 = private unnamed_addr constant [10 x i8] c"ushortVal\00", align 1
@42 = private unnamed_addr constant [8 x i8] c"uintVal\00", align 1
@43 = private unnamed_addr constant [9 x i8] c"uintVal4\00", align 1
@44 = private unnamed_addr constant [9 x i8] c"ulongVal\00", align 1
@45 = private unnamed_addr constant [8 x i8] c"boolVal\00", align 1
@46 = private unnamed_addr constant [9 x i8] c"boolVal2\00", align 1
@47 = private unnamed_addr constant [11 x i8] c"uchar zero\00", align 1
@48 = private unnamed_addr constant [10 x i8] c"uchar max\00", align 1

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

define void @check_ulong(i8* %0, i64 %1, i64 %2) {
entry:
  %expected = alloca i64, align 8
  %actual = alloca i64, align 8
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i64 %1, i64* %actual, align 4
  store i64 %2, i64* %expected, align 4
  %3 = load i64, i64* %actual, align 4
  %4 = load i64, i64* %expected, align 4
  %5 = icmp ne i64 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i64, i64* %actual, align 4
  %8 = load i64, i64* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @2, i32 0, i32 0), i8* %6, i64 %7, i64 %8)
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
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @3, i32 0, i32 0), i8* %8, i32 %10, i32 %12)
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
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @4, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @5, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @main() {
entry:
  %const = bitcast i32 12345678 to i32
  %maxUchar = alloca i8, align 1
  %zero = alloca i8, align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @6, i32 0, i32 0))
  %1 = load i8, i8* @charVal, align 1
  %2 = sext i8 %1 to i32
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @7, i32 0, i32 0), i32 %2)
  %4 = load i16, i16* @shortVal, align 2
  %5 = sext i16 %4 to i32
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @8, i32 0, i32 0), i32 %5)
  %7 = load i16, i16* @shortVal2, align 2
  %8 = sext i16 %7 to i32
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @9, i32 0, i32 0), i32 %8)
  %10 = load i32, i32* @intVal, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @10, i32 0, i32 0), i32 %10)
  %12 = load i32, i32* @intVal2, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @11, i32 0, i32 0), i32 %12)
  %14 = load i32, i32* @intVal3, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @12, i32 0, i32 0), i32 %14)
  %16 = load i32, i32* @intVal4, align 4
  %17 = sub i32 0, %16
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @13, i32 0, i32 0), i32 %17)
  %19 = load i64, i64* @longVal, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @14, i32 0, i32 0), i64 %19)
  %21 = load i64, i64* @longVal2, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @15, i32 0, i32 0), i64 %21)
  %23 = load i64, i64* @longVal3, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @16, i32 0, i32 0), i64 %23)
  %25 = load i64, i64* @longVal4, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @17, i32 0, i32 0), i64 %25)
  %27 = load i8, i8* @ucharVal, align 1
  %28 = zext i8 %27 to i32
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @18, i32 0, i32 0), i32 %28)
  %30 = load i16, i16* @ushortVal, align 2
  %31 = zext i16 %30 to i32
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @19, i32 0, i32 0), i32 %31)
  %33 = load i32, i32* @uintVal, align 4
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @20, i32 0, i32 0), i32 %33)
  %35 = load i32, i32* @uintVal2, align 4
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @21, i32 0, i32 0), i32 %35)
  %37 = load i32, i32* @uintVal3, align 4
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @22, i32 0, i32 0), i32 %37)
  %39 = load i32, i32* @uintVal4, align 4
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @23, i32 0, i32 0), i32 %39)
  %41 = load i64, i64* @ulongVal, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @24, i32 0, i32 0), i64 %41)
  %43 = load i64, i64* @ulongVal2, align 4
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @25, i32 0, i32 0), i64 %43)
  %45 = load float, float* @floatVal, align 4
  %46 = fpext float %45 to double
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @26, i32 0, i32 0), double %46)
  %48 = load float, float* @floatVal2, align 4
  %49 = fpext float %48 to double
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @27, i32 0, i32 0), double %49)
  %51 = load double, double* @doubleVal, align 8
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @28, i32 0, i32 0), double %51)
  %53 = load i1, i1* @boolVal, align 1
  %54 = zext i1 %53 to i32
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @29, i32 0, i32 0), i32 %54)
  %56 = load i1, i1* @boolVal2, align 1
  %57 = zext i1 %56 to i32
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @30, i32 0, i32 0), i32 %57)
  %59 = load i8, i8* @charVal, align 1
  call void @check_char(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @31, i32 0, i32 0), i8 %59, i8 65)
  %60 = load i16, i16* @shortVal, align 2
  %61 = sext i16 %60 to i32
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @32, i32 0, i32 0), i32 %61, i32 1024)
  %62 = load i16, i16* @shortVal2, align 2
  %63 = sext i16 %62 to i32
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @33, i32 0, i32 0), i32 %63, i32 -1024)
  %64 = load i32, i32* @intVal, align 4
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @34, i32 0, i32 0), i32 %64, i32 %const)
  %65 = load i32, i32* @intVal2, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @35, i32 0, i32 0), i32 %65, i32 -12345678)
  %66 = load i32, i32* @intVal3, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @36, i32 0, i32 0), i32 %66, i32 %const)
  %67 = load i32, i32* @intVal4, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @37, i32 0, i32 0), i32 %67, i32 -162254319)
  %68 = load i64, i64* @longVal, align 4
  %69 = trunc i64 %68 to i32
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @38, i32 0, i32 0), i32 %69, i32 1234567890)
  %70 = load i64, i64* @longVal2, align 4
  %71 = trunc i64 %70 to i32
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @39, i32 0, i32 0), i32 %71, i32 -1234567890)
  %72 = load i8, i8* @ucharVal, align 1
  %73 = zext i8 %72 to i32
  call void @check_uint(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @40, i32 0, i32 0), i32 %73, i32 250)
  %74 = load i16, i16* @ushortVal, align 2
  %75 = zext i16 %74 to i32
  call void @check_uint(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @41, i32 0, i32 0), i32 %75, i32 2048)
  %76 = load i32, i32* @uintVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @42, i32 0, i32 0), i32 %76, i32 87654321)
  %77 = load i32, i32* @uintVal4, align 4
  call void @check_uint(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @43, i32 0, i32 0), i32 %77, i32 180150000)
  %78 = load i64, i64* @ulongVal, align 4
  call void @check_ulong(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @44, i32 0, i32 0), i64 %78, i64 9876043210)
  %79 = load i1, i1* @boolVal, align 1
  %80 = zext i1 %79 to i32
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @45, i32 0, i32 0), i32 %80, i32 1)
  %81 = load i1, i1* @boolVal2, align 1
  %82 = zext i1 %81 to i32
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @46, i32 0, i32 0), i32 %82, i32 0)
  store i8 0, i8* %zero, align 1
  store i8 -1, i8* %maxUchar, align 1
  %83 = load i8, i8* %zero, align 1
  %84 = zext i8 %83 to i32
  call void @check_uint(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @47, i32 0, i32 0), i32 %84, i32 0)
  %85 = load i8, i8* %maxUchar, align 1
  %86 = zext i8 %85 to i32
  call void @check_uint(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @48, i32 0, i32 0), i32 %86, i32 255)
  call void @report_result()
  %87 = load i32, i32* @test_errors, align 4
  ret i32 %87
}
