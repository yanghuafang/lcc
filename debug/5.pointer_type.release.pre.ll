; ModuleID = 'lcc'
source_filename = "lcc"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %pgi = alloca ptr, align 8
  %pgc = alloca ptr, align 8
  %pi = alloca ptr, align 8
  %pc = alloca ptr, align 8
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i8 65, ptr %c, align 1
  store i32 128, ptr %i, align 4
  store ptr %c, ptr %pc, align 8
  store ptr %i, ptr %pi, align 8
  %0 = load ptr, ptr %pc, align 8
  store i8 66, ptr %0, align 1
  %1 = load i8, ptr %0, align 1
  %2 = load ptr, ptr %pi, align 8
  store i32 256, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  store ptr @gc, ptr %pgc, align 8
  store ptr @gi, ptr %pgi, align 8
  %4 = load ptr, ptr %pgc, align 8
  store i8 98, ptr %4, align 1
  %5 = load i8, ptr %4, align 1
  %6 = load ptr, ptr %pgi, align 8
  store i32 2048, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = load i8, ptr %c, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 66
  br i1 %10, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %12 = load ptr, ptr %pc, align 8
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 66
  br i1 %15, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %16 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %17 = load i32, ptr %i, align 4
  %18 = icmp ne i32 %17, 256
  br i1 %18, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %20 = load ptr, ptr %pi, align 8
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 256
  br i1 %22, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %24 = load i8, ptr @gc, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp ne i32 %25, 98
  br i1 %26, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %27 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %28 = load i32, ptr @gi, align 4
  %29 = icmp ne i32 %28, 2048
  br i1 %29, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %30 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %31 = load ptr, ptr %pi, align 8
  store i32 0, ptr %31, align 4
  %32 = load i32, ptr %31, align 4
  %33 = load i32, ptr %i, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %36 = load i32, ptr %err, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %then19, label %else20

then19:                                           ; preds = %if.end18
  %38 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end21

else20:                                           ; preds = %if.end18
  %39 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %40 = load i32, ptr %err, align 4
  ret i32 %40
}
