; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %sum, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4
  %2 = load i32, ptr %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %sum, align 4
  %6 = add i32 %5, %4
  store i32 %6, ptr %sum, align 4
  %7 = load i32, ptr %sum, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %i, align 4
  %10 = load i32, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
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
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4
  %2 = load i32, ptr %n, align 4
  %3 = icmp sle i32 %1, %2
  br i1 %3, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %sum, align 4
  %6 = add i32 %5, %4
  store i32 %6, ptr %sum, align 4
  %7 = load i32, ptr %sum, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %i, align 4
  %10 = load i32, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4
  ret i32 %11
}

define i32 @countSum3(i32 %0) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %sum, align 4
  store i32 1, ptr %i, align 4
  %1 = load i32, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %n, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4
  %6 = load i32, ptr %sum, align 4
  %7 = add i32 %6, %5
  store i32 %7, ptr %sum, align 4
  %8 = load i32, ptr %sum, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop
  %9 = load i32, ptr %i, align 4
  %10 = add i32 %9, 1
  store i32 %10, ptr %i, align 4
  %11 = load i32, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %sum, align 4
  ret i32 %12
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
  %6 = call i32 @countSum3(i32 100)
  %7 = icmp ne i32 %6, 5050
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum(i32 0)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countSum(i32 1)
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end15

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4
  ret i32 %19
}
