; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [14 x i8] c"age < 18: %d\0A\00", align 1
@4 = private unnamed_addr constant [15 x i8] c"age == 18: %d\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"age != 18\0A\00", align 1
@6 = private unnamed_addr constant [14 x i8] c"age > 18: %d\0A\00", align 1
@7 = private unnamed_addr constant [14 x i8] c"age < 18: %d\0A\00", align 1
@8 = private unnamed_addr constant [15 x i8] c"age == 18: %d\0A\00", align 1
@9 = private unnamed_addr constant [14 x i8] c"age > 18: %d\0A\00", align 1
@10 = private unnamed_addr constant [10 x i8] c"baby: %d\0A\00", align 1
@11 = private unnamed_addr constant [10 x i8] c"chld: %d\0A\00", align 1
@12 = private unnamed_addr constant [14 x i8] c"teenager: %d\0A\00", align 1
@13 = private unnamed_addr constant [11 x i8] c"young: %d\0A\00", align 1
@14 = private unnamed_addr constant [24 x i8] c"**** 17.if_else.c ****\0A\00", align 1
@15 = private unnamed_addr constant [8 x i8] c"age:%d\0A\00", align 1
@16 = private unnamed_addr constant [8 x i8] c"age:%d\0A\00", align 1
@17 = private unnamed_addr constant [8 x i8] c"age:%d\0A\00", align 1
@18 = private unnamed_addr constant [9 x i8] c"age2:%d\0A\00", align 1
@19 = private unnamed_addr constant [9 x i8] c"age2:%d\0A\00", align 1
@20 = private unnamed_addr constant [9 x i8] c"age2:%d\0A\00", align 1
@21 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@22 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@23 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@24 = private unnamed_addr constant [9 x i8] c"age3:%d\0A\00", align 1
@25 = private unnamed_addr constant [14 x i8] c"checkAge1(16)\00", align 1
@26 = private unnamed_addr constant [14 x i8] c"checkAge1(18)\00", align 1
@27 = private unnamed_addr constant [14 x i8] c"checkAge1(20)\00", align 1
@28 = private unnamed_addr constant [21 x i8] c"checkAge3 boundary 6\00", align 1
@29 = private unnamed_addr constant [22 x i8] c"checkAge3 boundary 35\00", align 1

declare i32 @printf(i8*, ...)

define void @check_int(i8* %0, i32 %1, i32 %2) {
entry:
  %expected = alloca i32, align 4
  %actual = alloca i32, align 4
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i32 %1, i32* %actual, align 4
  store i32 %2, i32* %expected, align 4
  %3 = load i32, i32* %actual, align 4
  %4 = load i32, i32* %expected, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i32, i32* %actual, align 4
  %8 = load i32, i32* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @0, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
  %10 = load i32, i32* @test_errors, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* @test_errors, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  ret void
}

define void @report_result() {
entry:
  %0 = load i32, i32* @test_errors, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @1, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @2, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @checkAge1(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp slt i32 %1, 18
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  %3 = load i32, i32* %age, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @3, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %5 = load i32, i32* %age, align 4
  %6 = icmp eq i32 %5, 18
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  %7 = load i32, i32* %age, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @4, i32 0, i32 0), i32 %7)
  br label %if.end3

else2:                                            ; preds = %if.end
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0))
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %10 = load i32, i32* %age, align 4
  %11 = icmp sgt i32 %10, 18
  br i1 %11, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  %12 = load i32, i32* %age, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @6, i32 0, i32 0), i32 %12)
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %14 = load i32, i32* %age, align 4
  ret i32 %14
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
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @7, i32 0, i32 0), i32 %3)
  br label %if.end3

else:                                             ; preds = %entry
  %5 = icmp eq i32 %3, 18
  %6 = load i32, i32* %age, align 4
  %. = select i1 %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @9, i32 0, i32 0)
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
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @10, i32 0, i32 0), i32 %3)
  br label %if.end9

else:                                             ; preds = %entry
  %5 = icmp sgt i32 %3, 6
  %6 = load i32, i32* %age, align 4
  %7 = icmp sle i32 %6, 14
  %8 = select i1 %5, i1 %7, i1 false
  %9 = load i32, i32* %age, align 4
  br i1 %8, label %then1, label %else2

then1:                                            ; preds = %else
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @11, i32 0, i32 0), i32 %9)
  br label %if.end9

else2:                                            ; preds = %else
  %11 = icmp sgt i32 %9, 14
  %12 = load i32, i32* %age, align 4
  %13 = icmp sle i32 %12, 18
  %14 = select i1 %11, i1 %13, i1 false
  %15 = load i32, i32* %age, align 4
  br i1 %14, label %then3, label %else4

then3:                                            ; preds = %else2
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @12, i32 0, i32 0), i32 %15)
  br label %if.end9

else4:                                            ; preds = %else2
  %17 = icmp sgt i32 %15, 18
  %18 = load i32, i32* %age, align 4
  %19 = icmp sle i32 %18, 35
  %20 = select i1 %17, i1 %19, i1 false
  br i1 %20, label %then5, label %if.end9

then5:                                            ; preds = %else4
  %21 = load i32, i32* %age, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @13, i32 0, i32 0), i32 %21)
  br label %if.end9

if.end9:                                          ; preds = %then1, %then5, %else4, %then3, %then
  %23 = load i32, i32* %age, align 4
  ret i32 %23
}

define i32 @main() {
entry:
  %age = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @14, i32 0, i32 0))
  %1 = call i32 @checkAge1(i32 16)
  store i32 %1, i32* %age, align 4
  %2 = load i32, i32* %age, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @15, i32 0, i32 0), i32 %2)
  %4 = call i32 @checkAge1(i32 18)
  store i32 %4, i32* %age, align 4
  %5 = load i32, i32* %age, align 4
  %6 = load i32, i32* %age, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @16, i32 0, i32 0), i32 %6)
  %8 = call i32 @checkAge1(i32 20)
  store i32 %8, i32* %age, align 4
  %9 = load i32, i32* %age, align 4
  %10 = load i32, i32* %age, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @17, i32 0, i32 0), i32 %10)
  %12 = call i32 @checkAge2(i32 16)
  store i32 %12, i32* %age, align 4
  %13 = load i32, i32* %age, align 4
  %14 = load i32, i32* %age, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @18, i32 0, i32 0), i32 %14)
  %16 = call i32 @checkAge2(i32 18)
  store i32 %16, i32* %age, align 4
  %17 = load i32, i32* %age, align 4
  %18 = load i32, i32* %age, align 4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @19, i32 0, i32 0), i32 %18)
  %20 = call i32 @checkAge2(i32 20)
  store i32 %20, i32* %age, align 4
  %21 = load i32, i32* %age, align 4
  %22 = load i32, i32* %age, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @20, i32 0, i32 0), i32 %22)
  %24 = call i32 @checkAge3(i32 6)
  store i32 %24, i32* %age, align 4
  %25 = load i32, i32* %age, align 4
  %26 = load i32, i32* %age, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @21, i32 0, i32 0), i32 %26)
  %28 = call i32 @checkAge3(i32 14)
  store i32 %28, i32* %age, align 4
  %29 = load i32, i32* %age, align 4
  %30 = load i32, i32* %age, align 4
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @22, i32 0, i32 0), i32 %30)
  %32 = call i32 @checkAge3(i32 18)
  store i32 %32, i32* %age, align 4
  %33 = load i32, i32* %age, align 4
  %34 = load i32, i32* %age, align 4
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @23, i32 0, i32 0), i32 %34)
  %36 = call i32 @checkAge3(i32 35)
  store i32 %36, i32* %age, align 4
  %37 = load i32, i32* %age, align 4
  %38 = load i32, i32* %age, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @24, i32 0, i32 0), i32 %38)
  %40 = call i32 @checkAge1(i32 16)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @25, i32 0, i32 0), i32 %40, i32 16)
  %41 = call i32 @checkAge1(i32 18)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @26, i32 0, i32 0), i32 %41, i32 18)
  %42 = call i32 @checkAge1(i32 20)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @27, i32 0, i32 0), i32 %42, i32 20)
  %43 = call i32 @checkAge3(i32 6)
  call void @check_int(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @28, i32 0, i32 0), i32 %43, i32 6)
  %44 = call i32 @checkAge3(i32 35)
  call void @check_int(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @29, i32 0, i32 0), i32 %44, i32 35)
  call void @report_result()
  %45 = load i32, i32* @test_errors, align 4
  ret i32 %45
}
