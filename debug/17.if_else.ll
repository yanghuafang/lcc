; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @accumulateFlags(i32 %0) {
entry:
  %flags = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %flags, align 4
  %1 = load i32, i32* %n, align 4
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  %3 = load i32, i32* %flags, align 4
  %4 = add i32 %3, 1
  store i32 %4, i32* %flags, align 4
  %5 = load i32, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %6 = load i32, i32* %n, align 4
  %7 = icmp eq i32 %6, 0
  %8 = load i32, i32* %flags, align 4
  br i1 %7, label %then1, label %else2

then1:                                            ; preds = %if.end
  %9 = add i32 %8, 2
  store i32 %9, i32* %flags, align 4
  %10 = load i32, i32* %flags, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  %11 = add i32 %8, 4
  store i32 %11, i32* %flags, align 4
  %12 = load i32, i32* %flags, align 4
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %13 = load i32, i32* %n, align 4
  %14 = icmp sgt i32 %13, 10
  br i1 %14, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  %15 = load i32, i32* %flags, align 4
  %16 = add i32 %15, 8
  store i32 %16, i32* %flags, align 4
  %17 = load i32, i32* %flags, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %18 = load i32, i32* %flags, align 4
  ret i32 %18
}

define i32 @signBucket(i32 %0) {
entry:
  %bucket = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  %1 = load i32, i32* %n, align 4
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, i32* %bucket, align 4
  %3 = load i32, i32* %bucket, align 4
  br label %if.end3

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %else
  store i32 2, i32* %bucket, align 4
  %6 = load i32, i32* %bucket, align 4
  br label %if.end3

else2:                                            ; preds = %else
  store i32 3, i32* %bucket, align 4
  %7 = load i32, i32* %bucket, align 4
  br label %if.end3

if.end3:                                          ; preds = %then1, %else2, %then
  %8 = load i32, i32* %bucket, align 4
  ret i32 %8
}

define i32 @decadeBucket(i32 %0) {
entry:
  %bucket = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, i32* %n, align 4
  %1 = load i32, i32* %n, align 4
  %2 = icmp sle i32 %1, 9
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 0, i32* %bucket, align 4
  %3 = load i32, i32* %bucket, align 4
  br label %if.end6

else:                                             ; preds = %entry
  %4 = load i32, i32* %n, align 4
  %5 = icmp sle i32 %4, 19
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %else
  store i32 1, i32* %bucket, align 4
  %6 = load i32, i32* %bucket, align 4
  br label %if.end6

else2:                                            ; preds = %else
  %7 = load i32, i32* %n, align 4
  %8 = icmp sle i32 %7, 29
  br i1 %8, label %then3, label %else4

then3:                                            ; preds = %else2
  store i32 2, i32* %bucket, align 4
  %9 = load i32, i32* %bucket, align 4
  br label %if.end6

else4:                                            ; preds = %else2
  store i32 3, i32* %bucket, align 4
  %10 = load i32, i32* %bucket, align 4
  br label %if.end6

if.end6:                                          ; preds = %then1, %else4, %then3, %then
  %11 = load i32, i32* %bucket, align 4
  ret i32 %11
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = call i32 @accumulateFlags(i32 -5)
  %1 = icmp ne i32 %0, 5
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @accumulateFlags(i32 0)
  %4 = icmp ne i32 %3, 2
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @accumulateFlags(i32 5)
  %7 = icmp ne i32 %6, 4
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @accumulateFlags(i32 15)
  %10 = icmp ne i32 %9, 12
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @signBucket(i32 -1)
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = call i32 @signBucket(i32 0)
  %16 = icmp ne i32 %15, 2
  br i1 %16, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %18 = call i32 @signBucket(i32 7)
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %21 = call i32 @decadeBucket(i32 5)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %24 = call i32 @decadeBucket(i32 15)
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %26 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %27 = call i32 @decadeBucket(i32 25)
  %28 = icmp ne i32 %27, 2
  br i1 %28, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %29 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %30 = call i32 @decadeBucket(i32 35)
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %32 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %33 = load i32, i32* %err, align 4
  %34 = icmp eq i32 %33, 0
  %. = select i1 %34, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0)
  %35 = call i32 (i8*, ...) @printf(i8* %.)
  %36 = load i32, i32* %err, align 4
  ret i32 %36
}
