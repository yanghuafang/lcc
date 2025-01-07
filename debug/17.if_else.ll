; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [14 x i8] c"age < 18: %d\0A\00", align 1
@1 = private unnamed_addr constant [15 x i8] c"age == 18: %d\0A\00", align 1
@2 = private unnamed_addr constant [11 x i8] c"age != 18\0A\00", align 1
@3 = private unnamed_addr constant [14 x i8] c"age > 18: %d\0A\00", align 1
@4 = private unnamed_addr constant [14 x i8] c"age < 18: %d\0A\00", align 1
@5 = private unnamed_addr constant [15 x i8] c"age == 18: %d\0A\00", align 1
@6 = private unnamed_addr constant [14 x i8] c"age > 18: %d\0A\00", align 1
@7 = private unnamed_addr constant [10 x i8] c"baby: %d\0A\00", align 1
@8 = private unnamed_addr constant [10 x i8] c"chld: %d\0A\00", align 1
@9 = private unnamed_addr constant [14 x i8] c"teenager: %d\0A\00", align 1
@10 = private unnamed_addr constant [11 x i8] c"young: %d\0A\00", align 1
@11 = private unnamed_addr constant [8 x i8] c"age:%d\0A\00", align 1
@12 = private unnamed_addr constant [8 x i8] c"age:%d\0A\00", align 1
@13 = private unnamed_addr constant [8 x i8] c"age:%d\0A\00", align 1
@14 = private unnamed_addr constant [9 x i8] c"age2:%d\0A\00", align 1
@15 = private unnamed_addr constant [9 x i8] c"age2:%d\0A\00", align 1
@16 = private unnamed_addr constant [9 x i8] c"age2:%d\0A\00", align 1
@17 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@18 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@19 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@20 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @checkAge1(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp slt i32 %1, 18
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  %3 = load i32, i32* %age, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @0, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %age, align 4
  %6 = icmp eq i32 %5, 18
  %7 = load i32, i32* %age, align 4
  %. = select i1 %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @2, i32 0, i32 0)
  %8 = call i32 (i8*, ...) @printf(i8* %., i32 %7)
  %9 = load i32, i32* %age, align 4
  %10 = icmp sgt i32 %9, 18
  br i1 %10, label %then4, label %if.end6

then4:                                            ; preds = %if.end
  %11 = load i32, i32* %age, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @3, i32 0, i32 0), i32 %11)
  br label %if.end6

if.end6:                                          ; preds = %if.end, %then4
  %13 = load i32, i32* %age, align 4
  ret i32 %13
}

define i32 @checkAge2(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp slt i32 %1, 18
  %3 = load i32, i32* %age, align 4
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @4, i32 0, i32 0), i32 %3)
  br label %if.end3

else:                                             ; preds = %entry
  %5 = icmp eq i32 %3, 18
  %6 = load i32, i32* %age, align 4
  %. = select i1 %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @5, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @6, i32 0, i32 0)
  %7 = call i32 (i8*, ...) @printf(i8* %., i32 %6)
  br label %if.end3

if.end3:                                          ; preds = %else, %then
  %8 = load i32, i32* %age, align 4
  ret i32 %8
}

define i32 @checkAge3(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp sle i32 %1, 6
  %3 = load i32, i32* %age, align 4
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @7, i32 0, i32 0), i32 %3)
  br label %if.end9

else:                                             ; preds = %entry
  %5 = icmp sgt i32 %3, 6
  %6 = load i32, i32* %age, align 4
  %7 = icmp sle i32 %6, 14
  %8 = select i1 %5, i1 %7, i1 false
  %9 = load i32, i32* %age, align 4
  br i1 %8, label %then1, label %else2

then1:                                            ; preds = %else
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @8, i32 0, i32 0), i32 %9)
  br label %if.end9

else2:                                            ; preds = %else
  %11 = icmp sgt i32 %9, 14
  %12 = load i32, i32* %age, align 4
  %13 = icmp sle i32 %12, 18
  %14 = select i1 %11, i1 %13, i1 false
  %15 = load i32, i32* %age, align 4
  br i1 %14, label %then3, label %else4

then3:                                            ; preds = %else2
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @9, i32 0, i32 0), i32 %15)
  br label %if.end9

else4:                                            ; preds = %else2
  %17 = icmp sgt i32 %15, 18
  %18 = load i32, i32* %age, align 4
  %19 = icmp sle i32 %18, 35
  %20 = select i1 %17, i1 %19, i1 false
  br i1 %20, label %then5, label %if.end9

then5:                                            ; preds = %else4
  %21 = load i32, i32* %age, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @10, i32 0, i32 0), i32 %21)
  br label %if.end9

if.end9:                                          ; preds = %then1, %then5, %else4, %then3, %then
  %23 = load i32, i32* %age, align 4
  ret i32 %23
}

define i32 @main() {
entry:
  %age = alloca i32, align 4
  %0 = call i32 @checkAge1(i32 16)
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @11, i32 0, i32 0), i32 %1)
  %3 = call i32 @checkAge1(i32 18)
  store i32 %3, i32* %age, align 4
  %4 = load i32, i32* %age, align 4
  %5 = load i32, i32* %age, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @12, i32 0, i32 0), i32 %5)
  %7 = call i32 @checkAge1(i32 20)
  store i32 %7, i32* %age, align 4
  %8 = load i32, i32* %age, align 4
  %9 = load i32, i32* %age, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @13, i32 0, i32 0), i32 %9)
  %11 = call i32 @checkAge2(i32 16)
  store i32 %11, i32* %age, align 4
  %12 = load i32, i32* %age, align 4
  %13 = load i32, i32* %age, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @14, i32 0, i32 0), i32 %13)
  %15 = call i32 @checkAge2(i32 18)
  store i32 %15, i32* %age, align 4
  %16 = load i32, i32* %age, align 4
  %17 = load i32, i32* %age, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 %17)
  %19 = call i32 @checkAge2(i32 20)
  store i32 %19, i32* %age, align 4
  %20 = load i32, i32* %age, align 4
  %21 = load i32, i32* %age, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @16, i32 0, i32 0), i32 %21)
  %23 = call i32 @checkAge3(i32 6)
  store i32 %23, i32* %age, align 4
  %24 = load i32, i32* %age, align 4
  %25 = load i32, i32* %age, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @17, i32 0, i32 0), i32 %25)
  %27 = call i32 @checkAge3(i32 14)
  store i32 %27, i32* %age, align 4
  %28 = load i32, i32* %age, align 4
  %29 = load i32, i32* %age, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @18, i32 0, i32 0), i32 %29)
  %31 = call i32 @checkAge3(i32 18)
  store i32 %31, i32* %age, align 4
  %32 = load i32, i32* %age, align 4
  %33 = load i32, i32* %age, align 4
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @19, i32 0, i32 0), i32 %33)
  %35 = call i32 @checkAge3(i32 35)
  store i32 %35, i32* %age, align 4
  %36 = load i32, i32* %age, align 4
  %37 = load i32, i32* %age, align 4
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @20, i32 0, i32 0), i32 %37)
  ret i32 0
}
