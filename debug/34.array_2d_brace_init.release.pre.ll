; ModuleID = 'lcc'
source_filename = "lcc"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
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
  %18 = getelementptr [3 x i32], ptr %la, i32 0
  %19 = getelementptr i32, ptr %18, i32 0
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 1
  br i1 %21, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %22 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %23 = getelementptr [3 x i32], ptr %la, i32 0
  %24 = getelementptr i32, ptr %23, i32 2
  %25 = load i32, ptr %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %27 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %28 = getelementptr [3 x i32], ptr %la, i32 1
  %29 = getelementptr i32, ptr %28, i32 0
  %30 = load i32, ptr %29, align 4
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %32 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %33 = getelementptr [3 x i32], ptr %la, i32 1
  %34 = getelementptr i32, ptr %33, i32 2
  %35 = load i32, ptr %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %37 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %38 = getelementptr [3 x i32], ptr %lb, i32 0
  %39 = getelementptr i32, ptr %38, i32 0
  %40 = load i32, ptr %39, align 4
  %41 = icmp ne i32 %40, 7
  br i1 %41, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %42 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %43 = getelementptr [3 x i32], ptr %lb, i32 1
  %44 = getelementptr i32, ptr %43, i32 2
  %45 = load i32, ptr %44, align 4
  %46 = icmp ne i32 %45, 12
  br i1 %46, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %47 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %48 = getelementptr [3 x i32], ptr %lc, i32 0
  %49 = getelementptr i32, ptr %48, i32 2
  %50 = load i32, ptr %49, align 4
  %51 = icmp ne i32 %50, 3
  br i1 %51, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %52 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %53 = getelementptr [3 x i32], ptr %lc, i32 1
  %54 = getelementptr i32, ptr %53, i32 0
  %55 = load i32, ptr %54, align 4
  %56 = icmp ne i32 %55, 4
  br i1 %56, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %57 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %58 = getelementptr [3 x i32], ptr %lc, i32 1
  %59 = getelementptr i32, ptr %58, i32 2
  %60 = load i32, ptr %59, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %62 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %63 = load i32, ptr @ga, align 4
  %64 = icmp ne i32 %63, 1
  br i1 %64, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %65 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %66 = load i32, ptr getelementptr (i32, ptr getelementptr ([3 x i32], ptr @ga, i32 1), i32 2), align 4
  %67 = icmp ne i32 %66, 6
  br i1 %67, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %68 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %69 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4
  %70 = icmp ne i32 %69, 1
  br i1 %70, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %71 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %72 = load i32, ptr getelementptr ([3 x i32], ptr @gb, i32 1), align 4
  %73 = icmp ne i32 %72, 3
  br i1 %73, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %74 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %75 = load i32, ptr getelementptr (i32, ptr @gc, i32 1), align 4
  %76 = icmp ne i32 %75, 11
  br i1 %76, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %77 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %78 = load i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), align 4
  %79 = icmp ne i32 %78, 20
  br i1 %79, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %80 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %81 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr @gc, i32 1), i32 1), align 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4
  %83 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %84 = load i32, ptr %err, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %then46, label %else47

then46:                                           ; preds = %if.end45
  %86 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end48

else47:                                           ; preds = %if.end45
  %87 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  %88 = load i32, ptr %err, align 4
  ret i32 %88
}
