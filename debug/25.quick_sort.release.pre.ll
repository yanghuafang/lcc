; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"25.quick_sort.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @swap(ptr %0, ptr %1) {
entry:
  %t = alloca i32, align 4
  %b = alloca ptr, align 8
  %a = alloca ptr, align 8
  store ptr %0, ptr %a, align 8
  store ptr %1, ptr %b, align 8
  %2 = load ptr, ptr %a, align 8
  %3 = load i32, ptr %2, align 4
  store i32 %3, ptr %t, align 4
  %4 = load ptr, ptr %a, align 8
  %5 = load ptr, ptr %b, align 8
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %b, align 8
  %9 = load i32, ptr %t, align 4
  store i32 %9, ptr %8, align 4
  %10 = load i32, ptr %8, align 4
  ret void
}

define i32 @partition(ptr %0, i32 %1, i32 %2) {
entry:
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pivot = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca ptr, align 8
  store ptr %0, ptr %arr, align 8
  store i32 %1, ptr %low, align 4
  store i32 %2, ptr %high, align 4
  %3 = load ptr, ptr %arr, align 8
  %4 = load i32, ptr %high, align 4
  %5 = getelementptr i32, ptr %3, i32 %4
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr %pivot, align 4
  %7 = load i32, ptr %low, align 4
  %8 = sub i32 %7, 1
  store i32 %8, ptr %i, align 4
  %9 = load i32, ptr %low, align 4
  store i32 %9, ptr %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %10 = load i32, ptr %j, align 4
  %11 = load i32, ptr %high, align 4
  %12 = sub i32 %11, 1
  %13 = icmp sle i32 %10, %12
  br i1 %13, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %14 = load ptr, ptr %arr, align 8
  %15 = load i32, ptr %j, align 4
  %16 = getelementptr i32, ptr %14, i32 %15
  %17 = load i32, ptr %16, align 4
  %18 = load i32, ptr %pivot, align 4
  %19 = icmp sle i32 %17, %18
  br i1 %19, label %then, label %else

then:                                             ; preds = %for.loop
  %20 = load i32, ptr %i, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %i, align 4
  %22 = load ptr, ptr %arr, align 8
  %23 = load i32, ptr %i, align 4
  %24 = getelementptr i32, ptr %22, i32 %23
  %25 = load ptr, ptr %arr, align 8
  %26 = load i32, ptr %j, align 4
  %27 = getelementptr i32, ptr %25, i32 %26
  call void @swap(ptr %24, ptr %27)
  br label %if.end

else:                                             ; preds = %for.loop
  br label %if.end

if.end:                                           ; preds = %else, %then
  br label %for.update

for.update:                                       ; preds = %if.end
  %28 = load i32, ptr %j, align 4
  %29 = add i32 %28, 1
  store i32 %29, ptr %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %30 = load ptr, ptr %arr, align 8
  %31 = load i32, ptr %i, align 4
  %32 = add i32 %31, 1
  %33 = getelementptr i32, ptr %30, i32 %32
  %34 = load ptr, ptr %arr, align 8
  %35 = load i32, ptr %high, align 4
  %36 = getelementptr i32, ptr %34, i32 %35
  call void @swap(ptr %33, ptr %36)
  %37 = load i32, ptr %i, align 4
  %38 = add i32 %37, 1
  ret i32 %38
}

define void @quickSort(ptr %0, i32 %1, i32 %2) {
entry:
  %pi = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %arr = alloca ptr, align 8
  store ptr %0, ptr %arr, align 8
  store i32 %1, ptr %low, align 4
  store i32 %2, ptr %high, align 4
  %3 = load i32, ptr %low, align 4
  %4 = load i32, ptr %high, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %then, label %else

then:                                             ; preds = %entry
  %6 = load ptr, ptr %arr, align 8
  %7 = load i32, ptr %low, align 4
  %8 = load i32, ptr %high, align 4
  %9 = call i32 @partition(ptr %6, i32 %7, i32 %8)
  store i32 %9, ptr %pi, align 4
  %10 = load ptr, ptr %arr, align 8
  %11 = load i32, ptr %low, align 4
  %12 = load i32, ptr %pi, align 4
  %13 = sub i32 %12, 1
  call void @quickSort(ptr %10, i32 %11, i32 %13)
  %14 = load ptr, ptr %arr, align 8
  %15 = load i32, ptr %pi, align 4
  %16 = add i32 %15, 1
  %17 = load i32, ptr %high, align 4
  call void @quickSort(ptr %14, i32 %16, i32 %17)
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  ret void
}

define i32 @main() {
entry:
  %single = alloca [1 x i32], align 4
  %n = alloca i32, align 4
  %arr = alloca [6 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr i32, ptr %arr, i32 0
  store i32 10, ptr %0, align 4
  %1 = load i32, ptr %0, align 4
  %2 = getelementptr i32, ptr %arr, i32 1
  store i32 7, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr i32, ptr %arr, i32 2
  store i32 8, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr i32, ptr %arr, i32 3
  store i32 9, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr i32, ptr %arr, i32 4
  store i32 1, ptr %8, align 4
  %9 = load i32, ptr %8, align 4
  %10 = getelementptr i32, ptr %arr, i32 5
  store i32 5, ptr %10, align 4
  %11 = load i32, ptr %10, align 4
  store i32 6, ptr %n, align 4
  %12 = load i32, ptr %n, align 4
  %13 = sub i32 %12, 1
  call void @quickSort(ptr %arr, i32 0, i32 %13)
  %14 = getelementptr i32, ptr %arr, i32 0
  %15 = load i32, ptr %14, align 4
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %18 = getelementptr i32, ptr %arr, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = icmp ne i32 %19, 5
  br i1 %20, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %21 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %22 = getelementptr i32, ptr %arr, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = icmp ne i32 %23, 7
  br i1 %24, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr i32, ptr %arr, i32 3
  %27 = load i32, ptr %26, align 4
  %28 = icmp ne i32 %27, 8
  br i1 %28, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %29 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %30 = getelementptr i32, ptr %arr, i32 4
  %31 = load i32, ptr %30, align 4
  %32 = icmp ne i32 %31, 9
  br i1 %32, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %33 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %34 = getelementptr i32, ptr %arr, i32 5
  %35 = load i32, ptr %34, align 4
  %36 = icmp ne i32 %35, 10
  br i1 %36, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %37 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %38 = getelementptr i32, ptr %single, i32 0
  store i32 42, ptr %38, align 4
  %39 = load i32, ptr %38, align 4
  call void @quickSort(ptr %single, i32 0, i32 0)
  %40 = getelementptr i32, ptr %single, i32 0
  %41 = load i32, ptr %40, align 4
  %42 = icmp ne i32 %41, 42
  br i1 %42, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %43 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %44 = load i32, ptr %err, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %then19, label %else20

then19:                                           ; preds = %if.end18
  %46 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end21

else20:                                           ; preds = %if.end18
  %47 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %48 = load i32, ptr %err, align 4
  ret i32 %48
}
