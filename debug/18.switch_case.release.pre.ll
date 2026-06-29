; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i8 @gradeOfScore(i32 %0) {
entry:
  %grade = alloca i8, align 1
  %score = alloca i32, align 4
  store i32 %0, ptr %score, align 4
  %1 = load i32, ptr %score, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2
  br i1 %3, label %case.1, label %switch.compare.1

switch.compare.1:                                 ; preds = %switch.compare.0
  %4 = icmp eq i32 %1, 3
  br i1 %4, label %case.2, label %switch.compare.2

switch.compare.2:                                 ; preds = %switch.compare.1
  %5 = icmp eq i32 %1, 4
  br i1 %5, label %case.3, label %switch.compare.3

switch.compare.3:                                 ; preds = %switch.compare.2
  %6 = icmp eq i32 %1, 5
  br i1 %6, label %case.4, label %switch.compare.4

switch.compare.4:                                 ; preds = %switch.compare.3
  %7 = icmp eq i32 %1, 6
  br i1 %7, label %case.5, label %switch.compare.5

switch.compare.5:                                 ; preds = %switch.compare.4
  %8 = icmp eq i32 %1, 7
  br i1 %8, label %case.6, label %switch.compare.6

switch.compare.6:                                 ; preds = %switch.compare.5
  %9 = icmp eq i32 %1, 8
  br i1 %9, label %case.7, label %switch.compare.7

switch.compare.7:                                 ; preds = %switch.compare.6
  %10 = icmp eq i32 %1, 9
  br i1 %10, label %case.8, label %switch.compare.8

switch.compare.8:                                 ; preds = %switch.compare.7
  %11 = icmp eq i32 %1, 10
  br i1 %11, label %case.9, label %switch.compare.9

switch.compare.9:                                 ; preds = %switch.compare.8
  br label %case.10

case.0:                                           ; preds = %entry
  br label %case.1

case.1:                                           ; preds = %case.0, %switch.compare.0
  br label %case.2

case.2:                                           ; preds = %case.1, %switch.compare.1
  br label %case.3

case.3:                                           ; preds = %case.2, %switch.compare.2
  br label %case.4

case.4:                                           ; preds = %case.3, %switch.compare.3
  store i8 68, ptr %grade, align 1
  %12 = load i8, ptr %grade, align 1
  br label %switch.end

case.5:                                           ; preds = %switch.compare.4
  store i8 67, ptr %grade, align 1
  %13 = load i8, ptr %grade, align 1
  br label %switch.end

case.6:                                           ; preds = %switch.compare.5
  br label %case.7

case.7:                                           ; preds = %case.6, %switch.compare.6
  store i8 66, ptr %grade, align 1
  %14 = load i8, ptr %grade, align 1
  br label %switch.end

case.8:                                           ; preds = %switch.compare.7
  br label %case.9

case.9:                                           ; preds = %case.8, %switch.compare.8
  store i8 65, ptr %grade, align 1
  %15 = load i8, ptr %grade, align 1
  br label %switch.end

case.10:                                          ; preds = %switch.compare.9
  store i8 69, ptr %grade, align 1
  %16 = load i8, ptr %grade, align 1
  br label %switch.end

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %17 = load i8, ptr %grade, align 1
  ret i8 %17
}

define i32 @main() {
entry:
  %boundary = alloca i32, align 4
  %grade = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i8 @gradeOfScore(i32 3)
  %1 = sext i8 %0 to i32
  %2 = icmp ne i32 %1, 68
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %3 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %4 = call i8 @gradeOfScore(i32 5)
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 68
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %8 = call i8 @gradeOfScore(i32 6)
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 67
  br i1 %10, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %12 = call i8 @gradeOfScore(i32 8)
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 66
  br i1 %14, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %16 = call i8 @gradeOfScore(i32 9)
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 65
  br i1 %18, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %boundary, align 4
  %20 = load i32, ptr %boundary, align 4
  br label %case.0

case.0:                                           ; preds = %if.end12
  store i8 69, ptr %grade, align 1
  %21 = load i8, ptr %grade, align 1
  br label %switch.end

switch.end:                                       ; preds = %case.0
  %22 = load i8, ptr %grade, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 69
  br i1 %24, label %then13, label %else14

then13:                                           ; preds = %switch.end
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %switch.end
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %26 = load i32, ptr %err, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %then16, label %else17

then16:                                           ; preds = %if.end15
  %28 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end18

else17:                                           ; preds = %if.end15
  %29 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %30 = load i32, ptr %err, align 4
  ret i32 %30
}
