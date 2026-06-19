; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"13.double_inc_sub.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 13, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* %a, align 4
  store i32 %0, i32* %b, align 4
  %2 = load i32, i32* %a, align 4
  %3 = icmp ne i32 %2, 14
  br i1 %3, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %4 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %b, align 4
  %6 = icmp ne i32 %5, 13
  br i1 %6, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  store i32 13, i32* %a, align 4
  %8 = load i32, i32* %a, align 4
  %9 = load i32, i32* %a, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %a, align 4
  %11 = load i32, i32* %a, align 4
  store i32 %11, i32* %c, align 4
  %12 = load i32, i32* %a, align 4
  %13 = icmp ne i32 %12, 14
  br i1 %13, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %15 = load i32, i32* %c, align 4
  %16 = icmp ne i32 %15, 14
  br i1 %16, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  store i32 13, i32* %a, align 4
  %18 = load i32, i32* %a, align 4
  %19 = load i32, i32* %a, align 4
  %20 = sub i32 %19, 1
  store i32 %20, i32* %a, align 4
  store i32 %19, i32* %d, align 4
  %21 = load i32, i32* %a, align 4
  %22 = icmp ne i32 %21, 12
  br i1 %22, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %24 = load i32, i32* %d, align 4
  %25 = icmp ne i32 %24, 13
  br i1 %25, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %26 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  store i32 13, i32* %a, align 4
  %27 = load i32, i32* %a, align 4
  %28 = load i32, i32* %a, align 4
  %29 = sub i32 %28, 1
  store i32 %29, i32* %a, align 4
  %30 = load i32, i32* %a, align 4
  store i32 %30, i32* %e, align 4
  %31 = load i32, i32* %a, align 4
  %32 = icmp ne i32 %31, 12
  br i1 %32, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %34 = load i32, i32* %e, align 4
  %35 = icmp ne i32 %34, 12
  br i1 %35, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %36 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  store i32 0, i32* %a, align 4
  %37 = load i32, i32* %a, align 4
  %38 = load i32, i32* %a, align 4
  %39 = add i32 %38, 1
  store i32 %39, i32* %a, align 4
  %40 = load i32, i32* %a, align 4
  %41 = icmp ne i32 %40, 1
  br i1 %41, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %42 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %43 = load i32, i32* %a, align 4
  %44 = sub i32 %43, 1
  store i32 %44, i32* %a, align 4
  %45 = load i32, i32* %a, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %47 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %48 = load i32, i32* %err, align 4
  %49 = icmp eq i32 %48, 0
  %. = select i1 %49, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0)
  %50 = call i32 (i8*, ...) @printf(i8* %.)
  %51 = load i32, i32* %err, align 4
  ret i32 %51
}
