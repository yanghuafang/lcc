; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [27 x i8] c"44.token_adjacency.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [27 x i8] c"44.token_adjacency.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %pos = alloca i32, align 4
  %zero = alloca i32, align 4
  %neg = alloca i32, align 4
  %f = alloca float, align 4
  %d = alloca double, align 8
  %ulv = alloca i64, align 8
  %lv = alloca i64, align 8
  %ui = alloca i32, align 4
  %hl = alloca i64, align 8
  %h = alloca i32, align 4
  %n = alloca i32, align 4
  %arr = alloca [4 x i32], align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 5, ptr %a, align 4
  %0 = load i32, ptr %a, align 4
  %1 = sub i32 %0, 1
  %2 = icmp ne i32 %1, 4
  br i1 %2, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %3 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %4 = load i32, ptr %a, align 4
  %5 = add i32 %4, 1
  %6 = icmp ne i32 %5, 6
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %7 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  br i1 false, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  br i1 false, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %9 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %10 = getelementptr [4 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %10, align 4
  %11 = getelementptr [4 x i32], ptr %arr, i32 0, i32 1
  store i32 20, ptr %11, align 4
  %12 = getelementptr [4 x i32], ptr %arr, i32 0, i32 2
  store i32 30, ptr %12, align 4
  %13 = getelementptr [4 x i32], ptr %arr, i32 0, i32 3
  store i32 40, ptr %13, align 4
  store i32 3, ptr %n, align 4
  %14 = load i32, ptr %n, align 4
  %15 = sub i32 %14, 1
  %16 = getelementptr i32, ptr %arr, i32 %15
  %17 = load i32, ptr %16, align 4
  %18 = icmp ne i32 %17, 30
  br i1 %18, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %20 = load i32, ptr %n, align 4
  %21 = sub i32 %20, 3
  %22 = getelementptr i32, ptr %arr, i32 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp ne i32 %23, 10
  br i1 %24, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  store i32 32, ptr %h, align 4
  %26 = load i32, ptr %h, align 4
  %27 = sub i32 %26, 16
  %28 = icmp ne i32 %27, 16
  br i1 %28, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %29 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  store i64 32, ptr %hl, align 8
  %30 = load i64, ptr %hl, align 8
  %31 = sub i64 %30, 16
  %32 = icmp ne i64 %31, 16
  br i1 %32, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %33 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  store i32 5, ptr %ui, align 4
  %34 = load i32, ptr %ui, align 4
  %35 = add i32 %34, 1
  %36 = icmp ne i32 %35, 6
  br i1 %36, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %37 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  store i64 5, ptr %lv, align 8
  %38 = load i64, ptr %lv, align 8
  %39 = sub i64 %38, 1
  %40 = icmp ne i64 %39, 4
  br i1 %40, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %41 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  store i64 5, ptr %ulv, align 8
  %42 = load i64, ptr %ulv, align 8
  %43 = add i64 %42, 1
  %44 = icmp ne i64 %43, 6
  br i1 %44, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %45 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  store double 5.000000e+00, ptr %d, align 8
  %46 = load double, ptr %d, align 8
  %47 = fsub double %46, 1.500000e+00
  %48 = fcmp one double %47, 3.500000e+00
  br i1 %48, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %49 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %50 = load double, ptr %d, align 8
  %51 = fadd double %50, 1.500000e+00
  %52 = fcmp one double %51, 6.500000e+00
  br i1 %52, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %53 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  store float 5.000000e+00, ptr %f, align 4
  %54 = load float, ptr %f, align 4
  %55 = fpext float %54 to double
  %56 = fsub double %55, 1.500000e+00
  %57 = fcmp one double %56, 3.500000e+00
  br i1 %57, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %58 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  br i1 false, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %59 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  br i1 false, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4
  %60 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  br i1 false, label %then46, label %else47

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end48

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  %62 = load i32, ptr %a, align 4
  %63 = sub i32 0, %62
  %64 = mul i32 %63, 2
  %65 = icmp ne i32 %64, -10
  br i1 %65, label %then49, label %else50

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4
  %66 = load i32, ptr %err, align 4
  br label %if.end51

else50:                                           ; preds = %if.end48
  br label %if.end51

if.end51:                                         ; preds = %else50, %then49
  store i32 -1, ptr %neg, align 4
  store i32 0, ptr %zero, align 4
  store i32 1, ptr %pos, align 4
  %67 = load i32, ptr %neg, align 4
  %68 = icmp ne i32 %67, -1
  br i1 %68, label %then52, label %else53

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4
  %69 = load i32, ptr %err, align 4
  br label %if.end54

else53:                                           ; preds = %if.end51
  br label %if.end54

if.end54:                                         ; preds = %else53, %then52
  %70 = load i32, ptr %zero, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %then55, label %else56

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4
  %72 = load i32, ptr %err, align 4
  br label %if.end57

else56:                                           ; preds = %if.end54
  br label %if.end57

if.end57:                                         ; preds = %else56, %then55
  %73 = load i32, ptr %pos, align 4
  %74 = icmp ne i32 %73, 1
  br i1 %74, label %then58, label %else59

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4
  %75 = load i32, ptr %err, align 4
  br label %if.end60

else59:                                           ; preds = %if.end57
  br label %if.end60

if.end60:                                         ; preds = %else59, %then58
  %76 = load i32, ptr %err, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %then61, label %else62

then61:                                           ; preds = %if.end60
  %78 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end63

else62:                                           ; preds = %if.end60
  %79 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end63

if.end63:                                         ; preds = %else62, %then61
  %80 = load i32, ptr %err, align 4
  ret i32 %80
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
