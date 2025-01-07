; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [16 x i8] c"2 + 4 * 5 = %d\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"(2 + 4) * 5 = %d\0A\00", align 1
@2 = private unnamed_addr constant [18 x i8] c"5 * (2 - 4) = %d\0A\00", align 1
@3 = private unnamed_addr constant [18 x i8] c"2 - 4 mod 5 = %d\0A\00", align 1
@4 = private unnamed_addr constant [18 x i8] c"(2 + 4) / 5 = %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @checkArithmetic() {
entry:
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 4, i32* %b, align 4
  store i32 5, i32* %c, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = load i32, i32* %c, align 4
  %3 = mul i32 %1, %2
  %4 = add i32 %0, %3
  store i32 %4, i32* %d, align 4
  %5 = load i32, i32* %d, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i32 %5)
  %7 = load i32, i32* %a, align 4
  %8 = load i32, i32* %b, align 4
  %9 = add i32 %7, %8
  %10 = load i32, i32* %c, align 4
  %11 = mul i32 %9, %10
  store i32 %11, i32* %d, align 4
  %12 = load i32, i32* %d, align 4
  %13 = load i32, i32* %d, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0), i32 %13)
  %15 = load i32, i32* %c, align 4
  %16 = load i32, i32* %a, align 4
  %17 = load i32, i32* %b, align 4
  %18 = sub i32 %16, %17
  %19 = mul i32 %15, %18
  store i32 %19, i32* %d, align 4
  %20 = load i32, i32* %d, align 4
  %21 = load i32, i32* %d, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @2, i32 0, i32 0), i32 %21)
  %23 = load i32, i32* %a, align 4
  %24 = load i32, i32* %b, align 4
  %25 = load i32, i32* %c, align 4
  %26 = srem i32 %24, %25
  %27 = sub i32 %23, %26
  store i32 %27, i32* %d, align 4
  %28 = load i32, i32* %d, align 4
  %29 = load i32, i32* %d, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @3, i32 0, i32 0), i32 %29)
  %31 = load i32, i32* %a, align 4
  %32 = load i32, i32* %b, align 4
  %33 = add i32 %31, %32
  %34 = load i32, i32* %c, align 4
  %35 = sdiv i32 %33, %34
  store i32 %35, i32* %d, align 4
  %36 = load i32, i32* %d, align 4
  %37 = load i32, i32* %d, align 4
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @4, i32 0, i32 0), i32 %37)
  ret void
}

define i32 @main() {
entry:
  call void @checkArithmetic()
  ret i32 0
}
