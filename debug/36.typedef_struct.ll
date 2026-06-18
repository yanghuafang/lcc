; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i32, i8 }
%struct.Point = type { i32, i32 }

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [34 x i8] c"ERROR [%s]: got %lu expected %lu\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [31 x i8] c"**** 36.typedef_struct.c ****\0A\00", align 1
@5 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@6 = private unnamed_addr constant [17 x i8] c"sizeof(Employee)\00", align 1
@7 = private unnamed_addr constant [20 x i8] c"sizeof(EmployeePtr)\00", align 1
@8 = private unnamed_addr constant [14 x i8] c"sizeof(Point)\00", align 1
@9 = private unnamed_addr constant [15 x i8] c"sizeof(size_t)\00", align 1
@10 = private unnamed_addr constant [10 x i8] c"strlen_hi\00", align 1
@11 = private unnamed_addr constant [10 x i8] c"worker.id\00", align 1
@12 = private unnamed_addr constant [14 x i8] c"workerPtr->id\00", align 1
@13 = private unnamed_addr constant [15 x i8] c"workerPtr->sex\00", align 1
@14 = private unnamed_addr constant [9 x i8] c"origin.x\00", align 1
@15 = private unnamed_addr constant [9 x i8] c"origin.y\00", align 1

declare i32 @printf(i8*, ...)

declare void* @malloc(i64)

declare i64 @strlen(i8*)

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

define void @check_ulong(i8* %0, i64 %1, i64 %2) {
entry:
  %expected = alloca i64, align 8
  %actual = alloca i64, align 8
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i64 %1, i64* %actual, align 4
  store i64 %2, i64* %expected, align 4
  %3 = load i64, i64* %actual, align 4
  %4 = load i64, i64* %expected, align 4
  %5 = icmp ne i64 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i64, i64* %actual, align 4
  %8 = load i64, i64* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @1, i32 0, i32 0), i8* %6, i64 %7, i64 %8)
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
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @3, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define void @fill_employee(%struct.Employee* %0, i32 %1, i8 %2) {
entry:
  %sex = alloca i8, align 1
  %id = alloca i32, align 4
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  store i32 %1, i32* %id, align 4
  store i8 %2, i8* %sex, align 1
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %4 = bitcast %struct.Employee* %3 to i32*
  %5 = load i32, i32* %id, align 4
  store i32 %5, i32* %4, align 4
  %6 = load i32, i32* %4, align 4
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1
  %9 = load i8, i8* %sex, align 1
  store i8 %9, i8* %8, align 1
  %10 = load i8, i8* %8, align 1
  ret void
}

define i32 @main() {
entry:
  %len_hi = alloca i64, align 8
  %origin = alloca %struct.Point, align 8
  %workerPtr = alloca %struct.Employee*, align 8
  %worker = alloca %struct.Employee, align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @4, i32 0, i32 0))
  %1 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1
  store i8 77, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  %4 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  call void @fill_employee(%struct.Employee* %4, i32 11, i8 70)
  %5 = bitcast %struct.Point* %origin to i32*
  store i32 3, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1
  store i32 4, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @5, i32 0, i32 0))
  store i64 %9, i64* %len_hi, align 4
  call void @check_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @6, i32 0, i32 0), i32 8, i32 8)
  call void @check_int(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @7, i32 0, i32 0), i32 8, i32 8)
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @8, i32 0, i32 0), i32 8, i32 8)
  call void @check_ulong(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @9, i32 0, i32 0), i64 8, i64 8)
  %10 = load i64, i64* %len_hi, align 4
  call void @check_ulong(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @10, i32 0, i32 0), i64 %10, i64 2)
  %11 = bitcast %struct.Employee* %worker to i32*
  %12 = load i32, i32* %11, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @11, i32 0, i32 0), i32 %12, i32 11)
  %13 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  %14 = bitcast %struct.Employee* %13 to i32*
  %15 = load i32, i32* %14, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @12, i32 0, i32 0), i32 %15, i32 11)
  %16 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  %17 = getelementptr %struct.Employee, %struct.Employee* %16, i32 0, i32 1
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @13, i32 0, i32 0), i32 %19, i32 70)
  %20 = bitcast %struct.Point* %origin to i32*
  %21 = load i32, i32* %20, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @14, i32 0, i32 0), i32 %21, i32 3)
  %22 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 %23, i32 4)
  call void @report_result()
  %24 = load i32, i32* @test_errors, align 4
  ret i32 %24
}
