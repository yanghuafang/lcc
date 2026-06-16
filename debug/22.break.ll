; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [6 x i8] c"i:%d\0A\00", align 1
@4 = private unnamed_addr constant [22 x i8] c"**** 22.break.c ****\0A\00", align 1
@5 = private unnamed_addr constant [19 x i8] c"count 1 to 37: %d\0A\00", align 1
@6 = private unnamed_addr constant [12 x i8] c"count to 37\00", align 1
@7 = private unnamed_addr constant [18 x i8] c"break at boundary\00", align 1
@8 = private unnamed_addr constant [18 x i8] c"break immediately\00", align 1

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
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @3, i32 0, i32 0), i32 %16)
  %18 = load i32, i32* %count, align 4
  ret i32 %18
}

define i32 @main() {
entry:
  %count = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @4, i32 0, i32 0))
  %1 = call i32 @countNumber(i32 100, i32 37)
  store i32 %1, i32* %count, align 4
  %2 = load i32, i32* %count, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @5, i32 0, i32 0), i32 %2)
  %4 = load i32, i32* %count, align 4
  call void @check_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @6, i32 0, i32 0), i32 %4, i32 37)
  %5 = call i32 @countNumber(i32 10, i32 10)
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @7, i32 0, i32 0), i32 %5, i32 10)
  %6 = call i32 @countNumber(i32 5, i32 0)
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @8, i32 0, i32 0), i32 %6, i32 0)
  call void @report_result()
  %7 = load i32, i32* @test_errors, align 4
  ret i32 %7
}
