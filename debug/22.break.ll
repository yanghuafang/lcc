; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countNumber(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, i32* %maxRange, align 4
  store i32 %1, i32* %smallRange, align 4
  store i32 0, i32* %count, align 4
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
  br i1 %7, label %for.end, label %if.end

if.end:                                           ; preds = %for.loop
  %8 = load i32, i32* %count, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %count, align 4
  %10 = load i32, i32* %count, align 4
  %11 = load i32, i32* %i, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %i, align 4
  %13 = load i32, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.loop, %for.cond
  %14 = load i32, i32* %count, align 4
  ret i32 %14
}

define i32 @countNumber2(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, i32* %maxRange, align 4
  store i32 %1, i32* %smallRange, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %maxRange, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %smallRange, align 4
  %7 = icmp sgt i32 %5, %6
  br i1 %7, label %while.end, label %if.end

if.end:                                           ; preds = %while.loop
  %8 = load i32, i32* %count, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %count, align 4
  %10 = load i32, i32* %count, align 4
  %11 = load i32, i32* %i, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %i, align 4
  %13 = load i32, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.loop, %while.cond
  %14 = load i32, i32* %count, align 4
  ret i32 %14
}

define i32 @countNumber3(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, i32* %maxRange, align 4
  store i32 %1, i32* %smallRange, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %i, align 4
  br label %do.loop

do.loop:                                          ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %smallRange, align 4
  %4 = icmp sgt i32 %2, %3
  br i1 %4, label %do.end, label %if.end

if.end:                                           ; preds = %do.loop
  %5 = load i32, i32* %count, align 4
  %6 = add i32 %5, 1
  store i32 %6, i32* %count, align 4
  %7 = load i32, i32* %count, align 4
  %8 = load i32, i32* %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %maxRange, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %do.loop, label %do.end

do.end:                                           ; preds = %do.loop, %if.end
  %14 = load i32, i32* %count, align 4
  ret i32 %14
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @countNumber(i32 100, i32 37)
  %1 = icmp ne i32 %0, 37
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countNumber2(i32 100, i32 37)
  %4 = icmp ne i32 %3, 37
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37)
  %7 = icmp ne i32 %6, 37
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countNumber(i32 10, i32 10)
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10)
  %13 = icmp ne i32 %12, 10
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10)
  %16 = icmp ne i32 %15, 10
  br i1 %16, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @countNumber(i32 5, i32 0)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %26 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %27 = load i32, i32* %err, align 4
  %28 = icmp eq i32 %27, 0
  %. = select i1 %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0)
  %29 = call i32 (i8*, ...) @printf(i8* %.)
  %30 = load i32, i32* %err, align 4
  ret i32 %30
}
