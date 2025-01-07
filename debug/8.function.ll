; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [12 x i8] c"i addr: %p\0A\00", align 1
@1 = private unnamed_addr constant [8 x i8] c"1+2=%d\0A\00", align 1
@2 = private unnamed_addr constant [8 x i8] c"1+2=%d\0A\00", align 1
@3 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@4 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@5 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@6 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@7 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1
@8 = private unnamed_addr constant [8 x i8] c"3+4=%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @sum(i32 %0, i32 %1) {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, i32* %l, align 4
  store i32 %1, i32* %r, align 4
  %2 = load i32, i32* %l, align 4
  %3 = load i32, i32* %r, align 4
  %4 = add i32 %2, %3
  ret i32 %4
}

define i32 @sum2(i32* %0, i32* %1) {
entry:
  %r = alloca i32*, align 8
  %l = alloca i32*, align 8
  store i32* %0, i32** %l, align 8
  store i32* %1, i32** %r, align 8
  %2 = load i32*, i32** %l, align 8
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** %r, align 8
  %5 = load i32, i32* %4, align 4
  %6 = call i32 @sum(i32 %3, i32 %5)
  ret i32 %6
}

define void @sum3(i32 %0, i32 %1, i32* %2) {
entry:
  %result = alloca i32*, align 8
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, i32* %l, align 4
  store i32 %1, i32* %r, align 4
  store i32* %2, i32** %result, align 8
  %3 = load i32*, i32** %result, align 8
  %4 = load i32, i32* %l, align 4
  %5 = load i32, i32* %r, align 4
  %6 = add i32 %4, %5
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  ret void
}

define i32 @main() {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  %i = alloca i32, align 4
  %0 = call i32 @sum(i32 1, i32 2)
  store i32 %0, i32* %i, align 4
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i32* %i)
  %2 = load i32, i32* %i, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0), i32 %2)
  %4 = call i32 @sum(i32 1, i32 2)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @2, i32 0, i32 0), i32 %4)
  store i32 3, i32* %l, align 4
  store i32 4, i32* %r, align 4
  %6 = load i32, i32* %l, align 4
  %7 = load i32, i32* %r, align 4
  %8 = call i32 @sum(i32 %6, i32 %7)
  store i32 %8, i32* %i, align 4
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @3, i32 0, i32 0), i32 %10)
  %12 = load i32, i32* %l, align 4
  %13 = load i32, i32* %r, align 4
  %14 = call i32 @sum(i32 %12, i32 %13)
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @4, i32 0, i32 0), i32 %14)
  %16 = call i32 @sum2(i32* %l, i32* %r)
  store i32 %16, i32* %i, align 4
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %i, align 4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @5, i32 0, i32 0), i32 %18)
  %20 = call i32 @sum2(i32* %l, i32* %r)
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @6, i32 0, i32 0), i32 %20)
  call void @sum3(i32 3, i32 4, i32* %i)
  %22 = load i32, i32* %i, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @7, i32 0, i32 0), i32 %22)
  %24 = load i32, i32* %l, align 4
  %25 = load i32, i32* %r, align 4
  call void @sum3(i32 %24, i32 %25, i32* %i)
  %26 = load i32, i32* %i, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i32 0, i32 0), i32 %26)
  ret i32 0
}
