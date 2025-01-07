; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin24.2.0"

@0 = private unnamed_addr constant [19 x i8] c"score:%d grade:%c\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @gradeOfScore(i32 %0) {
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
  %7 = load i32, i32* %score, align 4
  %8 = load i8, i8* %grade, align 1
  %9 = sext i8 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i32 %7, i32 %9)
  ret void
}

define i32 @main() {
entry:
  call void @gradeOfScore(i32 3)
  call void @gradeOfScore(i32 5)
  call void @gradeOfScore(i32 6)
  call void @gradeOfScore(i32 8)
  call void @gradeOfScore(i32 9)
  ret i32 0
}
