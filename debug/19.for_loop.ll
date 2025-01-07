; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [18 x i8] c"1+2+...+100 = %d\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"1+2+...+100 = %d\0A\00", align 1
@2 = private unnamed_addr constant [18 x i8] c"1+2+...+100 = %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countSum(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %sum, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %sum, align 4
  %6 = add i32 %5, %4
  store i32 %6, i32* %sum, align 4
  %7 = load i32, i32* %sum, align 4
  %8 = load i32, i32* %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
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
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %sum, align 4
  %6 = add i32 %5, %4
  store i32 %6, i32* %sum, align 4
  %7 = load i32, i32* %sum, align 4
  %8 = load i32, i32* %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %sum, align 4
  ret i32 %11
}

define i32 @countSum3(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %sum, align 4
  store i32 1, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.loop, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %sum, align 4
  %7 = add i32 %6, %5
  store i32 %7, i32* %sum, align 4
  %8 = load i32, i32* %sum, align 4
  %9 = load i32, i32* %i, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %i, align 4
  %11 = load i32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4
  ret i32 %12
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
  %7 = call i32 @countSum3(i32 100)
  store i32 %7, i32* %sum100, align 4
  %8 = load i32, i32* %sum100, align 4
  %9 = load i32, i32* %sum100, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @2, i32 0, i32 0), i32 %9)
  ret i32 0
}
