; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [10 x i8] c"c: %c %c\0A\00", align 1
@1 = private unnamed_addr constant [10 x i8] c"i: %i %i\0A\00", align 1
@2 = private unnamed_addr constant [14 x i8] c"new c: %c %c\0A\00", align 1
@3 = private unnamed_addr constant [14 x i8] c"new i: %i %i\0A\00", align 1
@4 = private unnamed_addr constant [11 x i8] c"gc: %c %c\0A\00", align 1
@5 = private unnamed_addr constant [11 x i8] c"gi: %i %i\0A\00", align 1
@6 = private unnamed_addr constant [15 x i8] c"new gc: %c %c\0A\00", align 1
@7 = private unnamed_addr constant [15 x i8] c"new gi: %i %i\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %pgi = alloca i32*, align 8
  %pgc = alloca i8*, align 8
  %pi = alloca i32*, align 8
  %pc = alloca i8*, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  store i8 65, i8* %c, align 1
  store i32 128, i32* %i, align 4
  store i8* %c, i8** %pc, align 8
  store i32* %i, i32** %pi, align 8
  %0 = load i8, i8* %c, align 1
  %1 = sext i8 %0 to i32
  %2 = load i8*, i8** %pc, align 8
  %3 = load i8, i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @0, i32 0, i32 0), i32 %1, i32 %4)
  %6 = load i32, i32* %i, align 4
  %7 = load i32*, i32** %pi, align 8
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @1, i32 0, i32 0), i32 %6, i32 %8)
  %10 = load i8*, i8** %pc, align 8
  store i8 66, i8* %10, align 1
  %11 = load i8, i8* %10, align 1
  %12 = load i32*, i32** %pi, align 8
  store i32 256, i32* %12, align 4
  %13 = load i32, i32* %12, align 4
  %14 = load i8, i8* %c, align 1
  %15 = sext i8 %14 to i32
  %16 = load i8*, i8** %pc, align 8
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @2, i32 0, i32 0), i32 %15, i32 %18)
  %20 = load i32, i32* %i, align 4
  %21 = load i32*, i32** %pi, align 8
  %22 = load i32, i32* %21, align 4
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @3, i32 0, i32 0), i32 %20, i32 %22)
  store i8* @gc, i8** %pgc, align 8
  store i32* @gi, i32** %pgi, align 8
  %24 = load i8, i8* @gc, align 1
  %25 = sext i8 %24 to i32
  %26 = load i8*, i8** %pgc, align 8
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @4, i32 0, i32 0), i32 %25, i32 %28)
  %30 = load i32, i32* @gi, align 4
  %31 = load i32*, i32** %pgi, align 8
  %32 = load i32, i32* %31, align 4
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @5, i32 0, i32 0), i32 %30, i32 %32)
  %34 = load i8*, i8** %pgc, align 8
  store i8 98, i8* %34, align 1
  %35 = load i8, i8* %34, align 1
  %36 = load i32*, i32** %pgi, align 8
  store i32 2048, i32* %36, align 4
  %37 = load i32, i32* %36, align 4
  %38 = load i8, i8* @gc, align 1
  %39 = sext i8 %38 to i32
  %40 = load i8*, i8** %pgc, align 8
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0), i32 %39, i32 %42)
  %44 = load i32, i32* @gi, align 4
  %45 = load i32*, i32** %pgi, align 8
  %46 = load i32, i32* %45, align 4
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @7, i32 0, i32 0), i32 %44, i32 %46)
  ret i32 0
}
