; ModuleID = 'lcc'
source_filename = "lcc"

%union.IPv4 = type { i32 }

@0 = private unnamed_addr constant [21 x i8] c"3.union_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"3.union_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %byte = alloca i8, align 1
  %ip = alloca i32, align 4
  %ipv4 = alloca %union.IPv4, align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 313249076, ptr %ipv4, align 4
  %0 = load i32, ptr %ipv4, align 4
  %1 = load i32, ptr %ipv4, align 4
  store i32 %1, ptr %ip, align 4
  %2 = load i32, ptr %ip, align 4
  %3 = load i8, ptr %ipv4, align 1
  store i8 %3, ptr %byte, align 1
  %4 = load i8, ptr %byte, align 1
  %5 = load i32, ptr %ip, align 4
  %6 = icmp ne i32 %5, 313249076
  br i1 %6, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %8 = load i8, ptr %byte, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp ne i32 %9, 52
  br i1 %10, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i8 86, ptr %ipv4, align 1
  %12 = load i8, ptr %ipv4, align 1
  %13 = load i32, ptr %ipv4, align 4
  store i32 %13, ptr %ip, align 4
  %14 = load i32, ptr %ip, align 4
  %15 = load i8, ptr %ipv4, align 1
  store i8 %15, ptr %byte, align 1
  %16 = load i8, ptr %byte, align 1
  %17 = load i32, ptr %ip, align 4
  %18 = icmp ne i32 %17, 313249110
  br i1 %18, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %20 = load i8, ptr %byte, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp ne i32 %21, 86
  br i1 %22, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  store i32 -1, ptr %ipv4, align 4
  %24 = load i32, ptr %ipv4, align 4
  %25 = load i32, ptr %ipv4, align 4
  store i32 %25, ptr %ip, align 4
  %26 = load i32, ptr %ip, align 4
  %27 = load i32, ptr %ip, align 4
  %28 = icmp ne i32 %27, -1
  br i1 %28, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %29 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  store i8 0, ptr %ipv4, align 1
  %30 = load i8, ptr %ipv4, align 1
  %31 = load i32, ptr %ipv4, align 4
  store i32 %31, ptr %ip, align 4
  %32 = load i32, ptr %ip, align 4
  %33 = load i32, ptr %ip, align 4
  %34 = icmp ne i32 %33, -256
  br i1 %34, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %36 = load i32, ptr %err, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %then16, label %else17

then16:                                           ; preds = %if.end15
  %38 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end18

else17:                                           ; preds = %if.end15
  %39 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %40 = load i32, ptr %err, align 4
  ret i32 %40
}
