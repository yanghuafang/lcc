; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [34 x i8] c"ERROR [%s]: got %lu expected %lu\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [55 x i8] c"checkAmpersandPrec a:%lu, b:%lu, c(addr a):%lu, d:%lu\0A\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@6 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@7 = private unnamed_addr constant [15 x i8] c"checkPlusPrec\0A\00", align 1
@8 = private unnamed_addr constant [13 x i8] c"3 + +13: %d\0A\00", align 1
@9 = private unnamed_addr constant [8 x i8] c"3 + +13\00", align 1
@10 = private unnamed_addr constant [13 x i8] c"3 - +13: %d\0A\00", align 1
@11 = private unnamed_addr constant [8 x i8] c"3 - +13\00", align 1
@12 = private unnamed_addr constant [13 x i8] c"3 + +13: %d\0A\00", align 1
@13 = private unnamed_addr constant [16 x i8] c"3 + +13 literal\00", align 1
@14 = private unnamed_addr constant [13 x i8] c"3 - +13: %d\0A\00", align 1
@15 = private unnamed_addr constant [16 x i8] c"3 - +13 literal\00", align 1
@16 = private unnamed_addr constant [16 x i8] c"checkMinusPrec\0A\00", align 1
@17 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@18 = private unnamed_addr constant [8 x i8] c"3 - -13\00", align 1
@19 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@20 = private unnamed_addr constant [14 x i8] c"3 - -13 again\00", align 1
@21 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@22 = private unnamed_addr constant [16 x i8] c"3 - -13 literal\00", align 1
@23 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@24 = private unnamed_addr constant [22 x i8] c"3 - -13 literal again\00", align 1
@25 = private unnamed_addr constant [15 x i8] c"checkAsterisk\0A\00", align 1
@26 = private unnamed_addr constant [15 x i8] c"3 * 4 * 4: %d\0A\00", align 1
@27 = private unnamed_addr constant [6 x i8] c"3*4*4\00", align 1
@28 = private unnamed_addr constant [15 x i8] c"subFunc i: %d\0A\00", align 1
@29 = private unnamed_addr constant [14 x i8] c"cast call arg\00", align 1
@30 = private unnamed_addr constant [24 x i8] c"checkInc, a: %d, b: %d\0A\00", align 1
@31 = private unnamed_addr constant [10 x i8] c"(++a)++ a\00", align 1
@32 = private unnamed_addr constant [10 x i8] c"(++a)++ b\00", align 1
@33 = private unnamed_addr constant [24 x i8] c"checkDec, a: %d, b: %d\0A\00", align 1
@34 = private unnamed_addr constant [10 x i8] c"(--a)-- a\00", align 1
@35 = private unnamed_addr constant [10 x i8] c"(--a)-- b\00", align 1
@36 = private unnamed_addr constant [36 x i8] c"**** 26.operator_precedence.c ****\0A\00", align 1

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

define void @check_ulong(i8* %0, i64 %1, i64 %2) {
entry:
  %expected = alloca i64, align 8
  %actual = alloca i64, align 8
  %name = alloca i8*, align 8
  store i8* %0, i8** %name, align 8
  store i64 %1, i64* %actual, align 4
  store i64 %2, i64* %expected, align 4
  %3 = load i64, i64* %actual, align 4
  %4 = load i64, i64* %expected, align 4
  %5 = icmp ne i64 %3, %4
  br i1 %5, label %then, label %if.end

then:                                             ; preds = %entry
  %6 = load i8*, i8** %name, align 8
  %7 = load i64, i64* %actual, align 4
  %8 = load i64, i64* %expected, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @1, i32 0, i32 0), i8* %6, i64 %7, i64 %8)
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

define void @checkAmpersandPrec() {
entry:
  %const1 = bitcast i64 2596069104 to i64
  %const = bitcast i64 305419896 to i64
  %d = alloca i64, align 8
  %c = alloca i64, align 8
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %const, i64* %a, align 4
  store i64 %const1, i64* %b, align 4
  %0 = ptrtoint i64* %a to i64
  store i64 %0, i64* %c, align 4
  %1 = ptrtoint i64* %c to i64
  %2 = load i64, i64* %a, align 4
  %3 = and i64 %1, %2
  %4 = load i64, i64* %b, align 4
  %5 = and i64 %3, %4
  store i64 %5, i64* %d, align 4
  %6 = load i64, i64* %a, align 4
  %7 = load i64, i64* %b, align 4
  %8 = load i64, i64* %c, align 4
  %9 = load i64, i64* %d, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @4, i32 0, i32 0), i64 %6, i64 %7, i64 %8, i64 %9)
  %11 = load i64, i64* %a, align 4
  call void @check_ulong(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0), i64 %11, i64 %const)
  %12 = load i64, i64* %b, align 4
  call void @check_ulong(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @6, i32 0, i32 0), i64 %12, i64 %const1)
  ret void
}

define void @checkPlusPrec() {
entry:
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @7, i32 0, i32 0))
  store i32 13, i32* %a, align 4
  %1 = load i32, i32* %a, align 4
  %2 = add i32 3, %1
  store i32 %2, i32* %b, align 4
  %3 = load i32, i32* %b, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @8, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @9, i32 0, i32 0), i32 %5, i32 16)
  %6 = load i32, i32* %a, align 4
  %7 = sub i32 3, %6
  store i32 %7, i32* %c, align 4
  %8 = load i32, i32* %c, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @10, i32 0, i32 0), i32 %8)
  %10 = load i32, i32* %c, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @11, i32 0, i32 0), i32 %10, i32 -10)
  store i32 16, i32* %b, align 4
  %11 = load i32, i32* %b, align 4
  %12 = load i32, i32* %b, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @12, i32 0, i32 0), i32 %12)
  %14 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @13, i32 0, i32 0), i32 %14, i32 16)
  store i32 -10, i32* %c, align 4
  %15 = load i32, i32* %c, align 4
  %16 = load i32, i32* %c, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @14, i32 0, i32 0), i32 %16)
  %18 = load i32, i32* %c, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @15, i32 0, i32 0), i32 %18, i32 -10)
  ret void
}

define void @checkMinusPrec() {
entry:
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @16, i32 0, i32 0))
  store i32 13, i32* %a, align 4
  %1 = load i32, i32* %a, align 4
  %2 = sub i32 0, %1
  %3 = sub i32 3, %2
  store i32 %3, i32* %b, align 4
  %4 = load i32, i32* %b, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @17, i32 0, i32 0), i32 %4)
  %6 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @18, i32 0, i32 0), i32 %6, i32 16)
  %7 = load i32, i32* %a, align 4
  %8 = sub i32 0, %7
  %9 = sub i32 3, %8
  store i32 %9, i32* %c, align 4
  %10 = load i32, i32* %c, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @19, i32 0, i32 0), i32 %10)
  %12 = load i32, i32* %c, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @20, i32 0, i32 0), i32 %12, i32 16)
  store i32 16, i32* %b, align 4
  %13 = load i32, i32* %b, align 4
  %14 = load i32, i32* %b, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @21, i32 0, i32 0), i32 %14)
  %16 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @22, i32 0, i32 0), i32 %16, i32 16)
  store i32 16, i32* %c, align 4
  %17 = load i32, i32* %c, align 4
  %18 = load i32, i32* %c, align 4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @23, i32 0, i32 0), i32 %18)
  %20 = load i32, i32* %c, align 4
  call void @check_int(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @24, i32 0, i32 0), i32 %20, i32 16)
  ret void
}

define void @checkAsterisk() {
entry:
  %d = alloca i32, align 4
  %c = alloca i32*, align 8
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @25, i32 0, i32 0))
  store i32 3, i32* %a, align 4
  store i32 4, i32* %b, align 4
  store i32* %b, i32** %c, align 8
  %1 = load i32, i32* %a, align 4
  %2 = load i32, i32* %b, align 4
  %3 = mul i32 %1, %2
  %4 = load i32*, i32** %c, align 8
  %5 = load i32, i32* %4, align 4
  %6 = mul i32 %3, %5
  store i32 %6, i32* %d, align 4
  %7 = load i32, i32* %d, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @26, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @27, i32 0, i32 0), i32 %9, i32 48)
  ret void
}

define void @subFunc(i32 %0) {
entry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @28, i32 0, i32 0), i32 %1)
  ret void
}

define void @checkFuncCall() {
entry:
  %i = alloca i64, align 8
  store i64 1234, i64* %i, align 4
  %0 = load i64, i64* %i, align 4
  %1 = trunc i64 %0 to i32
  call void @subFunc(i32 %1)
  %2 = load i64, i64* %i, align 4
  %3 = trunc i64 %2 to i32
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @29, i32 0, i32 0), i32 %3, i32 1234)
  ret void
}

define void @checkInc() {
entry:
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 10, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* %a, align 4
  %2 = load i32, i32* %a, align 4
  %3 = add i32 %2, 1
  store i32 %3, i32* %a, align 4
  store i32 %2, i32* %b, align 4
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %b, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @30, i32 0, i32 0), i32 %4, i32 %5)
  %7 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @31, i32 0, i32 0), i32 %7, i32 12)
  %8 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @32, i32 0, i32 0), i32 %8, i32 11)
  ret void
}

define void @checkDec() {
entry:
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 10, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %1 = sub i32 %0, 1
  store i32 %1, i32* %a, align 4
  %2 = load i32, i32* %a, align 4
  %3 = sub i32 %2, 1
  store i32 %3, i32* %a, align 4
  store i32 %2, i32* %b, align 4
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %b, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @33, i32 0, i32 0), i32 %4, i32 %5)
  %7 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @34, i32 0, i32 0), i32 %7, i32 8)
  %8 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @35, i32 0, i32 0), i32 %8, i32 9)
  ret void
}

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @36, i32 0, i32 0))
  call void @checkAmpersandPrec()
  call void @checkPlusPrec()
  call void @checkMinusPrec()
  call void @checkAsterisk()
  call void @checkFuncCall()
  call void @checkInc()
  call void @checkDec()
  call void @report_result()
  %1 = load i32, i32* @test_errors, align 4
  ret i32 %1
}
