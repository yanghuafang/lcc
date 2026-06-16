; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [24 x i8] c"**** 16.ternary.c ****\0A\00", align 1
@4 = private unnamed_addr constant [11 x i8] c"minVal:%d\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"maxVal:%d\0A\00", align 1
@6 = private unnamed_addr constant [7 x i8] c"minVal\00", align 1
@7 = private unnamed_addr constant [7 x i8] c"maxVal\00", align 1
@8 = private unnamed_addr constant [16 x i8] c"minNeg boundary\00", align 1
@9 = private unnamed_addr constant [16 x i8] c"maxNeg boundary\00", align 1
@10 = private unnamed_addr constant [15 x i8] c"equal operands\00", align 1

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

define i32 @main() {
entry:
  %ternarySame = alloca i32, align 4
  %same = alloca i32, align 4
  %maxNeg = alloca i32, align 4
  %minNeg = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %maxVal = alloca i32, align 4
  %minVal = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @3, i32 0, i32 0))
  store i32 3, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 7, i32* %c, align 4
  %1 = load i32, i32* %a, align 4
  %2 = load i32, i32* %c, align 4
  %3 = icmp slt i32 %1, %2
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %c, align 4
  %6 = select i1 %3, i32 %4, i32 %5
  store i32 %6, i32* %minVal, align 4
  %7 = load i32, i32* %a, align 4
  %8 = load i32, i32* %c, align 4
  %9 = icmp slt i32 %7, %8
  %10 = load i32, i32* %c, align 4
  %11 = load i32, i32* %a, align 4
  %12 = select i1 %9, i32 %10, i32 %11
  store i32 %12, i32* %maxVal, align 4
  %13 = load i32, i32* %minVal, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @4, i32 0, i32 0), i32 %13)
  %15 = load i32, i32* %maxVal, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i32 %15)
  %17 = load i32, i32* %minVal, align 4
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @6, i32 0, i32 0), i32 %17, i32 3)
  %18 = load i32, i32* %maxVal, align 4
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 %18, i32 7)
  store i32 -5, i32* %d, align 4
  store i32 2, i32* %e, align 4
  %19 = load i32, i32* %d, align 4
  %20 = load i32, i32* %e, align 4
  %21 = icmp slt i32 %19, %20
  %22 = load i32, i32* %d, align 4
  %23 = load i32, i32* %e, align 4
  %24 = select i1 %21, i32 %22, i32 %23
  store i32 %24, i32* %minNeg, align 4
  %25 = load i32, i32* %d, align 4
  %26 = load i32, i32* %e, align 4
  %27 = icmp slt i32 %25, %26
  %28 = load i32, i32* %e, align 4
  %29 = load i32, i32* %d, align 4
  %30 = select i1 %27, i32 %28, i32 %29
  store i32 %30, i32* %maxNeg, align 4
  %31 = load i32, i32* %minNeg, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @8, i32 0, i32 0), i32 %31, i32 -5)
  %32 = load i32, i32* %maxNeg, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @9, i32 0, i32 0), i32 %32, i32 2)
  store i32 42, i32* %same, align 4
  %33 = load i32, i32* %same, align 4
  %34 = load i32, i32* %same, align 4
  %35 = icmp slt i32 %33, %34
  %36 = select i1 %35, i32 0, i32 1
  store i32 %36, i32* %ternarySame, align 4
  %37 = load i32, i32* %ternarySame, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @10, i32 0, i32 0), i32 %37, i32 1)
  call void @report_result()
  %38 = load i32, i32* @test_errors, align 4
  ret i32 %38
}
