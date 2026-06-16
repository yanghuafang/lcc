; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [31 x i8] c"**** 13.double_inc_sub.c ****\0A\00", align 1
@4 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@5 = private unnamed_addr constant [24 x i8] c"after a++, a: %d b: %d\0A\00", align 1
@6 = private unnamed_addr constant [14 x i8] c"postfix inc a\00", align 1
@7 = private unnamed_addr constant [14 x i8] c"postfix inc b\00", align 1
@8 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@9 = private unnamed_addr constant [24 x i8] c"after ++a, a: %d c: %d\0A\00", align 1
@10 = private unnamed_addr constant [13 x i8] c"prefix inc a\00", align 1
@11 = private unnamed_addr constant [13 x i8] c"prefix inc c\00", align 1
@12 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@13 = private unnamed_addr constant [24 x i8] c"after a--, a: %d d: %d\0A\00", align 1
@14 = private unnamed_addr constant [14 x i8] c"postfix dec a\00", align 1
@15 = private unnamed_addr constant [14 x i8] c"postfix dec d\00", align 1
@16 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@17 = private unnamed_addr constant [24 x i8] c"after --a, a: %d e: %d\0A\00", align 1
@18 = private unnamed_addr constant [13 x i8] c"prefix dec a\00", align 1
@19 = private unnamed_addr constant [13 x i8] c"prefix dec e\00", align 1
@20 = private unnamed_addr constant [14 x i8] c"inc from zero\00", align 1
@21 = private unnamed_addr constant [12 x i8] c"dec to zero\00", align 1

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
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @3, i32 0, i32 0))
  store i32 13, i32* %a, align 4
  %1 = load i32, i32* %a, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0), i32 %1)
  %3 = load i32, i32* %a, align 4
  %4 = add i32 %3, 1
  store i32 %4, i32* %a, align 4
  store i32 %3, i32* %b, align 4
  %5 = load i32, i32* %a, align 4
  %6 = load i32, i32* %b, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @5, i32 0, i32 0), i32 %5, i32 %6)
  %8 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @6, i32 0, i32 0), i32 %8, i32 14)
  %9 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @7, i32 0, i32 0), i32 %9, i32 13)
  store i32 13, i32* %a, align 4
  %10 = load i32, i32* %a, align 4
  %11 = load i32, i32* %a, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @8, i32 0, i32 0), i32 %11)
  %13 = load i32, i32* %a, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %a, align 4
  %15 = load i32, i32* %a, align 4
  store i32 %15, i32* %c, align 4
  %16 = load i32, i32* %a, align 4
  %17 = load i32, i32* %c, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @9, i32 0, i32 0), i32 %16, i32 %17)
  %19 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @10, i32 0, i32 0), i32 %19, i32 14)
  %20 = load i32, i32* %c, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @11, i32 0, i32 0), i32 %20, i32 14)
  store i32 13, i32* %a, align 4
  %21 = load i32, i32* %a, align 4
  %22 = load i32, i32* %a, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @12, i32 0, i32 0), i32 %22)
  %24 = load i32, i32* %a, align 4
  %25 = sub i32 %24, 1
  store i32 %25, i32* %a, align 4
  store i32 %24, i32* %d, align 4
  %26 = load i32, i32* %a, align 4
  %27 = load i32, i32* %d, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @13, i32 0, i32 0), i32 %26, i32 %27)
  %29 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @14, i32 0, i32 0), i32 %29, i32 12)
  %30 = load i32, i32* %d, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @15, i32 0, i32 0), i32 %30, i32 13)
  store i32 13, i32* %a, align 4
  %31 = load i32, i32* %a, align 4
  %32 = load i32, i32* %a, align 4
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @16, i32 0, i32 0), i32 %32)
  %34 = load i32, i32* %a, align 4
  %35 = sub i32 %34, 1
  store i32 %35, i32* %a, align 4
  %36 = load i32, i32* %a, align 4
  store i32 %36, i32* %e, align 4
  %37 = load i32, i32* %a, align 4
  %38 = load i32, i32* %e, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @17, i32 0, i32 0), i32 %37, i32 %38)
  %40 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @18, i32 0, i32 0), i32 %40, i32 12)
  %41 = load i32, i32* %e, align 4
  call void @check_int(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @19, i32 0, i32 0), i32 %41, i32 12)
  store i32 0, i32* %a, align 4
  %42 = load i32, i32* %a, align 4
  %43 = load i32, i32* %a, align 4
  %44 = add i32 %43, 1
  store i32 %44, i32* %a, align 4
  %45 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @20, i32 0, i32 0), i32 %45, i32 1)
  %46 = load i32, i32* %a, align 4
  %47 = sub i32 %46, 1
  store i32 %47, i32* %a, align 4
  %48 = load i32, i32* %a, align 4
  call void @check_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @21, i32 0, i32 0), i32 %48, i32 0)
  call void @report_result()
  %49 = load i32, i32* @test_errors, align 4
  ret i32 %49
}
