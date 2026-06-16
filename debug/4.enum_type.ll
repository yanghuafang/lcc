; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [25 x i8] c"**** 4.enum_type.c ****\0A\00", align 1
@4 = private unnamed_addr constant [34 x i8] c"WEEK: %d, %d, %d, %d, %d, %d, %d\0A\00", align 1
@5 = private unnamed_addr constant [9 x i8] c"day: %d\0A\00", align 1
@6 = private unnamed_addr constant [19 x i8] c"all sexes: %d, %d\0A\00", align 1
@7 = private unnamed_addr constant [9 x i8] c"sex: %d\0A\00", align 1
@8 = private unnamed_addr constant [7 x i8] c"SUNDAY\00", align 1
@9 = private unnamed_addr constant [7 x i8] c"MONDAY\00", align 1
@10 = private unnamed_addr constant [8 x i8] c"TUESDAY\00", align 1
@11 = private unnamed_addr constant [10 x i8] c"WEDNESDAY\00", align 1
@12 = private unnamed_addr constant [9 x i8] c"THURSDAY\00", align 1
@13 = private unnamed_addr constant [7 x i8] c"FRIDAY\00", align 1
@14 = private unnamed_addr constant [9 x i8] c"SATURDAY\00", align 1
@15 = private unnamed_addr constant [4 x i8] c"day\00", align 1
@16 = private unnamed_addr constant [5 x i8] c"MALE\00", align 1
@17 = private unnamed_addr constant [7 x i8] c"FEMALE\00", align 1
@18 = private unnamed_addr constant [4 x i8] c"sex\00", align 1

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

define i32 @main() {
entry:
  %sex = alloca i32, align 4
  %day = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @3, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @4, i32 0, i32 0), i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6)
  store i32 5, i32* %day, align 4
  %2 = load i32, i32* %day, align 4
  %3 = load i32, i32* %day, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @5, i32 0, i32 0), i32 %3)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @6, i32 0, i32 0), i32 0, i32 1)
  store i32 1, i32* %sex, align 4
  %6 = load i32, i32* %sex, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @7, i32 0, i32 0), i32 %6)
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @8, i32 0, i32 0), i32 0, i32 0)
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @9, i32 0, i32 0), i32 1, i32 1)
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @10, i32 0, i32 0), i32 2, i32 2)
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @11, i32 0, i32 0), i32 3, i32 3)
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @12, i32 0, i32 0), i32 4, i32 4)
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @13, i32 0, i32 0), i32 5, i32 5)
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @14, i32 0, i32 0), i32 6, i32 6)
  %8 = load i32, i32* %day, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @15, i32 0, i32 0), i32 %8, i32 5)
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @16, i32 0, i32 0), i32 0, i32 0)
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @17, i32 0, i32 0), i32 1, i32 1)
  %9 = load i32, i32* %sex, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @18, i32 0, i32 0), i32 %9, i32 1)
  call void @report_result()
  %10 = load i32, i32* @test_errors, align 4
  ret i32 %10
}
