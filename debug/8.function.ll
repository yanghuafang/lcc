; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [24 x i8] c"**** 8.function.c ****\0A\00", align 1
@4 = private unnamed_addr constant [12 x i8] c"i addr: %p\0A\00", align 1
@5 = private unnamed_addr constant [8 x i8] c"1+2=%d\0A\00", align 1
@6 = private unnamed_addr constant [8 x i8] c"1+2=%d\0A\00", align 1
@7 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@8 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@9 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@10 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@11 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@12 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@13 = private unnamed_addr constant [4 x i8] c"1+2\00", align 1
@14 = private unnamed_addr constant [11 x i8] c"3+4 direct\00", align 1
@15 = private unnamed_addr constant [9 x i8] c"3+4 vars\00", align 1
@16 = private unnamed_addr constant [8 x i8] c"3+4 ptr\00", align 1
@17 = private unnamed_addr constant [14 x i8] c"3+4 out param\00", align 1
@18 = private unnamed_addr constant [10 x i8] c"large sum\00", align 1

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

define i32 @sum(i32 %0, i32 %1) {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, i32* %l, align 4
  store i32 %1, i32* %r, align 4
  %2 = load i32, i32* %l, align 4
  %3 = load i32, i32* %r, align 4
  %4 = add i32 %2, %3
  ret i32 %4
}

define i32 @sum2(i32* %0, i32* %1) {
entry:
  %r = alloca i32*, align 8
  %l = alloca i32*, align 8
  store i32* %0, i32** %l, align 8
  store i32* %1, i32** %r, align 8
  %2 = load i32*, i32** %l, align 8
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** %r, align 8
  %5 = load i32, i32* %4, align 4
  %6 = call i32 @sum(i32 %3, i32 %5)
  ret i32 %6
}

define void @sum3(i32 %0, i32 %1, i32* %2) {
entry:
  %result = alloca i32*, align 8
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, i32* %l, align 4
  store i32 %1, i32* %r, align 4
  store i32* %2, i32** %result, align 8
  %3 = load i32*, i32** %result, align 8
  %4 = load i32, i32* %l, align 4
  %5 = load i32, i32* %r, align 4
  %6 = add i32 %4, %5
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  ret void
}

define i32 @main() {
entry:
  %bigB = alloca i32, align 4
  %bigA = alloca i32, align 4
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  %i = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @3, i32 0, i32 0))
  %1 = call i32 @sum(i32 1, i32 2)
  store i32 %1, i32* %i, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @4, i32 0, i32 0), i32* %i)
  %3 = load i32, i32* %i, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @5, i32 0, i32 0), i32 %3)
  %5 = call i32 @sum(i32 1, i32 2)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @6, i32 0, i32 0), i32 %5)
  store i32 3, i32* %l, align 4
  store i32 4, i32* %r, align 4
  %7 = load i32, i32* %l, align 4
  %8 = load i32, i32* %r, align 4
  %9 = call i32 @sum(i32 %7, i32 %8)
  store i32 %9, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %i, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @7, i32 0, i32 0), i32 %11)
  %13 = load i32, i32* %l, align 4
  %14 = load i32, i32* %r, align 4
  %15 = call i32 @sum(i32 %13, i32 %14)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i32 0, i32 0), i32 %15)
  %17 = call i32 @sum2(i32* %l, i32* %r)
  store i32 %17, i32* %i, align 4
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* %i, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @9, i32 0, i32 0), i32 %19)
  %21 = call i32 @sum2(i32* %l, i32* %r)
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @10, i32 0, i32 0), i32 %21)
  call void @sum3(i32 3, i32 4, i32* %i)
  %23 = load i32, i32* %i, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @11, i32 0, i32 0), i32 %23)
  %25 = load i32, i32* %l, align 4
  %26 = load i32, i32* %r, align 4
  call void @sum3(i32 %25, i32 %26, i32* %i)
  %27 = load i32, i32* %i, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @12, i32 0, i32 0), i32 %27)
  %29 = call i32 @sum(i32 1, i32 2)
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @13, i32 0, i32 0), i32 %29, i32 3)
  %30 = call i32 @sum(i32 3, i32 4)
  call void @check_int(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @14, i32 0, i32 0), i32 %30, i32 7)
  %31 = load i32, i32* %l, align 4
  %32 = load i32, i32* %r, align 4
  %33 = call i32 @sum(i32 %31, i32 %32)
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 %33, i32 7)
  %34 = call i32 @sum2(i32* %l, i32* %r)
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @16, i32 0, i32 0), i32 %34, i32 7)
  %35 = load i32, i32* %i, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @17, i32 0, i32 0), i32 %35, i32 7)
  store i32 1000000, i32* %bigA, align 4
  store i32 2000000, i32* %bigB, align 4
  %36 = load i32, i32* %bigA, align 4
  %37 = load i32, i32* %bigB, align 4
  %38 = call i32 @sum(i32 %36, i32 %37)
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @18, i32 0, i32 0), i32 %38, i32 3000000)
  call void @report_result()
  %39 = load i32, i32* @test_errors, align 4
  ret i32 %39
}
