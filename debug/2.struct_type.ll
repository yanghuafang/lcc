; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i8*, i8, i32, i32, float }

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %c expected %c\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [17 x i8] c"deref struct...\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"\09name: %s\0A\00", align 1
@6 = private unnamed_addr constant [10 x i8] c"\09sex: %c\0A\00", align 1
@7 = private unnamed_addr constant [9 x i8] c"\09id: %d\0A\00", align 1
@8 = private unnamed_addr constant [10 x i8] c"\09age: %u\0A\00", align 1
@9 = private unnamed_addr constant [13 x i8] c"\09salary: %f\0A\00", align 1
@10 = private unnamed_addr constant [18 x i8] c"deref pointer...\0A\00", align 1
@11 = private unnamed_addr constant [11 x i8] c"\09name: %s\0A\00", align 1
@12 = private unnamed_addr constant [10 x i8] c"\09sex: %c\0A\00", align 1
@13 = private unnamed_addr constant [9 x i8] c"\09id: %d\0A\00", align 1
@14 = private unnamed_addr constant [10 x i8] c"\09age: %u\0A\00", align 1
@15 = private unnamed_addr constant [13 x i8] c"\09salary: %f\0A\00", align 1
@16 = private unnamed_addr constant [27 x i8] c"**** 2.struct_type.c ****\0A\00", align 1
@17 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@18 = private unnamed_addr constant [17 x i8] c"Employee ref...\0A\00", align 1
@19 = private unnamed_addr constant [11 x i8] c"\09name: %s\0A\00", align 1
@20 = private unnamed_addr constant [10 x i8] c"\09sex: %c\0A\00", align 1
@21 = private unnamed_addr constant [9 x i8] c"\09id: %d\0A\00", align 1
@22 = private unnamed_addr constant [10 x i8] c"\09age: %u\0A\00", align 1
@23 = private unnamed_addr constant [13 x i8] c"\09salary: %f\0A\00", align 1
@24 = private unnamed_addr constant [3 x i8] c"id\00", align 1
@25 = private unnamed_addr constant [4 x i8] c"sex\00", align 1
@26 = private unnamed_addr constant [4 x i8] c"age\00", align 1
@27 = private unnamed_addr constant [18 x i8] c"age boundary zero\00", align 1

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

define void @derefStruct(%struct.Employee* %0) {
entry:
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @4, i32 0, i32 0))
  %2 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %3 = bitcast %struct.Employee* %2 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i8* %4)
  %6 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %7 = getelementptr %struct.Employee, %struct.Employee* %6, i32 0, i32 1
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @6, i32 0, i32 0), i32 %9)
  %11 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %12 = getelementptr %struct.Employee, %struct.Employee* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @7, i32 0, i32 0), i32 %13)
  %15 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %16 = getelementptr %struct.Employee, %struct.Employee* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @8, i32 0, i32 0), i32 %17)
  %19 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %20 = getelementptr %struct.Employee, %struct.Employee* %19, i32 0, i32 4
  %21 = load float, float* %20, align 4
  %22 = fpext float %21 to double
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @9, i32 0, i32 0), double %22)
  ret void
}

define void @derefPointer(%struct.Employee* %0) {
entry:
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @10, i32 0, i32 0))
  %2 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %3 = bitcast %struct.Employee* %2 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @11, i32 0, i32 0), i8* %4)
  %6 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %7 = getelementptr %struct.Employee, %struct.Employee* %6, i32 0, i32 1
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @12, i32 0, i32 0), i32 %9)
  %11 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %12 = getelementptr %struct.Employee, %struct.Employee* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @13, i32 0, i32 0), i32 %13)
  %15 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %16 = getelementptr %struct.Employee, %struct.Employee* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @14, i32 0, i32 0), i32 %17)
  %19 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %20 = getelementptr %struct.Employee, %struct.Employee* %19, i32 0, i32 4
  %21 = load float, float* %20, align 4
  %22 = fpext float %21 to double
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @15, i32 0, i32 0), double %22)
  ret void
}

define i32 @main() {
entry:
  %employee = alloca %struct.Employee, align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @16, i32 0, i32 0))
  %1 = bitcast %struct.Employee* %employee to i8**
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @17, i32 0, i32 0), i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1
  store i8 77, i8* %3, align 1
  %4 = load i8, i8* %3, align 1
  %5 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2
  store i32 100, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  store i32 22, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 4
  store float 3.000000e+03, float* %9, align 4
  %10 = load float, float* %9, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @18, i32 0, i32 0))
  %12 = bitcast %struct.Employee* %employee to i8**
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @19, i32 0, i32 0), i8* %13)
  %15 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @20, i32 0, i32 0), i32 %17)
  %19 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @21, i32 0, i32 0), i32 %20)
  %22 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @22, i32 0, i32 0), i32 %23)
  %25 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 4
  %26 = load float, float* %25, align 4
  %27 = fpext float %26 to double
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @23, i32 0, i32 0), double %27)
  call void @derefStruct(%struct.Employee* %employee)
  call void @derefPointer(%struct.Employee* %employee)
  %29 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2
  %30 = load i32, i32* %29, align 4
  call void @check_int(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @24, i32 0, i32 0), i32 %30, i32 100)
  %31 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1
  %32 = load i8, i8* %31, align 1
  call void @check_char(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @25, i32 0, i32 0), i8 %32, i8 77)
  %33 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  %34 = load i32, i32* %33, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @26, i32 0, i32 0), i32 %34, i32 22)
  %35 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  store i32 0, i32* %35, align 4
  %36 = load i32, i32* %35, align 4
  %37 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  %38 = load i32, i32* %37, align 4
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @27, i32 0, i32 0), i32 %38, i32 0)
  call void @report_result()
  %39 = load i32, i32* @test_errors, align 4
  ret i32 %39
}
