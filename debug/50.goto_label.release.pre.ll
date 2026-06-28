; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"50.goto_label.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"50.goto_label.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countTo(i32 %0) {
entry:
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %i, align 4
  br label %label.top

label.top:                                        ; preds = %then, %entry
  %1 = load i32, ptr %i, align 4
  %2 = add i32 %1, 1
  store i32 %2, ptr %i, align 4
  %3 = load i32, ptr %i, align 4
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %n, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %then, label %else

then:                                             ; preds = %label.top
  br label %label.top

goto.cont:                                        ; No predecessors!
  br label %if.end

else:                                             ; preds = %label.top
  br label %if.end

if.end:                                           ; preds = %else, %goto.cont
  %7 = load i32, ptr %i, align 4
  ret i32 %7
}

define i32 @skip(i32 %0) {
entry:
  %r = alloca i32, align 4
  %flag = alloca i32, align 4
  store i32 %0, ptr %flag, align 4
  store i32 1, ptr %r, align 4
  %1 = load i32, ptr %flag, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  br label %label.done

goto.cont:                                        ; No predecessors!
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %goto.cont
  store i32 2, ptr %r, align 4
  %3 = load i32, ptr %r, align 4
  br label %label.done

label.done:                                       ; preds = %if.end, %then
  %4 = load i32, ptr %r, align 4
  ret i32 %4
}

define i32 @firstPair(i32 %0, i32 %1) {
entry:
  %found = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %target = alloca i32, align 4
  %limit = alloca i32, align 4
  store i32 %0, ptr %limit, align 4
  store i32 %1, ptr %target, align 4
  store i32 0, ptr %i, align 4
  store i32 -1, ptr %found, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %limit, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %while.loop, label %while.end3

while.loop:                                       ; preds = %while.cond
  store i32 0, ptr %j, align 4
  %5 = load i32, ptr %j, align 4
  br label %while.cond1

while.cond1:                                      ; preds = %if.end, %while.loop
  %6 = load i32, ptr %j, align 4
  %7 = load i32, ptr %limit, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %while.loop2, label %while.end

while.loop2:                                      ; preds = %while.cond1
  %9 = load i32, ptr %i, align 4
  %10 = mul i32 %9, 10
  %11 = load i32, ptr %j, align 4
  %12 = add i32 %10, %11
  %13 = load i32, ptr %target, align 4
  %14 = icmp eq i32 %12, %13
  br i1 %14, label %then, label %else

then:                                             ; preds = %while.loop2
  %15 = load i32, ptr %i, align 4
  %16 = mul i32 %15, 10
  %17 = load i32, ptr %j, align 4
  %18 = add i32 %16, %17
  store i32 %18, ptr %found, align 4
  %19 = load i32, ptr %found, align 4
  br label %label.out

goto.cont:                                        ; No predecessors!
  br label %if.end

else:                                             ; preds = %while.loop2
  br label %if.end

if.end:                                           ; preds = %else, %goto.cont
  %20 = load i32, ptr %j, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %j, align 4
  %22 = load i32, ptr %j, align 4
  br label %while.cond1

while.end:                                        ; preds = %while.cond1
  %23 = load i32, ptr %i, align 4
  %24 = add i32 %23, 1
  store i32 %24, ptr %i, align 4
  %25 = load i32, ptr %i, align 4
  br label %while.cond

while.end3:                                       ; preds = %while.cond
  br label %label.out

label.out:                                        ; preds = %while.end3, %then
  %26 = load i32, ptr %found, align 4
  ret i32 %26
}

define i32 @afterReturn(i32 %0) {
entry:
  %flag = alloca i32, align 4
  store i32 %0, ptr %flag, align 4
  %1 = load i32, ptr %flag, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  br label %label.tail

goto.cont:                                        ; No predecessors!
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %goto.cont
  ret i32 1

label.pred:                                       ; No predecessors!
  br label %label.tail

label.tail:                                       ; preds = %label.pred, %then
  ret i32 2
}

define i32 @fromSwitch(i32 %0) {
entry:
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %case.0, label %switch.compare.0

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2
  br i1 %3, label %case.1, label %case.2

case.0:                                           ; preds = %entry
  br label %label.one

goto.cont:                                        ; No predecessors!
  br label %case.1

case.1:                                           ; preds = %goto.cont, %switch.compare.0
  ret i32 20

case.2:                                           ; preds = %switch.compare.0
  br label %switch.end

switch.end:                                       ; preds = %case.2
  ret i32 0

label.pred:                                       ; No predecessors!
  br label %label.one

label.one:                                        ; preds = %label.pred, %case.0
  ret i32 10
}

define i32 @main() {
entry:
  %failed = alloca i32, align 4
  store i32 0, ptr %failed, align 4
  %0 = call i32 @countTo(i32 5)
  %1 = icmp ne i32 %0, 5
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4
  %2 = load i32, ptr %failed, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %3 = call i32 @skip(i32 1)
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %5 = call i32 @skip(i32 0)
  %6 = icmp ne i32 %5, 2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %7 = phi i1 [ true, %if.end ], [ %6, %lor.rhs ]
  br i1 %7, label %then1, label %else2

then1:                                            ; preds = %lor.end
  store i32 1, ptr %failed, align 4
  %8 = load i32, ptr %failed, align 4
  br label %if.end3

else2:                                            ; preds = %lor.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %9 = call i32 @firstPair(i32 5, i32 23)
  %10 = icmp ne i32 %9, 23
  br i1 %10, label %lor.end5, label %lor.rhs4

lor.rhs4:                                         ; preds = %if.end3
  %11 = call i32 @firstPair(i32 3, i32 99)
  %12 = icmp ne i32 %11, -1
  br label %lor.end5

lor.end5:                                         ; preds = %lor.rhs4, %if.end3
  %13 = phi i1 [ true, %if.end3 ], [ %12, %lor.rhs4 ]
  br i1 %13, label %then6, label %else7

then6:                                            ; preds = %lor.end5
  store i32 1, ptr %failed, align 4
  %14 = load i32, ptr %failed, align 4
  br label %if.end8

else7:                                            ; preds = %lor.end5
  br label %if.end8

if.end8:                                          ; preds = %else7, %then6
  %15 = call i32 @afterReturn(i32 1)
  %16 = icmp ne i32 %15, 2
  br i1 %16, label %lor.end10, label %lor.rhs9

lor.rhs9:                                         ; preds = %if.end8
  %17 = call i32 @afterReturn(i32 0)
  %18 = icmp ne i32 %17, 1
  br label %lor.end10

lor.end10:                                        ; preds = %lor.rhs9, %if.end8
  %19 = phi i1 [ true, %if.end8 ], [ %18, %lor.rhs9 ]
  br i1 %19, label %then11, label %else12

then11:                                           ; preds = %lor.end10
  store i32 1, ptr %failed, align 4
  %20 = load i32, ptr %failed, align 4
  br label %if.end13

else12:                                           ; preds = %lor.end10
  br label %if.end13

if.end13:                                         ; preds = %else12, %then11
  %21 = call i32 @fromSwitch(i32 1)
  %22 = icmp ne i32 %21, 10
  br i1 %22, label %lor.end15, label %lor.rhs14

lor.rhs14:                                        ; preds = %if.end13
  %23 = call i32 @fromSwitch(i32 2)
  %24 = icmp ne i32 %23, 20
  br label %lor.end15

lor.end15:                                        ; preds = %lor.rhs14, %if.end13
  %25 = phi i1 [ true, %if.end13 ], [ %24, %lor.rhs14 ]
  br i1 %25, label %lor.end17, label %lor.rhs16

lor.rhs16:                                        ; preds = %lor.end15
  %26 = call i32 @fromSwitch(i32 9)
  %27 = icmp ne i32 %26, 0
  br label %lor.end17

lor.end17:                                        ; preds = %lor.rhs16, %lor.end15
  %28 = phi i1 [ true, %lor.end15 ], [ %27, %lor.rhs16 ]
  br i1 %28, label %then18, label %else19

then18:                                           ; preds = %lor.end17
  store i32 1, ptr %failed, align 4
  %29 = load i32, ptr %failed, align 4
  br label %if.end20

else19:                                           ; preds = %lor.end17
  br label %if.end20

if.end20:                                         ; preds = %else19, %then18
  %30 = load i32, ptr %failed, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %then21, label %else22

then21:                                           ; preds = %if.end20
  %32 = call i32 (ptr, ...) @printf(ptr @0)
  ret i32 0

else22:                                           ; preds = %if.end20
  br label %if.end23

if.end23:                                         ; preds = %else22
  %33 = call i32 (ptr, ...) @printf(ptr @1)
  ret i32 1
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
