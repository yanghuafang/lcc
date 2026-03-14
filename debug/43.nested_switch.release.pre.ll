; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [25 x i8] c"43.nested_switch.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"43.nested_switch.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @nested(i32 %0, i32 %1) {
entry:
  %r = alloca i32, align 4
  %inner = alloca i32, align 4
  %outer = alloca i32, align 4
  store i32 %0, ptr %outer, align 4
  store i32 %1, ptr %inner, align 4
  store i32 0, ptr %r, align 4
  %2 = load i32, ptr %outer, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  %4 = icmp eq i32 %2, 2
  br i1 %4, label %case.13, label %case.24

case.0:                                           ; preds = %entry
  %5 = load i32, ptr %inner, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %case.02, label %switch.compare.01

switch.compare.01:                                ; preds = %case.0
  %7 = icmp eq i32 %5, 2
  br i1 %7, label %case.1, label %case.2

case.02:                                          ; preds = %case.0
  %8 = load i32, ptr %r, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %r, align 4
  %10 = load i32, ptr %r, align 4
  br label %switch.end

case.1:                                           ; preds = %switch.compare.01
  %11 = load i32, ptr %r, align 4
  %12 = add i32 %11, 2
  store i32 %12, ptr %r, align 4
  %13 = load i32, ptr %r, align 4
  br label %switch.end

case.2:                                           ; preds = %switch.compare.01
  %14 = load i32, ptr %r, align 4
  %15 = add i32 %14, 4
  store i32 %15, ptr %r, align 4
  %16 = load i32, ptr %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.2, %case.1, %case.02
  %17 = load i32, ptr %r, align 4
  %18 = add i32 %17, 10
  store i32 %18, ptr %r, align 4
  %19 = load i32, ptr %r, align 4
  br label %case.13

case.13:                                          ; preds = %switch.end, %switch.compare.0
  %20 = load i32, ptr %r, align 4
  %21 = add i32 %20, 100
  store i32 %21, ptr %r, align 4
  %22 = load i32, ptr %r, align 4
  br label %switch.end5

case.24:                                          ; preds = %switch.compare.0
  %23 = load i32, ptr %r, align 4
  %24 = add i32 %23, 1000
  store i32 %24, ptr %r, align 4
  %25 = load i32, ptr %r, align 4
  br label %switch.end5

switch.end5:                                      ; preds = %case.24, %case.13
  %26 = load i32, ptr %r, align 4
  ret i32 %26
}

define i32 @threeDeep(i32 %0) {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  store i32 0, ptr %r, align 4
  %1 = load i32, ptr %x, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %case.0, label %case.14

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %x, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %case.01, label %switch.compare.0

switch.compare.0:                                 ; preds = %case.0
  %5 = icmp eq i32 %3, 2
  br i1 %5, label %case.1, label %switch.end3

case.01:                                          ; preds = %case.0
  %6 = load i32, ptr %x, align 4
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %case.02, label %switch.end

case.02:                                          ; preds = %case.01
  %8 = load i32, ptr %r, align 4
  %9 = add i32 %8, 1
  store i32 %9, ptr %r, align 4
  %10 = load i32, ptr %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.02, %case.01
  %11 = load i32, ptr %r, align 4
  %12 = add i32 %11, 2
  store i32 %12, ptr %r, align 4
  %13 = load i32, ptr %r, align 4
  br label %case.1

case.1:                                           ; preds = %switch.end, %switch.compare.0
  %14 = load i32, ptr %r, align 4
  %15 = add i32 %14, 4
  store i32 %15, ptr %r, align 4
  %16 = load i32, ptr %r, align 4
  br label %switch.end3

switch.end3:                                      ; preds = %case.1, %switch.compare.0
  %17 = load i32, ptr %r, align 4
  %18 = add i32 %17, 8
  store i32 %18, ptr %r, align 4
  %19 = load i32, ptr %r, align 4
  br label %switch.end5

case.14:                                          ; preds = %entry
  %20 = load i32, ptr %r, align 4
  %21 = add i32 %20, 16
  store i32 %21, ptr %r, align 4
  %22 = load i32, ptr %r, align 4
  br label %switch.end5

switch.end5:                                      ; preds = %case.14, %switch.end3
  %23 = load i32, ptr %r, align 4
  ret i32 %23
}

define i32 @loopWithNestedSwitch() {
entry:
  %i = alloca i32, align 4
  %total = alloca i32, align 4
  store i32 0, ptr %total, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4
  %1 = icmp slt i32 %0, 5
  br i1 %1, label %for.loop, label %for.end

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3
  br i1 %4, label %case.1, label %case.2

case.0:                                           ; preds = %for.loop
  %5 = load i32, ptr %i, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %case.01, label %switch.end

case.01:                                          ; preds = %case.0
  br label %switch.end

switch.end:                                       ; preds = %case.01, %case.0
  %7 = load i32, ptr %total, align 4
  %8 = add i32 %7, 1
  store i32 %8, ptr %total, align 4
  %9 = load i32, ptr %total, align 4
  br label %switch.end2

case.1:                                           ; preds = %switch.compare.0
  br label %for.update

case.2:                                           ; preds = %switch.compare.0
  %10 = load i32, ptr %total, align 4
  %11 = add i32 %10, 10
  store i32 %11, ptr %total, align 4
  %12 = load i32, ptr %total, align 4
  br label %switch.end2

switch.end2:                                      ; preds = %case.2, %switch.end
  %13 = load i32, ptr %total, align 4
  %14 = add i32 %13, 100
  store i32 %14, ptr %total, align 4
  %15 = load i32, ptr %total, align 4
  br label %for.update

for.update:                                       ; preds = %switch.end2, %case.1
  %16 = load i32, ptr %i, align 4
  %17 = add i32 %16, 1
  store i32 %17, ptr %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i32, ptr %total, align 4
  ret i32 %18
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @nested(i32 1, i32 1)
  %1 = icmp ne i32 %0, 111
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @nested(i32 1, i32 2)
  %4 = icmp ne i32 %3, 112
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @nested(i32 1, i32 5)
  %7 = icmp ne i32 %6, 114
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @nested(i32 2, i32 1)
  %10 = icmp ne i32 %9, 100
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @nested(i32 3, i32 1)
  %13 = icmp ne i32 %12, 1000
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = call i32 @threeDeep(i32 1)
  %16 = icmp ne i32 %15, 15
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %18 = call i32 @threeDeep(i32 9)
  %19 = icmp ne i32 %18, 16
  br i1 %19, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %21 = call i32 @loopWithNestedSwitch()
  %22 = icmp ne i32 %21, 431
  br i1 %22, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %24 = load i32, ptr %err, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %then22, label %else23

then22:                                           ; preds = %if.end21
  %26 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end24

else23:                                           ; preds = %if.end21
  %27 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %28 = load i32, ptr %err, align 4
  ret i32 %28
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
