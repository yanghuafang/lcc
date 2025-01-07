; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [19 x i8] c"%d %d %d %d %d %d\0A\00", align 1
@1 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %h = alloca i32, align 4
  %g = alloca i32, align 4
  %f = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 1, i32* %b, align 4
  store i32 2, i32* %c, align 4
  store i32 3, i32* %d, align 4
  store i32 0, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  store i32 4, i32* %e, align 4
  %1 = load i32, i32* %e, align 4
  store i32 5, i32* %f, align 4
  %2 = load i32, i32* %f, align 4
  store i32 6, i32* %g, align 4
  %3 = load i32, i32* %g, align 4
  store i32 7, i32* %h, align 4
  %4 = load i32, i32* %h, align 4
  %5 = load i32, i32* %a, align 4
  %6 = load i32, i32* %b, align 4
  %7 = load i32, i32* %c, align 4
  %8 = load i32, i32* %d, align 4
  %9 = load i32, i32* %e, align 4
  %10 = load i32, i32* %f, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10)
  %12 = load i32, i32* %g, align 4
  %13 = load i32, i32* %h, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @1, i32 0, i32 0), i32 %12, i32 %13)
  ret i32 0
}
