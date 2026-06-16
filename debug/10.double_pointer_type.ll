; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@g_data = global i32 0
@3 = private unnamed_addr constant [36 x i8] c"**** 10.double_pointer_type.c ****\0A\00", align 1
@4 = private unnamed_addr constant [40 x i8] c"p: %p, *p: %d, &g_data: %p, g_data: %d\0A\00", align 1
@5 = private unnamed_addr constant [42 x i8] c"p2: %p, *p2: %d, &g_data: %p, g_data: %d\0A\00", align 1
@6 = private unnamed_addr constant [15 x i8] c"g_data after p\00", align 1
@7 = private unnamed_addr constant [4 x i8] c"*p2\00", align 1
@8 = private unnamed_addr constant [3 x i8] c"*p\00", align 1
@9 = private unnamed_addr constant [14 x i8] c"zero boundary\00", align 1
@10 = private unnamed_addr constant [18 x i8] c"negative boundary\00", align 1

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

define void @getAddress(i32** %0) {
entry:
  %p = alloca i32**, align 8
  store i32** %0, i32*** %p, align 8
  %1 = load i32**, i32*** %p, align 8
  store i32* @g_data, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  ret void
}

define i32 @main() {
entry:
  %p2 = alloca i32*, align 8
  %p = alloca i32*, align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @3, i32 0, i32 0))
  store i32* @g_data, i32** %p, align 8
  %1 = load i32*, i32** %p, align 8
  store i32 1234, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32*, i32** %p, align 8
  %4 = load i32*, i32** %p, align 8
  %5 = load i32, i32* %4, align 4
  %6 = load i32, i32* @g_data, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @4, i32 0, i32 0), i32* %3, i32 %5, i32* @g_data, i32 %6)
  call void @getAddress(i32** %p2)
  %8 = load i32*, i32** %p2, align 8
  store i32 5678, i32* %8, align 4
  %9 = load i32, i32* %8, align 4
  %10 = load i32*, i32** %p2, align 8
  %11 = load i32*, i32** %p2, align 8
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* @g_data, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @5, i32 0, i32 0), i32* %10, i32 %12, i32* @g_data, i32 %13)
  %15 = load i32, i32* @g_data, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0), i32 %15, i32 5678)
  %16 = load i32*, i32** %p2, align 8
  %17 = load i32, i32* %16, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @7, i32 0, i32 0), i32 %17, i32 5678)
  %18 = load i32*, i32** %p, align 8
  %19 = load i32, i32* %18, align 4
  call void @check_int(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @8, i32 0, i32 0), i32 %19, i32 5678)
  %20 = load i32*, i32** %p, align 8
  store i32 0, i32* %20, align 4
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* @g_data, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @9, i32 0, i32 0), i32 %22, i32 0)
  %23 = load i32*, i32** %p2, align 8
  store i32 -42, i32* %23, align 4
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* @g_data, align 4
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @10, i32 0, i32 0), i32 %25, i32 -42)
  call void @report_result()
  %26 = load i32, i32* @test_errors, align 4
  ret i32 %26
}
