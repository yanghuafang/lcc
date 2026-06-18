; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@ga = global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = global [3 x i8] c"hi\00"
@gt = global [4 x i8] c"hey\00"
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [46 x i8] c"**** 32.array_1d_inferred_string_init.c ****\0A\00", align 1
@5 = private unnamed_addr constant [6 x i8] c"la[0]\00", align 1
@6 = private unnamed_addr constant [6 x i8] c"la[1]\00", align 1
@7 = private unnamed_addr constant [6 x i8] c"la[2]\00", align 1
@8 = private unnamed_addr constant [6 x i8] c"ls[0]\00", align 1
@9 = private unnamed_addr constant [6 x i8] c"ls[1]\00", align 1
@10 = private unnamed_addr constant [6 x i8] c"ls[2]\00", align 1
@11 = private unnamed_addr constant [6 x i8] c"ls[3]\00", align 1
@12 = private unnamed_addr constant [6 x i8] c"ls[4]\00", align 1
@13 = private unnamed_addr constant [6 x i8] c"ls[5]\00", align 1
@14 = private unnamed_addr constant [6 x i8] c"lb[0]\00", align 1
@15 = private unnamed_addr constant [6 x i8] c"lb[5]\00", align 1
@16 = private unnamed_addr constant [6 x i8] c"ga[0]\00", align 1
@17 = private unnamed_addr constant [6 x i8] c"ga[1]\00", align 1
@18 = private unnamed_addr constant [6 x i8] c"ga[2]\00", align 1
@19 = private unnamed_addr constant [6 x i8] c"ga[3]\00", align 1
@20 = private unnamed_addr constant [6 x i8] c"ga[4]\00", align 1
@21 = private unnamed_addr constant [6 x i8] c"ga[5]\00", align 1
@22 = private unnamed_addr constant [6 x i8] c"gs[0]\00", align 1
@23 = private unnamed_addr constant [6 x i8] c"gs[1]\00", align 1
@24 = private unnamed_addr constant [6 x i8] c"gs[2]\00", align 1
@25 = private unnamed_addr constant [6 x i8] c"gt[0]\00", align 1
@26 = private unnamed_addr constant [6 x i8] c"gt[1]\00", align 1
@27 = private unnamed_addr constant [6 x i8] c"gt[2]\00", align 1
@28 = private unnamed_addr constant [6 x i8] c"gt[3]\00", align 1

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

define void @check_char(i8* %0, i32 %1, i32 %2) {
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
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @1, i32 0, i32 0), i8* %6, i32 %7, i32 %8)
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

define i32 @main() {
entry:
  %lb = alloca [6 x i8], align 1
  %ls = alloca [6 x i8], align 1
  %la = alloca [3 x i32], align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @4, i32 0, i32 0))
  %1 = bitcast [3 x i32]* %la to i32*
  store i32 1, i32* %1, align 4
  %2 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 1
  store i32 2, i32* %2, align 4
  %3 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 2
  store i32 3, i32* %3, align 4
  %4 = bitcast [6 x i8]* %ls to i8*
  store i8 104, i8* %4, align 1
  %5 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 1
  store i8 101, i8* %5, align 1
  %6 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 2
  store i8 108, i8* %6, align 1
  %7 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 3
  store i8 108, i8* %7, align 1
  %8 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 4
  store i8 111, i8* %8, align 1
  %9 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 5
  store i8 0, i8* %9, align 1
  %10 = bitcast [6 x i8]* %lb to i8*
  store i8 104, i8* %10, align 1
  %11 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 1
  store i8 101, i8* %11, align 1
  %12 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 2
  store i8 108, i8* %12, align 1
  %13 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 3
  store i8 108, i8* %13, align 1
  %14 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 4
  store i8 111, i8* %14, align 1
  %15 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 5
  store i8 0, i8* %15, align 1
  %16 = bitcast [3 x i32]* %la to i32*
  %17 = bitcast i32* %16 to i32*
  %18 = load i32, i32* %17, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @5, i32 0, i32 0), i32 %18, i32 1)
  %19 = bitcast [3 x i32]* %la to i32*
  %20 = getelementptr i32, i32* %19, i32 1
  %21 = load i32, i32* %20, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @6, i32 0, i32 0), i32 %21, i32 2)
  %22 = bitcast [3 x i32]* %la to i32*
  %23 = getelementptr i32, i32* %22, i32 2
  %24 = load i32, i32* %23, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @7, i32 0, i32 0), i32 %24, i32 3)
  %25 = bitcast [6 x i8]* %ls to i8*
  %26 = bitcast i8* %25 to i8*
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @8, i32 0, i32 0), i32 %28, i32 104)
  %29 = bitcast [6 x i8]* %ls to i8*
  %30 = getelementptr i8, i8* %29, i32 1
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @9, i32 0, i32 0), i32 %32, i32 101)
  %33 = bitcast [6 x i8]* %ls to i8*
  %34 = getelementptr i8, i8* %33, i32 2
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @10, i32 0, i32 0), i32 %36, i32 108)
  %37 = bitcast [6 x i8]* %ls to i8*
  %38 = getelementptr i8, i8* %37, i32 3
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @11, i32 0, i32 0), i32 %40, i32 108)
  %41 = bitcast [6 x i8]* %ls to i8*
  %42 = getelementptr i8, i8* %41, i32 4
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @12, i32 0, i32 0), i32 %44, i32 111)
  %45 = bitcast [6 x i8]* %ls to i8*
  %46 = getelementptr i8, i8* %45, i32 5
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @13, i32 0, i32 0), i32 %48, i32 0)
  %49 = bitcast [6 x i8]* %lb to i8*
  %50 = bitcast i8* %49 to i8*
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @14, i32 0, i32 0), i32 %52, i32 104)
  %53 = bitcast [6 x i8]* %lb to i8*
  %54 = getelementptr i8, i8* %53, i32 5
  %55 = load i8, i8* %54, align 1
  %56 = sext i8 %55 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @15, i32 0, i32 0), i32 %56, i32 0)
  %57 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @16, i32 0, i32 0), i32 %57, i32 10)
  %58 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @17, i32 0, i32 0), i32 %58, i32 7)
  %59 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 2), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @18, i32 0, i32 0), i32 %59, i32 8)
  %60 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 3), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @19, i32 0, i32 0), i32 %60, i32 9)
  %61 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 4), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @20, i32 0, i32 0), i32 %61, i32 1)
  %62 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 5), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @21, i32 0, i32 0), i32 %62, i32 5)
  %63 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 0), align 1
  %64 = sext i8 %63 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @22, i32 0, i32 0), i32 %64, i32 104)
  %65 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 1), align 1
  %66 = sext i8 %65 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @23, i32 0, i32 0), i32 %66, i32 105)
  %67 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 2), align 1
  %68 = sext i8 %67 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @24, i32 0, i32 0), i32 %68, i32 0)
  %69 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 0), align 1
  %70 = sext i8 %69 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @25, i32 0, i32 0), i32 %70, i32 104)
  %71 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 1), align 1
  %72 = sext i8 %71 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @26, i32 0, i32 0), i32 %72, i32 101)
  %73 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 2), align 1
  %74 = sext i8 %73 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @27, i32 0, i32 0), i32 %74, i32 121)
  %75 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 3), align 1
  %76 = sext i8 %75 to i32
  call void @check_char(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @28, i32 0, i32 0), i32 %76, i32 0)
  call void @report_result()
  %77 = load i32, i32* @test_errors, align 4
  ret i32 %77
}
