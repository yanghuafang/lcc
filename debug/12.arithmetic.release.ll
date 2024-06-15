; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %mixedUi = alloca i32, align 4
  %mixedSi = alloca i32, align 4
  %negB = alloca i32, align 4
  %negA = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %modeq = alloca i32, align 4
  %diveq = alloca i32, align 4
  %muleq = alloca i32, align 4
  %subeq = alloca i32, align 4
  %sumeq = alloca i32, align 4
  %mod = alloca i32, align 4
  %div = alloca i32, align 4
  %mul = alloca i32, align 4
  %sub2 = alloca i32, align 4
  %sub = alloca i32, align 4
  %sum = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i32 37, i32* %a, align 4
  store i32 8, i32* %b, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = add i32 %0, %1
  store i32 %2, i32* %sum, align 4
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %5 = sub i32 %3, %4
  store i32 %5, i32* %sub, align 4
  %6 = load i32, i32* %b, align 4
  %7 = load i32, i32* %a, align 4
  %8 = sub i32 %6, %7
  store i32 %8, i32* %sub2, align 4
  %9 = load i32, i32* %a, align 4
  %10 = load i32, i32* %b, align 4
  %11 = mul i32 %9, %10
  store i32 %11, i32* %mul, align 4
  %12 = load i32, i32* %a, align 4
  %13 = load i32, i32* %b, align 4
  %14 = sdiv i32 %12, %13
  store i32 %14, i32* %div, align 4
  %15 = load i32, i32* %a, align 4
  %16 = load i32, i32* %b, align 4
  %17 = srem i32 %15, %16
  store i32 %17, i32* %mod, align 4
  %18 = load i32, i32* %sum, align 4
  store i32 %18, i32* %sumeq, align 4
  %19 = load i32, i32* %b, align 4
  %20 = load i32, i32* %sumeq, align 4
  %21 = add i32 %20, %19
  store i32 %21, i32* %sumeq, align 4
  %22 = load i32, i32* %sumeq, align 4
  %23 = load i32, i32* %sumeq, align 4
  store i32 %23, i32* %subeq, align 4
  %24 = load i32, i32* %b, align 4
  %25 = load i32, i32* %subeq, align 4
  %26 = sub i32 %25, %24
  store i32 %26, i32* %subeq, align 4
  %27 = load i32, i32* %subeq, align 4
  %28 = load i32, i32* %subeq, align 4
  store i32 %28, i32* %muleq, align 4
  %29 = load i32, i32* %b, align 4
  %30 = load i32, i32* %muleq, align 4
  %31 = mul i32 %30, %29
  store i32 %31, i32* %muleq, align 4
  %32 = load i32, i32* %muleq, align 4
  %33 = load i32, i32* %muleq, align 4
  store i32 %33, i32* %diveq, align 4
  %34 = load i32, i32* %b, align 4
  %35 = load i32, i32* %diveq, align 4
  %36 = sdiv i32 %35, %34
  store i32 %36, i32* %diveq, align 4
  %37 = load i32, i32* %diveq, align 4
  %38 = load i32, i32* %diveq, align 4
  store i32 %38, i32* %modeq, align 4
  %39 = load i32, i32* %b, align 4
  %40 = load i32, i32* %modeq, align 4
  %41 = srem i32 %40, %39
  store i32 %41, i32* %modeq, align 4
  %42 = load i32, i32* %modeq, align 4
  %43 = load i32, i32* %sum, align 4
  %44 = icmp ne i32 %43, 45
  br i1 %44, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %45 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %46 = load i32, i32* %sub, align 4
  %47 = icmp ne i32 %46, 29
  br i1 %47, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %48 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %49 = load i32, i32* %sub2, align 4
  %50 = icmp ne i32 %49, -29
  br i1 %50, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %51 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %52 = load i32, i32* %mul, align 4
  %53 = icmp ne i32 %52, 296
  br i1 %53, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %54 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %55 = load i32, i32* %a, align 4
  %56 = add i32 %55, 0
  %57 = icmp ne i32 %56, 37
  br i1 %57, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %58 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %59 = load i32, i32* %div, align 4
  %60 = icmp ne i32 %59, 4
  br i1 %60, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %61 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %62 = load i32, i32* %mod, align 4
  %63 = icmp ne i32 %62, 5
  br i1 %63, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %64 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %65 = load i32, i32* %sumeq, align 4
  %66 = icmp ne i32 %65, 53
  br i1 %66, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %67 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %68 = load i32, i32* %subeq, align 4
  %69 = icmp ne i32 %68, 45
  br i1 %69, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %70 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %71 = load i32, i32* %muleq, align 4
  %72 = icmp ne i32 %71, 360
  br i1 %72, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %73 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %74 = load i32, i32* %diveq, align 4
  %75 = icmp ne i32 %74, 45
  br i1 %75, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %76 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %77 = load i32, i32* %modeq, align 4
  %78 = icmp ne i32 %77, 5
  br i1 %78, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %79 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  store i32 10, i32* %ua, align 4
  store i32 3, i32* %ub, align 4
  %80 = load i32, i32* %ua, align 4
  %81 = load i32, i32* %ub, align 4
  %82 = sdiv i32 %80, %81
  %83 = icmp ne i32 %82, 3
  br i1 %83, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %84 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %85 = load i32, i32* %ua, align 4
  %86 = load i32, i32* %ub, align 4
  %87 = srem i32 %85, %86
  %88 = icmp ne i32 %87, 1
  br i1 %88, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %89 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  store i32 -8, i32* %negA, align 4
  store i32 3, i32* %negB, align 4
  %90 = load i32, i32* %negA, align 4
  %91 = load i32, i32* %negB, align 4
  %92 = srem i32 %90, %91
  %93 = icmp ne i32 %92, -2
  br i1 %93, label %then40, label %if.end42

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4
  %94 = load i32, i32* %err, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end39, %then40
  store i32 -1, i32* %mixedSi, align 4
  store i32 1, i32* %mixedUi, align 4
  %95 = load i32, i32* %mixedSi, align 4
  %96 = load i32, i32* %mixedUi, align 4
  %97 = add i32 %95, %96
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %then43, label %if.end45

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4
  %99 = load i32, i32* %err, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.end42, %then43
  %100 = load i32, i32* %err, align 4
  %101 = icmp eq i32 %100, 0
  %. = select i1 %101, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0)
  %102 = call i32 (i8*, ...) @printf(i8* %.)
  %103 = load i32, i32* %err, align 4
  ret i32 %103
}
