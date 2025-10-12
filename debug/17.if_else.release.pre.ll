; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"17.if_else.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"17.if_else.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @accumulateFlags(i32 %0) {
entry:
  %flags = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %flags, align 4
  %1 = load i32, ptr %n, align 4
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  %3 = load i32, ptr %flags, align 4
  %4 = add i32 %3, 1
  store i32 %4, ptr %flags, align 4
  %5 = load i32, ptr %flags, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %6 = load i32, ptr %n, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %then1, label %else2

then1:                                            ; preds = %if.end
  %8 = load i32, ptr %flags, align 4
  %9 = add i32 %8, 2
  store i32 %9, ptr %flags, align 4
  %10 = load i32, ptr %flags, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  %11 = load i32, ptr %flags, align 4
  %12 = add i32 %11, 4
  store i32 %12, ptr %flags, align 4
  %13 = load i32, ptr %flags, align 4
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %14 = load i32, ptr %n, align 4
  %15 = icmp sgt i32 %14, 10
  br i1 %15, label %then4, label %else5

then4:                                            ; preds = %if.end3
  %16 = load i32, ptr %flags, align 4
  %17 = add i32 %16, 8
  store i32 %17, ptr %flags, align 4
  %18 = load i32, ptr %flags, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %19 = load i32, ptr %flags, align 4
  ret i32 %19
}

define i32 @signBucket(i32 %0) {
entry:
  %bucket = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %1 = load i32, ptr %n, align 4
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %bucket, align 4
  %3 = load i32, ptr %bucket, align 4
  br label %if.end3

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %else
  store i32 2, ptr %bucket, align 4
  %6 = load i32, ptr %bucket, align 4
  br label %if.end

else2:                                            ; preds = %else
  store i32 3, ptr %bucket, align 4
  %7 = load i32, ptr %bucket, align 4
  br label %if.end

if.end:                                           ; preds = %else2, %then1
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then
  %8 = load i32, ptr %bucket, align 4
  ret i32 %8
}

define i32 @decadeBucket(i32 %0) {
entry:
  %bucket = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %1 = load i32, ptr %n, align 4
  %2 = icmp sle i32 %1, 9
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 0, ptr %bucket, align 4
  %3 = load i32, ptr %bucket, align 4
  br label %if.end6

else:                                             ; preds = %entry
  %4 = load i32, ptr %n, align 4
  %5 = icmp sle i32 %4, 19
  br i1 %5, label %then1, label %else2

then1:                                            ; preds = %else
  store i32 1, ptr %bucket, align 4
  %6 = load i32, ptr %bucket, align 4
  br label %if.end5

else2:                                            ; preds = %else
  %7 = load i32, ptr %n, align 4
  %8 = icmp sle i32 %7, 29
  br i1 %8, label %then3, label %else4

then3:                                            ; preds = %else2
  store i32 2, ptr %bucket, align 4
  %9 = load i32, ptr %bucket, align 4
  br label %if.end

else4:                                            ; preds = %else2
  store i32 3, ptr %bucket, align 4
  %10 = load i32, ptr %bucket, align 4
  br label %if.end

if.end:                                           ; preds = %else4, %then3
  br label %if.end5

if.end5:                                          ; preds = %if.end, %then1
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %then
  %11 = load i32, ptr %bucket, align 4
  ret i32 %11
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @accumulateFlags(i32 -5)
  %1 = icmp ne i32 %0, 5
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @accumulateFlags(i32 0)
  %4 = icmp ne i32 %3, 2
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @accumulateFlags(i32 5)
  %7 = icmp ne i32 %6, 4
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @accumulateFlags(i32 15)
  %10 = icmp ne i32 %9, 12
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @signBucket(i32 -1)
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @signBucket(i32 0)
  %16 = icmp ne i32 %15, 2
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @signBucket(i32 7)
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @decadeBucket(i32 5)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @decadeBucket(i32 15)
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %27 = call i32 @decadeBucket(i32 25)
  %28 = icmp ne i32 %27, 2
  br i1 %28, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %29 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %30 = call i32 @decadeBucket(i32 35)
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %32 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %33 = load i32, ptr %err, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %then31, label %else32

then31:                                           ; preds = %if.end30
  %35 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end33

else32:                                           ; preds = %if.end30
  %36 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %37 = load i32, ptr %err, align 4
  ret i32 %37
}
