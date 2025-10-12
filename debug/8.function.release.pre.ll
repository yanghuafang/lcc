; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"8.function.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"8.function.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @sum(i32 %0, i32 %1) {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, ptr %l, align 4
  store i32 %1, ptr %r, align 4
  %2 = load i32, ptr %l, align 4
  %3 = load i32, ptr %r, align 4
  %4 = add i32 %2, %3
  ret i32 %4
}

define i32 @sum2(ptr %0, ptr %1) {
entry:
  %r = alloca ptr, align 8
  %l = alloca ptr, align 8
  store ptr %0, ptr %l, align 8
  store ptr %1, ptr %r, align 8
  %2 = load ptr, ptr %l, align 8
  %3 = load i32, ptr %2, align 4
  %4 = load ptr, ptr %r, align 8
  %5 = load i32, ptr %4, align 4
  %6 = call i32 @sum(i32 %3, i32 %5)
  ret i32 %6
}

define void @sum3(i32 %0, i32 %1, ptr %2) {
entry:
  %result = alloca ptr, align 8
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %0, ptr %l, align 4
  store i32 %1, ptr %r, align 4
  store ptr %2, ptr %result, align 8
  %3 = load ptr, ptr %result, align 8
  %4 = load i32, ptr %l, align 4
  %5 = load i32, ptr %r, align 4
  %6 = add i32 %4, %5
  store i32 %6, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  ret void
}

define i32 @main() {
entry:
  %r = alloca i32, align 4
  %l = alloca i32, align 4
  %i = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 3, ptr %l, align 4
  store i32 4, ptr %r, align 4
  %0 = call i32 @sum(i32 1, i32 2)
  %1 = icmp ne i32 %0, 3
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @sum(i32 3, i32 4)
  %4 = icmp ne i32 %3, 7
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = load i32, ptr %l, align 4
  %7 = load i32, ptr %r, align 4
  %8 = call i32 @sum(i32 %6, i32 %7)
  %9 = icmp ne i32 %8, 7
  br i1 %9, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %10 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %11 = call i32 @sum2(ptr %l, ptr %r)
  %12 = icmp ne i32 %11, 7
  br i1 %12, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %13 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  call void @sum3(i32 3, i32 4, ptr %i)
  %14 = load i32, ptr %i, align 4
  %15 = icmp ne i32 %14, 7
  br i1 %15, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %16 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %17 = load i32, ptr %l, align 4
  %18 = load i32, ptr %r, align 4
  call void @sum3(i32 %17, i32 %18, ptr %i)
  %19 = load i32, ptr %i, align 4
  %20 = icmp ne i32 %19, 7
  br i1 %20, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %21 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %22 = call i32 @sum(i32 1000000, i32 2000000)
  %23 = icmp ne i32 %22, 3000000
  br i1 %23, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %24 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %25 = load i32, ptr %err, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %then19, label %else20

then19:                                           ; preds = %if.end18
  %27 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end21

else20:                                           ; preds = %if.end18
  %28 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %29 = load i32, ptr %err, align 4
  ret i32 %29
}
