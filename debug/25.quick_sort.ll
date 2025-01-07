; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [18 x i8] c"Original array: \0A\00", align 1
@3 = private unnamed_addr constant [16 x i8] c"Sorted array: \0A\00", align 1

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
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @0, i32 0, i32 0), i32 %8)
  %10 = load i32, i32* %i, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  ret void
}

define i32 @main() {
entry:
  %n = alloca i32, align 4
  %arr = alloca [6 x i32], align 4
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
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @2, i32 0, i32 0))
  %22 = bitcast [6 x i32]* %arr to i32*
  %23 = load i32, i32* %n, align 4
  call void @printArray(i32* %22, i32 %23)
  %24 = bitcast [6 x i32]* %arr to i32*
  %25 = load i32, i32* %n, align 4
  %26 = sub i32 %25, 1
  call void @quickSort(i32* %24, i32 0, i32 %26)
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @3, i32 0, i32 0))
  %28 = bitcast [6 x i32]* %arr to i32*
  %29 = load i32, i32* %n, align 4
  call void @printArray(i32* %28, i32 %29)
  ret i32 0
}
