; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %ternarySame = alloca i32, align 4
  %same = alloca i32, align 4
  %maxNeg = alloca i32, align 4
  %minNeg = alloca i32, align 4
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %maxVal = alloca i32, align 4
  %minVal = alloca i32, align 4
  %c = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 3, ptr %a, align 4
  store i32 7, ptr %c, align 4
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %c, align 4
  %2 = icmp slt i32 %0, %1
  br i1 %2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %a, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %c, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %5 = phi i32 [ %3, %cond.true ], [ %4, %cond.false ]
  store i32 %5, ptr %minVal, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %c, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %cond.true1, label %cond.false2

cond.true1:                                       ; preds = %cond.end
  %9 = load i32, ptr %c, align 4
  br label %cond.end3

cond.false2:                                      ; preds = %cond.end
  %10 = load i32, ptr %a, align 4
  br label %cond.end3

cond.end3:                                        ; preds = %cond.false2, %cond.true1
  %11 = phi i32 [ %9, %cond.true1 ], [ %10, %cond.false2 ]
  store i32 %11, ptr %maxVal, align 4
  %12 = load i32, ptr %minVal, align 4
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %then, label %else

then:                                             ; preds = %cond.end3
  store i32 1, ptr %err, align 4
  %14 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %cond.end3
  br label %if.end

if.end:                                           ; preds = %else, %then
  %15 = load i32, ptr %maxVal, align 4
  %16 = icmp ne i32 %15, 7
  br i1 %16, label %then4, label %else5

then4:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %17 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  store i32 -5, ptr %d, align 4
  store i32 2, ptr %e, align 4
  %18 = load i32, ptr %d, align 4
  %19 = load i32, ptr %e, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %cond.true7, label %cond.false8

cond.true7:                                       ; preds = %if.end6
  %21 = load i32, ptr %d, align 4
  br label %cond.end9

cond.false8:                                      ; preds = %if.end6
  %22 = load i32, ptr %e, align 4
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false8, %cond.true7
  %23 = phi i32 [ %21, %cond.true7 ], [ %22, %cond.false8 ]
  store i32 %23, ptr %minNeg, align 4
  %24 = load i32, ptr %d, align 4
  %25 = load i32, ptr %e, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %cond.end9
  %27 = load i32, ptr %e, align 4
  br label %cond.end12

cond.false11:                                     ; preds = %cond.end9
  %28 = load i32, ptr %d, align 4
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %29 = phi i32 [ %27, %cond.true10 ], [ %28, %cond.false11 ]
  store i32 %29, ptr %maxNeg, align 4
  %30 = load i32, ptr %minNeg, align 4
  %31 = icmp ne i32 %30, -5
  br i1 %31, label %then13, label %else14

then13:                                           ; preds = %cond.end12
  store i32 1, ptr %err, align 4
  %32 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %cond.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %33 = load i32, ptr %maxNeg, align 4
  %34 = icmp ne i32 %33, 2
  br i1 %34, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  store i32 42, ptr %same, align 4
  %36 = load i32, ptr %same, align 4
  %37 = load i32, ptr %same, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %if.end18
  br label %cond.end21

cond.false20:                                     ; preds = %if.end18
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %39 = phi i32 [ 0, %cond.true19 ], [ 1, %cond.false20 ]
  store i32 %39, ptr %ternarySame, align 4
  %40 = load i32, ptr %ternarySame, align 4
  %41 = icmp ne i32 %40, 1
  br i1 %41, label %then22, label %else23

then22:                                           ; preds = %cond.end21
  store i32 1, ptr %err, align 4
  %42 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %cond.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %43 = load i32, ptr %err, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %then25, label %else26

then25:                                           ; preds = %if.end24
  %45 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end27

else26:                                           ; preds = %if.end24
  %46 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %47 = load i32, ptr %err, align 4
  ret i32 %47
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
