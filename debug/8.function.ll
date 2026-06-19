; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

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
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  %i = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 3, i32* %l, align 4
  store i32 4, i32* %r, align 4
  %0 = call i32 @sum(i32 1, i32 2)
  %1 = icmp ne i32 %0, 3
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @sum(i32 3, i32 4)
  %4 = icmp ne i32 %3, 7
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = load i32, i32* %l, align 4
  %7 = load i32, i32* %r, align 4
  %8 = call i32 @sum(i32 %6, i32 %7)
  %9 = icmp ne i32 %8, 7
  br i1 %9, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %10 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %11 = call i32 @sum2(i32* %l, i32* %r)
  %12 = icmp ne i32 %11, 7
  br i1 %12, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %13 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  call void @sum3(i32 3, i32 4, i32* %i)
  %14 = load i32, i32* %i, align 4
  %15 = icmp ne i32 %14, 7
  br i1 %15, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %16 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %17 = load i32, i32* %l, align 4
  %18 = load i32, i32* %r, align 4
  call void @sum3(i32 %17, i32 %18, i32* %i)
  %19 = load i32, i32* %i, align 4
  %20 = icmp ne i32 %19, 7
  br i1 %20, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %21 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000)
  %23 = icmp ne i32 %22, 3000000
  br i1 %23, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %24 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %25 = load i32, i32* %err, align 4
  %26 = icmp eq i32 %25, 0
  %. = select i1 %26, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0)
  %27 = call i32 (i8*, ...) @printf(i8* %.)
  %28 = load i32, i32* %err, align 4
  ret i32 %28
}
