; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [18 x i8] c"23.return.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [18 x i8] c"23.return.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @checkAge1(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp slt i32 %1, 18
  %3 = load i32, i32* %age, align 4
  %4 = icmp eq i32 %3, 18
  %5 = load i32, i32* %age, align 4
  %6 = load i32, i32* %age, align 4
  %spec.select = select i1 %4, i32 %5, i32 %6
  %common.ret.op = select i1 %2, i32 %3, i32 %spec.select
  ret i32 %common.ret.op
}

define i32 @checkAge2(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp slt i32 %1, 18
  %3 = load i32, i32* %age, align 4
  %4 = load i32, i32* %age, align 4
  %spec.select = select i1 %2, i32 %3, i32 %4
  ret i32 %spec.select
}

define i32 @checkAge3(i32 %0) {
entry:
  %age = alloca i32, align 4
  store i32 %0, i32* %age, align 4
  %1 = load i32, i32* %age, align 4
  %2 = icmp sle i32 %1, 6
  %3 = load i32, i32* %age, align 4
  br i1 %2, label %common.ret, label %else

common.ret:                                       ; preds = %else2, %else, %entry
  %common.ret.op = phi i32 [ %3, %entry ], [ %8, %else ], [ %spec.select, %else2 ]
  ret i32 %common.ret.op

else:                                             ; preds = %entry
  %4 = icmp sgt i32 %3, 6
  %5 = load i32, i32* %age, align 4
  %6 = icmp sle i32 %5, 14
  %7 = select i1 %4, i1 %6, i1 false
  %8 = load i32, i32* %age, align 4
  br i1 %7, label %common.ret, label %else2

else2:                                            ; preds = %else
  %9 = icmp sgt i32 %8, 14
  %10 = load i32, i32* %age, align 4
  %11 = icmp sle i32 %10, 18
  %12 = select i1 %9, i1 %11, i1 false
  %13 = load i32, i32* %age, align 4
  %14 = load i32, i32* %age, align 4
  %spec.select = select i1 %12, i32 %13, i32 %14
  br label %common.ret
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @checkAge1(i32 16)
  %1 = icmp ne i32 %0, 16
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @checkAge1(i32 18)
  %4 = icmp ne i32 %3, 18
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @checkAge1(i32 20)
  %7 = icmp ne i32 %6, 20
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @checkAge2(i32 16)
  %10 = icmp ne i32 %9, 16
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @checkAge2(i32 18)
  %13 = icmp ne i32 %12, 18
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @checkAge2(i32 20)
  %16 = icmp ne i32 %15, 20
  br i1 %16, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @checkAge3(i32 6)
  %19 = icmp ne i32 %18, 6
  br i1 %19, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @checkAge3(i32 35)
  %22 = icmp ne i32 %21, 35
  br i1 %22, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %24 = load i32, i32* %err, align 4
  %25 = icmp eq i32 %24, 0
  %. = select i1 %25, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @1, i32 0, i32 0)
  %26 = call i32 (i8*, ...) @printf(i8* %.)
  %27 = load i32, i32* %err, align 4
  ret i32 %27
}
