; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [15 x i8] c"a:0x%x b:0x%x\0A\00", align 1
@1 = private unnamed_addr constant [13 x i8] c"andVal:0x%x\0A\00", align 1
@2 = private unnamed_addr constant [12 x i8] c"orVal:0x%x\0A\00", align 1
@3 = private unnamed_addr constant [13 x i8] c"xorVal:0x%x\0A\00", align 1
@4 = private unnamed_addr constant [12 x i8] c"not a:0x%x\0A\00", align 1
@5 = private unnamed_addr constant [12 x i8] c"not b:0x%x\0A\00", align 1
@6 = private unnamed_addr constant [15 x i8] c"andeqVal:0x%x\0A\00", align 1
@7 = private unnamed_addr constant [14 x i8] c"oreqVal:0x%x\0A\00", align 1
@8 = private unnamed_addr constant [15 x i8] c"xoreqVal:0x%x\0A\00", align 1
@9 = private unnamed_addr constant [19 x i8] c"leftShiftVal:0x%x\0A\00", align 1
@10 = private unnamed_addr constant [20 x i8] c"rightShiftVal:0x%x\0A\00", align 1
@11 = private unnamed_addr constant [21 x i8] c"leftShiftEqVal:0x%x\0A\00", align 1
@12 = private unnamed_addr constant [22 x i8] c"rightShiftEqVal:0x%x\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
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
  store i32 305419896, i32* %a, align 4
  store i32 -2023406815, i32* %b, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @0, i32 0, i32 0), i32 %0, i32 %1)
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %5 = and i32 %3, %4
  store i32 %5, i32* %andVal, align 4
  %6 = load i32, i32* %a, align 4
  %7 = load i32, i32* %b, align 4
  %8 = or i32 %6, %7
  store i32 %8, i32* %orVal, align 4
  %9 = load i32, i32* %a, align 4
  %10 = load i32, i32* %b, align 4
  %11 = xor i32 %9, %10
  store i32 %11, i32* %xorVal, align 4
  %12 = load i32, i32* %a, align 4
  %13 = xor i32 %12, -1
  store i32 %13, i32* %notVal1, align 4
  %14 = load i32, i32* %b, align 4
  %15 = xor i32 %14, -1
  store i32 %15, i32* %notVal2, align 4
  %16 = load i32, i32* %andVal, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @1, i32 0, i32 0), i32 %16)
  %18 = load i32, i32* %orVal, align 4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i32 0, i32 0), i32 %18)
  %20 = load i32, i32* %xorVal, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0), i32 %20)
  %22 = load i32, i32* %notVal1, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @4, i32 0, i32 0), i32 %22)
  %24 = load i32, i32* %notVal2, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @5, i32 0, i32 0), i32 %24)
  %26 = load i32, i32* %andVal, align 4
  store i32 %26, i32* %andeqVal, align 4
  %27 = load i32, i32* %a, align 4
  %28 = load i32, i32* %andeqVal, align 4
  %29 = and i32 %28, %27
  store i32 %29, i32* %andeqVal, align 4
  %30 = load i32, i32* %andeqVal, align 4
  %31 = load i32, i32* %orVal, align 4
  store i32 %31, i32* %oreqVal, align 4
  %32 = load i32, i32* %a, align 4
  %33 = load i32, i32* %oreqVal, align 4
  %34 = or i32 %33, %32
  store i32 %34, i32* %oreqVal, align 4
  %35 = load i32, i32* %oreqVal, align 4
  %36 = load i32, i32* %xorVal, align 4
  store i32 %36, i32* %xoreqVal, align 4
  %37 = load i32, i32* %a, align 4
  %38 = load i32, i32* %xoreqVal, align 4
  %39 = xor i32 %38, %37
  store i32 %39, i32* %xoreqVal, align 4
  %40 = load i32, i32* %xoreqVal, align 4
  %41 = load i32, i32* %andeqVal, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0), i32 %41)
  %43 = load i32, i32* %oreqVal, align 4
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @7, i32 0, i32 0), i32 %43)
  %45 = load i32, i32* %xoreqVal, align 4
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @8, i32 0, i32 0), i32 %45)
  %47 = load i32, i32* %a, align 4
  %48 = shl i32 %47, 8
  store i32 %48, i32* %leftShiftVal, align 4
  %49 = load i32, i32* %b, align 4
  %50 = ashr i32 %49, 8
  store i32 %50, i32* %rightShiftVal, align 4
  %51 = load i32, i32* %leftShiftVal, align 4
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @9, i32 0, i32 0), i32 %51)
  %53 = load i32, i32* %rightShiftVal, align 4
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @10, i32 0, i32 0), i32 %53)
  %55 = load i32, i32* %leftShiftVal, align 4
  %56 = shl i32 %55, 8
  store i32 %56, i32* %leftShiftVal, align 4
  %57 = load i32, i32* %leftShiftVal, align 4
  %58 = load i32, i32* %rightShiftVal, align 4
  %59 = ashr i32 %58, 8
  store i32 %59, i32* %rightShiftVal, align 4
  %60 = load i32, i32* %rightShiftVal, align 4
  %61 = load i32, i32* %leftShiftVal, align 4
  %62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @11, i32 0, i32 0), i32 %61)
  %63 = load i32, i32* %rightShiftVal, align 4
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @12, i32 0, i32 0), i32 %63)
  ret i32 0
}
