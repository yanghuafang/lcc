; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@3 = private unnamed_addr constant [33 x i8] c"**** 30.array_mixed_decl.c ****\0A\00", align 1
@4 = private unnamed_addr constant [5 x i8] c"a[0]\00", align 1
@5 = private unnamed_addr constant [5 x i8] c"a[1]\00", align 1
@6 = private unnamed_addr constant [2 x i8] c"b\00", align 1

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
  %b = alloca i32, align 4
  %a = alloca [4 x i32], align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @3, i32 0, i32 0))
  %1 = bitcast [4 x i32]* %a to i32*
  %2 = bitcast i32* %1 to i32*
  store i32 10, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = bitcast [4 x i32]* %a to i32*
  %5 = getelementptr i32, i32* %4, i32 1
  store i32 20, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  store i32 30, i32* %b, align 4
  %7 = load i32, i32* %b, align 4
  %8 = bitcast [4 x i32]* %a to i32*
  %9 = bitcast i32* %8 to i32*
  %10 = load i32, i32* %9, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @4, i32 0, i32 0), i32 %10, i32 10)
  %11 = bitcast [4 x i32]* %a to i32*
  %12 = getelementptr i32, i32* %11, i32 1
  %13 = load i32, i32* %12, align 4
  call void @check_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @5, i32 0, i32 0), i32 %13, i32 20)
  %14 = load i32, i32* %b, align 4
  call void @check_int(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @6, i32 0, i32 0), i32 %14, i32 30)
  call void @report_result()
  %15 = load i32, i32* @test_errors, align 4
  ret i32 %15
}
