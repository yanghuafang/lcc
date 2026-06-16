; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [25 x i8] c"**** 21.continue.c ****\0A\00", align 1
@4 = private unnamed_addr constant [23 x i8] c"even number in 32: %d\0A\00", align 1
@5 = private unnamed_addr constant [23 x i8] c"even number in 32: %d\0A\00", align 1
@6 = private unnamed_addr constant [23 x i8] c"even number in 32: %d\0A\00", align 1
@7 = private unnamed_addr constant [13 x i8] c"for continue\00", align 1
@8 = private unnamed_addr constant [15 x i8] c"while continue\00", align 1
@9 = private unnamed_addr constant [18 x i8] c"do-while continue\00", align 1
@10 = private unnamed_addr constant [13 x i8] c"boundary n=0\00", align 1
@11 = private unnamed_addr constant [13 x i8] c"boundary n=1\00", align 1

declare i32 @printf(i8*, ...)

define void @check_int(i8* %0, i32 %1, i32 %2) {
entry:
  %expected = alloca i32, align 4
  %actual = alloca i32, align 4
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i32 %1, i32* %actual, align 4
  store i32 %2, i32* %expected, align 4
  %3 = load i32, i32* %actual, align 4
  %4 = load i32, i32* %expected, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i32, i32* %actual, align 4
  %8 = load i32, i32* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @0, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
  %10 = load i32, i32* @test_errors, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* @test_errors, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @report_result() {
entry:
  %0 = load i32, i32* @test_errors, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @1, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @2, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

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
  %eventNumberIn32 = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @3, i32 0, i32 0))
  %1 = call i32 @countEvenNumber(i32 32)
  store i32 %1, i32* %eventNumberIn32, align 4
  %2 = load i32, i32* %eventNumberIn32, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @4, i32 0, i32 0), i32 %2)
  %4 = call i32 @countEvenNumber2(i32 32)
  store i32 %4, i32* %eventNumberIn32, align 4
  %5 = load i32, i32* %eventNumberIn32, align 4
  %6 = load i32, i32* %eventNumberIn32, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @5, i32 0, i32 0), i32 %6)
  %8 = call i32 @countEvenNumber3(i32 32)
  store i32 %8, i32* %eventNumberIn32, align 4
  %9 = load i32, i32* %eventNumberIn32, align 4
  %10 = load i32, i32* %eventNumberIn32, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @6, i32 0, i32 0), i32 %10)
  %12 = call i32 @countEvenNumber(i32 32)
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @7, i32 0, i32 0), i32 %12, i32 16)
  %13 = call i32 @countEvenNumber2(i32 32)
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @8, i32 0, i32 0), i32 %13, i32 16)
  %14 = call i32 @countEvenNumber3(i32 32)
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @9, i32 0, i32 0), i32 %14, i32 16)
  %15 = call i32 @countEvenNumber(i32 0)
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @10, i32 0, i32 0), i32 %15, i32 0)
  %16 = call i32 @countEvenNumber(i32 1)
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @11, i32 0, i32 0), i32 %16, i32 0)
  call void @report_result()
  %17 = load i32, i32* @test_errors, align 4
  ret i32 %17
}
