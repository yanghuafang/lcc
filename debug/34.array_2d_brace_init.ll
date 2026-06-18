; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [36 x i8] c"**** 34.array_2d_brace_init.c ****\0A\00", align 1
@4 = private unnamed_addr constant [9 x i8] c"la[0][0]\00", align 1
@5 = private unnamed_addr constant [9 x i8] c"la[0][2]\00", align 1
@6 = private unnamed_addr constant [9 x i8] c"la[1][0]\00", align 1
@7 = private unnamed_addr constant [9 x i8] c"la[1][2]\00", align 1
@8 = private unnamed_addr constant [9 x i8] c"lb[0][0]\00", align 1
@9 = private unnamed_addr constant [9 x i8] c"lb[1][2]\00", align 1
@10 = private unnamed_addr constant [9 x i8] c"lc[0][2]\00", align 1
@11 = private unnamed_addr constant [9 x i8] c"lc[1][0]\00", align 1
@12 = private unnamed_addr constant [9 x i8] c"lc[1][2]\00", align 1
@13 = private unnamed_addr constant [9 x i8] c"ga[0][0]\00", align 1
@14 = private unnamed_addr constant [9 x i8] c"ga[1][2]\00", align 1
@15 = private unnamed_addr constant [9 x i8] c"gb[0][1]\00", align 1
@16 = private unnamed_addr constant [9 x i8] c"gb[1][0]\00", align 1
@17 = private unnamed_addr constant [9 x i8] c"gc[0][1]\00", align 1
@18 = private unnamed_addr constant [9 x i8] c"gc[1][0]\00", align 1
@19 = private unnamed_addr constant [9 x i8] c"gc[1][1]\00", align 1

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
  %lc = alloca [2 x [3 x i32]], align 4
  %lb = alloca [2 x [3 x i32]], align 4
  %la = alloca [2 x [3 x i32]], align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [2 x [3 x i32]]* %la to i32*
  store i32 1, i32* %1, align 4
  %2 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 1
  store i32 2, i32* %2, align 4
  %3 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 2
  store i32 0, i32* %3, align 4
  %4 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 0
  store i32 3, i32* %4, align 4
  %5 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 1
  store i32 0, i32* %5, align 4
  %6 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 2
  store i32 0, i32* %6, align 4
  %7 = bitcast [2 x [3 x i32]]* %lb to i32*
  store i32 7, i32* %7, align 4
  %8 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 1
  store i32 8, i32* %8, align 4
  %9 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 2
  store i32 9, i32* %9, align 4
  %10 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 0
  store i32 10, i32* %10, align 4
  %11 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 1
  store i32 11, i32* %11, align 4
  %12 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 2
  store i32 12, i32* %12, align 4
  %13 = bitcast [2 x [3 x i32]]* %lc to i32*
  store i32 1, i32* %13, align 4
  %14 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 1
  store i32 2, i32* %14, align 4
  %15 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 2
  store i32 3, i32* %15, align 4
  %16 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 0
  store i32 4, i32* %16, align 4
  %17 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 1
  store i32 0, i32* %17, align 4
  %18 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 2
  store i32 0, i32* %18, align 4
  %19 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %20 = bitcast [3 x i32]* %19 to [3 x i32]*
  %21 = bitcast [3 x i32]* %20 to i32*
  %22 = bitcast i32* %21 to i32*
  %23 = load i32, i32* %22, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @4, i32 0, i32 0), i32 %23, i32 1)
  %24 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %25 = bitcast [3 x i32]* %24 to [3 x i32]*
  %26 = bitcast [3 x i32]* %25 to i32*
  %27 = getelementptr i32, i32* %26, i32 2
  %28 = load i32, i32* %27, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @5, i32 0, i32 0), i32 %28, i32 0)
  %29 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %30 = getelementptr [3 x i32], [3 x i32]* %29, i32 1
  %31 = bitcast [3 x i32]* %30 to i32*
  %32 = bitcast i32* %31 to i32*
  %33 = load i32, i32* %32, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @6, i32 0, i32 0), i32 %33, i32 3)
  %34 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %35 = getelementptr [3 x i32], [3 x i32]* %34, i32 1
  %36 = bitcast [3 x i32]* %35 to i32*
  %37 = getelementptr i32, i32* %36, i32 2
  %38 = load i32, i32* %37, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @7, i32 0, i32 0), i32 %38, i32 0)
  %39 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*
  %40 = bitcast [3 x i32]* %39 to [3 x i32]*
  %41 = bitcast [3 x i32]* %40 to i32*
  %42 = bitcast i32* %41 to i32*
  %43 = load i32, i32* %42, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @8, i32 0, i32 0), i32 %43, i32 7)
  %44 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*
  %45 = getelementptr [3 x i32], [3 x i32]* %44, i32 1
  %46 = bitcast [3 x i32]* %45 to i32*
  %47 = getelementptr i32, i32* %46, i32 2
  %48 = load i32, i32* %47, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @9, i32 0, i32 0), i32 %48, i32 12)
  %49 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*
  %50 = bitcast [3 x i32]* %49 to [3 x i32]*
  %51 = bitcast [3 x i32]* %50 to i32*
  %52 = getelementptr i32, i32* %51, i32 2
  %53 = load i32, i32* %52, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @10, i32 0, i32 0), i32 %53, i32 3)
  %54 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*
  %55 = getelementptr [3 x i32], [3 x i32]* %54, i32 1
  %56 = bitcast [3 x i32]* %55 to i32*
  %57 = bitcast i32* %56 to i32*
  %58 = load i32, i32* %57, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @11, i32 0, i32 0), i32 %58, i32 4)
  %59 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*
  %60 = getelementptr [3 x i32], [3 x i32]* %59, i32 1
  %61 = bitcast [3 x i32]* %60 to i32*
  %62 = getelementptr i32, i32* %61, i32 2
  %63 = load i32, i32* %62, align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @12, i32 0, i32 0), i32 %63, i32 0)
  %64 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 0, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @13, i32 0, i32 0), i32 %64, i32 1)
  %65 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 1, i32 2), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @14, i32 0, i32 0), i32 %65, i32 6)
  %66 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 %66, i32 1)
  %67 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 1, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @16, i32 0, i32 0), i32 %67, i32 3)
  %68 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @17, i32 0, i32 0), i32 %68, i32 11)
  %69 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @18, i32 0, i32 0), i32 %69, i32 20)
  %70 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @19, i32 0, i32 0), i32 %70, i32 0)
  call void @report_result()
  %71 = load i32, i32* @test_errors, align 4
  ret i32 %71
}
