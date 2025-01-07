; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@gs = global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0)
@gi = global [4 x i32] undef
@1 = private unnamed_addr constant [16 x i8] c"happy new year!\00", align 1
@2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@5 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@6 = private unnamed_addr constant [9 x i8] c"i %d %d\0A\00", align 1
@7 = private unnamed_addr constant [14 x i8] c"i addr %p %p\0A\00", align 1
@8 = private unnamed_addr constant [10 x i8] c"gi %d %d\0A\00", align 1
@9 = private unnamed_addr constant [15 x i8] c"gi addr %p %p\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %i = alloca [4 x i32], align 4
  %s = alloca [16 x i8], align 1
  %ps = alloca i8*, align 8
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @1, i32 0, i32 0), i8** %ps, align 8
  %0 = load i8*, i8** %ps, align 8
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0), i8* %0)
  %2 = load i8*, i8** @gps, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0), i8* %2)
  %4 = bitcast [16 x i8]* %s to i8*
  %5 = bitcast i8* %4 to i8*
  store i8 103, i8* %5, align 1
  %6 = load i8, i8* %5, align 1
  %7 = bitcast [16 x i8]* %s to i8*
  %8 = getelementptr i8, i8* %7, i32 1
  store i8 111, i8* %8, align 1
  %9 = load i8, i8* %8, align 1
  %10 = bitcast [16 x i8]* %s to i8*
  %11 = getelementptr i8, i8* %10, i32 2
  store i8 111, i8* %11, align 1
  %12 = load i8, i8* %11, align 1
  %13 = bitcast [16 x i8]* %s to i8*
  %14 = getelementptr i8, i8* %13, i32 3
  store i8 100, i8* %14, align 1
  %15 = load i8, i8* %14, align 1
  %16 = bitcast [16 x i8]* %s to i8*
  %17 = getelementptr i8, i8* %16, i32 4
  store i8 0, i8* %17, align 1
  %18 = load i8, i8* %17, align 1
  %19 = bitcast [16 x i8]* %s to i8*
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), i8* %19)
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  %21 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1
  %22 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1
  %23 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1
  %24 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1
  %25 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1
  %26 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @5, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0))
  %28 = bitcast [4 x i32]* %i to i32*
  %29 = bitcast i32* %28 to i32*
  store i32 128, i32* %29, align 4
  %30 = load i32, i32* %29, align 4
  %31 = bitcast [4 x i32]* %i to i32*
  %32 = getelementptr i32, i32* %31, i32 1
  store i32 256, i32* %32, align 4
  %33 = load i32, i32* %32, align 4
  %34 = bitcast [4 x i32]* %i to i32*
  %35 = bitcast i32* %34 to i32*
  %36 = load i32, i32* %35, align 4
  %37 = bitcast [4 x i32]* %i to i32*
  %38 = getelementptr i32, i32* %37, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @6, i32 0, i32 0), i32 %36, i32 %39)
  %41 = bitcast [4 x i32]* %i to i32*
  %42 = bitcast i32* %41 to i32*
  %43 = bitcast [4 x i32]* %i to i32*
  %44 = getelementptr i32, i32* %43, i32 1
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @7, i32 0, i32 0), i32* %42, i32* %44)
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  %46 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %47 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %48 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  %49 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @8, i32 0, i32 0), i32 %48, i32 %49)
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @9, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1))
  ret i32 0
}
