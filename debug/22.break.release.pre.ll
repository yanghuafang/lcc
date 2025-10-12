; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countNumber(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, ptr %maxRange, align 4
  store i32 %1, ptr %smallRange, align 4
  store i32 0, ptr %count, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %maxRange, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4
  %6 = load i32, ptr %smallRange, align 4
  %7 = icmp sgt i32 %5, %6
  br i1 %7, label %then, label %else

then:                                             ; preds = %for.loop
  br label %for.end

else:                                             ; preds = %for.loop
  br label %if.end

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %count, align 4
  %10 = load i32, ptr %count, align 4
  br label %for.update

for.update:                                       ; preds = %if.end
  %11 = load i32, ptr %i, align 4
  %12 = add i32 %11, 1
  store i32 %12, ptr %i, align 4
  %13 = load i32, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %then, %for.cond
  %14 = load i32, ptr %count, align 4
  ret i32 %14
}

define i32 @countNumber2(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, ptr %maxRange, align 4
  store i32 %1, ptr %smallRange, align 4
  store i32 0, ptr %count, align 4
  store i32 1, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %maxRange, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %5 = load i32, ptr %i, align 4
  %6 = load i32, ptr %smallRange, align 4
  %7 = icmp sgt i32 %5, %6
  br i1 %7, label %then, label %else

then:                                             ; preds = %while.loop
  br label %while.end

else:                                             ; preds = %while.loop
  br label %if.end

if.end:                                           ; preds = %else
  %8 = load i32, ptr %count, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %count, align 4
  %10 = load i32, ptr %count, align 4
  %11 = load i32, ptr %i, align 4
  %12 = add i32 %11, 1
  store i32 %12, ptr %i, align 4
  %13 = load i32, ptr %i, align 4
  br label %while.cond

while.end:                                        ; preds = %then, %while.cond
  %14 = load i32, ptr %count, align 4
  ret i32 %14
}

define i32 @countNumber3(i32 %0, i32 %1) {
entry:
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %smallRange = alloca i32, align 4
  %maxRange = alloca i32, align 4
  store i32 %0, ptr %maxRange, align 4
  store i32 %1, ptr %smallRange, align 4
  store i32 0, ptr %count, align 4
  store i32 1, ptr %i, align 4
  br label %do.loop

do.loop:                                          ; preds = %do.cond, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %smallRange, align 4
  %4 = icmp sgt i32 %2, %3
  br i1 %4, label %then, label %else

then:                                             ; preds = %do.loop
  br label %do.end

else:                                             ; preds = %do.loop
  br label %if.end

if.end:                                           ; preds = %else
  %5 = load i32, ptr %count, align 4
  %6 = add i32 %5, 1
  store i32 %6, ptr %count, align 4
  %7 = load i32, ptr %count, align 4
  %8 = load i32, ptr %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %i, align 4
  %10 = load i32, ptr %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4
  %12 = load i32, ptr %maxRange, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %do.loop, label %do.end

do.end:                                           ; preds = %do.cond, %then
  %14 = load i32, ptr %count, align 4
  ret i32 %14
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @countNumber(i32 100, i32 37)
  %1 = icmp ne i32 %0, 37
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countNumber2(i32 100, i32 37)
  %4 = icmp ne i32 %3, 37
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countNumber3(i32 100, i32 37)
  %7 = icmp ne i32 %6, 37
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countNumber(i32 10, i32 10)
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countNumber2(i32 10, i32 10)
  %13 = icmp ne i32 %12, 10
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @countNumber3(i32 10, i32 10)
  %16 = icmp ne i32 %15, 10
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @countNumber(i32 5, i32 0)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @countNumber2(i32 5, i32 0)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %24 = call i32 @countNumber3(i32 5, i32 0)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %27 = load i32, ptr %err, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %then25, label %else26

then25:                                           ; preds = %if.end24
  %29 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end27

else26:                                           ; preds = %if.end24
  %30 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr %err, align 4
  ret i32 %31
}
