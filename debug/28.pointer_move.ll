; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %c expected %c\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [29 x i8] c"**** 28.pointer_move.c ****\0A\00", align 1
@4 = private unnamed_addr constant [13 x i8] c"c[0]: %c %c\0A\00", align 1
@5 = private unnamed_addr constant [13 x i8] c"c[0] forward\00", align 1
@6 = private unnamed_addr constant [13 x i8] c"c[1]: %c %c\0A\00", align 1
@7 = private unnamed_addr constant [13 x i8] c"c[1] forward\00", align 1
@8 = private unnamed_addr constant [13 x i8] c"c[2]: %c %c\0A\00", align 1
@9 = private unnamed_addr constant [13 x i8] c"c[2] forward\00", align 1
@10 = private unnamed_addr constant [13 x i8] c"c[3]: %c %c\0A\00", align 1
@11 = private unnamed_addr constant [13 x i8] c"c[3] forward\00", align 1
@12 = private unnamed_addr constant [13 x i8] c"c[3]: %c %c\0A\00", align 1
@13 = private unnamed_addr constant [20 x i8] c"c[3] backward start\00", align 1
@14 = private unnamed_addr constant [13 x i8] c"c[2]: %c %c\0A\00", align 1
@15 = private unnamed_addr constant [14 x i8] c"c[2] backward\00", align 1
@16 = private unnamed_addr constant [13 x i8] c"c[1]: %c %c\0A\00", align 1
@17 = private unnamed_addr constant [14 x i8] c"c[1] backward\00", align 1
@18 = private unnamed_addr constant [13 x i8] c"c[0]: %c %c\0A\00", align 1
@19 = private unnamed_addr constant [18 x i8] c"c[0] backward end\00", align 1

declare i32 @printf(i8*, ...)

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
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @0, i32 0, i32 0), i8* %8, i32 %10, i32 %12)
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
  %pc = alloca i8*, align 8
  %c = alloca [4 x i8], align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [4 x i8]* %c to i8*
  %2 = bitcast i8* %1 to i8*
  store i8 65, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = bitcast [4 x i8]* %c to i8*
  %5 = getelementptr i8, i8* %4, i32 1
  store i8 66, i8* %5, align 1
  %6 = load i8, i8* %5, align 1
  %7 = bitcast [4 x i8]* %c to i8*
  %8 = getelementptr i8, i8* %7, i32 2
  store i8 67, i8* %8, align 1
  %9 = load i8, i8* %8, align 1
  %10 = bitcast [4 x i8]* %c to i8*
  %11 = getelementptr i8, i8* %10, i32 3
  store i8 68, i8* %11, align 1
  %12 = load i8, i8* %11, align 1
  %13 = bitcast [4 x i8]* %c to i8*
  store i8* %13, i8** %pc, align 8
  %14 = load i8*, i8** %pc, align 8
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8*, i8** %pc, align 8
  %18 = bitcast i8* %17 to i8*
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i32 0, i32 0), i32 %16, i32 %20)
  %22 = load i8*, i8** %pc, align 8
  %23 = load i8, i8* %22, align 1
  call void @check_char(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @5, i32 0, i32 0), i8 %23, i8 65)
  %24 = load i8*, i8** %pc, align 8
  %25 = getelementptr i8, i8* %24, i32 1
  store i8* %25, i8** %pc, align 8
  %26 = load i8*, i8** %pc, align 8
  %27 = load i8*, i8** %pc, align 8
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = load i8*, i8** %pc, align 8
  %31 = bitcast i8* %30 to i8*
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @6, i32 0, i32 0), i32 %29, i32 %33)
  %35 = load i8*, i8** %pc, align 8
  %36 = load i8, i8* %35, align 1
  call void @check_char(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @7, i32 0, i32 0), i8 %36, i8 66)
  %37 = load i8*, i8** %pc, align 8
  %38 = getelementptr i8, i8* %37, i32 1
  store i8* %38, i8** %pc, align 8
  %39 = load i8*, i8** %pc, align 8
  %40 = load i8*, i8** %pc, align 8
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = load i8*, i8** %pc, align 8
  %44 = bitcast i8* %43 to i8*
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @8, i32 0, i32 0), i32 %42, i32 %46)
  %48 = load i8*, i8** %pc, align 8
  %49 = load i8, i8* %48, align 1
  call void @check_char(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @9, i32 0, i32 0), i8 %49, i8 67)
  %50 = load i8*, i8** %pc, align 8
  %51 = getelementptr i8, i8* %50, i32 1
  store i8* %51, i8** %pc, align 8
  %52 = load i8*, i8** %pc, align 8
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = load i8*, i8** %pc, align 8
  %56 = bitcast i8* %55 to i8*
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @10, i32 0, i32 0), i32 %54, i32 %58)
  %60 = load i8*, i8** %pc, align 8
  %61 = load i8, i8* %60, align 1
  call void @check_char(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @11, i32 0, i32 0), i8 %61, i8 68)
  %62 = bitcast [4 x i8]* %c to i8*
  %63 = getelementptr i8, i8* %62, i32 3
  store i8* %63, i8** %pc, align 8
  %64 = load i8*, i8** %pc, align 8
  %65 = load i8*, i8** %pc, align 8
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = load i8*, i8** %pc, align 8
  %69 = bitcast i8* %68 to i8*
  %70 = load i8, i8* %69, align 1
  %71 = sext i8 %70 to i32
  %72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @12, i32 0, i32 0), i32 %67, i32 %71)
  %73 = load i8*, i8** %pc, align 8
  %74 = load i8, i8* %73, align 1
  call void @check_char(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @13, i32 0, i32 0), i8 %74, i8 68)
  %75 = load i8*, i8** %pc, align 8
  %76 = getelementptr i8, i8* %75, i32 -1
  store i8* %76, i8** %pc, align 8
  %77 = load i8*, i8** %pc, align 8
  %78 = load i8*, i8** %pc, align 8
  %79 = load i8, i8* %78, align 1
  %80 = sext i8 %79 to i32
  %81 = load i8*, i8** %pc, align 8
  %82 = bitcast i8* %81 to i8*
  %83 = load i8, i8* %82, align 1
  %84 = sext i8 %83 to i32
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @14, i32 0, i32 0), i32 %80, i32 %84)
  %86 = load i8*, i8** %pc, align 8
  %87 = load i8, i8* %86, align 1
  call void @check_char(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @15, i32 0, i32 0), i8 %87, i8 67)
  %88 = load i8*, i8** %pc, align 8
  %89 = getelementptr i8, i8* %88, i32 -1
  store i8* %89, i8** %pc, align 8
  %90 = load i8*, i8** %pc, align 8
  %91 = load i8*, i8** %pc, align 8
  %92 = load i8, i8* %91, align 1
  %93 = sext i8 %92 to i32
  %94 = load i8*, i8** %pc, align 8
  %95 = bitcast i8* %94 to i8*
  %96 = load i8, i8* %95, align 1
  %97 = sext i8 %96 to i32
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @16, i32 0, i32 0), i32 %93, i32 %97)
  %99 = load i8*, i8** %pc, align 8
  %100 = load i8, i8* %99, align 1
  call void @check_char(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @17, i32 0, i32 0), i8 %100, i8 66)
  %101 = load i8*, i8** %pc, align 8
  %102 = getelementptr i8, i8* %101, i32 -1
  store i8* %102, i8** %pc, align 8
  %103 = load i8*, i8** %pc, align 8
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  %106 = load i8*, i8** %pc, align 8
  %107 = bitcast i8* %106 to i8*
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @18, i32 0, i32 0), i32 %105, i32 %109)
  %111 = load i8*, i8** %pc, align 8
  %112 = load i8, i8* %111, align 1
  call void @check_char(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @19, i32 0, i32 0), i8 %112, i8 65)
  call void @report_result()
  %113 = load i32, i32* @test_errors, align 4
  ret i32 %113
}
