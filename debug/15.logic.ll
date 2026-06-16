; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [34 x i8] c"ERROR [%s]: got %d expected true\0A\00", align 1
@2 = private unnamed_addr constant [35 x i8] c"ERROR [%s]: got %d expected false\0A\00", align 1
@3 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@4 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@5 = private unnamed_addr constant [22 x i8] c"**** 15.logic.c ****\0A\00", align 1
@6 = private unnamed_addr constant [11 x i8] c"t:%d f:%d\0A\00", align 1
@7 = private unnamed_addr constant [11 x i8] c"t && f:%d\0A\00", align 1
@8 = private unnamed_addr constant [11 x i8] c"t && t:%d\0A\00", align 1
@9 = private unnamed_addr constant [11 x i8] c"f && f:%d\0A\00", align 1
@10 = private unnamed_addr constant [11 x i8] c"t || f:%d\0A\00", align 1
@11 = private unnamed_addr constant [11 x i8] c"t || t:%d\0A\00", align 1
@12 = private unnamed_addr constant [11 x i8] c"f || f:%d\0A\00", align 1
@13 = private unnamed_addr constant [7 x i8] c"!t:%d\0A\00", align 1
@14 = private unnamed_addr constant [7 x i8] c"!f:%d\0A\00", align 1
@15 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@16 = private unnamed_addr constant [2 x i8] c"f\00", align 1
@17 = private unnamed_addr constant [7 x i8] c"t && f\00", align 1
@18 = private unnamed_addr constant [7 x i8] c"t && t\00", align 1
@19 = private unnamed_addr constant [7 x i8] c"f && f\00", align 1
@20 = private unnamed_addr constant [7 x i8] c"t || f\00", align 1
@21 = private unnamed_addr constant [7 x i8] c"t || t\00", align 1
@22 = private unnamed_addr constant [7 x i8] c"f || f\00", align 1
@23 = private unnamed_addr constant [3 x i8] c"!t\00", align 1
@24 = private unnamed_addr constant [3 x i8] c"!f\00", align 1
@25 = private unnamed_addr constant [11 x i8] c"100 == 100\00", align 1
@26 = private unnamed_addr constant [11 x i8] c"100 == 128\00", align 1
@27 = private unnamed_addr constant [11 x i8] c"100 != 100\00", align 1
@28 = private unnamed_addr constant [11 x i8] c"100 != 128\00", align 1
@29 = private unnamed_addr constant [10 x i8] c"100 < 100\00", align 1
@30 = private unnamed_addr constant [10 x i8] c"100 < 128\00", align 1
@31 = private unnamed_addr constant [10 x i8] c"128 < 100\00", align 1
@32 = private unnamed_addr constant [11 x i8] c"100 <= 100\00", align 1
@33 = private unnamed_addr constant [11 x i8] c"100 <= 128\00", align 1
@34 = private unnamed_addr constant [11 x i8] c"128 <= 100\00", align 1
@35 = private unnamed_addr constant [10 x i8] c"100 > 100\00", align 1
@36 = private unnamed_addr constant [10 x i8] c"100 > 128\00", align 1
@37 = private unnamed_addr constant [10 x i8] c"128 > 100\00", align 1
@38 = private unnamed_addr constant [11 x i8] c"100 >= 100\00", align 1
@39 = private unnamed_addr constant [11 x i8] c"100 >= 128\00", align 1
@40 = private unnamed_addr constant [11 x i8] c"128 >= 100\00", align 1
@41 = private unnamed_addr constant [29 x i8] c"unsigned 1 < 0xFFFFFFFF: %d\0A\00", align 1
@42 = private unnamed_addr constant [29 x i8] c"unsigned 0xFFFFFFFF > 1: %d\0A\00", align 1
@43 = private unnamed_addr constant [23 x i8] c"unsigned less boundary\00", align 1
@44 = private unnamed_addr constant [26 x i8] c"unsigned greater boundary\00", align 1
@45 = private unnamed_addr constant [19 x i8] c"mixed -1 < 1u: %d\0A\00", align 1
@46 = private unnamed_addr constant [19 x i8] c"mixed -1 > 1u: %d\0A\00", align 1
@47 = private unnamed_addr constant [32 x i8] c"mixed -1 < 1u promotes unsigned\00", align 1
@48 = private unnamed_addr constant [32 x i8] c"mixed -1 > 1u promotes unsigned\00", align 1

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

define void @check_bool(i8* %0, i32 %1, i32 %2) {
entry:
  %isTruthy = alloca i32, align 4
  %expectedTruthy = alloca i32, align 4
  %actual = alloca i32, align 4
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i32 %1, i32* %actual, align 4
  store i32 %2, i32* %expectedTruthy, align 4
  store i32 0, i32* %isTruthy, align 4
  %3 = load i32, i32* %actual, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %isTruthy, align 4
  %5 = load i32, i32* %isTruthy, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %6 = load i32, i32* %isTruthy, align 4
  %7 = load i32, i32* %expectedTruthy, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %then1, label %if.end6

then1:                                            ; preds = %if.end
  %9 = load i32, i32* %expectedTruthy, align 4
  %10 = icmp ne i32 %9, 0
  %11 = load i8*, i8** %name, align 8
  %12 = load i32, i32* %actual, align 4
  %. = select i1 %10, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @2, i32 0, i32 0)
  %13 = call i32 (i8*, ...) @printf(i8* %., i8* %11, i32 %12)
  %14 = load i32, i32* @test_errors, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* @test_errors, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %then1
  ret void
}

define void @report_result() {
entry:
  %0 = load i32, i32* @test_errors, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @3, i32 0, i32 0))
  br label %if.end

else:                                             ; preds = %entry
  %3 = load i32, i32* @test_errors, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @4, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @main() {
entry:
  %mixedGreater = alloca i32, align 4
  %mixedLess = alloca i32, align 4
  %ui = alloca i32, align 4
  %si = alloca i32, align 4
  %unsignedGreater = alloca i32, align 4
  %unsignedLess = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %boolNot2 = alloca i1, align 1
  %boolNot1 = alloca i1, align 1
  %boolOr3 = alloca i1, align 1
  %boolOr2 = alloca i1, align 1
  %boolOr1 = alloca i1, align 1
  %boolAnd3 = alloca i1, align 1
  %boolAnd2 = alloca i1, align 1
  %boolAnd1 = alloca i1, align 1
  %f = alloca i1, align 1
  %t = alloca i1, align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @5, i32 0, i32 0))
  store i1 true, i1* %t, align 1
  store i1 false, i1* %f, align 1
  %1 = load i1, i1* %t, align 1
  %2 = zext i1 %1 to i32
  %3 = load i1, i1* %f, align 1
  %4 = zext i1 %3 to i32
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @6, i32 0, i32 0), i32 %2, i32 %4)
  %6 = load i1, i1* %t, align 1
  %7 = load i1, i1* %f, align 1
  %8 = select i1 %6, i1 %7, i1 false
  store i1 %8, i1* %boolAnd1, align 1
  %9 = load i1, i1* %t, align 1
  %10 = load i1, i1* %t, align 1
  %11 = select i1 %9, i1 %10, i1 false
  store i1 %11, i1* %boolAnd2, align 1
  %12 = load i1, i1* %f, align 1
  %13 = load i1, i1* %f, align 1
  %14 = select i1 %12, i1 %13, i1 false
  store i1 %14, i1* %boolAnd3, align 1
  %15 = load i1, i1* %boolAnd1, align 1
  %16 = zext i1 %15 to i32
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @7, i32 0, i32 0), i32 %16)
  %18 = load i1, i1* %boolAnd2, align 1
  %19 = zext i1 %18 to i32
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @8, i32 0, i32 0), i32 %19)
  %21 = load i1, i1* %boolAnd3, align 1
  %22 = zext i1 %21 to i32
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @9, i32 0, i32 0), i32 %22)
  %24 = load i1, i1* %t, align 1
  %25 = load i1, i1* %f, align 1
  %26 = select i1 %24, i1 true, i1 %25
  store i1 %26, i1* %boolOr1, align 1
  %27 = load i1, i1* %t, align 1
  %28 = load i1, i1* %t, align 1
  %29 = select i1 %27, i1 true, i1 %28
  store i1 %29, i1* %boolOr2, align 1
  %30 = load i1, i1* %f, align 1
  %31 = load i1, i1* %f, align 1
  %32 = select i1 %30, i1 true, i1 %31
  store i1 %32, i1* %boolOr3, align 1
  %33 = load i1, i1* %boolOr1, align 1
  %34 = zext i1 %33 to i32
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @10, i32 0, i32 0), i32 %34)
  %36 = load i1, i1* %boolOr2, align 1
  %37 = zext i1 %36 to i32
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @11, i32 0, i32 0), i32 %37)
  %39 = load i1, i1* %boolOr3, align 1
  %40 = zext i1 %39 to i32
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @12, i32 0, i32 0), i32 %40)
  %42 = load i1, i1* %t, align 1
  %43 = icmp eq i1 %42, false
  store i1 %43, i1* %boolNot1, align 1
  %44 = load i1, i1* %f, align 1
  %45 = icmp eq i1 %44, false
  store i1 %45, i1* %boolNot2, align 1
  %46 = load i1, i1* %boolNot1, align 1
  %47 = zext i1 %46 to i32
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @13, i32 0, i32 0), i32 %47)
  %49 = load i1, i1* %boolNot2, align 1
  %50 = zext i1 %49 to i32
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @14, i32 0, i32 0), i32 %50)
  store i32 100, i32* %a, align 4
  store i32 100, i32* %b, align 4
  store i32 128, i32* %c, align 4
  %52 = load i1, i1* %t, align 1
  %53 = zext i1 %52 to i32
  call void @check_int(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @15, i32 0, i32 0), i32 %53, i32 1)
  %54 = load i1, i1* %f, align 1
  %55 = zext i1 %54 to i32
  call void @check_int(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @16, i32 0, i32 0), i32 %55, i32 0)
  %56 = load i1, i1* %boolAnd1, align 1
  %57 = zext i1 %56 to i32
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @17, i32 0, i32 0), i32 %57, i32 0)
  %58 = load i1, i1* %boolAnd2, align 1
  %59 = zext i1 %58 to i32
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @18, i32 0, i32 0), i32 %59, i32 1)
  %60 = load i1, i1* %boolAnd3, align 1
  %61 = zext i1 %60 to i32
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @19, i32 0, i32 0), i32 %61, i32 0)
  %62 = load i1, i1* %boolOr1, align 1
  %63 = zext i1 %62 to i32
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @20, i32 0, i32 0), i32 %63, i32 1)
  %64 = load i1, i1* %boolOr2, align 1
  %65 = zext i1 %64 to i32
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @21, i32 0, i32 0), i32 %65, i32 1)
  %66 = load i1, i1* %boolOr3, align 1
  %67 = zext i1 %66 to i32
  call void @check_int(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @22, i32 0, i32 0), i32 %67, i32 0)
  %68 = load i1, i1* %boolNot1, align 1
  %69 = zext i1 %68 to i32
  call void @check_int(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @23, i32 0, i32 0), i32 %69, i32 0)
  %70 = load i1, i1* %boolNot2, align 1
  %71 = zext i1 %70 to i32
  call void @check_int(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @24, i32 0, i32 0), i32 %71, i32 1)
  %72 = load i32, i32* %a, align 4
  %73 = load i32, i32* %b, align 4
  %74 = icmp eq i32 %72, %73
  %75 = sext i1 %74 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @25, i32 0, i32 0), i32 %75, i32 1)
  %76 = load i32, i32* %a, align 4
  %77 = load i32, i32* %c, align 4
  %78 = icmp eq i32 %76, %77
  %79 = sext i1 %78 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @26, i32 0, i32 0), i32 %79, i32 0)
  %80 = load i32, i32* %a, align 4
  %81 = load i32, i32* %b, align 4
  %82 = icmp ne i32 %80, %81
  %83 = sext i1 %82 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @27, i32 0, i32 0), i32 %83, i32 0)
  %84 = load i32, i32* %a, align 4
  %85 = load i32, i32* %c, align 4
  %86 = icmp ne i32 %84, %85
  %87 = sext i1 %86 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @28, i32 0, i32 0), i32 %87, i32 1)
  %88 = load i32, i32* %a, align 4
  %89 = load i32, i32* %b, align 4
  %90 = icmp slt i32 %88, %89
  %91 = sext i1 %90 to i32
  call void @check_bool(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @29, i32 0, i32 0), i32 %91, i32 0)
  %92 = load i32, i32* %a, align 4
  %93 = load i32, i32* %c, align 4
  %94 = icmp slt i32 %92, %93
  %95 = sext i1 %94 to i32
  call void @check_bool(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @30, i32 0, i32 0), i32 %95, i32 1)
  %96 = load i32, i32* %c, align 4
  %97 = load i32, i32* %a, align 4
  %98 = icmp slt i32 %96, %97
  %99 = sext i1 %98 to i32
  call void @check_bool(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @31, i32 0, i32 0), i32 %99, i32 0)
  %100 = load i32, i32* %a, align 4
  %101 = load i32, i32* %b, align 4
  %102 = icmp sle i32 %100, %101
  %103 = sext i1 %102 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @32, i32 0, i32 0), i32 %103, i32 1)
  %104 = load i32, i32* %a, align 4
  %105 = load i32, i32* %c, align 4
  %106 = icmp sle i32 %104, %105
  %107 = sext i1 %106 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @33, i32 0, i32 0), i32 %107, i32 1)
  %108 = load i32, i32* %c, align 4
  %109 = load i32, i32* %a, align 4
  %110 = icmp sle i32 %108, %109
  %111 = sext i1 %110 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @34, i32 0, i32 0), i32 %111, i32 0)
  %112 = load i32, i32* %a, align 4
  %113 = load i32, i32* %b, align 4
  %114 = icmp sgt i32 %112, %113
  %115 = sext i1 %114 to i32
  call void @check_bool(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @35, i32 0, i32 0), i32 %115, i32 0)
  %116 = load i32, i32* %a, align 4
  %117 = load i32, i32* %c, align 4
  %118 = icmp sgt i32 %116, %117
  %119 = sext i1 %118 to i32
  call void @check_bool(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @36, i32 0, i32 0), i32 %119, i32 0)
  %120 = load i32, i32* %c, align 4
  %121 = load i32, i32* %a, align 4
  %122 = icmp sgt i32 %120, %121
  %123 = sext i1 %122 to i32
  call void @check_bool(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @37, i32 0, i32 0), i32 %123, i32 1)
  %124 = load i32, i32* %a, align 4
  %125 = load i32, i32* %b, align 4
  %126 = icmp sge i32 %124, %125
  %127 = sext i1 %126 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @38, i32 0, i32 0), i32 %127, i32 1)
  %128 = load i32, i32* %a, align 4
  %129 = load i32, i32* %c, align 4
  %130 = icmp sge i32 %128, %129
  %131 = sext i1 %130 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @39, i32 0, i32 0), i32 %131, i32 0)
  %132 = load i32, i32* %c, align 4
  %133 = load i32, i32* %a, align 4
  %134 = icmp sge i32 %132, %133
  %135 = sext i1 %134 to i32
  call void @check_bool(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @40, i32 0, i32 0), i32 %135, i32 1)
  store i32 1, i32* %ua, align 4
  store i32 -1, i32* %ub, align 4
  %136 = load i32, i32* %ua, align 4
  %137 = load i32, i32* %ub, align 4
  %138 = icmp ult i32 %136, %137
  %139 = sext i1 %138 to i32
  store i32 %139, i32* %unsignedLess, align 4
  %140 = load i32, i32* %ub, align 4
  %141 = load i32, i32* %ua, align 4
  %142 = icmp ugt i32 %140, %141
  %143 = sext i1 %142 to i32
  store i32 %143, i32* %unsignedGreater, align 4
  %144 = load i32, i32* %unsignedLess, align 4
  %145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @41, i32 0, i32 0), i32 %144)
  %146 = load i32, i32* %unsignedGreater, align 4
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @42, i32 0, i32 0), i32 %146)
  %148 = load i32, i32* %unsignedLess, align 4
  call void @check_bool(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @43, i32 0, i32 0), i32 %148, i32 1)
  %149 = load i32, i32* %unsignedGreater, align 4
  call void @check_bool(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @44, i32 0, i32 0), i32 %149, i32 1)
  store i32 -1, i32* %si, align 4
  store i32 1, i32* %ui, align 4
  %150 = load i32, i32* %si, align 4
  %151 = load i32, i32* %ui, align 4
  %152 = icmp ult i32 %150, %151
  %153 = sext i1 %152 to i32
  store i32 %153, i32* %mixedLess, align 4
  %154 = load i32, i32* %si, align 4
  %155 = load i32, i32* %ui, align 4
  %156 = icmp ugt i32 %154, %155
  %157 = sext i1 %156 to i32
  store i32 %157, i32* %mixedGreater, align 4
  %158 = load i32, i32* %mixedLess, align 4
  %159 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @45, i32 0, i32 0), i32 %158)
  %160 = load i32, i32* %mixedGreater, align 4
  %161 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @46, i32 0, i32 0), i32 %160)
  %162 = load i32, i32* %mixedLess, align 4
  call void @check_bool(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @47, i32 0, i32 0), i32 %162, i32 0)
  %163 = load i32, i32* %mixedGreater, align 4
  call void @check_bool(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @48, i32 0, i32 0), i32 %163, i32 1)
  call void @report_result()
  %164 = load i32, i32* @test_errors, align 4
  ret i32 %164
}
