; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

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
  %1 = icmp ne i8 %0, 68
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i8 @gradeOfScore(i32 5)
  %4 = icmp ne i8 %3, 68
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i8 @gradeOfScore(i32 6)
  %7 = icmp ne i8 %6, 67
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i8 @gradeOfScore(i32 8)
  %10 = icmp ne i8 %9, 66
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i8 @gradeOfScore(i32 9)
  %13 = icmp ne i8 %12, 65
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, i32* %boundary, align 4
  %15 = load i32, i32* %boundary, align 4
  store i8 69, i8* %grade, align 1
  %16 = load i8, i8* %grade, align 1
  %17 = load i8, i8* %grade, align 1
  %18 = icmp ne i8 %17, 69
  br i1 %18, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %20 = load i32, i32* %err, align 4
  %21 = icmp eq i32 %20, 0
  %. = select i1 %21, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0)
  %22 = call i32 (i8*, ...) @printf(i8* %.)
  %23 = load i32, i32* %err, align 4
  ret i32 %23
}
