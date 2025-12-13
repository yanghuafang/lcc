; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@gd = global [2 x [2 x i32]] zeroinitializer
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %ld = alloca [2 x [2 x i32]], align 4
  %lc = alloca [2 x [3 x i32]], align 4
  %lb = alloca [2 x [3 x i32]], align 4
  %la = alloca [2 x [3 x i32]], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 0
  store i32 1, ptr %0, align 4
  %1 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 1
  store i32 2, ptr %1, align 4
  %2 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 0, i32 2
  store i32 0, ptr %2, align 4
  %3 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 0
  store i32 3, ptr %3, align 4
  %4 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 1
  store i32 0, ptr %4, align 4
  %5 = getelementptr [2 x [3 x i32]], ptr %la, i32 0, i32 1, i32 2
  store i32 0, ptr %5, align 4
  %6 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 0
  store i32 7, ptr %6, align 4
  %7 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 1
  store i32 8, ptr %7, align 4
  %8 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 0, i32 2
  store i32 9, ptr %8, align 4
  %9 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 0
  store i32 10, ptr %9, align 4
  %10 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 1
  store i32 11, ptr %10, align 4
  %11 = getelementptr [2 x [3 x i32]], ptr %lb, i32 0, i32 1, i32 2
  store i32 12, ptr %11, align 4
  %12 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 0
  store i32 1, ptr %12, align 4
  %13 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 1
  store i32 2, ptr %13, align 4
  %14 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 0, i32 2
  store i32 3, ptr %14, align 4
  %15 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 0
  store i32 4, ptr %15, align 4
  %16 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 1
  store i32 0, ptr %16, align 4
  %17 = getelementptr [2 x [3 x i32]], ptr %lc, i32 0, i32 1, i32 2
  store i32 0, ptr %17, align 4
  %18 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 0, i32 0
  store i32 0, ptr %18, align 4
  %19 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 0, i32 1
  store i32 0, ptr %19, align 4
  %20 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 1, i32 0
  store i32 0, ptr %20, align 4
  %21 = getelementptr [2 x [2 x i32]], ptr %ld, i32 0, i32 1, i32 1
  store i32 0, ptr %21, align 4
  %22 = getelementptr [3 x i32], ptr %la, i32 0
  %23 = getelementptr i32, ptr %22, i32 0
  %24 = load i32, ptr %23, align 4
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %27 = getelementptr [3 x i32], ptr %la, i32 0
  %28 = getelementptr i32, ptr %27, i32 2
  %29 = load i32, ptr %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %31 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %32 = getelementptr [3 x i32], ptr %la, i32 1
  %33 = getelementptr i32, ptr %32, i32 0
  %34 = load i32, ptr %33, align 4
  %35 = icmp ne i32 %34, 3
  br i1 %35, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %36 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %37 = getelementptr [3 x i32], ptr %la, i32 1
  %38 = getelementptr i32, ptr %37, i32 2
  %39 = load i32, ptr %38, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %41 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %42 = getelementptr [3 x i32], ptr %lb, i32 0
  %43 = getelementptr i32, ptr %42, i32 0
  %44 = load i32, ptr %43, align 4
  %45 = icmp ne i32 %44, 7
  br i1 %45, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %46 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %47 = getelementptr [3 x i32], ptr %lb, i32 1
  %48 = getelementptr i32, ptr %47, i32 2
  %49 = load i32, ptr %48, align 4
  %50 = icmp ne i32 %49, 12
  br i1 %50, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %51 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %52 = getelementptr [3 x i32], ptr %lc, i32 0
  %53 = getelementptr i32, ptr %52, i32 2
  %54 = load i32, ptr %53, align 4
  %55 = icmp ne i32 %54, 3
  br i1 %55, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %56 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %57 = getelementptr [3 x i32], ptr %lc, i32 1
  %58 = getelementptr i32, ptr %57, i32 0
  %59 = load i32, ptr %58, align 4
  %60 = icmp ne i32 %59, 4
  br i1 %60, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %62 = getelementptr [3 x i32], ptr %lc, i32 1
  %63 = getelementptr i32, ptr %62, i32 2
  %64 = load i32, ptr %63, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %66 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %67 = getelementptr [2 x i32], ptr %ld, i32 0
  %68 = getelementptr i32, ptr %67, i32 0
  %69 = load i32, ptr %68, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %71 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %72 = getelementptr [2 x i32], ptr %ld, i32 0
  %73 = getelementptr i32, ptr %72, i32 1
  %74 = load i32, ptr %73, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %76 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %77 = getelementptr [2 x i32], ptr %ld, i32 1
  %78 = getelementptr i32, ptr %77, i32 0
  %79 = load i32, ptr %78, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %81 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %82 = getelementptr [2 x i32], ptr %ld, i32 1
  %83 = getelementptr i32, ptr %82, i32 1
  %84 = load i32, ptr %83, align 4
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %86 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %87 = load i32, ptr @ga, align 4
  %88 = icmp ne i32 %87, 1
  br i1 %88, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %89 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %90 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @ga, i32 1), i32 2), align 4
  %91 = icmp ne i32 %90, 6
  br i1 %91, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %92 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %93 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4
  %94 = icmp ne i32 %93, 1
  br i1 %94, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4
  %95 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %96 = load i32, ptr getelementptr ([3 x i32], ptr @gb, i32 1), align 4
  %97 = icmp ne i32 %96, 3
  br i1 %97, label %then46, label %else47

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4
  %98 = load i32, ptr %err, align 4
  br label %if.end48

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  %99 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4
  %100 = icmp ne i32 %99, 11
  br i1 %100, label %then49, label %else50

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4
  %101 = load i32, ptr %err, align 4
  br label %if.end51

else50:                                           ; preds = %if.end48
  br label %if.end51

if.end51:                                         ; preds = %else50, %then49
  %102 = load i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), align 4
  %103 = icmp ne i32 %102, 20
  br i1 %103, label %then52, label %else53

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4
  %104 = load i32, ptr %err, align 4
  br label %if.end54

else53:                                           ; preds = %if.end51
  br label %if.end54

if.end54:                                         ; preds = %else53, %then52
  %105 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), i32 1), align 4
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %then55, label %else56

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4
  %107 = load i32, ptr %err, align 4
  br label %if.end57

else56:                                           ; preds = %if.end54
  br label %if.end57

if.end57:                                         ; preds = %else56, %then55
  %108 = load i32, ptr @gd, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %then58, label %else59

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4
  %110 = load i32, ptr %err, align 4
  br label %if.end60

else59:                                           ; preds = %if.end57
  br label %if.end60

if.end60:                                         ; preds = %else59, %then58
  %111 = load i32, ptr getelementptr (i32, ptr @gd, i32 1), align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %then61, label %else62

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4
  %113 = load i32, ptr %err, align 4
  br label %if.end63

else62:                                           ; preds = %if.end60
  br label %if.end63

if.end63:                                         ; preds = %else62, %then61
  %114 = load i32, ptr getelementptr ([2 x i32], ptr @gd, i32 1), align 4
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %then64, label %else65

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4
  %116 = load i32, ptr %err, align 4
  br label %if.end66

else65:                                           ; preds = %if.end63
  br label %if.end66

if.end66:                                         ; preds = %else65, %then64
  %117 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gd, i32 1), i32 1), align 4
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %then67, label %else68

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4
  %119 = load i32, ptr %err, align 4
  br label %if.end69

else68:                                           ; preds = %if.end66
  br label %if.end69

if.end69:                                         ; preds = %else68, %then67
  %120 = load i32, ptr %err, align 4
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %then70, label %else71

then70:                                           ; preds = %if.end69
  %122 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end72

else71:                                           ; preds = %if.end69
  %123 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end72

if.end72:                                         ; preds = %else71, %then70
  %124 = load i32, ptr %err, align 4
  ret i32 %124
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
