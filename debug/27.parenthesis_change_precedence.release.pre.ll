; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"27.parenthesis_change_precedence.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %s = alloca i32, align 4
  %r = alloca i32, align 4
  %z = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 2, ptr %a, align 4
  store i32 4, ptr %b, align 4
  store i32 5, ptr %c, align 4
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %2 = load i32, ptr %c, align 4
  %3 = mul i32 %1, %2
  %4 = add i32 %0, %3
  %5 = icmp ne i32 %4, 22
  br i1 %5, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %6 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %b, align 4
  %9 = add i32 %7, %8
  %10 = load i32, ptr %c, align 4
  %11 = mul i32 %9, %10
  %12 = icmp ne i32 %11, 30
  br i1 %12, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %13 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %14 = load i32, ptr %c, align 4
  %15 = load i32, ptr %a, align 4
  %16 = load i32, ptr %b, align 4
  %17 = sub i32 %15, %16
  %18 = mul i32 %14, %17
  %19 = icmp ne i32 %18, -10
  br i1 %19, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %21 = load i32, ptr %a, align 4
  %22 = load i32, ptr %b, align 4
  %23 = load i32, ptr %c, align 4
  %24 = srem i32 %22, %23
  %25 = sub i32 %21, %24
  %26 = icmp ne i32 %25, -2
  br i1 %26, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %27 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %28 = load i32, ptr %a, align 4
  %29 = load i32, ptr %b, align 4
  %30 = add i32 %28, %29
  %31 = load i32, ptr %c, align 4
  %32 = sdiv i32 %30, %31
  %33 = icmp ne i32 %32, 1
  br i1 %33, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %34 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  store i32 1, ptr %x, align 4
  store i32 2, ptr %y, align 4
  store i32 3, ptr %z, align 4
  %35 = load i32, ptr %x, align 4
  %36 = load i32, ptr %y, align 4
  %37 = add i32 %35, %36
  %38 = load i32, ptr %z, align 4
  %39 = shl i32 %37, %38
  store i32 %39, ptr %r, align 4
  %40 = load i32, ptr %r, align 4
  %41 = icmp ne i32 %40, 24
  br i1 %41, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %42 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %43 = load i32, ptr %x, align 4
  %44 = load i32, ptr %y, align 4
  %45 = add i32 %43, %44
  %46 = load i32, ptr %z, align 4
  %47 = shl i32 %45, %46
  store i32 %47, ptr %s, align 4
  %48 = load i32, ptr %s, align 4
  %49 = icmp ne i32 %48, 24
  br i1 %49, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %50 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %51 = load i32, ptr %err, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %then19, label %else20

then19:                                           ; preds = %if.end18
  %53 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end21

else20:                                           ; preds = %if.end18
  %54 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %55 = load i32, ptr %err, align 4
  ret i32 %55
}
