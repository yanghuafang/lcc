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
@14 = private unnamed_addr constant [23 x i8] c"**** 23.return.c ****\0A\00", align 1
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
@25 = private unnamed_addr constant [10 x i8] c"return 16\00", align 1
@26 = private unnamed_addr constant [19 x i8] c"early return young\00", align 1
@27 = private unnamed_addr constant [18 x i8] c"early return baby\00", align 1

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
  %3 = load i32, i32* %age, align 4
  br i1 %2, label %then, label %if.end

common.ret:                                       ; preds = %else2, %then4, %then1, %then
  %common.ret.op = phi i32 [ %5, %then ], [ %9, %then1 ], [ %15, %then4 ], [ %13, %else2 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @3, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %age, align 4
  br label %common.ret

if.end:                                           ; preds = %entry
  %6 = icmp eq i32 %3, 18
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  %7 = load i32, i32* %age, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @4, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* %age, align 4
  br label %common.ret

else2:                                            ; preds = %if.end
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0))
  %11 = load i32, i32* %age, align 4
  %12 = icmp sgt i32 %11, 18
  %13 = load i32, i32* %age, align 4
  br i1 %12, label %then4, label %common.ret

then4:                                            ; preds = %else2
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @6, i32 0, i32 0), i32 %13)
  %15 = load i32, i32* %age, align 4
  br label %common.ret
}

define i32 @checkAge2(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp slt i32 %1, 18
  %3 = load i32, i32* %age, align 4
  br i1 %2, label %then, label %else

common.ret:                                       ; preds = %else2, %then1, %then
  %common.ret.op = phi i32 [ %5, %then ], [ %9, %then1 ], [ %11, %else2 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @7, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %age, align 4
  br label %common.ret

else:                                             ; preds = %entry
  %6 = icmp eq i32 %3, 18
  %7 = load i32, i32* %age, align 4
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %else
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @8, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* %age, align 4
  br label %common.ret

else2:                                            ; preds = %else
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @9, i32 0, i32 0), i32 %7)
  %11 = load i32, i32* %age, align 4
  br label %common.ret
}

define i32 @checkAge3(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp sle i32 %1, 6
  %3 = load i32, i32* %age, align 4
  br i1 %2, label %then, label %else

common.ret:                                       ; preds = %else4, %then5, %then3, %then1, %then
  %common.ret.op = phi i32 [ %5, %then ], [ %12, %then1 ], [ %19, %then3 ], [ %26, %then5 ], [ %24, %else4 ]
  ret i32 %common.ret.op

then:                                             ; preds = %entry
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @10, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %age, align 4
  br label %common.ret

else:                                             ; preds = %entry
  %6 = icmp sgt i32 %3, 6
  %7 = load i32, i32* %age, align 4
  %8 = icmp sle i32 %7, 14
  %9 = select i1 %6, i1 %8, i1 false
  %10 = load i32, i32* %age, align 4
  br i1 %9, label %then1, label %else2

then1:                                            ; preds = %else
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @11, i32 0, i32 0), i32 %10)
  %12 = load i32, i32* %age, align 4
  br label %common.ret

else2:                                            ; preds = %else
  %13 = icmp sgt i32 %10, 14
  %14 = load i32, i32* %age, align 4
  %15 = icmp sle i32 %14, 18
  %16 = select i1 %13, i1 %15, i1 false
  %17 = load i32, i32* %age, align 4
  br i1 %16, label %then3, label %else4

then3:                                            ; preds = %else2
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @12, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %age, align 4
  br label %common.ret

else4:                                            ; preds = %else2
  %20 = icmp sgt i32 %17, 18
  %21 = load i32, i32* %age, align 4
  %22 = icmp sle i32 %21, 35
  %23 = select i1 %20, i1 %22, i1 false
  %24 = load i32, i32* %age, align 4
  br i1 %23, label %then5, label %common.ret

then5:                                            ; preds = %else4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @13, i32 0, i32 0), i32 %24)
  %26 = load i32, i32* %age, align 4
  br label %common.ret
}

define i32 @main() {
entry:
  %age = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @14, i32 0, i32 0))
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
  %40 = load i32, i32* %age, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @25, i32 0, i32 0), i32 %40, i32 35)
  %41 = call i32 @checkAge3(i32 35)
  call void @check_int(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @26, i32 0, i32 0), i32 %41, i32 35)
  %42 = call i32 @checkAge3(i32 6)
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @27, i32 0, i32 0), i32 %42, i32 6)
  call void @report_result()
  %43 = load i32, i32* @test_errors, align 4
  ret i32 %43
}
