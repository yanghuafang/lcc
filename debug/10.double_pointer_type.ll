; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@g_data = global i32 0
@0 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

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
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32* @g_data, i32** %p, align 8
  %0 = load i32*, i32** %p, align 8
  store i32 1234, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  call void @getAddress(i32** %p2)
  %2 = load i32*, i32** %p2, align 8
  store i32 5678, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* @g_data, align 4
  %5 = icmp ne i32 %4, 5678
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %6 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %7 = load i32*, i32** %p2, align 8
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 5678
  br i1 %9, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %10 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32*, i32** %p, align 8
  %12 = load i32, i32* %11, align 4
  %13 = icmp ne i32 %12, 5678
  br i1 %13, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %15 = load i32*, i32** %p, align 8
  store i32 0, i32* %15, align 4
  %16 = load i32, i32* %15, align 4
  %17 = load i32, i32* @g_data, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %20 = load i32*, i32** %p2, align 8
  store i32 -42, i32* %20, align 4
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* @g_data, align 4
  %23 = icmp ne i32 %22, -42
  br i1 %23, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %24 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %25 = load i32, i32* %err, align 4
  %26 = icmp eq i32 %25, 0
  %. = select i1 %26, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0)
  %27 = call i32 (i8*, ...) @printf(i8* %.)
  %28 = load i32, i32* %err, align 4
  ret i32 %28
}
