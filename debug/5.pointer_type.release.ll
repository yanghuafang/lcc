; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %pgi = alloca i32*, align 8
  %pgc = alloca i8*, align 8
  %pi = alloca i32*, align 8
  %pc = alloca i8*, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i8 65, i8* %c, align 1
  store i32 128, i32* %i, align 4
  store i8* %c, i8** %pc, align 8
  store i32* %i, i32** %pi, align 8
  %0 = load i8*, i8** %pc, align 8
  store i8 66, i8* %0, align 1
  %1 = load i8, i8* %0, align 1
  %2 = load i32*, i32** %pi, align 8
  store i32 256, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  store i8* @gc, i8** %pgc, align 8
  store i32* @gi, i32** %pgi, align 8
  %4 = load i8*, i8** %pgc, align 8
  store i8 98, i8* %4, align 1
  %5 = load i8, i8* %4, align 1
  %6 = load i32*, i32** %pgi, align 8
  store i32 2048, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = load i8, i8* %c, align 1
  %9 = icmp ne i8 %8, 66
  br i1 %9, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %10 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %11 = load i8*, i8** %pc, align 8
  %12 = load i8, i8* %11, align 1
  %13 = icmp ne i8 %12, 66
  br i1 %13, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %15 = load i32, i32* %i, align 4
  %16 = icmp ne i32 %15, 256
  br i1 %16, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %18 = load i32*, i32** %pi, align 8
  %19 = load i32, i32* %18, align 4
  %20 = icmp ne i32 %19, 256
  br i1 %20, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %21 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %22 = load i8, i8* @gc, align 1
  %23 = icmp ne i8 %22, 98
  br i1 %23, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %24 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %25 = load i32, i32* @gi, align 4
  %26 = icmp ne i32 %25, 2048
  br i1 %26, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %27 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %28 = load i32*, i32** %pi, align 8
  store i32 0, i32* %28, align 4
  %29 = load i32, i32* %28, align 4
  %30 = load i32, i32* %i, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %32 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %33 = load i32, i32* %err, align 4
  %34 = icmp eq i32 %33, 0
  %. = select i1 %34, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0)
  %35 = call i32 (i8*, ...) @printf(i8* %.)
  %36 = load i32, i32* %err, align 4
  ret i32 %36
}
