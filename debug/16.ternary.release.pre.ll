; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %ternarySame = alloca i32, align 4
  %same = alloca i32, align 4
  %maxNeg = alloca i32, align 4
  %minNeg = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %maxVal = alloca i32, align 4
  %minVal = alloca i32, align 4
  %c = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 3, ptr %a, align 4
  store i32 7, ptr %c, align 4
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %c, align 4
  %2 = icmp slt i32 %0, %1
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %c, align 4
  %5 = select i1 %2, i32 %3, i32 %4
  store i32 %5, ptr %minVal, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %c, align 4
  %8 = icmp slt i32 %6, %7
  %9 = load i32, ptr %c, align 4
  %10 = load i32, ptr %a, align 4
  %11 = select i1 %8, i32 %9, i32 %10
  store i32 %11, ptr %maxVal, align 4
  %12 = load i32, ptr %minVal, align 4
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %15 = load i32, ptr %maxVal, align 4
  %16 = icmp ne i32 %15, 7
  br i1 %16, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i32 -5, ptr %d, align 4
  store i32 2, ptr %e, align 4
  %18 = load i32, ptr %d, align 4
  %19 = load i32, ptr %e, align 4
  %20 = icmp slt i32 %18, %19
  %21 = load i32, ptr %d, align 4
  %22 = load i32, ptr %e, align 4
  %23 = select i1 %20, i32 %21, i32 %22
  store i32 %23, ptr %minNeg, align 4
  %24 = load i32, ptr %d, align 4
  %25 = load i32, ptr %e, align 4
  %26 = icmp slt i32 %24, %25
  %27 = load i32, ptr %e, align 4
  %28 = load i32, ptr %d, align 4
  %29 = select i1 %26, i32 %27, i32 %28
  store i32 %29, ptr %maxNeg, align 4
  %30 = load i32, ptr %minNeg, align 4
  %31 = icmp ne i32 %30, -5
  br i1 %31, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %32 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %33 = load i32, ptr %maxNeg, align 4
  %34 = icmp ne i32 %33, 2
  br i1 %34, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  store i32 42, ptr %same, align 4
  %36 = load i32, ptr %same, align 4
  %37 = load i32, ptr %same, align 4
  %38 = icmp slt i32 %36, %37
  %39 = select i1 %38, i32 0, i32 1
  store i32 %39, ptr %ternarySame, align 4
  %40 = load i32, ptr %ternarySame, align 4
  %41 = icmp ne i32 %40, 1
  br i1 %41, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %42 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %43 = load i32, ptr %err, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %then13, label %else14

then13:                                           ; preds = %if.end12
  %45 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end15

else14:                                           ; preds = %if.end12
  %46 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %47 = load i32, ptr %err, align 4
  ret i32 %47
}
