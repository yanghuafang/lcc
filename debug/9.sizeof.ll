; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.ID = type { i8* }
%struct.Student = type { i32, i8*, i8, float }

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [22 x i8] c"**** 9.sizeof.c ****\0A\00", align 1
@4 = private unnamed_addr constant [17 x i8] c"sizeof(char):%d\0A\00", align 1
@5 = private unnamed_addr constant [20 x i8] c"sizeof(charVal):%d\0A\00", align 1
@6 = private unnamed_addr constant [26 x i8] c"sizeof(unsigned char):%d\0A\00", align 1
@7 = private unnamed_addr constant [21 x i8] c"sizeof(ucharVal):%d\0A\00", align 1
@8 = private unnamed_addr constant [18 x i8] c"sizeof(short):%d\0A\00", align 1
@9 = private unnamed_addr constant [21 x i8] c"sizeof(shortVal):%d\0A\00", align 1
@10 = private unnamed_addr constant [27 x i8] c"sizeof(unsigned short):%d\0A\00", align 1
@11 = private unnamed_addr constant [22 x i8] c"sizeof(ushortVal):%d\0A\00", align 1
@12 = private unnamed_addr constant [16 x i8] c"sizeof(int):%d\0A\00", align 1
@13 = private unnamed_addr constant [19 x i8] c"sizeof(intVal):%d\0A\00", align 1
@14 = private unnamed_addr constant [25 x i8] c"sizeof(unsigned int):%d\0A\00", align 1
@15 = private unnamed_addr constant [20 x i8] c"sizeof(uintVal):%d\0A\00", align 1
@16 = private unnamed_addr constant [17 x i8] c"sizeof(long):%d\0A\00", align 1
@17 = private unnamed_addr constant [20 x i8] c"sizeof(longVal):%d\0A\00", align 1
@18 = private unnamed_addr constant [26 x i8] c"sizeof(unsigned long):%d\0A\00", align 1
@19 = private unnamed_addr constant [21 x i8] c"sizeof(ulongVal):%d\0A\00", align 1
@20 = private unnamed_addr constant [18 x i8] c"sizeof(float):%d\0A\00", align 1
@21 = private unnamed_addr constant [21 x i8] c"sizeof(floatVal):%d\0A\00", align 1
@22 = private unnamed_addr constant [19 x i8] c"sizeof(double):%d\0A\00", align 1
@23 = private unnamed_addr constant [22 x i8] c"sizeof(doubleVal):%d\0A\00", align 1
@24 = private unnamed_addr constant [18 x i8] c"sizeof(char*):%d\0A\00", align 1
@25 = private unnamed_addr constant [18 x i8] c"sizeof(pchar):%d\0A\00", align 1
@26 = private unnamed_addr constant [17 x i8] c"sizeof(int*):%d\0A\00", align 1
@27 = private unnamed_addr constant [17 x i8] c"sizeof(pint):%d\0A\00", align 1
@28 = private unnamed_addr constant [20 x i8] c"sizeof(Student):%d\0A\00", align 1
@29 = private unnamed_addr constant [20 x i8] c"sizeof(student):%d\0A\00", align 1
@30 = private unnamed_addr constant [15 x i8] c"sizeof(ID):%d\0A\00", align 1
@31 = private unnamed_addr constant [15 x i8] c"sizeof(id):%d\0A\00", align 1
@32 = private unnamed_addr constant [16 x i8] c"sizeof(SEX):%d\0A\00", align 1
@33 = private unnamed_addr constant [16 x i8] c"sizeof(sex):%d\0A\00", align 1
@34 = private unnamed_addr constant [13 x i8] c"sizeof(char)\00", align 1
@35 = private unnamed_addr constant [14 x i8] c"sizeof(short)\00", align 1
@36 = private unnamed_addr constant [12 x i8] c"sizeof(int)\00", align 1
@37 = private unnamed_addr constant [13 x i8] c"sizeof(long)\00", align 1
@38 = private unnamed_addr constant [14 x i8] c"sizeof(float)\00", align 1
@39 = private unnamed_addr constant [15 x i8] c"sizeof(double)\00", align 1
@40 = private unnamed_addr constant [14 x i8] c"sizeof(char*)\00", align 1
@41 = private unnamed_addr constant [13 x i8] c"sizeof(int*)\00", align 1
@42 = private unnamed_addr constant [12 x i8] c"sizeof(SEX)\00", align 1

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
  %id = alloca %union.ID, align 8
  %student = alloca %struct.Student, align 8
  %pint = alloca i32*, align 8
  %pchar = alloca i8*, align 8
  %doubleVal = alloca double, align 8
  %floatVal = alloca float, align 4
  %ulongVal = alloca i64, align 8
  %longVal = alloca i64, align 8
  %uintVal = alloca i32, align 4
  %intVal = alloca i32, align 4
  %ushortVal = alloca i16, align 2
  %shortVal = alloca i16, align 2
  %ucharVal = alloca i8, align 1
  %charVal = alloca i8, align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @3, i32 0, i32 0))
  store i8 65, i8* %charVal, align 1
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @4, i32 0, i32 0), i64 1)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @5, i32 0, i32 0), i64 1)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @6, i32 0, i32 0), i64 1)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @7, i32 0, i32 0), i64 1)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @8, i32 0, i32 0), i64 2)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @9, i32 0, i32 0), i64 2)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @10, i32 0, i32 0), i64 2)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @11, i32 0, i32 0), i64 2)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @12, i32 0, i32 0), i64 4)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @13, i32 0, i32 0), i64 4)
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @14, i32 0, i32 0), i64 4)
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @15, i32 0, i32 0), i64 4)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @16, i32 0, i32 0), i64 8)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @17, i32 0, i32 0), i64 8)
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @18, i32 0, i32 0), i64 8)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @19, i32 0, i32 0), i64 8)
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @20, i32 0, i32 0), i64 4)
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @21, i32 0, i32 0), i64 4)
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @22, i32 0, i32 0), i64 8)
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @23, i32 0, i32 0), i64 8)
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @24, i32 0, i32 0), i64 8)
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @25, i32 0, i32 0), i64 8)
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @26, i32 0, i32 0), i64 8)
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @27, i32 0, i32 0), i64 8)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @28, i32 0, i32 0), i64 24)
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @29, i32 0, i32 0), i64 24)
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @30, i32 0, i32 0), i64 8)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @31, i32 0, i32 0), i64 8)
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @32, i32 0, i32 0), i64 4)
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @33, i32 0, i32 0), i64 4)
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @34, i32 0, i32 0), i32 1, i32 1)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @35, i32 0, i32 0), i32 2, i32 2)
  call void @check_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @36, i32 0, i32 0), i32 4, i32 4)
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @37, i32 0, i32 0), i32 8, i32 8)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @38, i32 0, i32 0), i32 4, i32 4)
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @39, i32 0, i32 0), i32 8, i32 8)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @40, i32 0, i32 0), i32 8, i32 8)
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @41, i32 0, i32 0), i32 8, i32 8)
  call void @check_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @42, i32 0, i32 0), i32 4, i32 4)
  call void @report_result()
  %31 = load i32, i32* @test_errors, align 4
  ret i32 %31
}
