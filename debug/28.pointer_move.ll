; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [13 x i8] c"c[0]: %c %c\0A\00", align 1
@1 = private unnamed_addr constant [13 x i8] c"c[1]: %c %c\0A\00", align 1
@2 = private unnamed_addr constant [13 x i8] c"c[2]: %c %c\0A\00", align 1
@3 = private unnamed_addr constant [13 x i8] c"c[3]: %c %c\0A\00", align 1
@4 = private unnamed_addr constant [13 x i8] c"c[3]: %c %c\0A\00", align 1
@5 = private unnamed_addr constant [13 x i8] c"c[2]: %c %c\0A\00", align 1
@6 = private unnamed_addr constant [13 x i8] c"c[1]: %c %c\0A\00", align 1
@7 = private unnamed_addr constant [13 x i8] c"c[0]: %c %c\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %pc = alloca i8*, align 8
  %c = alloca [4 x i8], align 1
  %0 = bitcast [4 x i8]* %c to i8*
  %1 = bitcast i8* %0 to i8*
  store i8 65, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = bitcast [4 x i8]* %c to i8*
  %4 = getelementptr i8, i8* %3, i32 1
  store i8 66, i8* %4, align 1
  %5 = load i8, i8* %4, align 1
  %6 = bitcast [4 x i8]* %c to i8*
  %7 = getelementptr i8, i8* %6, i32 2
  store i8 67, i8* %7, align 1
  %8 = load i8, i8* %7, align 1
  %9 = bitcast [4 x i8]* %c to i8*
  %10 = getelementptr i8, i8* %9, i32 3
  store i8 68, i8* %10, align 1
  %11 = load i8, i8* %10, align 1
  %12 = bitcast [4 x i8]* %c to i8*
  store i8* %12, i8** %pc, align 8
  %13 = load i8*, i8** %pc, align 8
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = load i8*, i8** %pc, align 8
  %17 = bitcast i8* %16 to i8*
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0), i32 %15, i32 %19)
  %21 = load i8*, i8** %pc, align 8
  %22 = getelementptr i8, i8* %21, i32 1
  store i8* %22, i8** %pc, align 8
  %23 = load i8*, i8** %pc, align 8
  %24 = load i8*, i8** %pc, align 8
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = load i8*, i8** %pc, align 8
  %28 = bitcast i8* %27 to i8*
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @1, i32 0, i32 0), i32 %26, i32 %30)
  %32 = load i8*, i8** %pc, align 8
  %33 = getelementptr i8, i8* %32, i32 1
  store i8* %33, i8** %pc, align 8
  %34 = load i8*, i8** %pc, align 8
  %35 = load i8*, i8** %pc, align 8
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = load i8*, i8** %pc, align 8
  %39 = bitcast i8* %38 to i8*
  %40 = load i8, i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @2, i32 0, i32 0), i32 %37, i32 %41)
  %43 = load i8*, i8** %pc, align 8
  %44 = getelementptr i8, i8* %43, i32 1
  store i8* %44, i8** %pc, align 8
  %45 = load i8*, i8** %pc, align 8
  %46 = load i8, i8* %45, align 1
  %47 = sext i8 %46 to i32
  %48 = load i8*, i8** %pc, align 8
  %49 = bitcast i8* %48 to i8*
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0), i32 %47, i32 %51)
  %53 = bitcast [4 x i8]* %c to i8*
  %54 = getelementptr i8, i8* %53, i32 3
  store i8* %54, i8** %pc, align 8
  %55 = load i8*, i8** %pc, align 8
  %56 = load i8*, i8** %pc, align 8
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = load i8*, i8** %pc, align 8
  %60 = bitcast i8* %59 to i8*
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i32 0, i32 0), i32 %58, i32 %62)
  %64 = load i8*, i8** %pc, align 8
  %65 = getelementptr i8, i8* %64, i32 -1
  store i8* %65, i8** %pc, align 8
  %66 = load i8*, i8** %pc, align 8
  %67 = load i8*, i8** %pc, align 8
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = load i8*, i8** %pc, align 8
  %71 = bitcast i8* %70 to i8*
  %72 = load i8, i8* %71, align 1
  %73 = sext i8 %72 to i32
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @5, i32 0, i32 0), i32 %69, i32 %73)
  %75 = load i8*, i8** %pc, align 8
  %76 = getelementptr i8, i8* %75, i32 -1
  store i8* %76, i8** %pc, align 8
  %77 = load i8*, i8** %pc, align 8
  %78 = load i8*, i8** %pc, align 8
  %79 = load i8, i8* %78, align 1
  %80 = sext i8 %79 to i32
  %81 = load i8*, i8** %pc, align 8
  %82 = bitcast i8* %81 to i8*
  %83 = load i8, i8* %82, align 1
  %84 = sext i8 %83 to i32
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @6, i32 0, i32 0), i32 %80, i32 %84)
  %86 = load i8*, i8** %pc, align 8
  %87 = getelementptr i8, i8* %86, i32 -1
  store i8* %87, i8** %pc, align 8
  %88 = load i8*, i8** %pc, align 8
  %89 = load i8, i8* %88, align 1
  %90 = sext i8 %89 to i32
  %91 = load i8*, i8** %pc, align 8
  %92 = bitcast i8* %91 to i8*
  %93 = load i8, i8* %92, align 1
  %94 = sext i8 %93 to i32
  %95 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @7, i32 0, i32 0), i32 %90, i32 %94)
  ret i32 0
}
