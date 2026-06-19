; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countEvenNumber(i32 %0) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %5 = srem i32 %4, 2
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %for.update, label %if.end

if.end:                                           ; preds = %for.loop
  %7 = load i32, i32* %count, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* %count, align 4
  %9 = load i32, i32* %count, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop, %if.end
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  %12 = load i32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %count, align 4
  ret i32 %13
}

define i32 @countEvenNumber2(i32 %0) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4
  %5 = srem i32 %4, 2
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %then, label %if.end

then:                                             ; preds = %while.loop
  %7 = load i32, i32* %i, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* %i, align 4
  %9 = load i32, i32* %i, align 4
  br label %while.cond

if.end:                                           ; preds = %while.loop
  %10 = load i32, i32* %count, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %count, align 4
  %12 = load i32, i32* %count, align 4
  %13 = load i32, i32* %i, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %i, align 4
  %15 = load i32, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %16 = load i32, i32* %count, align 4
  ret i32 %16
}

define i32 @countEvenNumber3(i32 %0) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %i, align 4
  br label %do.loop

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %i, align 4
  %2 = srem i32 %1, 2
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %then, label %if.end

then:                                             ; preds = %do.loop
  %4 = load i32, i32* %i, align 4
  %5 = add i32 %4, 1
  store i32 %5, i32* %i, align 4
  %6 = load i32, i32* %i, align 4
  br label %do.cond

if.end:                                           ; preds = %do.loop
  %7 = load i32, i32* %count, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* %count, align 4
  %9 = load i32, i32* %count, align 4
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  %12 = load i32, i32* %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %n, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %do.loop, label %do.end

do.end:                                           ; preds = %do.cond
  %16 = load i32, i32* %count, align 4
  ret i32 %16
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @countEvenNumber(i32 32)
  %1 = icmp ne i32 %0, 16
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countEvenNumber2(i32 32)
  %4 = icmp ne i32 %3, 16
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countEvenNumber3(i32 32)
  %7 = icmp ne i32 %6, 16
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countEvenNumber(i32 0)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countEvenNumber(i32 1)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4
  %16 = icmp eq i32 %15, 0
  %. = select i1 %16, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0)
  %17 = call i32 (i8*, ...) @printf(i8* %.)
  %18 = load i32, i32* %err, align 4
  ret i32 %18
}
