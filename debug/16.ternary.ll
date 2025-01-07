; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [11 x i8] c"minVal:%d\0A\00", align 1
@1 = private unnamed_addr constant [11 x i8] c"maxVal:%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %maxVal = alloca i32, align 4
  %minVal = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 3, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 7, i32* %c, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %c, align 4
  %2 = icmp slt i32 %0, %1
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %c, align 4
  %5 = select i1 %2, i32 %3, i32 %4
  store i32 %5, i32* %minVal, align 4
  %6 = load i32, i32* %a, align 4
  %7 = load i32, i32* %c, align 4
  %8 = icmp slt i32 %6, %7
  %9 = load i32, i32* %c, align 4
  %10 = load i32, i32* %a, align 4
  %11 = select i1 %8, i32 %9, i32 %10
  store i32 %11, i32* %maxVal, align 4
  %12 = load i32, i32* %minVal, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @0, i32 0, i32 0), i32 %12)
  %14 = load i32, i32* %maxVal, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @1, i32 0, i32 0), i32 %14)
  ret i32 0
}
