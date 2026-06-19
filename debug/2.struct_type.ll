; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i8*, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %age = alloca i32, align 4
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %employee = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast %struct.Employee* %employee to i8**
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @0, i32 0, i32 0), i8** %0, align 8
  %1 = load i8*, i8** %0, align 8
  %2 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1
  store i8 77, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2
  store i32 100, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  store i32 22, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 4
  store float 3.000000e+03, float* %8, align 4
  %9 = load float, float* %8, align 4
  %10 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %id, align 4
  %12 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  store i32 %14, i32* %sex, align 4
  %15 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %age, align 4
  %17 = load i32, i32* %id, align 4
  %18 = icmp ne i32 %17, 100
  br i1 %18, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %20 = load i32, i32* %sex, align 4
  %21 = icmp ne i32 %20, 77
  br i1 %21, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %22 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %23 = load i32, i32* %age, align 4
  %24 = icmp ne i32 %23, 22
  br i1 %24, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %25 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %26 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  store i32 0, i32* %26, align 4
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %age, align 4
  %30 = load i32, i32* %age, align 4
  %31 = load i32, i32* %age, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %34 = load i32, i32* %err, align 4
  %35 = icmp eq i32 %34, 0
  %. = select i1 %35, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @2, i32 0, i32 0)
  %36 = call i32 (i8*, ...) @printf(i8* %.)
  %37 = load i32, i32* %err, align 4
  ret i32 %37
}
