; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [34 x i8] c"ERROR [%s]: got %lu expected %lu\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@4 = private unnamed_addr constant [32 x i8] c"**** 35.typedef_builtin.c ****\0A\00", align 1
@5 = private unnamed_addr constant [15 x i8] c"sizeof(size_t)\00", align 1
@6 = private unnamed_addr constant [18 x i8] c"sizeof(counter_t)\00", align 1
@7 = private unnamed_addr constant [15 x i8] c"sizeof(IntPtr)\00", align 1
@8 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@10 = private unnamed_addr constant [15 x i8] c"x after helper\00", align 1
@11 = private unnamed_addr constant [3 x i8] c"*p\00", align 1

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

define void @helper(i64 %0, i32 %1, i32* %2) {
entry:
  %p = alloca i32*, align 8
  %step = alloca i32, align 4
  %nbytes = alloca i64, align 8
  store i64 %0, i64* %nbytes, align 4
  store i32 %1, i32* %step, align 4
  store i32* %2, i32** %p, align 8
  %3 = load i32*, i32** %p, align 8
  %4 = load i64, i64* %nbytes, align 4
  %5 = load i32, i32* %step, align 4
  %6 = zext i32 %5 to i64
  %7 = add i64 %4, %6
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %3, align 4
  %9 = load i32, i32* %3, align 4
  ret void
}

define i32 @main() {
entry:
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i64, align 8
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @4, i32 0, i32 0))
  store i64 42, i64* %n, align 4
  %1 = load i64, i64* %n, align 4
  store i32 7, i32* %c, align 4
  %2 = load i32, i32* %c, align 4
  store i32 10, i32* %x, align 4
  %3 = load i32, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  %4 = load i32*, i32** %p, align 8
  %5 = load i64, i64* %n, align 4
  %6 = load i32, i32* %c, align 4
  %7 = load i32*, i32** %p, align 8
  call void @helper(i64 %5, i32 %6, i32* %7)
  call void @check_ulong(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @5, i32 0, i32 0), i64 8, i64 8)
  call void @check_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @6, i32 0, i32 0), i32 4, i32 4)
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @7, i32 0, i32 0), i32 8, i32 8)
  %8 = load i64, i64* %n, align 4
  call void @check_ulong(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @8, i32 0, i32 0), i64 %8, i64 42)
  %9 = load i32, i32* %c, align 4
  call void @check_int(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @9, i32 0, i32 0), i32 %9, i32 7)
  %10 = load i32, i32* %x, align 4
  call void @check_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @10, i32 0, i32 0), i32 %10, i32 49)
  %11 = load i32*, i32** %p, align 8
  %12 = load i32, i32* %11, align 4
  call void @check_int(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @11, i32 0, i32 0), i32 %12, i32 49)
  call void @report_result()
  %13 = load i32, i32* @test_errors, align 4
  ret i32 %13
}
