; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

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
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @countSum(i32 100)
  %1 = icmp ne i32 %0, 5050
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100)
  %4 = icmp ne i32 %3, 5050
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum(i32 0)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum2(i32 0)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, i32* %err, align 4
  %13 = icmp eq i32 %12, 0
  %. = select i1 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0)
  %14 = call i32 (i8*, ...) @printf(i8* %.)
  %15 = load i32, i32* %err, align 4
  ret i32 %15
}
