; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [18 x i8] c"1+2+...+100 = %d\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"1+2+...+100 = %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countSum(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %sum, align 4
  store i32 1, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %sum, align 4
  %6 = add i32 %5, %4
  store i32 %6, i32* %sum, align 4
  %7 = load i32, i32* %sum, align 4
  %8 = load i32, i32* %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %sum, align 4
  ret i32 %11
}

define i32 @countSum2(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %do.loop

do.loop:                                          ; preds = %do.loop, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %sum, align 4
  %3 = add i32 %2, %1
  store i32 %3, i32* %sum, align 4
  %4 = load i32, i32* %sum, align 4
  %5 = load i32, i32* %i, align 4
  %6 = add i32 %5, 1
  store i32 %6, i32* %i, align 4
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %n, align 4
  %10 = icmp sle i32 %8, %9
  br i1 %10, label %do.loop, label %do.end

do.end:                                           ; preds = %do.loop
  %11 = load i32, i32* %sum, align 4
  ret i32 %11
}

define i32 @main() {
entry:
  %sum100 = alloca i32, align 4
  %0 = call i32 @countSum(i32 100)
  store i32 %0, i32* %sum100, align 4
  %1 = load i32, i32* %sum100, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0), i32 %1)
  %3 = call i32 @countSum2(i32 100)
  store i32 %3, i32* %sum100, align 4
  %4 = load i32, i32* %sum100, align 4
  %5 = load i32, i32* %sum100, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0), i32 %5)
  ret i32 0
}
