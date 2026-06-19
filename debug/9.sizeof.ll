; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%union.ID = type { i8* }
%struct.Student = type { i32, i8*, i8, float }

@0 = private unnamed_addr constant [17 x i8] c"9.sizeof.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"9.sizeof.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %sex = alloca i32, align 4
  %id = alloca %union.ID, align 8
  %student = alloca %struct.Student, align 8
  %pc = alloca i8*, align 8
  %d = alloca double, align 8
  %f = alloca float, align 4
  %l = alloca i64, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = load i32, i32* %err, align 4
  %1 = icmp eq i32 %0, 0
  %. = select i1 %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0)
  %2 = call i32 (i8*, ...) @printf(i8* %.)
  %3 = load i32, i32* %err, align 4
  ret i32 %3
}
