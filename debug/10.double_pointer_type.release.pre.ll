; ModuleID = 'lcc'
source_filename = "lcc"

@g_data = global i32 0
@0 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"10.double_pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @getAddress(ptr %0) {
entry:
  %p = alloca ptr, align 8
  store ptr %0, ptr %p, align 8
  %1 = load ptr, ptr %p, align 8
  store ptr @g_data, ptr %1, align 8
  %2 = load ptr, ptr %1, align 8
  ret void
}

define i32 @main() {
entry:
  %p2 = alloca ptr, align 8
  %p = alloca ptr, align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store ptr @g_data, ptr %p, align 8
  %0 = load ptr, ptr %p, align 8
  store i32 1234, ptr %0, align 4
  %1 = load i32, ptr %0, align 4
  call void @getAddress(ptr %p2)
  %2 = load ptr, ptr %p2, align 8
  store i32 5678, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr @g_data, align 4
  %5 = icmp ne i32 %4, 5678
  br i1 %5, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %6 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %7 = load ptr, ptr %p2, align 8
  %8 = load i32, ptr %7, align 4
  %9 = icmp ne i32 %8, 5678
  br i1 %9, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %10 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %11 = load ptr, ptr %p, align 8
  %12 = load i32, ptr %11, align 4
  %13 = icmp ne i32 %12, 5678
  br i1 %13, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr @g_data, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %20 = load ptr, ptr %p2, align 8
  store i32 -42, ptr %20, align 4
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr @g_data, align 4
  %23 = icmp ne i32 %22, -42
  br i1 %23, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %24 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %err, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %then13, label %else14

then13:                                           ; preds = %if.end12
  %27 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end15

else14:                                           ; preds = %if.end12
  %28 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %err, align 4
  ret i32 %29
}
