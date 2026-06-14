; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@chosen = global ptr null
@0 = private unnamed_addr constant [24 x i8] c"49.func_pointer.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"49.func_pointer.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @addOne(i32 %0) {
entry:
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %2 = add i32 %1, 1
  ret i32 %2
}

define i32 @square(i32 %0) {
entry:
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %2 = load i32, ptr %x, align 4
  %3 = mul i32 %1, %2
  ret i32 %3
}

define i32 @addTwo(i32 %0, i32 %1) {
entry:
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %0, ptr %a, align 4
  store i32 %1, ptr %b, align 4
  %2 = load i32, ptr %a, align 4
  %3 = load i32, ptr %b, align 4
  %4 = add i32 %2, %3
  ret i32 %4
}

define i32 @apply(ptr %0, i32 %1) {
entry:
  %n = alloca i32, align 4
  %fn = alloca ptr, align 8
  store ptr %0, ptr %fn, align 8
  store i32 %1, ptr %n, align 4
  %2 = load ptr, ptr %fn, align 8
  %3 = load i32, ptr %n, align 4
  %4 = call i32 %2(i32 %3)
  ret i32 %4
}

define i32 @sumWith(ptr %0, i32 %1, i32 %2) {
entry:
  %i = alloca i32, align 4
  %total = alloca i32, align 4
  %to = alloca i32, align 4
  %from = alloca i32, align 4
  %fn = alloca ptr, align 8
  store ptr %0, ptr %fn, align 8
  store i32 %1, ptr %from, align 4
  store i32 %2, ptr %to, align 4
  store i32 0, ptr %total, align 4
  %3 = load i32, ptr %from, align 4
  store i32 %3, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.loop, %entry
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %to, align 4
  %6 = icmp sle i32 %4, %5
  br i1 %6, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %7 = load i32, ptr %total, align 4
  %8 = load ptr, ptr %fn, align 8
  %9 = load i32, ptr %i, align 4
  %10 = call i32 %8(i32 %9)
  %11 = add i32 %7, %10
  store i32 %11, ptr %total, align 4
  %12 = load i32, ptr %total, align 4
  %13 = load i32, ptr %i, align 4
  %14 = add i32 %13, 1
  store i32 %14, ptr %i, align 4
  %15 = load i32, ptr %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %total, align 4
  ret i32 %16
}

define i32 @main() {
entry:
  %r = alloca i32, align 4
  %q = alloca ptr, align 8
  %p = alloca ptr, align 8
  %failed = alloca i32, align 4
  store i32 0, ptr %failed, align 4
  store ptr @addOne, ptr %p, align 8
  %0 = load ptr, ptr %p, align 8
  %1 = load ptr, ptr %p, align 8
  %2 = call i32 %1(i32 10)
  %3 = icmp ne i32 %2, 11
  br i1 %3, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4
  %4 = load i32, ptr %failed, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  store ptr @square, ptr %p, align 8
  %5 = load ptr, ptr %p, align 8
  %6 = load ptr, ptr %p, align 8
  %7 = call i32 %6(i32 6)
  %8 = icmp ne i32 %7, 36
  br i1 %8, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %failed, align 4
  %9 = load i32, ptr %failed, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store ptr @addTwo, ptr %q, align 8
  %10 = load ptr, ptr %q, align 8
  %11 = load ptr, ptr %q, align 8
  %12 = call i32 %11(i32 3, i32 4)
  %13 = icmp ne i32 %12, 7
  br i1 %13, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4
  %14 = load i32, ptr %failed, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %15 = load ptr, ptr %p, align 8
  %16 = call i32 %15(i32 5)
  %17 = add i32 %16, 1
  store i32 %17, ptr %r, align 4
  %18 = load i32, ptr %r, align 4
  %19 = load i32, ptr %r, align 4
  %20 = icmp ne i32 %19, 26
  br i1 %20, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %failed, align 4
  %21 = load i32, ptr %failed, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %22 = call i32 @apply(ptr @addOne, i32 41)
  %23 = icmp ne i32 %22, 42
  br i1 %23, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4
  %24 = load i32, ptr %failed, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %25 = call i32 @apply(ptr @square, i32 7)
  %26 = icmp ne i32 %25, 49
  br i1 %26, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4
  %27 = load i32, ptr %failed, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %28 = call i32 @sumWith(ptr @square, i32 1, i32 4)
  %29 = icmp ne i32 %28, 30
  br i1 %29, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4
  %30 = load i32, ptr %failed, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  store ptr @addOne, ptr @chosen, align 8
  %31 = load ptr, ptr @chosen, align 8
  %32 = load ptr, ptr @chosen, align 8
  %33 = call i32 %32(i32 99)
  %34 = icmp ne i32 %33, 100
  br i1 %34, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4
  %35 = load i32, ptr %failed, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  store ptr @addOne, ptr %p, align 8
  %36 = load ptr, ptr %p, align 8
  %37 = load ptr, ptr %p, align 8
  %38 = call i32 %37(i32 7)
  %39 = icmp ne i32 %38, 8
  br i1 %39, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4
  %40 = load i32, ptr %failed, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %41 = load i32, ptr %failed, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %then25, label %else26

then25:                                           ; preds = %if.end24
  %43 = call i32 (ptr, ...) @printf(ptr @0)
  ret i32 0

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26
  %44 = call i32 (ptr, ...) @printf(ptr @1)
  ret i32 1
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
