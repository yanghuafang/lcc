; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"47.paren_expr.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"47.paren_expr.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @identity(i32 %0) {
entry:
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  ret i32 %1
}

define i32 @addTwo(i32 %0, i32 %1) {
entry:
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %0, ptr %x, align 4
  store i32 %1, ptr %y, align 4
  %2 = load i32, ptr %x, align 4
  %3 = load i32, ptr %y, align 4
  %4 = add i32 %2, %3
  ret i32 %4
}

define i32 @main() {
entry:
  %s = alloca i64, align 8
  %d = alloca double, align 8
  %arr = alloca [3 x i32], align 4
  %failed = alloca i32, align 4
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 7, ptr %a, align 4
  store i32 3, ptr %b, align 4
  store i32 2, ptr %i, align 4
  store i32 0, ptr %r, align 4
  store i32 0, ptr %failed, align 4
  store double 3.900000e+00, ptr %d, align 8
  store i64 0, ptr %s, align 8
  %0 = getelementptr i32, ptr %arr, i32 0
  store i32 11, ptr %0, align 4
  %1 = load i32, ptr %0, align 4
  %2 = getelementptr i32, ptr %arr, i32 1
  store i32 22, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr i32, ptr %arr, i32 2
  store i32 33, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = load i32, ptr %a, align 4
  store i32 %6, ptr %r, align 4
  %7 = load i32, ptr %r, align 4
  %8 = load i32, ptr %r, align 4
  %9 = icmp ne i32 %8, 7
  br i1 %9, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4
  %10 = load i32, ptr %failed, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %11 = load i32, ptr %a, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %r, align 4
  %13 = load i32, ptr %r, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  store i32 0, ptr %r, align 4
  %14 = load i32, ptr %r, align 4
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %15 = load i32, ptr %r, align 4
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %failed, align 4
  %17 = load i32, ptr %failed, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %18 = load i32, ptr %a, align 4
  %19 = icmp eq i32 %18, 7
  br i1 %19, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 2, ptr %r, align 4
  %20 = load i32, ptr %r, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  store i32 0, ptr %r, align 4
  %21 = load i32, ptr %r, align 4
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %22 = load i32, ptr %r, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %failed, align 4
  %24 = load i32, ptr %failed, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %25 = load i32, ptr %a, align 4
  %26 = call i32 @identity(i32 %25)
  %27 = icmp ne i32 %26, 7
  br i1 %27, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %failed, align 4
  %28 = load i32, ptr %failed, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %29 = load i32, ptr %a, align 4
  %30 = load i32, ptr %b, align 4
  %31 = call i32 @addTwo(i32 %29, i32 %30)
  %32 = icmp ne i32 %31, 10
  br i1 %32, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %failed, align 4
  %33 = load i32, ptr %failed, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %34 = load i32, ptr %a, align 4
  %35 = icmp ne i32 %34, 7
  br i1 %35, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %failed, align 4
  %36 = load i32, ptr %failed, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %37 = load i32, ptr %i, align 4
  %38 = getelementptr i32, ptr %arr, i32 %37
  %39 = load i32, ptr %38, align 4
  %40 = icmp ne i32 %39, 33
  br i1 %40, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %failed, align 4
  %41 = load i32, ptr %failed, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %42 = load i32, ptr %a, align 4
  %43 = sdiv i32 %42, 7
  %44 = icmp ne i32 %43, 1
  br i1 %44, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %failed, align 4
  %45 = load i32, ptr %failed, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %46 = load i32, ptr %a, align 4
  %47 = srem i32 %46, 4
  %48 = icmp ne i32 %47, 3
  br i1 %48, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %failed, align 4
  %49 = load i32, ptr %failed, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %50 = load i32, ptr %b, align 4
  %51 = shl i32 %50, 1
  %52 = icmp ne i32 %51, 6
  br i1 %52, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %failed, align 4
  %53 = load i32, ptr %failed, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr %b, align 4
  %55 = load i32, ptr %a, align 4
  %56 = add i32 %54, %55
  store i32 %56, ptr %r, align 4
  %57 = load i32, ptr %r, align 4
  %58 = load i32, ptr %r, align 4
  %59 = icmp ne i32 %58, 10
  br i1 %59, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %failed, align 4
  %60 = load i32, ptr %failed, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %61 = load double, ptr %d, align 8
  %62 = fptosi double %61 to i32
  %63 = icmp ne i32 %62, 3
  br i1 %63, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %failed, align 4
  %64 = load i32, ptr %failed, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %65 = load i32, ptr %a, align 4
  %66 = sext i32 %65 to i64
  store i64 %66, ptr %s, align 8
  %67 = load i64, ptr %s, align 8
  %68 = load i64, ptr %s, align 8
  %69 = trunc i64 %68 to i32
  %70 = icmp ne i32 %69, 7
  br i1 %70, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %failed, align 4
  %71 = load i32, ptr %failed, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %72 = load i32, ptr %b, align 4
  %73 = sext i32 %72 to i64
  %74 = trunc i64 %73 to i32
  %75 = icmp ne i32 %74, 3
  br i1 %75, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %failed, align 4
  %76 = load i32, ptr %failed, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %77 = load i32, ptr %failed, align 4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %then46, label %else47

then46:                                           ; preds = %if.end45
  %79 = call i32 (ptr, ...) @printf(ptr @0)
  ret i32 0

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47
  %80 = call i32 (ptr, ...) @printf(ptr @1)
  ret i32 1
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
