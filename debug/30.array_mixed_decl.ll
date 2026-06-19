; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"30.array_mixed_decl.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %b = alloca i32, align 4
  %a = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [4 x i32]* %a to i32*
  %1 = bitcast i32* %0 to i32*
  store i32 10, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = bitcast [4 x i32]* %a to i32*
  %4 = getelementptr i32, i32* %3, i32 1
  store i32 20, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  store i32 30, i32* %b, align 4
  %6 = load i32, i32* %b, align 4
  %7 = bitcast [4 x i32]* %a to i32*
  %8 = bitcast i32* %7 to i32*
  %9 = load i32, i32* %8, align 4
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %12 = bitcast [4 x i32]* %a to i32*
  %13 = getelementptr i32, i32* %12, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 20
  br i1 %15, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %16 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %b, align 4
  %18 = icmp ne i32 %17, 30
  br i1 %18, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32, i32* %err, align 4
  %21 = icmp eq i32 %20, 0
  %. = select i1 %21, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @1, i32 0, i32 0)
  %22 = call i32 (i8*, ...) @printf(i8* %.)
  %23 = load i32, i32* %err, align 4
  ret i32 %23
}
