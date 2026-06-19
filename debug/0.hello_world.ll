; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [22 x i8] c"0.hello_world.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"0.hello_world.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = load i32, i32* %err, align 4
  %1 = icmp eq i32 %0, 0
  %. = select i1 %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @1, i32 0, i32 0)
  %2 = call i32 (i8*, ...) @printf(i8* %.)
  %3 = load i32, i32* %err, align 4
  ret i32 %3
}
