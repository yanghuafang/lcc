; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [29 x i8] c"**** 24.struct_array.c ****\0A\00", align 1
@4 = private unnamed_addr constant [27 x i8] c"da[1].id:%d da[1].data:%d\0A\00", align 1
@5 = private unnamed_addr constant [9 x i8] c"da[1].id\00", align 1
@6 = private unnamed_addr constant [11 x i8] c"da[1].data\00", align 1
@7 = private unnamed_addr constant [17 x i8] c"da[0].id default\00", align 1
@8 = private unnamed_addr constant [19 x i8] c"da[0].data default\00", align 1

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
  %da = alloca [2 x %struct.Data], align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %2 = bitcast %struct.Data* %1 to %struct.Data*
  %3 = bitcast %struct.Data* %2 to i32*
  store i32 0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %6 = bitcast %struct.Data* %5 to %struct.Data*
  %7 = getelementptr %struct.Data, %struct.Data* %6, i32 0, i32 1
  store i32 0, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %10 = getelementptr %struct.Data, %struct.Data* %9, i32 1
  %11 = bitcast %struct.Data* %10 to i32*
  store i32 10, i32* %11, align 4
  %12 = load i32, i32* %11, align 4
  %13 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 1
  %15 = getelementptr %struct.Data, %struct.Data* %14, i32 0, i32 1
  store i32 80, i32* %15, align 4
  %16 = load i32, i32* %15, align 4
  %17 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %18 = getelementptr %struct.Data, %struct.Data* %17, i32 1
  %19 = bitcast %struct.Data* %18 to i32*
  %20 = load i32, i32* %19, align 4
  %21 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 1
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i32 %20, i32 %24)
  %26 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %27 = getelementptr %struct.Data, %struct.Data* %26, i32 1
  %28 = bitcast %struct.Data* %27 to i32*
  %29 = load i32, i32* %28, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @5, i32 0, i32 0), i32 %29, i32 10)
  %30 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %31 = getelementptr %struct.Data, %struct.Data* %30, i32 1
  %32 = getelementptr %struct.Data, %struct.Data* %31, i32 0, i32 1
  %33 = load i32, i32* %32, align 4
  call void @check_int(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @6, i32 0, i32 0), i32 %33, i32 80)
  %34 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %35 = bitcast %struct.Data* %34 to %struct.Data*
  %36 = bitcast %struct.Data* %35 to i32*
  %37 = load i32, i32* %36, align 4
  call void @check_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @7, i32 0, i32 0), i32 %37, i32 0)
  %38 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %39 = bitcast %struct.Data* %38 to %struct.Data*
  %40 = getelementptr %struct.Data, %struct.Data* %39, i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  call void @check_int(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @8, i32 0, i32 0), i32 %41, i32 0)
  call void @report_result()
  %42 = load i32, i32* @test_errors, align 4
  ret i32 %42
}
