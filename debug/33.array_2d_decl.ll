; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Cell = type { i32, i32 }

@test_errors = global i32 0
@gm = global [3 x [4 x i32]] undef
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [30 x i8] c"**** 33.array_2d_decl.c ****\0A\00", align 1
@4 = private unnamed_addr constant [8 x i8] c"m[0][0]\00", align 1
@5 = private unnamed_addr constant [8 x i8] c"m[0][2]\00", align 1
@6 = private unnamed_addr constant [8 x i8] c"m[1][1]\00", align 1
@7 = private unnamed_addr constant [8 x i8] c"m[1][2]\00", align 1
@8 = private unnamed_addr constant [7 x i8] c"scalar\00", align 1
@9 = private unnamed_addr constant [9 x i8] c"gm[0][0]\00", align 1
@10 = private unnamed_addr constant [9 x i8] c"gm[1][2]\00", align 1
@11 = private unnamed_addr constant [9 x i8] c"gm[2][3]\00", align 1
@12 = private unnamed_addr constant [17 x i8] c"gm[0][1] default\00", align 1
@13 = private unnamed_addr constant [14 x i8] c"grid[0][1].id\00", align 1
@14 = private unnamed_addr constant [15 x i8] c"grid[0][1].val\00", align 1
@15 = private unnamed_addr constant [14 x i8] c"grid[1][0].id\00", align 1

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
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
  %scalar = alloca i32, align 4
  %m = alloca [2 x [3 x i32]], align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %2 = bitcast [3 x i32]* %1 to [3 x i32]*
  %3 = bitcast [3 x i32]* %2 to i32*
  %4 = bitcast i32* %3 to i32*
  store i32 1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %7 = bitcast [3 x i32]* %6 to [3 x i32]*
  %8 = bitcast [3 x i32]* %7 to i32*
  %9 = getelementptr i32, i32* %8, i32 1
  store i32 2, i32* %9, align 4
  %10 = load i32, i32* %9, align 4
  %11 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %12 = bitcast [3 x i32]* %11 to [3 x i32]*
  %13 = bitcast [3 x i32]* %12 to i32*
  %14 = getelementptr i32, i32* %13, i32 2
  store i32 3, i32* %14, align 4
  %15 = load i32, i32* %14, align 4
  %16 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %17 = getelementptr [3 x i32], [3 x i32]* %16, i32 1
  %18 = bitcast [3 x i32]* %17 to i32*
  %19 = bitcast i32* %18 to i32*
  store i32 4, i32* %19, align 4
  %20 = load i32, i32* %19, align 4
  %21 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %22 = getelementptr [3 x i32], [3 x i32]* %21, i32 1
  %23 = bitcast [3 x i32]* %22 to i32*
  %24 = getelementptr i32, i32* %23, i32 1
  store i32 5, i32* %24, align 4
  %25 = load i32, i32* %24, align 4
  %26 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %27 = getelementptr [3 x i32], [3 x i32]* %26, i32 1
  %28 = bitcast [3 x i32]* %27 to i32*
  %29 = getelementptr i32, i32* %28, i32 2
  store i32 6, i32* %29, align 4
  %30 = load i32, i32* %29, align 4
  store i32 99, i32* %scalar, align 4
  %31 = load i32, i32* %scalar, align 4
  store i32 10, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4
  %32 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4
  store i32 20, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4
  %33 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4
  store i32 30, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4
  %34 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4
  %35 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*
  %36 = bitcast [2 x %struct.Cell]* %35 to [2 x %struct.Cell]*
  %37 = bitcast [2 x %struct.Cell]* %36 to %struct.Cell*
  %38 = getelementptr %struct.Cell, %struct.Cell* %37, i32 1
  %39 = bitcast %struct.Cell* %38 to i32*
  store i32 7, i32* %39, align 4
  %40 = load i32, i32* %39, align 4
  %41 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*
  %42 = bitcast [2 x %struct.Cell]* %41 to [2 x %struct.Cell]*
  %43 = bitcast [2 x %struct.Cell]* %42 to %struct.Cell*
  %44 = getelementptr %struct.Cell, %struct.Cell* %43, i32 1
  %45 = getelementptr %struct.Cell, %struct.Cell* %44, i32 0, i32 1
  store i32 70, i32* %45, align 4
  %46 = load i32, i32* %45, align 4
  %47 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*
  %48 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %47, i32 1
  %49 = bitcast [2 x %struct.Cell]* %48 to %struct.Cell*
  %50 = bitcast %struct.Cell* %49 to %struct.Cell*
  %51 = bitcast %struct.Cell* %50 to i32*
  store i32 8, i32* %51, align 4
  %52 = load i32, i32* %51, align 4
  %53 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %54 = bitcast [3 x i32]* %53 to [3 x i32]*
  %55 = bitcast [3 x i32]* %54 to i32*
  %56 = bitcast i32* %55 to i32*
  %57 = load i32, i32* %56, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @4, i32 0, i32 0), i32 %57, i32 1)
  %58 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %59 = bitcast [3 x i32]* %58 to [3 x i32]*
  %60 = bitcast [3 x i32]* %59 to i32*
  %61 = getelementptr i32, i32* %60, i32 2
  %62 = load i32, i32* %61, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @5, i32 0, i32 0), i32 %62, i32 3)
  %63 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %64 = getelementptr [3 x i32], [3 x i32]* %63, i32 1
  %65 = bitcast [3 x i32]* %64 to i32*
  %66 = getelementptr i32, i32* %65, i32 1
  %67 = load i32, i32* %66, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @6, i32 0, i32 0), i32 %67, i32 5)
  %68 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*
  %69 = getelementptr [3 x i32], [3 x i32]* %68, i32 1
  %70 = bitcast [3 x i32]* %69 to i32*
  %71 = getelementptr i32, i32* %70, i32 2
  %72 = load i32, i32* %71, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @7, i32 0, i32 0), i32 %72, i32 6)
  %73 = load i32, i32* %scalar, align 4
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @8, i32 0, i32 0), i32 %73, i32 99)
  %74 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @9, i32 0, i32 0), i32 %74, i32 10)
  %75 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @10, i32 0, i32 0), i32 %75, i32 20)
  %76 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4
  call void @check_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @11, i32 0, i32 0), i32 %76, i32 30)
  %77 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 1), align 4
  call void @check_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @12, i32 0, i32 0), i32 %77, i32 0)
  %78 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*
  %79 = bitcast [2 x %struct.Cell]* %78 to [2 x %struct.Cell]*
  %80 = bitcast [2 x %struct.Cell]* %79 to %struct.Cell*
  %81 = getelementptr %struct.Cell, %struct.Cell* %80, i32 1
  %82 = bitcast %struct.Cell* %81 to i32*
  %83 = load i32, i32* %82, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @13, i32 0, i32 0), i32 %83, i32 7)
  %84 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*
  %85 = bitcast [2 x %struct.Cell]* %84 to [2 x %struct.Cell]*
  %86 = bitcast [2 x %struct.Cell]* %85 to %struct.Cell*
  %87 = getelementptr %struct.Cell, %struct.Cell* %86, i32 1
  %88 = getelementptr %struct.Cell, %struct.Cell* %87, i32 0, i32 1
  %89 = load i32, i32* %88, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @14, i32 0, i32 0), i32 %89, i32 70)
  %90 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*
  %91 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %90, i32 1
  %92 = bitcast [2 x %struct.Cell]* %91 to %struct.Cell*
  %93 = bitcast %struct.Cell* %92 to %struct.Cell*
  %94 = bitcast %struct.Cell* %93 to i32*
  %95 = load i32, i32* %94, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @15, i32 0, i32 0), i32 %95, i32 8)
  call void @report_result()
  %96 = load i32, i32* @test_errors, align 4
  ret i32 %96
}
