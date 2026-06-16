; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@gs = global [16 x i8] undef
@3 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0)
@gi = global [4 x i32] undef
@4 = private unnamed_addr constant [26 x i8] c"**** 6.array_type.c ****\0A\00", align 1
@5 = private unnamed_addr constant [16 x i8] c"happy new year!\00", align 1
@6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@7 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@8 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@10 = private unnamed_addr constant [9 x i8] c"i %d %d\0A\00", align 1
@11 = private unnamed_addr constant [14 x i8] c"i addr %p %p\0A\00", align 1
@12 = private unnamed_addr constant [10 x i8] c"gi %d %d\0A\00", align 1
@13 = private unnamed_addr constant [15 x i8] c"gi addr %p %p\0A\00", align 1
@14 = private unnamed_addr constant [5 x i8] c"i[0]\00", align 1
@15 = private unnamed_addr constant [5 x i8] c"i[1]\00", align 1
@16 = private unnamed_addr constant [6 x i8] c"gi[0]\00", align 1
@17 = private unnamed_addr constant [6 x i8] c"gi[1]\00", align 1
@18 = private unnamed_addr constant [5 x i8] c"s[0]\00", align 1
@19 = private unnamed_addr constant [6 x i8] c"gs[0]\00", align 1
@20 = private unnamed_addr constant [10 x i8] c"i[2] zero\00", align 1
@21 = private unnamed_addr constant [14 x i8] c"i[3] negative\00", align 1

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
  %i = alloca [4 x i32], align 4
  %s = alloca [16 x i8], align 1
  %ps = alloca i8*, align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @4, i32 0, i32 0))
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @5, i32 0, i32 0), i8** %ps, align 8
  %1 = load i8*, i8** %ps, align 8
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @6, i32 0, i32 0), i8* %1)
  %3 = load i8*, i8** @gps, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @7, i32 0, i32 0), i8* %3)
  %5 = bitcast [16 x i8]* %s to i8*
  %6 = bitcast i8* %5 to i8*
  store i8 103, i8* %6, align 1
  %7 = load i8, i8* %6, align 1
  %8 = bitcast [16 x i8]* %s to i8*
  %9 = getelementptr i8, i8* %8, i32 1
  store i8 111, i8* %9, align 1
  %10 = load i8, i8* %9, align 1
  %11 = bitcast [16 x i8]* %s to i8*
  %12 = getelementptr i8, i8* %11, i32 2
  store i8 111, i8* %12, align 1
  %13 = load i8, i8* %12, align 1
  %14 = bitcast [16 x i8]* %s to i8*
  %15 = getelementptr i8, i8* %14, i32 3
  store i8 100, i8* %15, align 1
  %16 = load i8, i8* %15, align 1
  %17 = bitcast [16 x i8]* %s to i8*
  %18 = getelementptr i8, i8* %17, i32 4
  store i8 0, i8* %18, align 1
  %19 = load i8, i8* %18, align 1
  %20 = bitcast [16 x i8]* %s to i8*
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @8, i32 0, i32 0), i8* %20)
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  %22 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1
  %23 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1
  %24 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1
  %25 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1
  %26 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1
  %27 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @9, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0))
  %29 = bitcast [4 x i32]* %i to i32*
  %30 = bitcast i32* %29 to i32*
  store i32 128, i32* %30, align 4
  %31 = load i32, i32* %30, align 4
  %32 = bitcast [4 x i32]* %i to i32*
  %33 = getelementptr i32, i32* %32, i32 1
  store i32 256, i32* %33, align 4
  %34 = load i32, i32* %33, align 4
  %35 = bitcast [4 x i32]* %i to i32*
  %36 = bitcast i32* %35 to i32*
  %37 = load i32, i32* %36, align 4
  %38 = bitcast [4 x i32]* %i to i32*
  %39 = getelementptr i32, i32* %38, i32 1
  %40 = load i32, i32* %39, align 4
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @10, i32 0, i32 0), i32 %37, i32 %40)
  %42 = bitcast [4 x i32]* %i to i32*
  %43 = bitcast i32* %42 to i32*
  %44 = bitcast [4 x i32]* %i to i32*
  %45 = getelementptr i32, i32* %44, i32 1
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @11, i32 0, i32 0), i32* %43, i32* %45)
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  %47 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %48 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %49 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  %50 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @12, i32 0, i32 0), i32 %49, i32 %50)
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @13, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1))
  %53 = bitcast [4 x i32]* %i to i32*
  %54 = bitcast i32* %53 to i32*
  %55 = load i32, i32* %54, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i32 %55, i32 128)
  %56 = bitcast [4 x i32]* %i to i32*
  %57 = getelementptr i32, i32* %56, i32 1
  %58 = load i32, i32* %57, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @15, i32 0, i32 0), i32 %58, i32 256)
  %59 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @16, i32 0, i32 0), i32 %59, i32 1024)
  %60 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @17, i32 0, i32 0), i32 %60, i32 2048)
  %61 = bitcast [16 x i8]* %s to i8*
  %62 = bitcast i8* %61 to i8*
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @18, i32 0, i32 0), i32 %64, i32 103)
  %65 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  %66 = sext i8 %65 to i32
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @19, i32 0, i32 0), i32 %66, i32 108)
  %67 = bitcast [4 x i32]* %i to i32*
  %68 = getelementptr i32, i32* %67, i32 2
  store i32 0, i32* %68, align 4
  %69 = load i32, i32* %68, align 4
  %70 = bitcast [4 x i32]* %i to i32*
  %71 = getelementptr i32, i32* %70, i32 3
  store i32 -1, i32* %71, align 4
  %72 = load i32, i32* %71, align 4
  %73 = bitcast [4 x i32]* %i to i32*
  %74 = getelementptr i32, i32* %73, i32 2
  %75 = load i32, i32* %74, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @20, i32 0, i32 0), i32 %75, i32 0)
  %76 = bitcast [4 x i32]* %i to i32*
  %77 = getelementptr i32, i32* %76, i32 3
  %78 = load i32, i32* %77, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @21, i32 0, i32 0), i32 %78, i32 -1)
  call void @report_result()
  %79 = load i32, i32* @test_errors, align 4
  ret i32 %79
}
