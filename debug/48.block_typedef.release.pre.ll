; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [25 x i8] c"48.block_typedef.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"48.block_typedef.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @outerSize() {
entry:
  ret i32 4
}

define i32 @main() {
entry:
  %w = alloca i64, align 8
  %pt = alloca %struct.Point, align 8
  %p = alloca ptr, align 8
  %v = alloca i32, align 4
  %narrow = alloca i8, align 1
  %outer = alloca i32, align 4
  %failed = alloca i32, align 4
  store i32 0, ptr %failed, align 4
  store i32 1000, ptr %outer, align 4
  %0 = load i32, ptr %outer, align 4
  %1 = icmp ne i32 %0, 1000
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4
  %2 = load i32, ptr %failed, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  br i1 false, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4
  %3 = load i32, ptr %failed, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i8 44, ptr %narrow, align 1
  %4 = load i8, ptr %narrow, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 44
  br i1 %6, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4
  %7 = load i32, ptr %failed, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4
  %8 = load i32, ptr %failed, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4
  %9 = load i32, ptr %failed, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %10 = call i32 @outerSize()
  %11 = icmp ne i32 %10, 4
  br i1 %11, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4
  %12 = load i32, ptr %failed, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  store i32 7, ptr %v, align 4
  store ptr %v, ptr %p, align 8
  %13 = load ptr, ptr %p, align 8
  %14 = load i32, ptr %13, align 4
  %15 = icmp ne i32 %14, 7
  br i1 %15, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4
  %16 = load i32, ptr %failed, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4
  %17 = load i32, ptr %failed, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %18 = getelementptr %struct.Point, ptr %pt, i32 0, i32 0
  store i32 3, ptr %18, align 4
  %19 = load i32, ptr %18, align 4
  %20 = getelementptr %struct.Point, ptr %pt, i32 0, i32 1
  store i32 4, ptr %20, align 4
  %21 = load i32, ptr %20, align 4
  %22 = getelementptr %struct.Point, ptr %pt, i32 0, i32 0
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr %struct.Point, ptr %pt, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = add i32 %23, %25
  %27 = icmp ne i32 %26, 7
  br i1 %27, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4
  %28 = load i32, ptr %failed, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  br i1 false, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4
  %29 = load i32, ptr %failed, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  store i64 5, ptr %w, align 8
  %30 = load i64, ptr %w, align 8
  %31 = icmp ne i64 %30, 5
  br i1 %31, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4
  %32 = load i32, ptr %failed, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  br i1 false, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4
  %33 = load i32, ptr %failed, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %34 = load i32, ptr %failed, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %then34, label %else35

then34:                                           ; preds = %if.end33
  %36 = call i32 (ptr, ...) @printf(ptr @0)
  ret i32 0

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35
  %37 = call i32 (ptr, ...) @printf(ptr @1)
  ret i32 1
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
