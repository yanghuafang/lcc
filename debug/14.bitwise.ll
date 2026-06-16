; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %u expected %u\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [24 x i8] c"**** 14.bitwise.c ****\0A\00", align 1
@5 = private unnamed_addr constant [15 x i8] c"a:0x%x b:0x%x\0A\00", align 1
@6 = private unnamed_addr constant [13 x i8] c"andVal:0x%x\0A\00", align 1
@7 = private unnamed_addr constant [12 x i8] c"orVal:0x%x\0A\00", align 1
@8 = private unnamed_addr constant [13 x i8] c"xorVal:0x%x\0A\00", align 1
@9 = private unnamed_addr constant [12 x i8] c"not a:0x%x\0A\00", align 1
@10 = private unnamed_addr constant [12 x i8] c"not b:0x%x\0A\00", align 1
@11 = private unnamed_addr constant [15 x i8] c"andeqVal:0x%x\0A\00", align 1
@12 = private unnamed_addr constant [14 x i8] c"oreqVal:0x%x\0A\00", align 1
@13 = private unnamed_addr constant [15 x i8] c"xoreqVal:0x%x\0A\00", align 1
@14 = private unnamed_addr constant [19 x i8] c"leftShiftVal:0x%x\0A\00", align 1
@15 = private unnamed_addr constant [20 x i8] c"rightShiftVal:0x%x\0A\00", align 1
@16 = private unnamed_addr constant [21 x i8] c"leftShiftEqVal:0x%x\0A\00", align 1
@17 = private unnamed_addr constant [22 x i8] c"rightShiftEqVal:0x%x\0A\00", align 1
@18 = private unnamed_addr constant [7 x i8] c"andVal\00", align 1
@19 = private unnamed_addr constant [6 x i8] c"orVal\00", align 1
@20 = private unnamed_addr constant [7 x i8] c"xorVal\00", align 1
@21 = private unnamed_addr constant [6 x i8] c"not a\00", align 1
@22 = private unnamed_addr constant [6 x i8] c"not b\00", align 1
@23 = private unnamed_addr constant [9 x i8] c"andeqVal\00", align 1
@24 = private unnamed_addr constant [8 x i8] c"oreqVal\00", align 1
@25 = private unnamed_addr constant [9 x i8] c"xoreqVal\00", align 1
@26 = private unnamed_addr constant [13 x i8] c"leftShiftVal\00", align 1
@27 = private unnamed_addr constant [23 x i8] c"rightShiftVal boundary\00", align 1
@28 = private unnamed_addr constant [34 x i8] c"boundary lshr 0x80000000>>1=0x%x\0A\00", align 1
@29 = private unnamed_addr constant [23 x i8] c"unsigned >> clears MSB\00", align 1
@30 = private unnamed_addr constant [20 x i8] c"signed -8 >> 1: %d\0A\00", align 1
@31 = private unnamed_addr constant [25 x i8] c"signed >> preserves sign\00", align 1

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

define void @report_result() {
entry:
  %0 = load i32, i32* @test_errors, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @3, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @main() {
entry:
  %const2 = bitcast i32 -1753917575 to i32
  %const1 = bitcast i32 -2023406815 to i32
  %const = bitcast i32 35930656 to i32
  %ashr = alloca i32, align 4
  %signedVal = alloca i32, align 4
  %lshr = alloca i32, align 4
  %msbSet = alloca i32, align 4
  %rightShiftVal = alloca i32, align 4
  %leftShiftVal = alloca i32, align 4
  %xoreqVal = alloca i32, align 4
  %oreqVal = alloca i32, align 4
  %andeqVal = alloca i32, align 4
  %notVal2 = alloca i32, align 4
  %notVal1 = alloca i32, align 4
  %xorVal = alloca i32, align 4
  %orVal = alloca i32, align 4
  %andVal = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @4, i32 0, i32 0))
  store i32 305419896, i32* %a, align 4
  store i32 %const1, i32* %b, align 4
  %1 = load i32, i32* %a, align 4
  %2 = load i32, i32* %b, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @5, i32 0, i32 0), i32 %1, i32 %2)
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %b, align 4
  %6 = and i32 %4, %5
  store i32 %6, i32* %andVal, align 4
  %7 = load i32, i32* %a, align 4
  %8 = load i32, i32* %b, align 4
  %9 = or i32 %7, %8
  store i32 %9, i32* %orVal, align 4
  %10 = load i32, i32* %a, align 4
  %11 = load i32, i32* %b, align 4
  %12 = xor i32 %10, %11
  store i32 %12, i32* %xorVal, align 4
  %13 = load i32, i32* %a, align 4
  %14 = xor i32 %13, -1
  store i32 %14, i32* %notVal1, align 4
  %15 = load i32, i32* %b, align 4
  %16 = xor i32 %15, -1
  store i32 %16, i32* %notVal2, align 4
  %17 = load i32, i32* %andVal, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @6, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %orVal, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @7, i32 0, i32 0), i32 %19)
  %21 = load i32, i32* %xorVal, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @8, i32 0, i32 0), i32 %21)
  %23 = load i32, i32* %notVal1, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @9, i32 0, i32 0), i32 %23)
  %25 = load i32, i32* %notVal2, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @10, i32 0, i32 0), i32 %25)
  %27 = load i32, i32* %andVal, align 4
  store i32 %27, i32* %andeqVal, align 4
  %28 = load i32, i32* %a, align 4
  %29 = load i32, i32* %andeqVal, align 4
  %30 = and i32 %29, %28
  store i32 %30, i32* %andeqVal, align 4
  %31 = load i32, i32* %andeqVal, align 4
  %32 = load i32, i32* %orVal, align 4
  store i32 %32, i32* %oreqVal, align 4
  %33 = load i32, i32* %a, align 4
  %34 = load i32, i32* %oreqVal, align 4
  %35 = or i32 %34, %33
  store i32 %35, i32* %oreqVal, align 4
  %36 = load i32, i32* %oreqVal, align 4
  %37 = load i32, i32* %xorVal, align 4
  store i32 %37, i32* %xoreqVal, align 4
  %38 = load i32, i32* %a, align 4
  %39 = load i32, i32* %xoreqVal, align 4
  %40 = xor i32 %39, %38
  store i32 %40, i32* %xoreqVal, align 4
  %41 = load i32, i32* %xoreqVal, align 4
  %42 = load i32, i32* %andeqVal, align 4
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @11, i32 0, i32 0), i32 %42)
  %44 = load i32, i32* %oreqVal, align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @12, i32 0, i32 0), i32 %44)
  %46 = load i32, i32* %xoreqVal, align 4
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @13, i32 0, i32 0), i32 %46)
  %48 = load i32, i32* %a, align 4
  %49 = shl i32 %48, 8
  store i32 %49, i32* %leftShiftVal, align 4
  %50 = load i32, i32* %b, align 4
  %51 = lshr i32 %50, 8
  store i32 %51, i32* %rightShiftVal, align 4
  %52 = load i32, i32* %leftShiftVal, align 4
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @14, i32 0, i32 0), i32 %52)
  %54 = load i32, i32* %rightShiftVal, align 4
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @15, i32 0, i32 0), i32 %54)
  %56 = load i32, i32* %leftShiftVal, align 4
  %57 = shl i32 %56, 8
  store i32 %57, i32* %leftShiftVal, align 4
  %58 = load i32, i32* %leftShiftVal, align 4
  %59 = load i32, i32* %rightShiftVal, align 4
  %60 = lshr i32 %59, 8
  store i32 %60, i32* %rightShiftVal, align 4
  %61 = load i32, i32* %rightShiftVal, align 4
  %62 = load i32, i32* %leftShiftVal, align 4
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @16, i32 0, i32 0), i32 %62)
  %64 = load i32, i32* %rightShiftVal, align 4
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @17, i32 0, i32 0), i32 %64)
  %66 = load i32, i32* %andVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @18, i32 0, i32 0), i32 %66, i32 %const)
  %67 = load i32, i32* %orVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @19, i32 0, i32 0), i32 %67, i32 %const2)
  %68 = load i32, i32* %xorVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @20, i32 0, i32 0), i32 %68, i32 -1789848231)
  %69 = load i32, i32* %notVal1, align 4
  call void @check_uint(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @21, i32 0, i32 0), i32 %69, i32 -305419897)
  %70 = load i32, i32* %notVal2, align 4
  call void @check_uint(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @22, i32 0, i32 0), i32 %70, i32 2023406814)
  %71 = load i32, i32* %andeqVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @23, i32 0, i32 0), i32 %71, i32 %const)
  %72 = load i32, i32* %oreqVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @24, i32 0, i32 0), i32 %72, i32 %const2)
  %73 = load i32, i32* %xoreqVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @25, i32 0, i32 0), i32 %73, i32 %const1)
  %74 = load i32, i32* %leftShiftVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @26, i32 0, i32 0), i32 %74, i32 1450704896)
  %75 = load i32, i32* %rightShiftVal, align 4
  call void @check_uint(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @27, i32 0, i32 0), i32 %75, i32 34661)
  store i32 -2147483648, i32* %msbSet, align 4
  %76 = load i32, i32* %msbSet, align 4
  %77 = lshr i32 %76, 1
  store i32 %77, i32* %lshr, align 4
  %78 = load i32, i32* %lshr, align 4
  %79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @28, i32 0, i32 0), i32 %78)
  %80 = load i32, i32* %lshr, align 4
  call void @check_uint(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @29, i32 0, i32 0), i32 %80, i32 1073741824)
  store i32 -8, i32* %signedVal, align 4
  %81 = load i32, i32* %signedVal, align 4
  %82 = ashr i32 %81, 1
  store i32 %82, i32* %ashr, align 4
  %83 = load i32, i32* %ashr, align 4
  %84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @30, i32 0, i32 0), i32 %83)
  %85 = load i32, i32* %ashr, align 4
  call void @check_int(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @31, i32 0, i32 0), i32 %85, i32 -4)
  call void @report_result()
  %86 = load i32, i32* @test_errors, align 4
  ret i32 %86
}
