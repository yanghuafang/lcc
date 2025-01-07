; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

%struct.Employee = type { i8*, i8, i32, i32, float }

@0 = private unnamed_addr constant [17 x i8] c"deref struct...\0A\00", align 1
@1 = private unnamed_addr constant [11 x i8] c"\09name: %s\0A\00", align 1
@2 = private unnamed_addr constant [10 x i8] c"\09sex: %c\0A\00", align 1
@3 = private unnamed_addr constant [9 x i8] c"\09id: %d\0A\00", align 1
@4 = private unnamed_addr constant [10 x i8] c"\09age: %u\0A\00", align 1
@5 = private unnamed_addr constant [13 x i8] c"\09salary: %f\0A\00", align 1
@6 = private unnamed_addr constant [18 x i8] c"deref pointer...\0A\00", align 1
@7 = private unnamed_addr constant [11 x i8] c"\09name: %s\0A\00", align 1
@8 = private unnamed_addr constant [10 x i8] c"\09sex: %c\0A\00", align 1
@9 = private unnamed_addr constant [9 x i8] c"\09id: %d\0A\00", align 1
@10 = private unnamed_addr constant [10 x i8] c"\09age: %u\0A\00", align 1
@11 = private unnamed_addr constant [13 x i8] c"\09salary: %f\0A\00", align 1
@12 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@13 = private unnamed_addr constant [17 x i8] c"Employee ref...\0A\00", align 1
@14 = private unnamed_addr constant [11 x i8] c"\09name: %s\0A\00", align 1
@15 = private unnamed_addr constant [10 x i8] c"\09sex: %c\0A\00", align 1
@16 = private unnamed_addr constant [9 x i8] c"\09id: %d\0A\00", align 1
@17 = private unnamed_addr constant [10 x i8] c"\09age: %u\0A\00", align 1
@18 = private unnamed_addr constant [13 x i8] c"\09salary: %f\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @derefStruct(%struct.Employee* %0) {
entry:
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0))
  %2 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %3 = bitcast %struct.Employee* %2 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @1, i32 0, i32 0), i8* %4)
  %6 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %7 = getelementptr %struct.Employee, %struct.Employee* %6, i32 0, i32 1
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @2, i32 0, i32 0), i32 %9)
  %11 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %12 = getelementptr %struct.Employee, %struct.Employee* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @3, i32 0, i32 0), i32 %13)
  %15 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %16 = getelementptr %struct.Employee, %struct.Employee* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @4, i32 0, i32 0), i32 %17)
  %19 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %20 = getelementptr %struct.Employee, %struct.Employee* %19, i32 0, i32 4
  %21 = load float, float* %20, align 4
  %22 = fpext float %21 to double
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @5, i32 0, i32 0), double %22)
  ret void
}

define void @derefPointer(%struct.Employee* %0) {
entry:
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @6, i32 0, i32 0))
  %2 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %3 = bitcast %struct.Employee* %2 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @7, i32 0, i32 0), i8* %4)
  %6 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %7 = getelementptr %struct.Employee, %struct.Employee* %6, i32 0, i32 1
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @8, i32 0, i32 0), i32 %9)
  %11 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %12 = getelementptr %struct.Employee, %struct.Employee* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @9, i32 0, i32 0), i32 %13)
  %15 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %16 = getelementptr %struct.Employee, %struct.Employee* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @10, i32 0, i32 0), i32 %17)
  %19 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %20 = getelementptr %struct.Employee, %struct.Employee* %19, i32 0, i32 4
  %21 = load float, float* %20, align 4
  %22 = fpext float %21 to double
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @11, i32 0, i32 0), double %22)
  ret void
}

define i32 @main() {
entry:
  %employee = alloca %struct.Employee, align 8
  %0 = bitcast %struct.Employee* %employee to i8**
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @12, i32 0, i32 0), i8** %0, align 8
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
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @13, i32 0, i32 0))
  %11 = bitcast %struct.Employee* %employee to i8**
  %12 = load i8*, i8** %11, align 8
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @14, i32 0, i32 0), i8* %12)
  %14 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 1
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @15, i32 0, i32 0), i32 %16)
  %18 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 2
  %19 = load i32, i32* %18, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @16, i32 0, i32 0), i32 %19)
  %21 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @17, i32 0, i32 0), i32 %22)
  %24 = getelementptr %struct.Employee, %struct.Employee* %employee, i32 0, i32 4
  %25 = load float, float* %24, align 4
  %26 = fpext float %25 to double
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @18, i32 0, i32 0), double %26)
  call void @derefStruct(%struct.Employee* %employee)
  call void @derefPointer(%struct.Employee* %employee)
  ret i32 0
}
