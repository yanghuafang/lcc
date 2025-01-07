; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [6 x i8] c"i:%d\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"count 1 to 37: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countNumber(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %recordi = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, i32* %maxRange, align 4
  store i32 %1, i32* %smallRange, align 4
  store i32 0, i32* %count, align 4
  store i32 0, i32* %recordi, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %maxRange, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %smallRange, align 4
  %7 = icmp sgt i32 %5, %6
  br i1 %7, label %then, label %if.end

then:                                             ; preds = %for.loop
  %8 = load i32, i32* %i, align 4
  store i32 %8, i32* %recordi, align 4
  %9 = load i32, i32* %recordi, align 4
  br label %for.end

if.end:                                           ; preds = %for.loop
  %10 = load i32, i32* %count, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %count, align 4
  %12 = load i32, i32* %count, align 4
  %13 = load i32, i32* %i, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %i, align 4
  %15 = load i32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond, %then
  %16 = load i32, i32* %recordi, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @0, i32 0, i32 0), i32 %16)
  %18 = load i32, i32* %count, align 4
  ret i32 %18
}

define i32 @main() {
entry:
  %count = alloca i32, align 4
  %0 = call i32 @countNumber(i32 100, i32 37)
  store i32 %0, i32* %count, align 4
  %1 = load i32, i32* %count, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), i32 %1)
  ret i32 0
}
