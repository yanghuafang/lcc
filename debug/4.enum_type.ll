; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"4.enum_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"4.enum_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %v = alloca i32, align 4
  %sex = alloca i32, align 4
  %day = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 5, i32* %day, align 4
  store i32 1, i32* %sex, align 4
  store i32 0, i32* %v, align 4
  %0 = load i32, i32* %v, align 4
  %1 = load i32, i32* %v, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %3 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  store i32 1, i32* %v, align 4
  %4 = load i32, i32* %v, align 4
  %5 = load i32, i32* %v, align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  store i32 5, i32* %v, align 4
  %8 = load i32, i32* %v, align 4
  %9 = load i32, i32* %v, align 4
  %10 = icmp ne i32 %9, 5
  br i1 %10, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  store i32 6, i32* %v, align 4
  %12 = load i32, i32* %v, align 4
  %13 = load i32, i32* %v, align 4
  %14 = icmp ne i32 %13, 6
  br i1 %14, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %15 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %16 = load i32, i32* %day, align 4
  store i32 %16, i32* %v, align 4
  %17 = load i32, i32* %v, align 4
  %18 = load i32, i32* %v, align 4
  %19 = icmp ne i32 %18, 5
  br i1 %19, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, i32* %v, align 4
  %21 = load i32, i32* %v, align 4
  %22 = load i32, i32* %v, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %24 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  store i32 1, i32* %v, align 4
  %25 = load i32, i32* %v, align 4
  %26 = load i32, i32* %v, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %29 = load i32, i32* %sex, align 4
  store i32 %29, i32* %v, align 4
  %30 = load i32, i32* %v, align 4
  %31 = load i32, i32* %v, align 4
  %32 = icmp ne i32 %31, 1
  br i1 %32, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %34 = load i32, i32* %err, align 4
  %35 = icmp eq i32 %34, 0
  %. = select i1 %35, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0)
  %36 = call i32 (i8*, ...) @printf(i8* %.)
  %37 = load i32, i32* %err, align 4
  ret i32 %37
}
