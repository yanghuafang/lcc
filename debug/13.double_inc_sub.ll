; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"after a++, a: %d b: %d\0A\00", align 1
@2 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@3 = private unnamed_addr constant [24 x i8] c"after ++a, a: %d c: %d\0A\00", align 1
@4 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@5 = private unnamed_addr constant [24 x i8] c"after a--, a: %d d: %d\0A\00", align 1
@6 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@7 = private unnamed_addr constant [24 x i8] c"after --a, a: %d e: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 13, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @0, i32 0, i32 0), i32 %0)
  %2 = load i32, i32* %a, align 4
  %3 = add i32 %2, 1
  store i32 %3, i32* %a, align 4
  store i32 %2, i32* %b, align 4
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %b, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), i32 %4, i32 %5)
  store i32 13, i32* %a, align 4
  %7 = load i32, i32* %a, align 4
  %8 = load i32, i32* %a, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @2, i32 0, i32 0), i32 %8)
  %10 = load i32, i32* %a, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %a, align 4
  %12 = load i32, i32* %a, align 4
  store i32 %12, i32* %c, align 4
  %13 = load i32, i32* %a, align 4
  %14 = load i32, i32* %c, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @3, i32 0, i32 0), i32 %13, i32 %14)
  store i32 13, i32* %a, align 4
  %16 = load i32, i32* %a, align 4
  %17 = load i32, i32* %a, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %a, align 4
  %20 = sub i32 %19, 1
  store i32 %20, i32* %a, align 4
  store i32 %19, i32* %d, align 4
  %21 = load i32, i32* %a, align 4
  %22 = load i32, i32* %d, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @5, i32 0, i32 0), i32 %21, i32 %22)
  store i32 13, i32* %a, align 4
  %24 = load i32, i32* %a, align 4
  %25 = load i32, i32* %a, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @6, i32 0, i32 0), i32 %25)
  %27 = load i32, i32* %a, align 4
  %28 = sub i32 %27, 1
  store i32 %28, i32* %a, align 4
  %29 = load i32, i32* %a, align 4
  store i32 %29, i32* %e, align 4
  %30 = load i32, i32* %a, align 4
  %31 = load i32, i32* %e, align 4
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @7, i32 0, i32 0), i32 %30, i32 %31)
  ret i32 0
}
