; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [36 x i8] c"**** 31.array_1d_brace_init.c ****\0A\00", align 1
@4 = private unnamed_addr constant [6 x i8] c"la[0]\00", align 1
@5 = private unnamed_addr constant [6 x i8] c"la[1]\00", align 1
@6 = private unnamed_addr constant [6 x i8] c"la[2]\00", align 1
@7 = private unnamed_addr constant [6 x i8] c"la[3]\00", align 1
@8 = private unnamed_addr constant [6 x i8] c"lb[0]\00", align 1
@9 = private unnamed_addr constant [6 x i8] c"lb[1]\00", align 1
@10 = private unnamed_addr constant [6 x i8] c"lb[2]\00", align 1
@11 = private unnamed_addr constant [6 x i8] c"lc[0]\00", align 1
@12 = private unnamed_addr constant [6 x i8] c"lc[1]\00", align 1
@13 = private unnamed_addr constant [6 x i8] c"ga[0]\00", align 1
@14 = private unnamed_addr constant [6 x i8] c"ga[1]\00", align 1
@15 = private unnamed_addr constant [6 x i8] c"ga[2]\00", align 1
@16 = private unnamed_addr constant [6 x i8] c"ga[3]\00", align 1
@17 = private unnamed_addr constant [6 x i8] c"gb[0]\00", align 1
@18 = private unnamed_addr constant [6 x i8] c"gb[1]\00", align 1

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
  %lc = alloca [2 x i32], align 4
  %lb = alloca [3 x i32], align 4
  %la = alloca [4 x i32], align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [4 x i32]* %la to i32*
  store i32 1, i32* %1, align 4
  %2 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 1
  store i32 2, i32* %2, align 4
  %3 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 2
  store i32 3, i32* %3, align 4
  %4 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 3
  store i32 0, i32* %4, align 4
  %5 = bitcast [3 x i32]* %lb to i32*
  store i32 4, i32* %5, align 4
  %6 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 1
  store i32 5, i32* %6, align 4
  %7 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 2
  store i32 6, i32* %7, align 4
  %8 = bitcast [2 x i32]* %lc to i32*
  store i32 0, i32* %8, align 4
  %9 = getelementptr [2 x i32], [2 x i32]* %lc, i32 0, i32 1
  store i32 0, i32* %9, align 4
  %10 = bitcast [4 x i32]* %la to i32*
  %11 = bitcast i32* %10 to i32*
  %12 = load i32, i32* %11, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @4, i32 0, i32 0), i32 %12, i32 1)
  %13 = bitcast [4 x i32]* %la to i32*
  %14 = getelementptr i32, i32* %13, i32 1
  %15 = load i32, i32* %14, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @5, i32 0, i32 0), i32 %15, i32 2)
  %16 = bitcast [4 x i32]* %la to i32*
  %17 = getelementptr i32, i32* %16, i32 2
  %18 = load i32, i32* %17, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @6, i32 0, i32 0), i32 %18, i32 3)
  %19 = bitcast [4 x i32]* %la to i32*
  %20 = getelementptr i32, i32* %19, i32 3
  %21 = load i32, i32* %20, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @7, i32 0, i32 0), i32 %21, i32 0)
  %22 = bitcast [3 x i32]* %lb to i32*
  %23 = bitcast i32* %22 to i32*
  %24 = load i32, i32* %23, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @8, i32 0, i32 0), i32 %24, i32 4)
  %25 = bitcast [3 x i32]* %lb to i32*
  %26 = getelementptr i32, i32* %25, i32 1
  %27 = load i32, i32* %26, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @9, i32 0, i32 0), i32 %27, i32 5)
  %28 = bitcast [3 x i32]* %lb to i32*
  %29 = getelementptr i32, i32* %28, i32 2
  %30 = load i32, i32* %29, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @10, i32 0, i32 0), i32 %30, i32 6)
  %31 = bitcast [2 x i32]* %lc to i32*
  %32 = bitcast i32* %31 to i32*
  %33 = load i32, i32* %32, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @11, i32 0, i32 0), i32 %33, i32 0)
  %34 = bitcast [2 x i32]* %lc to i32*
  %35 = getelementptr i32, i32* %34, i32 1
  %36 = load i32, i32* %35, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0), i32 %36, i32 0)
  %37 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @13, i32 0, i32 0), i32 %37, i32 1)
  %38 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @14, i32 0, i32 0), i32 %38, i32 2)
  %39 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 2), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @15, i32 0, i32 0), i32 %39, i32 3)
  %40 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 3), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @16, i32 0, i32 0), i32 %40, i32 0)
  %41 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @17, i32 0, i32 0), i32 %41, i32 10)
  %42 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @18, i32 0, i32 0), i32 %42, i32 20)
  call void @report_result()
  %43 = load i32, i32* @test_errors, align 4
  ret i32 %43
}
