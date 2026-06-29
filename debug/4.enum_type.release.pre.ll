; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"4.enum_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"4.enum_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %v = alloca i32, align 4
  %sex = alloca i32, align 4
  %day = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 5, ptr %day, align 4
  store i32 1, ptr %sex, align 4
  store i32 0, ptr %v, align 4
  %0 = load i32, ptr %v, align 4
  %1 = load i32, ptr %v, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %3 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  store i32 1, ptr %v, align 4
  %4 = load i32, ptr %v, align 4
  %5 = load i32, ptr %v, align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i32 5, ptr %v, align 4
  %8 = load i32, ptr %v, align 4
  %9 = load i32, ptr %v, align 4
  %10 = icmp ne i32 %9, 5
  br i1 %10, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  store i32 6, ptr %v, align 4
  %12 = load i32, ptr %v, align 4
  %13 = load i32, ptr %v, align 4
  %14 = icmp ne i32 %13, 6
  br i1 %14, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %16 = load i32, ptr %day, align 4
  store i32 %16, ptr %v, align 4
  %17 = load i32, ptr %v, align 4
  %18 = load i32, ptr %v, align 4
  %19 = icmp ne i32 %18, 5
  br i1 %19, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %v, align 4
  %21 = load i32, ptr %v, align 4
  %22 = load i32, ptr %v, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %24 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  store i32 1, ptr %v, align 4
  %25 = load i32, ptr %v, align 4
  %26 = load i32, ptr %v, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %28 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %29 = load i32, ptr %sex, align 4
  store i32 %29, ptr %v, align 4
  %30 = load i32, ptr %v, align 4
  %31 = load i32, ptr %v, align 4
  %32 = icmp ne i32 %31, 1
  br i1 %32, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %33 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %34 = load i32, ptr %err, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %then22, label %else23

then22:                                           ; preds = %if.end21
  %36 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end24

else23:                                           ; preds = %if.end21
  %37 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %38 = load i32, ptr %err, align 4
  ret i32 %38
}
