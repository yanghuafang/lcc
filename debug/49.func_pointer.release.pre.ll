; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

%union.Slot = type { ptr }
%struct.Rec = type { i32, ptr }

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

define i32 @applyAlias(ptr %0, i32 %1) {
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

define ptr @pickOp(i32 %0) {
entry:
  %which = alloca i32, align 4
  store i32 %0, ptr %which, align 4
  %1 = load i32, ptr %which, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  ret ptr @addOne

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else
  ret ptr @square
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
  %total = alloca i32, align 4
  %i = alloca i32, align 4
  %fromMember = alloca ptr, align 8
  %table = alloca [3 x ptr], align 8
  %slot = alloca %union.Slot, align 8
  %rec = alloca %struct.Rec, align 8
  %chain = alloca ptr, align 8
  %twoArgs = alloca ptr, align 8
  %viaAlias = alloca ptr, align 8
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
  store ptr @addOne, ptr %viaAlias, align 8
  %41 = load ptr, ptr %viaAlias, align 8
  %42 = load ptr, ptr %viaAlias, align 8
  %43 = call i32 %42(i32 10)
  %44 = icmp ne i32 %43, 11
  br i1 %44, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4
  %45 = load i32, ptr %failed, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  store ptr @square, ptr %viaAlias, align 8
  %46 = load ptr, ptr %viaAlias, align 8
  %47 = load ptr, ptr %viaAlias, align 8
  %48 = call i32 %47(i32 6)
  %49 = icmp ne i32 %48, 36
  br i1 %49, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4
  %50 = load i32, ptr %failed, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  store ptr @addTwo, ptr %twoArgs, align 8
  %51 = load ptr, ptr %twoArgs, align 8
  %52 = load ptr, ptr %twoArgs, align 8
  %53 = call i32 %52(i32 3, i32 4)
  %54 = icmp ne i32 %53, 7
  br i1 %54, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4
  %55 = load i32, ptr %failed, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  store ptr @square, ptr %chain, align 8
  %56 = load ptr, ptr %chain, align 8
  %57 = load ptr, ptr %chain, align 8
  %58 = call i32 %57(i32 9)
  %59 = icmp ne i32 %58, 81
  br i1 %59, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %failed, align 4
  %60 = load i32, ptr %failed, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %61 = call i32 @applyAlias(ptr @addOne, i32 41)
  %62 = icmp ne i32 %61, 42
  br i1 %62, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %failed, align 4
  %63 = load i32, ptr %failed, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %failed, align 4
  %64 = load i32, ptr %failed, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %65 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0
  store i32 5, ptr %65, align 4
  %66 = load i32, ptr %65, align 4
  %67 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1
  store ptr @square, ptr %67, align 8
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  store ptr %70, ptr %fromMember, align 8
  %71 = load ptr, ptr %fromMember, align 8
  %72 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0
  %73 = load i32, ptr %72, align 4
  %74 = icmp ne i32 %73, 5
  br i1 %74, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end42
  %75 = load ptr, ptr %fromMember, align 8
  %76 = call i32 %75(i32 7)
  %77 = icmp ne i32 %76, 49
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end42
  %78 = phi i1 [ true, %if.end42 ], [ %77, %lor.rhs ]
  br i1 %78, label %then43, label %else44

then43:                                           ; preds = %lor.end
  store i32 1, ptr %failed, align 4
  %79 = load i32, ptr %failed, align 4
  br label %if.end45

else44:                                           ; preds = %lor.end
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %80 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1
  store ptr @addOne, ptr %80, align 8
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 1
  %83 = load ptr, ptr %82, align 8
  store ptr %83, ptr %fromMember, align 8
  %84 = load ptr, ptr %fromMember, align 8
  %85 = getelementptr %struct.Rec, ptr %rec, i32 0, i32 0
  %86 = load i32, ptr %85, align 4
  %87 = icmp ne i32 %86, 5
  br i1 %87, label %lor.end47, label %lor.rhs46

lor.rhs46:                                        ; preds = %if.end45
  %88 = load ptr, ptr %fromMember, align 8
  %89 = call i32 %88(i32 7)
  %90 = icmp ne i32 %89, 8
  br label %lor.end47

lor.end47:                                        ; preds = %lor.rhs46, %if.end45
  %91 = phi i1 [ true, %if.end45 ], [ %90, %lor.rhs46 ]
  br i1 %91, label %then48, label %else49

then48:                                           ; preds = %lor.end47
  store i32 1, ptr %failed, align 4
  %92 = load i32, ptr %failed, align 4
  br label %if.end50

else49:                                           ; preds = %lor.end47
  br label %if.end50

if.end50:                                         ; preds = %else49, %then48
  store ptr @addOne, ptr %slot, align 8
  %93 = load ptr, ptr %slot, align 8
  %94 = load ptr, ptr %slot, align 8
  store ptr %94, ptr %fromMember, align 8
  %95 = load ptr, ptr %fromMember, align 8
  %96 = load ptr, ptr %fromMember, align 8
  %97 = call i32 %96(i32 41)
  %98 = icmp ne i32 %97, 42
  br i1 %98, label %then51, label %else52

then51:                                           ; preds = %if.end50
  store i32 1, ptr %failed, align 4
  %99 = load i32, ptr %failed, align 4
  br label %if.end53

else52:                                           ; preds = %if.end50
  br label %if.end53

if.end53:                                         ; preds = %else52, %then51
  %100 = getelementptr ptr, ptr %table, i32 0
  store ptr @addOne, ptr %100, align 8
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr ptr, ptr %table, i32 1
  store ptr @square, ptr %102, align 8
  %103 = load ptr, ptr %102, align 8
  %104 = getelementptr ptr, ptr %table, i32 2
  store ptr @addOne, ptr %104, align 8
  %105 = load ptr, ptr %104, align 8
  store i32 0, ptr %total, align 4
  %106 = load i32, ptr %total, align 4
  store i32 0, ptr %i, align 4
  %107 = load i32, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.loop, %if.end53
  %108 = load i32, ptr %i, align 4
  %109 = icmp slt i32 %108, 3
  br i1 %109, label %while.loop, label %while.end

while.loop:                                       ; preds = %while.cond
  %110 = load i32, ptr %i, align 4
  %111 = getelementptr ptr, ptr %table, i32 %110
  %112 = load ptr, ptr %111, align 8
  store ptr %112, ptr %fromMember, align 8
  %113 = load ptr, ptr %fromMember, align 8
  %114 = load i32, ptr %total, align 4
  %115 = load ptr, ptr %fromMember, align 8
  %116 = load i32, ptr %i, align 4
  %117 = add i32 %116, 1
  %118 = call i32 %115(i32 %117)
  %119 = add i32 %114, %118
  store i32 %119, ptr %total, align 4
  %120 = load i32, ptr %total, align 4
  %121 = load i32, ptr %i, align 4
  %122 = add i32 %121, 1
  store i32 %122, ptr %i, align 4
  %123 = load i32, ptr %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %124 = load i32, ptr %total, align 4
  %125 = icmp ne i32 %124, 10
  br i1 %125, label %then54, label %else55

then54:                                           ; preds = %while.end
  store i32 1, ptr %failed, align 4
  %126 = load i32, ptr %failed, align 4
  br label %if.end56

else55:                                           ; preds = %while.end
  br label %if.end56

if.end56:                                         ; preds = %else55, %then54
  %127 = call ptr @pickOp(i32 0)
  store ptr %127, ptr %fromMember, align 8
  %128 = load ptr, ptr %fromMember, align 8
  %129 = load ptr, ptr %fromMember, align 8
  %130 = call i32 %129(i32 10)
  %131 = icmp ne i32 %130, 11
  br i1 %131, label %then57, label %else58

then57:                                           ; preds = %if.end56
  store i32 1, ptr %failed, align 4
  %132 = load i32, ptr %failed, align 4
  br label %if.end59

else58:                                           ; preds = %if.end56
  br label %if.end59

if.end59:                                         ; preds = %else58, %then57
  %133 = call ptr @pickOp(i32 1)
  store ptr %133, ptr %fromMember, align 8
  %134 = load ptr, ptr %fromMember, align 8
  %135 = load ptr, ptr %fromMember, align 8
  %136 = call i32 %135(i32 10)
  %137 = icmp ne i32 %136, 100
  br i1 %137, label %then60, label %else61

then60:                                           ; preds = %if.end59
  store i32 1, ptr %failed, align 4
  %138 = load i32, ptr %failed, align 4
  br label %if.end62

else61:                                           ; preds = %if.end59
  br label %if.end62

if.end62:                                         ; preds = %else61, %then60
  %139 = load i32, ptr %failed, align 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %then63, label %else64

then63:                                           ; preds = %if.end62
  %141 = call i32 (ptr, ...) @printf(ptr @0)
  ret i32 0

else64:                                           ; preds = %if.end62
  br label %if.end65

if.end65:                                         ; preds = %else64
  %142 = call i32 (ptr, ...) @printf(ptr @1)
  ret i32 1
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
