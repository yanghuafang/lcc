; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@g_data = global i32 0
@0 = private unnamed_addr constant [40 x i8] c"p: %p, *p: %d, &g_data: %p, g_data: %d\0A\00", align 1
@1 = private unnamed_addr constant [42 x i8] c"p2: %p, *p2: %d, &g_data: %p, g_data: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @getAddress(i32** %0) {
entry:
  %p = alloca i32**, align 8
  store i32** %0, i32*** %p, align 8
  %1 = load i32**, i32*** %p, align 8
  store i32* @g_data, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  ret void
}

define i32 @main() {
entry:
  %p2 = alloca i32*, align 8
  %p = alloca i32*, align 8
  store i32* @g_data, i32** %p, align 8
  %0 = load i32*, i32** %p, align 8
  store i32 1234, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = load i32*, i32** %p, align 8
  %3 = load i32*, i32** %p, align 8
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* @g_data, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @0, i32 0, i32 0), i32* %2, i32 %4, i32* @g_data, i32 %5)
  call void @getAddress(i32** %p2)
  %7 = load i32*, i32** %p2, align 8
  store i32 5678, i32* %7, align 4
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %p2, align 8
  %10 = load i32*, i32** %p2, align 8
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* @g_data, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i32 0, i32 0), i32* %9, i32 %11, i32* @g_data, i32 %12)
  ret i32 0
}
