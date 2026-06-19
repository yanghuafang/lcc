; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"7.variable_list.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"7.variable_list.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %h = alloca i32, align 4
  %g = alloca i32, align 4
  %f = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 1, i32* %b, align 4
  store i32 2, i32* %c, align 4
  store i32 3, i32* %d, align 4
  store i32 0, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  store i32 4, i32* %e, align 4
  %1 = load i32, i32* %e, align 4
  store i32 5, i32* %f, align 4
  %2 = load i32, i32* %f, align 4
  store i32 6, i32* %g, align 4
  %3 = load i32, i32* %g, align 4
  store i32 7, i32* %h, align 4
  %4 = load i32, i32* %h, align 4
  %5 = load i32, i32* %a, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %8 = load i32, i32* %b, align 4
  %9 = icmp ne i32 %8, 1
  br i1 %9, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %10 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %11 = load i32, i32* %c, align 4
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %13 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %14 = load i32, i32* %d, align 4
  %15 = icmp ne i32 %14, 3
  br i1 %15, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %16 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %17 = load i32, i32* %e, align 4
  %18 = icmp ne i32 %17, 4
  br i1 %18, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %20 = load i32, i32* %f, align 4
  %21 = icmp ne i32 %20, 5
  br i1 %21, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %22 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %23 = load i32, i32* %g, align 4
  %24 = icmp ne i32 %23, 6
  br i1 %24, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %25 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %26 = load i32, i32* %h, align 4
  %27 = icmp ne i32 %26, 7
  br i1 %27, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %29 = load i32, i32* %err, align 4
  %30 = icmp eq i32 %29, 0
  %. = select i1 %30, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %31 = call i32 (i8*, ...) @printf(i8* %.)
  %32 = load i32, i32* %err, align 4
  ret i32 %32
}
