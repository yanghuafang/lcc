; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %s = alloca i32, align 4
  %r = alloca i32, align 4
  %z = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 2, i32* %a, align 4
  store i32 4, i32* %b, align 4
  store i32 5, i32* %c, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = load i32, i32* %c, align 4
  %3 = mul i32 %1, %2
  %4 = add i32 %0, %3
  %5 = icmp ne i32 %4, 22
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %6 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %7 = load i32, i32* %a, align 4
  %8 = load i32, i32* %b, align 4
  %9 = add i32 %7, %8
  %10 = load i32, i32* %c, align 4
  %11 = mul i32 %9, %10
  %12 = icmp ne i32 %11, 30
  br i1 %12, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %13 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %14 = load i32, i32* %c, align 4
  %15 = load i32, i32* %a, align 4
  %16 = load i32, i32* %b, align 4
  %17 = sub i32 %15, %16
  %18 = mul i32 %14, %17
  %19 = icmp ne i32 %18, -10
  br i1 %19, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %21 = load i32, i32* %a, align 4
  %22 = load i32, i32* %b, align 4
  %23 = load i32, i32* %c, align 4
  %24 = srem i32 %22, %23
  %25 = sub i32 %21, %24
  %26 = icmp ne i32 %25, -2
  br i1 %26, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %27 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %28 = load i32, i32* %a, align 4
  %29 = load i32, i32* %b, align 4
  %30 = add i32 %28, %29
  %31 = load i32, i32* %c, align 4
  %32 = sdiv i32 %30, %31
  %33 = icmp ne i32 %32, 1
  br i1 %33, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %34 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  store i32 1, i32* %x, align 4
  store i32 2, i32* %y, align 4
  store i32 3, i32* %z, align 4
  %35 = load i32, i32* %x, align 4
  %36 = load i32, i32* %y, align 4
  %37 = add i32 %35, %36
  %38 = load i32, i32* %z, align 4
  %39 = shl i32 %37, %38
  store i32 %39, i32* %r, align 4
  %40 = load i32, i32* %r, align 4
  %41 = icmp ne i32 %40, 24
  br i1 %41, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %42 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %43 = load i32, i32* %x, align 4
  %44 = load i32, i32* %y, align 4
  %45 = add i32 %43, %44
  %46 = load i32, i32* %z, align 4
  %47 = shl i32 %45, %46
  store i32 %47, i32* %s, align 4
  %48 = load i32, i32* %s, align 4
  %49 = icmp ne i32 %48, 24
  br i1 %49, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %50 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %51 = load i32, i32* %err, align 4
  %52 = icmp eq i32 %51, 0
  %. = select i1 %52, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0)
  %53 = call i32 (i8*, ...) @printf(i8* %.)
  %54 = load i32, i32* %err, align 4
  ret i32 %54
}
