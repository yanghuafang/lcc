; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %sum, align 4
  store i32 1, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, ptr %i, align 4
  %2 = load i32, ptr %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %sum, align 4
  %6 = add i32 %5, %4
  store i32 %6, ptr %sum, align 4
  %7 = load i32, ptr %sum, align 4
  %8 = load i32, ptr %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %i, align 4
  %10 = load i32, ptr %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %11 = load i32, ptr %sum, align 4
  ret i32 %11
}

define i32 @countSum2(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %sum, align 4
  store i32 0, ptr %i, align 4
  br label %do.loop

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4
  %2 = load i32, ptr %sum, align 4
  %3 = add i32 %2, %1
  store i32 %3, ptr %sum, align 4
  %4 = load i32, ptr %sum, align 4
  %5 = load i32, ptr %i, align 4
  %6 = add i32 %5, 1
  store i32 %6, ptr %i, align 4
  %7 = load i32, ptr %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.loop
  %8 = load i32, ptr %i, align 4
  %9 = load i32, ptr %n, align 4
  %10 = icmp sle i32 %8, %9
  br i1 %10, label %do.loop, label %do.end

do.end:                                           ; preds = %do.cond
  %11 = load i32, ptr %sum, align 4
  ret i32 %11
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @countSum(i32 100)
  %1 = icmp ne i32 %0, 5050
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100)
  %4 = icmp ne i32 %3, 5050
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum(i32 0)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum2(i32 0)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = load i32, ptr %err, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  %14 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end12

else11:                                           ; preds = %if.end9
  %15 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %16 = load i32, ptr %err, align 4
  ret i32 %16
}
