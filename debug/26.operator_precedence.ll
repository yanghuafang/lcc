; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

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
  %const43 = bitcast i64 2596069104 to i64
  %const = bitcast i64 305419896 to i64
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
  store i64 %const, i64* %a, align 4
  store i64 %const43, i64* %b, align 4
  %0 = ptrtoint i64* %a to i64
  store i64 %0, i64* %c, align 4
  %1 = ptrtoint i64* %c to i64
  %2 = load i64, i64* %a, align 4
  %3 = and i64 %1, %2
  %4 = load i64, i64* %b, align 4
  %5 = and i64 %3, %4
  store i64 %5, i64* %d, align 4
  %6 = load i64, i64* %a, align 4
  %7 = icmp ne i64 %6, %const
  br i1 %7, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %9 = load i64, i64* %b, align 4
  %10 = icmp ne i64 %9, %const43
  br i1 %10, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  store i32 13, i32* %plusA, align 4
  %12 = load i32, i32* %plusA, align 4
  %13 = add i32 3, %12
  %14 = icmp ne i32 %13, 16
  br i1 %14, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %15 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i32, i32* %plusA, align 4
  %17 = sub i32 3, %16
  %18 = icmp ne i32 %17, -10
  br i1 %18, label %then7, label %if.end15

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end6, %then7
  store i32 13, i32* %minusA, align 4
  %20 = load i32, i32* %minusA, align 4
  %21 = sub i32 0, %20
  %22 = sub i32 3, %21
  %23 = icmp ne i32 %22, 16
  br i1 %23, label %then16, label %if.end21

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %24 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end15, %then16
  store i32 3, i32* %mulA, align 4
  store i32 4, i32* %mulB, align 4
  store i32* %mulB, i32** %mulC, align 8
  %25 = load i32, i32* %mulA, align 4
  %26 = load i32, i32* %mulB, align 4
  %27 = mul i32 %25, %26
  %28 = load i32*, i32** %mulC, align 8
  %29 = load i32, i32* %28, align 4
  %30 = mul i32 %27, %29
  %31 = icmp ne i32 %30, 48
  br i1 %31, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %32 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  store i64 1234, i64* %callI, align 4
  %33 = load i64, i64* %callI, align 4
  %34 = trunc i64 %33 to i32
  call void @subFunc(i32 %34)
  %35 = load i64, i64* %callI, align 4
  %36 = trunc i64 %35 to i32
  %37 = icmp ne i32 %36, 1234
  br i1 %37, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %38 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  store i32 10, i32* %incA, align 4
  %39 = load i32, i32* %incA, align 4
  %40 = add i32 %39, 1
  store i32 %40, i32* %incA, align 4
  %41 = load i32, i32* %incA, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %incA, align 4
  store i32 %41, i32* %incB, align 4
  %43 = load i32, i32* %incA, align 4
  %44 = icmp ne i32 %43, 12
  br i1 %44, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %45 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %46 = load i32, i32* %incB, align 4
  %47 = icmp ne i32 %46, 11
  br i1 %47, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %48 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  store i32 10, i32* %decA, align 4
  %49 = load i32, i32* %decA, align 4
  %50 = sub i32 %49, 1
  store i32 %50, i32* %decA, align 4
  %51 = load i32, i32* %decA, align 4
  %52 = sub i32 %51, 1
  store i32 %52, i32* %decA, align 4
  store i32 %51, i32* %decB, align 4
  %53 = load i32, i32* %decA, align 4
  %54 = icmp ne i32 %53, 8
  br i1 %54, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %55 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %56 = load i32, i32* %decB, align 4
  %57 = icmp ne i32 %56, 9
  br i1 %57, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %58 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  %59 = load i32, i32* %err, align 4
  %60 = icmp eq i32 %59, 0
  %. = select i1 %60, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0)
  %61 = call i32 (i8*, ...) @printf(i8* %.)
  %62 = load i32, i32* %err, align 4
  ret i32 %62
}
