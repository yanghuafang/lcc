; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %c expected %c\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [19 x i8] c"score:%d grade:%c\0A\00", align 1
@5 = private unnamed_addr constant [8 x i8] c"grade D\00", align 1
@6 = private unnamed_addr constant [8 x i8] c"grade C\00", align 1
@7 = private unnamed_addr constant [8 x i8] c"grade B\00", align 1
@8 = private unnamed_addr constant [8 x i8] c"grade A\00", align 1
@9 = private unnamed_addr constant [28 x i8] c"**** 18.switch_case.c ****\0A\00", align 1
@10 = private unnamed_addr constant [19 x i8] c"score:%d grade:%c\0A\00", align 1
@11 = private unnamed_addr constant [13 x i8] c"default case\00", align 1

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

define void @check_char(i8* %0, i8 %1, i8 %2) {
entry:
  %expected = alloca i8, align 1
  %actual = alloca i8, align 1
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i8 %1, i8* %actual, align 1
  store i8 %2, i8* %expected, align 1
  %3 = load i8, i8* %actual, align 1
  %4 = load i8, i8* %expected, align 1
  %5 = sext i8 %3 to i32
  %6 = sext i8 %4 to i32
  %7 = icmp ne i32 %5, %6
  br i1 %7, label %then, label %if.end

then:                                             ; preds = %entry
  %8 = load i8*, i8** %name, align 8
  %9 = load i8, i8* %actual, align 1
  %10 = sext i8 %9 to i32
  %11 = load i8, i8* %expected, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @1, i32 0, i32 0), i8* %8, i32 %10, i32 %12)
  %14 = load i32, i32* @test_errors, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* @test_errors, align 4
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
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @3, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define void @gradeOfScore(i32 %0) {
entry:
  %grade = alloca i8, align 1
  %score = alloca i32, align 4
  store i32 %0, i32* %score, align 4
  %1 = load i32, i32* %score, align 4
  switch i32 %1, label %case.10 [
    i32 1, label %case.4
    i32 2, label %case.4
    i32 3, label %case.4
    i32 4, label %case.4
    i32 5, label %case.4
    i32 6, label %case.5
    i32 7, label %case.7
    i32 8, label %case.7
    i32 9, label %case.9
    i32 10, label %case.9
  ]

case.4:                                           ; preds = %entry, %entry, %entry, %entry, %entry
  store i8 68, i8* %grade, align 1
  %2 = load i8, i8* %grade, align 1
  br label %switch.end

case.5:                                           ; preds = %entry
  store i8 67, i8* %grade, align 1
  %3 = load i8, i8* %grade, align 1
  br label %switch.end

case.7:                                           ; preds = %entry, %entry
  store i8 66, i8* %grade, align 1
  %4 = load i8, i8* %grade, align 1
  br label %switch.end

case.9:                                           ; preds = %entry, %entry
  store i8 65, i8* %grade, align 1
  %5 = load i8, i8* %grade, align 1
  br label %switch.end

case.10:                                          ; preds = %entry
  store i8 69, i8* %grade, align 1
  %6 = load i8, i8* %grade, align 1
  br label %switch.end

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %7 = load i32, i32* %score, align 4
  %8 = load i8, i8* %grade, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @4, i32 0, i32 0), i32 %7, i32 %9)
  %11 = load i32, i32* %score, align 4
  %12 = icmp sge i32 %11, 1
  %13 = load i32, i32* %score, align 4
  %14 = icmp sle i32 %13, 5
  %15 = select i1 %12, i1 %14, i1 false
  br i1 %15, label %then, label %else

then:                                             ; preds = %switch.end
  %16 = load i8, i8* %grade, align 1
  call void @check_char(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @5, i32 0, i32 0), i8 %16, i8 68)
  br label %if.end9

else:                                             ; preds = %switch.end
  %17 = load i32, i32* %score, align 4
  %18 = icmp eq i32 %17, 6
  br i1 %18, label %then1, label %else2

then1:                                            ; preds = %else
  %19 = load i8, i8* %grade, align 1
  call void @check_char(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @6, i32 0, i32 0), i8 %19, i8 67)
  br label %if.end9

else2:                                            ; preds = %else
  %20 = load i32, i32* %score, align 4
  %21 = icmp eq i32 %20, 7
  %22 = load i32, i32* %score, align 4
  %23 = icmp eq i32 %22, 8
  %24 = select i1 %21, i1 true, i1 %23
  br i1 %24, label %then3, label %else4

then3:                                            ; preds = %else2
  %25 = load i8, i8* %grade, align 1
  call void @check_char(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @7, i32 0, i32 0), i8 %25, i8 66)
  br label %if.end9

else4:                                            ; preds = %else2
  %26 = load i32, i32* %score, align 4
  %27 = icmp eq i32 %26, 9
  %28 = load i32, i32* %score, align 4
  %29 = icmp eq i32 %28, 10
  %30 = select i1 %27, i1 true, i1 %29
  br i1 %30, label %then5, label %if.end9

then5:                                            ; preds = %else4
  %31 = load i8, i8* %grade, align 1
  call void @check_char(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i32 0, i32 0), i8 %31, i8 65)
  br label %if.end9

if.end9:                                          ; preds = %then1, %then5, %else4, %then3, %then
  ret void
}

define i32 @main() {
entry:
  %boundary = alloca i32, align 4
  %grade = alloca i8, align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @9, i32 0, i32 0))
  call void @gradeOfScore(i32 3)
  call void @gradeOfScore(i32 5)
  call void @gradeOfScore(i32 6)
  call void @gradeOfScore(i32 8)
  call void @gradeOfScore(i32 9)
  store i32 0, i32* %boundary, align 4
  %1 = load i32, i32* %boundary, align 4
  store i8 69, i8* %grade, align 1
  %2 = load i8, i8* %grade, align 1
  %3 = load i32, i32* %boundary, align 4
  %4 = load i8, i8* %grade, align 1
  %5 = sext i8 %4 to i32
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @10, i32 0, i32 0), i32 %3, i32 %5)
  %7 = load i8, i8* %grade, align 1
  call void @check_char(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @11, i32 0, i32 0), i8 %7, i8 69)
  call void @report_result()
  %8 = load i32, i32* @test_errors, align 4
  ret i32 %8
}
