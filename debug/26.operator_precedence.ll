; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [55 x i8] c"checkAmpersandPrec a:%lu, b:%lu, c(addr a):%lu, d:%lu\0A\00", align 1
@1 = private unnamed_addr constant [15 x i8] c"checkPlusPrec\0A\00", align 1
@2 = private unnamed_addr constant [13 x i8] c"3 + +13: %d\0A\00", align 1
@3 = private unnamed_addr constant [13 x i8] c"3 - +13: %d\0A\00", align 1
@4 = private unnamed_addr constant [13 x i8] c"3 + +13: %d\0A\00", align 1
@5 = private unnamed_addr constant [13 x i8] c"3 - +13: %d\0A\00", align 1
@6 = private unnamed_addr constant [16 x i8] c"checkMinusPrec\0A\00", align 1
@7 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@8 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@9 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@10 = private unnamed_addr constant [13 x i8] c"3 - -13: %d\0A\00", align 1
@11 = private unnamed_addr constant [15 x i8] c"checkAsterisk\0A\00", align 1
@12 = private unnamed_addr constant [15 x i8] c"3 * 4 * 4: %d\0A\00", align 1
@13 = private unnamed_addr constant [15 x i8] c"subFunc i: %d\0A\00", align 1
@14 = private unnamed_addr constant [24 x i8] c"checkInc, a: %d, b: %d\0A\00", align 1
@15 = private unnamed_addr constant [24 x i8] c"checkDec, a: %d, b: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @checkAmpersandPrec() {
entry:
  %d = alloca i64, align 8
  %c = alloca i64, align 8
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 305419896, i64* %a, align 4
  store i64 -1698898192, i64* %b, align 4
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
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @0, i32 0, i32 0), i64 %6, i64 %7, i64 %8, i64 %9)
  ret void
}

define void @checkPlusPrec() {
entry:
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @1, i32 0, i32 0))
  store i32 13, i32* %a, align 4
  %1 = load i32, i32* %a, align 4
  %2 = add i32 3, %1
  store i32 %2, i32* %b, align 4
  %3 = load i32, i32* %b, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @2, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %a, align 4
  %6 = sub i32 3, %5
  store i32 %6, i32* %c, align 4
  %7 = load i32, i32* %c, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0), i32 %7)
  store i32 16, i32* %b, align 4
  %9 = load i32, i32* %b, align 4
  %10 = load i32, i32* %b, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i32 0, i32 0), i32 %10)
  store i32 -10, i32* %c, align 4
  %12 = load i32, i32* %c, align 4
  %13 = load i32, i32* %c, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @5, i32 0, i32 0), i32 %13)
  ret void
}

define void @checkMinusPrec() {
entry:
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @6, i32 0, i32 0))
  store i32 13, i32* %a, align 4
  %1 = load i32, i32* %a, align 4
  %2 = sub i32 0, %1
  %3 = sub i32 3, %2
  store i32 %3, i32* %b, align 4
  %4 = load i32, i32* %b, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @7, i32 0, i32 0), i32 %4)
  %6 = load i32, i32* %a, align 4
  %7 = sub i32 0, %6
  %8 = sub i32 3, %7
  store i32 %8, i32* %c, align 4
  %9 = load i32, i32* %c, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @8, i32 0, i32 0), i32 %9)
  store i32 16, i32* %b, align 4
  %11 = load i32, i32* %b, align 4
  %12 = load i32, i32* %b, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @9, i32 0, i32 0), i32 %12)
  store i32 16, i32* %c, align 4
  %14 = load i32, i32* %c, align 4
  %15 = load i32, i32* %c, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @10, i32 0, i32 0), i32 %15)
  ret void
}

define void @checkAsterisk() {
entry:
  %d = alloca i32, align 4
  %c = alloca i32*, align 8
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @11, i32 0, i32 0))
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
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @12, i32 0, i32 0), i32 %7)
  ret void
}

define void @subFunc(i32 %0) {
entry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @13, i32 0, i32 0), i32 %1)
  ret void
}

define void @checkFuncCall() {
entry:
  %i = alloca i64, align 8
  store i64 1234, i64* %i, align 4
  %0 = load i64, i64* %i, align 4
  %1 = trunc i64 %0 to i32
  call void @subFunc(i32 %1)
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
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @14, i32 0, i32 0), i32 %4, i32 %5)
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
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @15, i32 0, i32 0), i32 %4, i32 %5)
  ret void
}

define i32 @main() {
entry:
  call void @checkAmpersandPrec()
  call void @checkPlusPrec()
  call void @checkMinusPrec()
  call void @checkAsterisk()
  call void @checkFuncCall()
  call void @checkInc()
  call void @checkDec()
  ret i32 0
}
