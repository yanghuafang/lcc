; ModuleID = 'lcc'
source_filename = "lcc"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %lc = alloca [2 x i32], align 4
  %lb = alloca [3 x i32], align 4
  %la = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr [4 x i32], ptr %la, i32 0, i32 0
  store i32 1, ptr %0, align 4
  %1 = getelementptr [4 x i32], ptr %la, i32 0, i32 1
  store i32 2, ptr %1, align 4
  %2 = getelementptr [4 x i32], ptr %la, i32 0, i32 2
  store i32 3, ptr %2, align 4
  %3 = getelementptr [4 x i32], ptr %la, i32 0, i32 3
  store i32 0, ptr %3, align 4
  %4 = getelementptr [3 x i32], ptr %lb, i32 0, i32 0
  store i32 4, ptr %4, align 4
  %5 = getelementptr [3 x i32], ptr %lb, i32 0, i32 1
  store i32 5, ptr %5, align 4
  %6 = getelementptr [3 x i32], ptr %lb, i32 0, i32 2
  store i32 6, ptr %6, align 4
  %7 = getelementptr [2 x i32], ptr %lc, i32 0, i32 0
  store i32 0, ptr %7, align 4
  %8 = getelementptr [2 x i32], ptr %lc, i32 0, i32 1
  store i32 0, ptr %8, align 4
  %9 = getelementptr i32, ptr %la, i32 0
  %10 = load i32, ptr %9, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %12 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %13 = getelementptr i32, ptr %la, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %16 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %17 = getelementptr i32, ptr %la, i32 2
  %18 = load i32, ptr %17, align 4
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %21 = getelementptr i32, ptr %la, i32 3
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %24 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %25 = getelementptr i32, ptr %lb, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = icmp ne i32 %26, 4
  br i1 %27, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %28 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr i32, ptr %lb, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = icmp ne i32 %30, 5
  br i1 %31, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %32 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %33 = getelementptr i32, ptr %lb, i32 2
  %34 = load i32, ptr %33, align 4
  %35 = icmp ne i32 %34, 6
  br i1 %35, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %36 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %37 = getelementptr i32, ptr %lc, i32 0
  %38 = load i32, ptr %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %40 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %41 = getelementptr i32, ptr %lc, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %44 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %45 = load i32, ptr @ga, align 4
  %46 = icmp ne i32 %45, 1
  br i1 %46, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %47 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %48 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4
  %49 = icmp ne i32 %48, 2
  br i1 %49, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %50 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %51 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4
  %52 = icmp ne i32 %51, 3
  br i1 %52, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %53 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %54 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %56 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %57 = load i32, ptr @gb, align 4
  %58 = icmp ne i32 %57, 10
  br i1 %58, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %59 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %60 = load i32, ptr getelementptr (i32, ptr @gb, i32 1), align 4
  %61 = icmp ne i32 %60, 20
  br i1 %61, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %62 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %63 = load i32, ptr %err, align 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %then43, label %else44

then43:                                           ; preds = %if.end42
  %65 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end45

else44:                                           ; preds = %if.end42
  %66 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %67 = load i32, ptr %err, align 4
  ret i32 %67
}
