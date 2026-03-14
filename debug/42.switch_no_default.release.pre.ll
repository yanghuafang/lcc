; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [29 x i8] c"42.switch_no_default.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [29 x i8] c"42.switch_no_default.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @grade(i32 %0) {
entry:
  %r = alloca i32, align 4
  %score = alloca i32, align 4
  store i32 %0, ptr %score, align 4
  store i32 0, ptr %r, align 4
  %1 = load i32, ptr %score, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2
  br i1 %3, label %case.1, label %switch.end

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4
  %4 = load i32, ptr %r, align 4
  br label %switch.end

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4
  %5 = load i32, ptr %r, align 4
  br label %switch.end

switch.end:                                       ; preds = %case.1, %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4
  ret i32 %6
}

define i32 @allReturn(i32 %0) {
entry:
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %case.0, label %case.1

case.0:                                           ; preds = %entry
  ret i32 100

case.1:                                           ; preds = %entry
  ret i32 200
}

define i32 @main() {
entry:
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = call i32 @grade(i32 1)
  %1 = icmp ne i32 %0, 10
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %2 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @grade(i32 2)
  %4 = icmp ne i32 %3, 20
  br i1 %4, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %5 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @grade(i32 7)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @allReturn(i32 1)
  %10 = icmp ne i32 %9, 100
  br i1 %10, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @allReturn(i32 3)
  %13 = icmp ne i32 %12, 200
  br i1 %13, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %then13, label %else14

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end15

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4
  ret i32 %19
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
