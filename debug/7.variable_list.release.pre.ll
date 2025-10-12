; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"7.variable_list.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"7.variable_list.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %h = alloca i32, align 4
  %g = alloca i32, align 4
  %f = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 1, ptr %b, align 4
  store i32 2, ptr %c, align 4
  store i32 3, ptr %d, align 4
  store i32 0, ptr %a, align 4
  %0 = load i32, ptr %a, align 4
  store i32 4, ptr %e, align 4
  %1 = load i32, ptr %e, align 4
  store i32 5, ptr %f, align 4
  %2 = load i32, ptr %f, align 4
  store i32 6, ptr %g, align 4
  %3 = load i32, ptr %g, align 4
  store i32 7, ptr %h, align 4
  %4 = load i32, ptr %h, align 4
  %5 = load i32, ptr %a, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %8 = load i32, ptr %b, align 4
  %9 = icmp ne i32 %8, 1
  br i1 %9, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %10 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %11 = load i32, ptr %c, align 4
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %13 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %14 = load i32, ptr %d, align 4
  %15 = icmp ne i32 %14, 3
  br i1 %15, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %16 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %17 = load i32, ptr %e, align 4
  %18 = icmp ne i32 %17, 4
  br i1 %18, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %20 = load i32, ptr %f, align 4
  %21 = icmp ne i32 %20, 5
  br i1 %21, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %22 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %23 = load i32, ptr %g, align 4
  %24 = icmp ne i32 %23, 6
  br i1 %24, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %26 = load i32, ptr %h, align 4
  %27 = icmp ne i32 %26, 7
  br i1 %27, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %28 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %29 = load i32, ptr %err, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %then22, label %else23

then22:                                           ; preds = %if.end21
  %31 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end24

else23:                                           ; preds = %if.end21
  %32 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %33 = load i32, ptr %err, align 4
  ret i32 %33
}
