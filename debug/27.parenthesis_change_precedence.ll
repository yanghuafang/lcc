; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [16 x i8] c"2 + 4 * 5 = %d\0A\00", align 1
@4 = private unnamed_addr constant [15 x i8] c"mul before add\00", align 1
@5 = private unnamed_addr constant [18 x i8] c"(2 + 4) * 5 = %d\0A\00", align 1
@6 = private unnamed_addr constant [16 x i8] c"parens override\00", align 1
@7 = private unnamed_addr constant [18 x i8] c"5 * (2 - 4) = %d\0A\00", align 1
@8 = private unnamed_addr constant [17 x i8] c"negative product\00", align 1
@9 = private unnamed_addr constant [18 x i8] c"2 - 4 mod 5 = %d\0A\00", align 1
@10 = private unnamed_addr constant [15 x i8] c"mod before sub\00", align 1
@11 = private unnamed_addr constant [18 x i8] c"(2 + 4) / 5 = %d\0A\00", align 1
@12 = private unnamed_addr constant [8 x i8] c"int div\00", align 1
@13 = private unnamed_addr constant [46 x i8] c"**** 27.parenthesis_change_precedence.c ****\0A\00", align 1
@14 = private unnamed_addr constant [17 x i8] c"1 + 2 << 3 = %d\0A\00", align 1
@15 = private unnamed_addr constant [31 x i8] c"lcc evaluates (1+2) then shift\00", align 1
@16 = private unnamed_addr constant [13 x i8] c"parens shift\00", align 1

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

define void @checkArithmetic() {
entry:
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 4, i32* %b, align 4
  store i32 5, i32* %c, align 4
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = load i32, i32* %c, align 4
  %3 = mul i32 %1, %2
  %4 = add i32 %0, %3
  store i32 %4, i32* %d, align 4
  %5 = load i32, i32* %d, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @3, i32 0, i32 0), i32 %5)
  %7 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @4, i32 0, i32 0), i32 %7, i32 22)
  %8 = load i32, i32* %a, align 4
  %9 = load i32, i32* %b, align 4
  %10 = add i32 %8, %9
  %11 = load i32, i32* %c, align 4
  %12 = mul i32 %10, %11
  store i32 %12, i32* %d, align 4
  %13 = load i32, i32* %d, align 4
  %14 = load i32, i32* %d, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @5, i32 0, i32 0), i32 %14)
  %16 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @6, i32 0, i32 0), i32 %16, i32 30)
  %17 = load i32, i32* %c, align 4
  %18 = load i32, i32* %a, align 4
  %19 = load i32, i32* %b, align 4
  %20 = sub i32 %18, %19
  %21 = mul i32 %17, %20
  store i32 %21, i32* %d, align 4
  %22 = load i32, i32* %d, align 4
  %23 = load i32, i32* %d, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @7, i32 0, i32 0), i32 %23)
  %25 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @8, i32 0, i32 0), i32 %25, i32 -10)
  %26 = load i32, i32* %a, align 4
  %27 = load i32, i32* %b, align 4
  %28 = load i32, i32* %c, align 4
  %29 = srem i32 %27, %28
  %30 = sub i32 %26, %29
  store i32 %30, i32* %d, align 4
  %31 = load i32, i32* %d, align 4
  %32 = load i32, i32* %d, align 4
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @9, i32 0, i32 0), i32 %32)
  %34 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @10, i32 0, i32 0), i32 %34, i32 -2)
  %35 = load i32, i32* %a, align 4
  %36 = load i32, i32* %b, align 4
  %37 = add i32 %35, %36
  %38 = load i32, i32* %c, align 4
  %39 = sdiv i32 %37, %38
  store i32 %39, i32* %d, align 4
  %40 = load i32, i32* %d, align 4
  %41 = load i32, i32* %d, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @11, i32 0, i32 0), i32 %41)
  %43 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @12, i32 0, i32 0), i32 %43, i32 1)
  ret void
}

define i32 @main() {
entry:
  %s = alloca i32, align 4
  %r = alloca i32, align 4
  %z = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @13, i32 0, i32 0))
  call void @checkArithmetic()
  store i32 1, i32* %x, align 4
  store i32 2, i32* %y, align 4
  store i32 3, i32* %z, align 4
  %1 = load i32, i32* %x, align 4
  %2 = load i32, i32* %y, align 4
  %3 = add i32 %1, %2
  %4 = load i32, i32* %z, align 4
  %5 = shl i32 %3, %4
  store i32 %5, i32* %r, align 4
  %6 = load i32, i32* %r, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @14, i32 0, i32 0), i32 %6)
  %8 = load i32, i32* %r, align 4
  call void @check_int(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @15, i32 0, i32 0), i32 %8, i32 24)
  %9 = load i32, i32* %x, align 4
  %10 = load i32, i32* %y, align 4
  %11 = add i32 %9, %10
  %12 = load i32, i32* %z, align 4
  %13 = shl i32 %11, %12
  store i32 %13, i32* %s, align 4
  %14 = load i32, i32* %s, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @16, i32 0, i32 0), i32 %14, i32 24)
  call void @report_result()
  %15 = load i32, i32* @test_errors, align 4
  ret i32 %15
}
