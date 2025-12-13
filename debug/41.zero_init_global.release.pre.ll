; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Point = type { i32, i32 }

@g_scalar = global i32 0
@g_arr = global [4 x i32] zeroinitializer
@g_matrix = global [2 x [3 x i32]] zeroinitializer
@g_ptr = global ptr null
@g_point = global %struct.Point zeroinitializer
@0 = private unnamed_addr constant [28 x i8] c"41.zero_init_global.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"41.zero_init_global.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = load i32, ptr @g_scalar, align 4
  %1 = icmp ne i32 %0, 0
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = load i32, ptr @g_arr, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 1), align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 2), align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = load i32, ptr getelementptr (i32, ptr @g_arr, i32 3), align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr @g_matrix, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %18 = load i32, ptr getelementptr (i32, ptr @g_matrix, i32 2), align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %21 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @g_matrix, i32 1), i32 1), align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @g_matrix, i32 1), i32 2), align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %27 = load ptr, ptr @g_ptr, align 8
  %28 = ptrtoint ptr %27 to i64
  %29 = icmp ne i64 %28, 0
  br i1 %29, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %30 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %31 = load i32, ptr @g_point, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %33 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %34 = load i32, ptr getelementptr (%struct.Point, ptr @g_point, i32 0, i32 1), align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %36 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %37 = load i32, ptr %err, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %then34, label %else35

then34:                                           ; preds = %if.end33
  %39 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end36

else35:                                           ; preds = %if.end33
  %40 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %41 = load i32, ptr %err, align 4
  ret i32 %41
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
