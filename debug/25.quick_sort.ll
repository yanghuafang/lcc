; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

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

define i32 @main() {
entry:
  %single = alloca [1 x i32], align 4
  %n = alloca i32, align 4
  %arr = alloca [6 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [6 x i32]* %arr to i32*
  %1 = bitcast i32* %0 to i32*
  store i32 10, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = bitcast [6 x i32]* %arr to i32*
  %4 = getelementptr i32, i32* %3, i32 1
  store i32 7, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = bitcast [6 x i32]* %arr to i32*
  %7 = getelementptr i32, i32* %6, i32 2
  store i32 8, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = bitcast [6 x i32]* %arr to i32*
  %10 = getelementptr i32, i32* %9, i32 3
  store i32 9, i32* %10, align 4
  %11 = load i32, i32* %10, align 4
  %12 = bitcast [6 x i32]* %arr to i32*
  %13 = getelementptr i32, i32* %12, i32 4
  store i32 1, i32* %13, align 4
  %14 = load i32, i32* %13, align 4
  %15 = bitcast [6 x i32]* %arr to i32*
  %16 = getelementptr i32, i32* %15, i32 5
  store i32 5, i32* %16, align 4
  %17 = load i32, i32* %16, align 4
  %18 = bitcast [6 x i32]* %arr to i32*
  %19 = bitcast i32* %18 to i32*
  %20 = load i32, i32* %19, align 4
  store i32 6, i32* %n, align 4
  %21 = bitcast [6 x i32]* %arr to i32*
  %22 = load i32, i32* %n, align 4
  %23 = sub i32 %22, 1
  call void @quickSort(i32* %21, i32 0, i32 %23)
  %24 = bitcast [6 x i32]* %arr to i32*
  %25 = bitcast i32* %24 to i32*
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %29 = bitcast [6 x i32]* %arr to i32*
  %30 = getelementptr i32, i32* %29, i32 1
  %31 = load i32, i32* %30, align 4
  %32 = icmp ne i32 %31, 5
  br i1 %32, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %34 = bitcast [6 x i32]* %arr to i32*
  %35 = getelementptr i32, i32* %34, i32 2
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %36, 7
  br i1 %37, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %38 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %39 = bitcast [6 x i32]* %arr to i32*
  %40 = getelementptr i32, i32* %39, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %41, 8
  br i1 %42, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %43 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %44 = bitcast [6 x i32]* %arr to i32*
  %45 = getelementptr i32, i32* %44, i32 4
  %46 = load i32, i32* %45, align 4
  %47 = icmp ne i32 %46, 9
  br i1 %47, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %48 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %49 = bitcast [6 x i32]* %arr to i32*
  %50 = getelementptr i32, i32* %49, i32 5
  %51 = load i32, i32* %50, align 4
  %52 = icmp ne i32 %51, 10
  br i1 %52, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %53 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %54 = bitcast [1 x i32]* %single to i32*
  %55 = bitcast i32* %54 to i32*
  store i32 42, i32* %55, align 4
  %56 = load i32, i32* %55, align 4
  %57 = bitcast [1 x i32]* %single to i32*
  call void @quickSort(i32* %57, i32 0, i32 0)
  %58 = bitcast [1 x i32]* %single to i32*
  %59 = bitcast i32* %58 to i32*
  %60 = load i32, i32* %59, align 4
  %61 = icmp ne i32 %60, 42
  br i1 %61, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %62 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %63 = load i32, i32* %err, align 4
  %64 = icmp eq i32 %63, 0
  %. = select i1 %64, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0)
  %65 = call i32 (i8*, ...) @printf(i8* %.)
  %66 = load i32, i32* %err, align 4
  ret i32 %66
}
