; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [11 x i8] c"a:%d b:%d\0A\00", align 1
@1 = private unnamed_addr constant [12 x i8] c"sum: %d %d\0A\00", align 1
@2 = private unnamed_addr constant [18 x i8] c"sub: %d %d %d %d\0A\00", align 1
@3 = private unnamed_addr constant [9 x i8] c"mul: %d\0A\00", align 1
@4 = private unnamed_addr constant [9 x i8] c"div: %d\0A\00", align 1
@5 = private unnamed_addr constant [9 x i8] c"mod: %d\0A\00", align 1
@6 = private unnamed_addr constant [11 x i8] c"sumeq: %d\0A\00", align 1
@7 = private unnamed_addr constant [11 x i8] c"subeq: %d\0A\00", align 1
@8 = private unnamed_addr constant [11 x i8] c"muleq: %d\0A\00", align 1
@9 = private unnamed_addr constant [11 x i8] c"diveq: %d\0A\00", align 1
@10 = private unnamed_addr constant [11 x i8] c"modeq: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %modeq = alloca i32, align 4
  %diveq = alloca i32, align 4
  %muleq = alloca i32, align 4
  %subeq = alloca i32, align 4
  %sumeq = alloca i32, align 4
  %mod = alloca i32, align 4
  %div = alloca i32, align 4
  %mul = alloca i32, align 4
  %sub4 = alloca i32, align 4
  %sub3 = alloca i32, align 4
  %sub2 = alloca i32, align 4
  %sub = alloca i32, align 4
  %sum2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 37, i32* %a, align 4
  store i32 8, i32* %b, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = add i32 %0, %1
  store i32 %2, i32* %sum, align 4
  store i32 45, i32* %sum2, align 4
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %5 = sub i32 %3, %4
  store i32 %5, i32* %sub, align 4
  %6 = load i32, i32* %b, align 4
  %7 = load i32, i32* %a, align 4
  %8 = sub i32 %6, %7
  store i32 %8, i32* %sub2, align 4
  store i32 29, i32* %sub3, align 4
  store i32 -29, i32* %sub4, align 4
  %9 = load i32, i32* %a, align 4
  %10 = load i32, i32* %b, align 4
  %11 = mul i32 %9, %10
  store i32 %11, i32* %mul, align 4
  %12 = load i32, i32* %a, align 4
  %13 = load i32, i32* %b, align 4
  %14 = sdiv i32 %12, %13
  store i32 %14, i32* %div, align 4
  %15 = load i32, i32* %a, align 4
  %16 = load i32, i32* %b, align 4
  %17 = srem i32 %15, %16
  store i32 %17, i32* %mod, align 4
  %18 = load i32, i32* %sum, align 4
  store i32 %18, i32* %sumeq, align 4
  %19 = load i32, i32* %b, align 4
  %20 = load i32, i32* %sumeq, align 4
  %21 = add i32 %20, %19
  store i32 %21, i32* %sumeq, align 4
  %22 = load i32, i32* %sumeq, align 4
  %23 = load i32, i32* %sumeq, align 4
  store i32 %23, i32* %subeq, align 4
  %24 = load i32, i32* %b, align 4
  %25 = load i32, i32* %subeq, align 4
  %26 = sub i32 %25, %24
  store i32 %26, i32* %subeq, align 4
  %27 = load i32, i32* %subeq, align 4
  %28 = load i32, i32* %subeq, align 4
  store i32 %28, i32* %muleq, align 4
  %29 = load i32, i32* %b, align 4
  %30 = load i32, i32* %muleq, align 4
  %31 = mul i32 %30, %29
  store i32 %31, i32* %muleq, align 4
  %32 = load i32, i32* %muleq, align 4
  %33 = load i32, i32* %muleq, align 4
  store i32 %33, i32* %diveq, align 4
  %34 = load i32, i32* %b, align 4
  %35 = load i32, i32* %diveq, align 4
  %36 = sdiv i32 %35, %34
  store i32 %36, i32* %diveq, align 4
  %37 = load i32, i32* %diveq, align 4
  %38 = load i32, i32* %diveq, align 4
  store i32 %38, i32* %modeq, align 4
  %39 = load i32, i32* %b, align 4
  %40 = load i32, i32* %modeq, align 4
  %41 = srem i32 %40, %39
  store i32 %41, i32* %modeq, align 4
  %42 = load i32, i32* %modeq, align 4
  %43 = load i32, i32* %a, align 4
  %44 = load i32, i32* %b, align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @0, i32 0, i32 0), i32 %43, i32 %44)
  %46 = load i32, i32* %sum, align 4
  %47 = load i32, i32* %sum2, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @1, i32 0, i32 0), i32 %46, i32 %47)
  %49 = load i32, i32* %sub, align 4
  %50 = load i32, i32* %sub2, align 4
  %51 = load i32, i32* %sub3, align 4
  %52 = load i32, i32* %sub4, align 4
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @2, i32 0, i32 0), i32 %49, i32 %50, i32 %51, i32 %52)
  %54 = load i32, i32* %mul, align 4
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @3, i32 0, i32 0), i32 %54)
  %56 = load i32, i32* %div, align 4
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @4, i32 0, i32 0), i32 %56)
  %58 = load i32, i32* %mod, align 4
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @5, i32 0, i32 0), i32 %58)
  %60 = load i32, i32* %sumeq, align 4
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @6, i32 0, i32 0), i32 %60)
  %62 = load i32, i32* %subeq, align 4
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @7, i32 0, i32 0), i32 %62)
  %64 = load i32, i32* %muleq, align 4
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @8, i32 0, i32 0), i32 %64)
  %66 = load i32, i32* %diveq, align 4
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @9, i32 0, i32 0), i32 %66)
  %68 = load i32, i32* %modeq, align 4
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @10, i32 0, i32 0), i32 %68)
  ret i32 undef
}
