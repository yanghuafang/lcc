; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %u expected %u\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [27 x i8] c"**** 12.arithmetic.c ****\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"a:%d b:%d\0A\00", align 1
@6 = private unnamed_addr constant [12 x i8] c"sum: %d %d\0A\00", align 1
@7 = private unnamed_addr constant [18 x i8] c"sub: %d %d %d %d\0A\00", align 1
@8 = private unnamed_addr constant [9 x i8] c"mul: %d\0A\00", align 1
@9 = private unnamed_addr constant [9 x i8] c"div: %d\0A\00", align 1
@10 = private unnamed_addr constant [9 x i8] c"mod: %d\0A\00", align 1
@11 = private unnamed_addr constant [11 x i8] c"sumeq: %d\0A\00", align 1
@12 = private unnamed_addr constant [11 x i8] c"subeq: %d\0A\00", align 1
@13 = private unnamed_addr constant [11 x i8] c"muleq: %d\0A\00", align 1
@14 = private unnamed_addr constant [11 x i8] c"diveq: %d\0A\00", align 1
@15 = private unnamed_addr constant [11 x i8] c"modeq: %d\0A\00", align 1
@16 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@17 = private unnamed_addr constant [5 x i8] c"sum2\00", align 1
@18 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@19 = private unnamed_addr constant [5 x i8] c"sub2\00", align 1
@20 = private unnamed_addr constant [5 x i8] c"sub3\00", align 1
@21 = private unnamed_addr constant [5 x i8] c"sub4\00", align 1
@22 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@23 = private unnamed_addr constant [4 x i8] c"div\00", align 1
@24 = private unnamed_addr constant [4 x i8] c"mod\00", align 1
@25 = private unnamed_addr constant [6 x i8] c"sumeq\00", align 1
@26 = private unnamed_addr constant [6 x i8] c"subeq\00", align 1
@27 = private unnamed_addr constant [6 x i8] c"muleq\00", align 1
@28 = private unnamed_addr constant [6 x i8] c"diveq\00", align 1
@29 = private unnamed_addr constant [6 x i8] c"modeq\00", align 1
@30 = private unnamed_addr constant [29 x i8] c"unsigned div 10/3=%u mod=%u\0A\00", align 1
@31 = private unnamed_addr constant [13 x i8] c"unsigned div\00", align 1
@32 = private unnamed_addr constant [13 x i8] c"unsigned mod\00", align 1
@33 = private unnamed_addr constant [21 x i8] c"signed mod -8%%3=%d\0A\00", align 1
@34 = private unnamed_addr constant [20 x i8] c"signed negative mod\00", align 1
@35 = private unnamed_addr constant [19 x i8] c"mixed -1 + 1u: %u\0A\00", align 1
@36 = private unnamed_addr constant [21 x i8] c"mixed int + unsigned\00", align 1

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

define void @check_uint(i8* %0, i32 %1, i32 %2) {
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
  %mixedSum = alloca i32, align 4
  %mixedUi = alloca i32, align 4
  %mixedSi = alloca i32, align 4
  %negMod = alloca i32, align 4
  %negB = alloca i32, align 4
  %negA = alloca i32, align 4
  %umod = alloca i32, align 4
  %udiv = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %modeq = alloca i32, align 4
  %diveq = alloca i32, align 4
  %muleq = alloca i32, align 4
  %subeq = alloca i32, align 4
  %sumeq = alloca i32, align 4
  %mod = alloca i32, align 4
  %div = alloca i32, align 4
  %mul = alloca i32, align 4
  %sub4 = alloca i32, align 4
  %sub3 = alloca i32, align 4
  %sub2 = alloca i32, align 4
  %sub = alloca i32, align 4
  %sum2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0))
  store i32 37, i32* %a, align 4
  store i32 8, i32* %b, align 4
  %1 = load i32, i32* %a, align 4
  %2 = load i32, i32* %b, align 4
  %3 = add i32 %1, %2
  store i32 %3, i32* %sum, align 4
  store i32 45, i32* %sum2, align 4
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %b, align 4
  %6 = sub i32 %4, %5
  store i32 %6, i32* %sub, align 4
  %7 = load i32, i32* %b, align 4
  %8 = load i32, i32* %a, align 4
  %9 = sub i32 %7, %8
  store i32 %9, i32* %sub2, align 4
  store i32 29, i32* %sub3, align 4
  store i32 -29, i32* %sub4, align 4
  %10 = load i32, i32* %a, align 4
  %11 = load i32, i32* %b, align 4
  %12 = mul i32 %10, %11
  store i32 %12, i32* %mul, align 4
  %13 = load i32, i32* %a, align 4
  %14 = load i32, i32* %b, align 4
  %15 = sdiv i32 %13, %14
  store i32 %15, i32* %div, align 4
  %16 = load i32, i32* %a, align 4
  %17 = load i32, i32* %b, align 4
  %18 = srem i32 %16, %17
  store i32 %18, i32* %mod, align 4
  %19 = load i32, i32* %sum, align 4
  store i32 %19, i32* %sumeq, align 4
  %20 = load i32, i32* %b, align 4
  %21 = load i32, i32* %sumeq, align 4
  %22 = add i32 %21, %20
  store i32 %22, i32* %sumeq, align 4
  %23 = load i32, i32* %sumeq, align 4
  %24 = load i32, i32* %sumeq, align 4
  store i32 %24, i32* %subeq, align 4
  %25 = load i32, i32* %b, align 4
  %26 = load i32, i32* %subeq, align 4
  %27 = sub i32 %26, %25
  store i32 %27, i32* %subeq, align 4
  %28 = load i32, i32* %subeq, align 4
  %29 = load i32, i32* %subeq, align 4
  store i32 %29, i32* %muleq, align 4
  %30 = load i32, i32* %b, align 4
  %31 = load i32, i32* %muleq, align 4
  %32 = mul i32 %31, %30
  store i32 %32, i32* %muleq, align 4
  %33 = load i32, i32* %muleq, align 4
  %34 = load i32, i32* %muleq, align 4
  store i32 %34, i32* %diveq, align 4
  %35 = load i32, i32* %b, align 4
  %36 = load i32, i32* %diveq, align 4
  %37 = sdiv i32 %36, %35
  store i32 %37, i32* %diveq, align 4
  %38 = load i32, i32* %diveq, align 4
  %39 = load i32, i32* %diveq, align 4
  store i32 %39, i32* %modeq, align 4
  %40 = load i32, i32* %b, align 4
  %41 = load i32, i32* %modeq, align 4
  %42 = srem i32 %41, %40
  store i32 %42, i32* %modeq, align 4
  %43 = load i32, i32* %modeq, align 4
  %44 = load i32, i32* %a, align 4
  %45 = load i32, i32* %b, align 4
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i32 %44, i32 %45)
  %47 = load i32, i32* %sum, align 4
  %48 = load i32, i32* %sum2, align 4
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @6, i32 0, i32 0), i32 %47, i32 %48)
  %50 = load i32, i32* %sub, align 4
  %51 = load i32, i32* %sub2, align 4
  %52 = load i32, i32* %sub3, align 4
  %53 = load i32, i32* %sub4, align 4
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @7, i32 0, i32 0), i32 %50, i32 %51, i32 %52, i32 %53)
  %55 = load i32, i32* %mul, align 4
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @8, i32 0, i32 0), i32 %55)
  %57 = load i32, i32* %div, align 4
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @9, i32 0, i32 0), i32 %57)
  %59 = load i32, i32* %mod, align 4
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @10, i32 0, i32 0), i32 %59)
  %61 = load i32, i32* %sumeq, align 4
  %62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @11, i32 0, i32 0), i32 %61)
  %63 = load i32, i32* %subeq, align 4
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @12, i32 0, i32 0), i32 %63)
  %65 = load i32, i32* %muleq, align 4
  %66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @13, i32 0, i32 0), i32 %65)
  %67 = load i32, i32* %diveq, align 4
  %68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @14, i32 0, i32 0), i32 %67)
  %69 = load i32, i32* %modeq, align 4
  %70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @15, i32 0, i32 0), i32 %69)
  %71 = load i32, i32* %sum, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @16, i32 0, i32 0), i32 %71, i32 45)
  %72 = load i32, i32* %sum2, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @17, i32 0, i32 0), i32 %72, i32 45)
  %73 = load i32, i32* %sub, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @18, i32 0, i32 0), i32 %73, i32 29)
  %74 = load i32, i32* %sub2, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @19, i32 0, i32 0), i32 %74, i32 -29)
  %75 = load i32, i32* %sub3, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @20, i32 0, i32 0), i32 %75, i32 29)
  %76 = load i32, i32* %sub4, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @21, i32 0, i32 0), i32 %76, i32 -29)
  %77 = load i32, i32* %mul, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @22, i32 0, i32 0), i32 %77, i32 296)
  %78 = load i32, i32* %div, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @23, i32 0, i32 0), i32 %78, i32 4)
  %79 = load i32, i32* %mod, align 4
  call void @check_int(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @24, i32 0, i32 0), i32 %79, i32 5)
  %80 = load i32, i32* %sumeq, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @25, i32 0, i32 0), i32 %80, i32 53)
  %81 = load i32, i32* %subeq, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @26, i32 0, i32 0), i32 %81, i32 45)
  %82 = load i32, i32* %muleq, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @27, i32 0, i32 0), i32 %82, i32 360)
  %83 = load i32, i32* %diveq, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @28, i32 0, i32 0), i32 %83, i32 45)
  %84 = load i32, i32* %modeq, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @29, i32 0, i32 0), i32 %84, i32 5)
  store i32 10, i32* %ua, align 4
  store i32 3, i32* %ub, align 4
  %85 = load i32, i32* %ua, align 4
  %86 = load i32, i32* %ub, align 4
  %87 = udiv i32 %85, %86
  store i32 %87, i32* %udiv, align 4
  %88 = load i32, i32* %ua, align 4
  %89 = load i32, i32* %ub, align 4
  %90 = urem i32 %88, %89
  store i32 %90, i32* %umod, align 4
  %91 = load i32, i32* %udiv, align 4
  %92 = load i32, i32* %umod, align 4
  %93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @30, i32 0, i32 0), i32 %91, i32 %92)
  %94 = load i32, i32* %udiv, align 4
  call void @check_uint(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @31, i32 0, i32 0), i32 %94, i32 3)
  %95 = load i32, i32* %umod, align 4
  call void @check_uint(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @32, i32 0, i32 0), i32 %95, i32 1)
  store i32 -8, i32* %negA, align 4
  store i32 3, i32* %negB, align 4
  %96 = load i32, i32* %negA, align 4
  %97 = load i32, i32* %negB, align 4
  %98 = srem i32 %96, %97
  store i32 %98, i32* %negMod, align 4
  %99 = load i32, i32* %negMod, align 4
  %100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @33, i32 0, i32 0), i32 %99)
  %101 = load i32, i32* %negMod, align 4
  call void @check_int(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @34, i32 0, i32 0), i32 %101, i32 -2)
  store i32 -1, i32* %mixedSi, align 4
  store i32 1, i32* %mixedUi, align 4
  %102 = load i32, i32* %mixedSi, align 4
  %103 = load i32, i32* %mixedUi, align 4
  %104 = add i32 %102, %103
  store i32 %104, i32* %mixedSum, align 4
  %105 = load i32, i32* %mixedSum, align 4
  %106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @35, i32 0, i32 0), i32 %105)
  %107 = load i32, i32* %mixedSum, align 4
  call void @check_uint(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @36, i32 0, i32 0), i32 %107, i32 0)
  call void @report_result()
  %108 = load i32, i32* @test_errors, align 4
  ret i32 %108
}
