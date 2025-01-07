; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [34 x i8] c"WEEK: %d, %d, %d, %d, %d, %d, %d\0A\00", align 1
@1 = private unnamed_addr constant [9 x i8] c"day: %d\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"all sexes: %d, %d\0A\00", align 1
@3 = private unnamed_addr constant [9 x i8] c"sex: %d\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %sex = alloca i32, align 4
  %day = alloca i32, align 4
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @0, i32 0, i32 0), i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6)
  store i32 5, i32* %day, align 4
  %1 = load i32, i32* %day, align 4
  %2 = load i32, i32* %day, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @1, i32 0, i32 0), i32 %2)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @2, i32 0, i32 0), i32 0, i32 1)
  store i32 1, i32* %sex, align 4
  %5 = load i32, i32* %sex, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @3, i32 0, i32 0), i32 %5)
  ret i32 0
}
