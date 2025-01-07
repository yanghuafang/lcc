; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

%union.ID = type { i8* }
%struct.Student = type { i32, i8*, i8, float }

@0 = private unnamed_addr constant [17 x i8] c"sizeof(char):%d\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"sizeof(charVal):%d\0A\00", align 1
@2 = private unnamed_addr constant [26 x i8] c"sizeof(unsigned char):%d\0A\00", align 1
@3 = private unnamed_addr constant [21 x i8] c"sizeof(ucharVal):%d\0A\00", align 1
@4 = private unnamed_addr constant [18 x i8] c"sizeof(short):%d\0A\00", align 1
@5 = private unnamed_addr constant [21 x i8] c"sizeof(shortVal):%d\0A\00", align 1
@6 = private unnamed_addr constant [27 x i8] c"sizeof(unsigned short):%d\0A\00", align 1
@7 = private unnamed_addr constant [22 x i8] c"sizeof(ushortVal):%d\0A\00", align 1
@8 = private unnamed_addr constant [16 x i8] c"sizeof(int):%d\0A\00", align 1
@9 = private unnamed_addr constant [19 x i8] c"sizeof(intVal):%d\0A\00", align 1
@10 = private unnamed_addr constant [25 x i8] c"sizeof(unsigned int):%d\0A\00", align 1
@11 = private unnamed_addr constant [20 x i8] c"sizeof(uintVal):%d\0A\00", align 1
@12 = private unnamed_addr constant [17 x i8] c"sizeof(long):%d\0A\00", align 1
@13 = private unnamed_addr constant [20 x i8] c"sizeof(longVal):%d\0A\00", align 1
@14 = private unnamed_addr constant [26 x i8] c"sizeof(unsigned long):%d\0A\00", align 1
@15 = private unnamed_addr constant [21 x i8] c"sizeof(ulongVal):%d\0A\00", align 1
@16 = private unnamed_addr constant [18 x i8] c"sizeof(float):%d\0A\00", align 1
@17 = private unnamed_addr constant [21 x i8] c"sizeof(floatVal):%d\0A\00", align 1
@18 = private unnamed_addr constant [19 x i8] c"sizeof(double):%d\0A\00", align 1
@19 = private unnamed_addr constant [22 x i8] c"sizeof(doubleVal):%d\0A\00", align 1
@20 = private unnamed_addr constant [18 x i8] c"sizeof(char*):%d\0A\00", align 1
@21 = private unnamed_addr constant [18 x i8] c"sizeof(pchar):%d\0A\00", align 1
@22 = private unnamed_addr constant [17 x i8] c"sizeof(int*):%d\0A\00", align 1
@23 = private unnamed_addr constant [17 x i8] c"sizeof(pint):%d\0A\00", align 1
@24 = private unnamed_addr constant [20 x i8] c"sizeof(Student):%d\0A\00", align 1
@25 = private unnamed_addr constant [20 x i8] c"sizeof(student):%d\0A\00", align 1
@26 = private unnamed_addr constant [15 x i8] c"sizeof(ID):%d\0A\00", align 1
@27 = private unnamed_addr constant [15 x i8] c"sizeof(id):%d\0A\00", align 1
@28 = private unnamed_addr constant [16 x i8] c"sizeof(SEX):%d\0A\00", align 1
@29 = private unnamed_addr constant [16 x i8] c"sizeof(sex):%d\0A\00", align 1

declare i32 @printf(i8*, ...)

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
  store i8 65, i8* %charVal, align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i64 1)
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), i64 1)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), i64 1)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @3, i32 0, i32 0), i64 1)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @4, i32 0, i32 0), i64 2)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @5, i32 0, i32 0), i64 2)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @6, i32 0, i32 0), i64 2)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @7, i32 0, i32 0), i64 2)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @8, i32 0, i32 0), i64 4)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @9, i32 0, i32 0), i64 4)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @10, i32 0, i32 0), i64 4)
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @11, i32 0, i32 0), i64 4)
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @12, i32 0, i32 0), i64 8)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @13, i32 0, i32 0), i64 8)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @14, i32 0, i32 0), i64 8)
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @15, i32 0, i32 0), i64 8)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @16, i32 0, i32 0), i64 4)
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @17, i32 0, i32 0), i64 4)
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @18, i32 0, i32 0), i64 8)
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @19, i32 0, i32 0), i64 8)
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @20, i32 0, i32 0), i64 8)
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @21, i32 0, i32 0), i64 8)
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @22, i32 0, i32 0), i64 8)
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @23, i32 0, i32 0), i64 8)
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @24, i32 0, i32 0), i64 24)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @25, i32 0, i32 0), i64 24)
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @26, i32 0, i32 0), i64 8)
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @27, i32 0, i32 0), i64 8)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @28, i32 0, i32 0), i64 4)
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @29, i32 0, i32 0), i64 4)
  ret i32 0
}
