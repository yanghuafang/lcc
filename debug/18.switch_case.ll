; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i8 @gradeOfScore(i32 %0) {
entry:
  %grade = alloca i8, align 1
  %score = alloca i32, align 4
  store i32 %0, i32* %score, align 4
  %1 = load i32, i32* %score, align 4
  switch i32 %1, label %case.10 [
    i32 1, label %case.4
    i32 2, label %case.4
    i32 3, label %case.4
    i32 4, label %case.4
    i32 5, label %case.4
    i32 6, label %case.5
    i32 7, label %case.7
    i32 8, label %case.7
    i32 9, label %case.9
    i32 10, label %case.9
  ]

case.4:                                           ; preds = %entry, %entry, %entry, %entry, %entry
  store i8 68, i8* %grade, align 1
  %2 = load i8, i8* %grade, align 1
  br label %switch.end

case.5:                                           ; preds = %entry
  store i8 67, i8* %grade, align 1
  %3 = load i8, i8* %grade, align 1
  br label %switch.end

case.7:                                           ; preds = %entry, %entry
  store i8 66, i8* %grade, align 1
  %4 = load i8, i8* %grade, align 1
  br label %switch.end

case.9:                                           ; preds = %entry, %entry
  store i8 65, i8* %grade, align 1
  %5 = load i8, i8* %grade, align 1
  br label %switch.end

case.10:                                          ; preds = %entry
  store i8 69, i8* %grade, align 1
  %6 = load i8, i8* %grade, align 1
  br label %switch.end

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %7 = load i8, i8* %grade, align 1
  ret i8 %7
}

define i32 @main() {
entry:
  %boundary = alloca i32, align 4
  %grade = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i8 @gradeOfScore(i32 3)
  %1 = sext i8 %0 to i32
  %2 = icmp ne i32 %1, 68
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %3 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %4 = call i8 @gradeOfScore(i32 5)
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 68
  br i1 %6, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %8 = call i8 @gradeOfScore(i32 6)
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 67
  br i1 %10, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %12 = call i8 @gradeOfScore(i32 8)
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 66
  br i1 %14, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %15 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %16 = call i8 @gradeOfScore(i32 9)
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 65
  br i1 %18, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, i32* %boundary, align 4
  %20 = load i32, i32* %boundary, align 4
  store i8 69, i8* %grade, align 1
  %21 = load i8, i8* %grade, align 1
  %22 = load i8, i8* %grade, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 69
  br i1 %24, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %25 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %26 = load i32, i32* %err, align 4
  %27 = icmp eq i32 %26, 0
  %. = select i1 %27, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0)
  %28 = call i32 (i8*, ...) @printf(i8* %.)
  %29 = load i32, i32* %err, align 4
  ret i32 %29
}
