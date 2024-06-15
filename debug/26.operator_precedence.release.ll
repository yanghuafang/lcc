; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @subFunc(i32 %0) {
entry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4
  ret void
}

define i32 @main() {
entry:
  %decB = alloca i32, align 4
  %decA = alloca i32, align 4
  %incB = alloca i32, align 4
  %incA = alloca i32, align 4
  %callI = alloca i64, align 8
  %mulC = alloca i32*, align 8
  %mulB = alloca i32, align 4
  %mulA = alloca i32, align 4
  %minusA = alloca i32, align 4
  %plusA = alloca i32, align 4
  %d = alloca i64, align 8
  %c = alloca i64, align 8
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i64 305419896, i64* %a, align 4
  store i64 -1698898192, i64* %b, align 4
  %0 = ptrtoint i64* %a to i64
  store i64 %0, i64* %c, align 4
  %1 = ptrtoint i64* %c to i64
  %2 = load i64, i64* %a, align 4
  %3 = and i64 %1, %2
  %4 = load i64, i64* %b, align 4
  %5 = and i64 %3, %4
  store i64 %5, i64* %d, align 4
  store i32 13, i32* %plusA, align 4
  %6 = load i32, i32* %plusA, align 4
  %7 = add i32 3, %6
  %8 = icmp ne i32 %7, 16
  br i1 %8, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %9 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %10 = load i32, i32* %plusA, align 4
  %11 = sub i32 3, %10
  %12 = icmp ne i32 %11, -10
  br i1 %12, label %then1, label %if.end9

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %13 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %then1
  store i32 13, i32* %minusA, align 4
  %14 = load i32, i32* %minusA, align 4
  %15 = sub i32 0, %14
  %16 = sub i32 3, %15
  %17 = icmp ne i32 %16, 16
  br i1 %17, label %then10, label %if.end15

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %18 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end9, %then10
  store i32 3, i32* %mulA, align 4
  store i32 4, i32* %mulB, align 4
  store i32* %mulB, i32** %mulC, align 8
  %19 = load i32, i32* %mulA, align 4
  %20 = load i32, i32* %mulB, align 4
  %21 = mul i32 %19, %20
  %22 = load i32*, i32** %mulC, align 8
  %23 = load i32, i32* %22, align 4
  %24 = mul i32 %21, %23
  %25 = icmp ne i32 %24, 48
  br i1 %25, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %26 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  store i64 1234, i64* %callI, align 4
  %27 = load i64, i64* %callI, align 4
  %28 = trunc i64 %27 to i32
  call void @subFunc(i32 %28)
  %29 = load i64, i64* %callI, align 4
  %30 = trunc i64 %29 to i32
  %31 = icmp ne i32 %30, 1234
  br i1 %31, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %32 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  store i32 10, i32* %incA, align 4
  %33 = load i32, i32* %incA, align 4
  %34 = add i32 %33, 1
  store i32 %34, i32* %incA, align 4
  %35 = load i32, i32* %incA, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %incA, align 4
  store i32 %35, i32* %incB, align 4
  %37 = load i32, i32* %incA, align 4
  %38 = icmp ne i32 %37, 12
  br i1 %38, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %39 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %40 = load i32, i32* %incB, align 4
  %41 = icmp ne i32 %40, 11
  br i1 %41, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %42 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  store i32 10, i32* %decA, align 4
  %43 = load i32, i32* %decA, align 4
  %44 = sub i32 %43, 1
  store i32 %44, i32* %decA, align 4
  %45 = load i32, i32* %decA, align 4
  %46 = sub i32 %45, 1
  store i32 %46, i32* %decA, align 4
  store i32 %45, i32* %decB, align 4
  %47 = load i32, i32* %decA, align 4
  %48 = icmp ne i32 %47, 8
  br i1 %48, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %49 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %50 = load i32, i32* %decB, align 4
  %51 = icmp ne i32 %50, 9
  br i1 %51, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %52 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  %53 = load i32, i32* %err, align 4
  %54 = icmp eq i32 %53, 0
  %. = select i1 %54, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0)
  %55 = call i32 (i8*, ...) @printf(i8* %.)
  %56 = load i32, i32* %err, align 4
  ret i32 %56
}
