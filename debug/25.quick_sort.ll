; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@5 = private unnamed_addr constant [27 x i8] c"**** 25.quick_sort.c ****\0A\00", align 1
@6 = private unnamed_addr constant [18 x i8] c"Original array: \0A\00", align 1
@7 = private unnamed_addr constant [16 x i8] c"Sorted array: \0A\00", align 1
@8 = private unnamed_addr constant [10 x i8] c"sorted[0]\00", align 1
@9 = private unnamed_addr constant [10 x i8] c"sorted[1]\00", align 1
@10 = private unnamed_addr constant [10 x i8] c"sorted[2]\00", align 1
@11 = private unnamed_addr constant [10 x i8] c"sorted[3]\00", align 1
@12 = private unnamed_addr constant [10 x i8] c"sorted[4]\00", align 1
@13 = private unnamed_addr constant [10 x i8] c"sorted[5]\00", align 1
@14 = private unnamed_addr constant [15 x i8] c"single element\00", align 1

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

define void @swap(i32* %0, i32* %1) {
entry:
  %t = alloca i32, align 4
  %b = alloca i32*, align 8
  %a = alloca i32*, align 8
  store i32* %0, i32** %a, align 8
  store i32* %1, i32** %b, align 8
  %2 = load i32*, i32** %a, align 8
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %t, align 4
  %4 = load i32*, i32** %a, align 8
  %5 = load i32*, i32** %b, align 8
  %6 = load i32, i32* %5, align 4
  store i32 %6, i32* %4, align 4
  %7 = load i32, i32* %4, align 4
  %8 = load i32*, i32** %b, align 8
  %9 = load i32, i32* %t, align 4
  store i32 %9, i32* %8, align 4
  %10 = load i32, i32* %8, align 4
  ret void
}

define i32 @partition(i32* %0, i32 %1, i32 %2) {
entry:
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pivot = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8
  store i32 %1, i32* %low, align 4
  store i32 %2, i32* %high, align 4
  %3 = load i32*, i32** %arr, align 8
  %4 = load i32, i32* %high, align 4
  %5 = getelementptr i32, i32* %3, i32 %4
  %6 = load i32, i32* %5, align 4
  store i32 %6, i32* %pivot, align 4
  %7 = load i32, i32* %low, align 4
  %8 = sub i32 %7, 1
  store i32 %8, i32* %i, align 4
  %9 = load i32, i32* %low, align 4
  store i32 %9, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %high, align 4
  %12 = sub i32 %11, 1
  %13 = icmp sle i32 %10, %12
  %14 = load i32*, i32** %arr, align 8
  br i1 %13, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %15 = load i32, i32* %j, align 4
  %16 = getelementptr i32, i32* %14, i32 %15
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %pivot, align 4
  %19 = icmp sle i32 %17, %18
  br i1 %19, label %then, label %for.update

then:                                             ; preds = %for.loop
  %20 = load i32, i32* %i, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* %i, align 4
  %22 = load i32*, i32** %arr, align 8
  %23 = load i32, i32* %i, align 4
  %24 = getelementptr i32, i32* %22, i32 %23
  %25 = load i32*, i32** %arr, align 8
  %26 = load i32, i32* %j, align 4
  %27 = getelementptr i32, i32* %25, i32 %26
  call void @swap(i32* %24, i32* %27)
  br label %for.update

for.update:                                       ; preds = %then, %for.loop
  %28 = load i32, i32* %j, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %30 = load i32, i32* %i, align 4
  %31 = add i32 %30, 1
  %32 = getelementptr i32, i32* %14, i32 %31
  %33 = load i32*, i32** %arr, align 8
  %34 = load i32, i32* %high, align 4
  %35 = getelementptr i32, i32* %33, i32 %34
  call void @swap(i32* %32, i32* %35)
  %36 = load i32, i32* %i, align 4
  %37 = add i32 %36, 1
  ret i32 %37
}

define void @quickSort(i32* %0, i32 %1, i32 %2) {
entry:
  %pi = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8
  store i32 %1, i32* %low, align 4
  store i32 %2, i32* %high, align 4
  %3 = load i32, i32* %low, align 4
  %4 = load i32, i32* %high, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i32*, i32** %arr, align 8
  %7 = load i32, i32* %low, align 4
  %8 = load i32, i32* %high, align 4
  %9 = call i32 @partition(i32* %6, i32 %7, i32 %8)
  store i32 %9, i32* %pi, align 4
  %10 = load i32*, i32** %arr, align 8
  %11 = load i32, i32* %low, align 4
  %12 = load i32, i32* %pi, align 4
  %13 = sub i32 %12, 1
  call void @quickSort(i32* %10, i32 %11, i32 %13)
  %14 = load i32*, i32** %arr, align 8
  %15 = load i32, i32* %pi, align 4
  %16 = add i32 %15, 1
  %17 = load i32, i32* %high, align 4
  call void @quickSort(i32* %14, i32 %16, i32 %17)
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @printArray(i32* %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %size = alloca i32, align 4
  %arr = alloca i32*, align 8
  store i32* %0, i32** %arr, align 8
  store i32 %1, i32* %size, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.loop, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %size, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %5 = load i32*, i32** %arr, align 8
  %6 = load i32, i32* %i, align 4
  %7 = getelementptr i32, i32* %5, i32 %6
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0), i32 %8)
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @4, i32 0, i32 0))
  ret void
}

define i32 @main() {
entry:
  %single = alloca [1 x i32], align 4
  %n = alloca i32, align 4
  %arr = alloca [6 x i32], align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @5, i32 0, i32 0))
  %1 = bitcast [6 x i32]* %arr to i32*
  %2 = bitcast i32* %1 to i32*
  store i32 10, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = bitcast [6 x i32]* %arr to i32*
  %5 = getelementptr i32, i32* %4, i32 1
  store i32 7, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = bitcast [6 x i32]* %arr to i32*
  %8 = getelementptr i32, i32* %7, i32 2
  store i32 8, i32* %8, align 4
  %9 = load i32, i32* %8, align 4
  %10 = bitcast [6 x i32]* %arr to i32*
  %11 = getelementptr i32, i32* %10, i32 3
  store i32 9, i32* %11, align 4
  %12 = load i32, i32* %11, align 4
  %13 = bitcast [6 x i32]* %arr to i32*
  %14 = getelementptr i32, i32* %13, i32 4
  store i32 1, i32* %14, align 4
  %15 = load i32, i32* %14, align 4
  %16 = bitcast [6 x i32]* %arr to i32*
  %17 = getelementptr i32, i32* %16, i32 5
  store i32 5, i32* %17, align 4
  %18 = load i32, i32* %17, align 4
  %19 = bitcast [6 x i32]* %arr to i32*
  %20 = bitcast i32* %19 to i32*
  %21 = load i32, i32* %20, align 4
  store i32 6, i32* %n, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @6, i32 0, i32 0))
  %23 = bitcast [6 x i32]* %arr to i32*
  %24 = load i32, i32* %n, align 4
  call void @printArray(i32* %23, i32 %24)
  %25 = bitcast [6 x i32]* %arr to i32*
  %26 = load i32, i32* %n, align 4
  %27 = sub i32 %26, 1
  call void @quickSort(i32* %25, i32 0, i32 %27)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @7, i32 0, i32 0))
  %29 = bitcast [6 x i32]* %arr to i32*
  %30 = load i32, i32* %n, align 4
  call void @printArray(i32* %29, i32 %30)
  %31 = bitcast [6 x i32]* %arr to i32*
  %32 = bitcast i32* %31 to i32*
  %33 = load i32, i32* %32, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @8, i32 0, i32 0), i32 %33, i32 1)
  %34 = bitcast [6 x i32]* %arr to i32*
  %35 = getelementptr i32, i32* %34, i32 1
  %36 = load i32, i32* %35, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @9, i32 0, i32 0), i32 %36, i32 5)
  %37 = bitcast [6 x i32]* %arr to i32*
  %38 = getelementptr i32, i32* %37, i32 2
  %39 = load i32, i32* %38, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @10, i32 0, i32 0), i32 %39, i32 7)
  %40 = bitcast [6 x i32]* %arr to i32*
  %41 = getelementptr i32, i32* %40, i32 3
  %42 = load i32, i32* %41, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @11, i32 0, i32 0), i32 %42, i32 8)
  %43 = bitcast [6 x i32]* %arr to i32*
  %44 = getelementptr i32, i32* %43, i32 4
  %45 = load i32, i32* %44, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @12, i32 0, i32 0), i32 %45, i32 9)
  %46 = bitcast [6 x i32]* %arr to i32*
  %47 = getelementptr i32, i32* %46, i32 5
  %48 = load i32, i32* %47, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @13, i32 0, i32 0), i32 %48, i32 10)
  %49 = bitcast [1 x i32]* %single to i32*
  %50 = bitcast i32* %49 to i32*
  store i32 42, i32* %50, align 4
  %51 = load i32, i32* %50, align 4
  %52 = bitcast [1 x i32]* %single to i32*
  call void @quickSort(i32* %52, i32 0, i32 0)
  %53 = bitcast [1 x i32]* %single to i32*
  %54 = bitcast i32* %53 to i32*
  %55 = load i32, i32* %54, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @14, i32 0, i32 0), i32 %55, i32 42)
  call void @report_result()
  %56 = load i32, i32* @test_errors, align 4
  ret i32 %56
}
