; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@test_errors = global i32 0
@0 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %d expected %d\0A\00", align 1
@1 = private unnamed_addr constant [32 x i8] c"ERROR [%s]: got %c expected %c\0A\00", align 1
@2 = private unnamed_addr constant [6 x i8] c"PASS\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"FAIL: %d error(s)\0A\00", align 1
@gc = global i8 97
@gi = global i32 1024
@4 = private unnamed_addr constant [28 x i8] c"**** 5.pointer_type.c ****\0A\00", align 1
@5 = private unnamed_addr constant [10 x i8] c"c: %c %c\0A\00", align 1
@6 = private unnamed_addr constant [10 x i8] c"i: %i %i\0A\00", align 1
@7 = private unnamed_addr constant [14 x i8] c"new c: %c %c\0A\00", align 1
@8 = private unnamed_addr constant [14 x i8] c"new i: %i %i\0A\00", align 1
@9 = private unnamed_addr constant [11 x i8] c"gc: %c %c\0A\00", align 1
@10 = private unnamed_addr constant [11 x i8] c"gi: %i %i\0A\00", align 1
@11 = private unnamed_addr constant [15 x i8] c"new gc: %c %c\0A\00", align 1
@12 = private unnamed_addr constant [15 x i8] c"new gi: %i %i\0A\00", align 1
@13 = private unnamed_addr constant [10 x i8] c"c initial\00", align 1
@14 = private unnamed_addr constant [8 x i8] c"deref c\00", align 1
@15 = private unnamed_addr constant [8 x i8] c"i local\00", align 1
@16 = private unnamed_addr constant [8 x i8] c"deref i\00", align 1
@17 = private unnamed_addr constant [10 x i8] c"gc global\00", align 1
@18 = private unnamed_addr constant [10 x i8] c"gi global\00", align 1
@19 = private unnamed_addr constant [16 x i8] c"i zero boundary\00", align 1

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
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @1, i32 0, i32 0), i8* %8, i32 %10, i32 %12)
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
  %pgi = alloca i32*, align 8
  %pgc = alloca i8*, align 8
  %pi = alloca i32*, align 8
  %pc = alloca i8*, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @4, i32 0, i32 0))
  store i8 65, i8* %c, align 1
  store i32 128, i32* %i, align 4
  store i8* %c, i8** %pc, align 8
  store i32* %i, i32** %pi, align 8
  %1 = load i8, i8* %c, align 1
  %2 = sext i8 %1 to i32
  %3 = load i8*, i8** %pc, align 8
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @5, i32 0, i32 0), i32 %2, i32 %5)
  %7 = load i32, i32* %i, align 4
  %8 = load i32*, i32** %pi, align 8
  %9 = load i32, i32* %8, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @6, i32 0, i32 0), i32 %7, i32 %9)
  %11 = load i8*, i8** %pc, align 8
  store i8 66, i8* %11, align 1
  %12 = load i8, i8* %11, align 1
  %13 = load i32*, i32** %pi, align 8
  store i32 256, i32* %13, align 4
  %14 = load i32, i32* %13, align 4
  %15 = load i8, i8* %c, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8*, i8** %pc, align 8
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @7, i32 0, i32 0), i32 %16, i32 %19)
  %21 = load i32, i32* %i, align 4
  %22 = load i32*, i32** %pi, align 8
  %23 = load i32, i32* %22, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @8, i32 0, i32 0), i32 %21, i32 %23)
  store i8* @gc, i8** %pgc, align 8
  store i32* @gi, i32** %pgi, align 8
  %25 = load i8, i8* @gc, align 1
  %26 = sext i8 %25 to i32
  %27 = load i8*, i8** %pgc, align 8
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @9, i32 0, i32 0), i32 %26, i32 %29)
  %31 = load i32, i32* @gi, align 4
  %32 = load i32*, i32** %pgi, align 8
  %33 = load i32, i32* %32, align 4
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @10, i32 0, i32 0), i32 %31, i32 %33)
  %35 = load i8*, i8** %pgc, align 8
  store i8 98, i8* %35, align 1
  %36 = load i8, i8* %35, align 1
  %37 = load i32*, i32** %pgi, align 8
  store i32 2048, i32* %37, align 4
  %38 = load i32, i32* %37, align 4
  %39 = load i8, i8* @gc, align 1
  %40 = sext i8 %39 to i32
  %41 = load i8*, i8** %pgc, align 8
  %42 = load i8, i8* %41, align 1
  %43 = sext i8 %42 to i32
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @11, i32 0, i32 0), i32 %40, i32 %43)
  %45 = load i32, i32* @gi, align 4
  %46 = load i32*, i32** %pgi, align 8
  %47 = load i32, i32* %46, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @12, i32 0, i32 0), i32 %45, i32 %47)
  %49 = load i8, i8* %c, align 1
  call void @check_char(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @13, i32 0, i32 0), i8 %49, i8 66)
  %50 = load i8*, i8** %pc, align 8
  %51 = load i8, i8* %50, align 1
  call void @check_char(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @14, i32 0, i32 0), i8 %51, i8 66)
  %52 = load i32, i32* %i, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @15, i32 0, i32 0), i32 %52, i32 256)
  %53 = load i32*, i32** %pi, align 8
  %54 = load i32, i32* %53, align 4
  call void @check_int(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @16, i32 0, i32 0), i32 %54, i32 256)
  %55 = load i8, i8* @gc, align 1
  call void @check_char(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @17, i32 0, i32 0), i8 %55, i8 98)
  %56 = load i32, i32* @gi, align 4
  call void @check_int(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @18, i32 0, i32 0), i32 %56, i32 2048)
  %57 = load i32*, i32** %pi, align 8
  store i32 0, i32* %57, align 4
  %58 = load i32, i32* %57, align 4
  %59 = load i32, i32* %i, align 4
  call void @check_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @19, i32 0, i32 0), i32 %59, i32 0)
  call void @report_result()
  %60 = load i32, i32* @test_errors, align 4
  ret i32 %60
}
