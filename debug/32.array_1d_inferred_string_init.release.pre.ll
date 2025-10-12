; ModuleID = 'lcc'
source_filename = "lcc"

@ga = global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = global [3 x i8] c"hi\00"
@gt = global [4 x i8] c"hey\00"
@0 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %lb = alloca [6 x i8], align 1
  %ls = alloca [6 x i8], align 1
  %la = alloca [3 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr [3 x i32], ptr %la, i32 0, i32 0
  store i32 1, ptr %0, align 4
  %1 = getelementptr [3 x i32], ptr %la, i32 0, i32 1
  store i32 2, ptr %1, align 4
  %2 = getelementptr [3 x i32], ptr %la, i32 0, i32 2
  store i32 3, ptr %2, align 4
  %3 = getelementptr [6 x i8], ptr %ls, i32 0, i32 0
  store i8 104, ptr %3, align 1
  %4 = getelementptr [6 x i8], ptr %ls, i32 0, i32 1
  store i8 101, ptr %4, align 1
  %5 = getelementptr [6 x i8], ptr %ls, i32 0, i32 2
  store i8 108, ptr %5, align 1
  %6 = getelementptr [6 x i8], ptr %ls, i32 0, i32 3
  store i8 108, ptr %6, align 1
  %7 = getelementptr [6 x i8], ptr %ls, i32 0, i32 4
  store i8 111, ptr %7, align 1
  %8 = getelementptr [6 x i8], ptr %ls, i32 0, i32 5
  store i8 0, ptr %8, align 1
  %9 = getelementptr [6 x i8], ptr %lb, i32 0, i32 0
  store i8 104, ptr %9, align 1
  %10 = getelementptr [6 x i8], ptr %lb, i32 0, i32 1
  store i8 101, ptr %10, align 1
  %11 = getelementptr [6 x i8], ptr %lb, i32 0, i32 2
  store i8 108, ptr %11, align 1
  %12 = getelementptr [6 x i8], ptr %lb, i32 0, i32 3
  store i8 108, ptr %12, align 1
  %13 = getelementptr [6 x i8], ptr %lb, i32 0, i32 4
  store i8 111, ptr %13, align 1
  %14 = getelementptr [6 x i8], ptr %lb, i32 0, i32 5
  store i8 0, ptr %14, align 1
  %15 = getelementptr i32, ptr %la, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %18 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %19 = getelementptr i32, ptr %la, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 2
  br i1 %21, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %22 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %23 = getelementptr i32, ptr %la, i32 2
  %24 = load i32, ptr %23, align 4
  %25 = icmp ne i32 %24, 3
  br i1 %25, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %27 = getelementptr i8, ptr %ls, i32 0
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp ne i32 %29, 104
  br i1 %30, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %31 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %32 = getelementptr i8, ptr %ls, i32 1
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 101
  br i1 %35, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %36 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %37 = getelementptr i8, ptr %ls, i32 2
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 108
  br i1 %40, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %41 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %42 = getelementptr i8, ptr %ls, i32 3
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 108
  br i1 %45, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %46 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %47 = getelementptr i8, ptr %ls, i32 4
  %48 = load i8, ptr %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp ne i32 %49, 111
  br i1 %50, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %51 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %52 = getelementptr i8, ptr %ls, i32 5
  %53 = load i8, ptr %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %56 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %57 = getelementptr i8, ptr %lb, i32 0
  %58 = load i8, ptr %57, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp ne i32 %59, 104
  br i1 %60, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %62 = getelementptr i8, ptr %lb, i32 5
  %63 = load i8, ptr %62, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %66 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %67 = load i32, ptr @ga, align 4
  %68 = icmp ne i32 %67, 10
  br i1 %68, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %69 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %70 = load i32, ptr getelementptr (i32, ptr @ga, i32 1), align 4
  %71 = icmp ne i32 %70, 7
  br i1 %71, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %72 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %73 = load i32, ptr getelementptr (i32, ptr @ga, i32 2), align 4
  %74 = icmp ne i32 %73, 8
  br i1 %74, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %75 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %76 = load i32, ptr getelementptr (i32, ptr @ga, i32 3), align 4
  %77 = icmp ne i32 %76, 9
  br i1 %77, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %78 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %79 = load i32, ptr getelementptr (i32, ptr @ga, i32 4), align 4
  %80 = icmp ne i32 %79, 1
  br i1 %80, label %then43, label %else44

then43:                                           ; preds = %if.end42
  store i32 1, ptr %err, align 4
  %81 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %if.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %82 = load i32, ptr getelementptr (i32, ptr @ga, i32 5), align 4
  %83 = icmp ne i32 %82, 5
  br i1 %83, label %then46, label %else47

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4
  %84 = load i32, ptr %err, align 4
  br label %if.end48

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  %85 = load i8, ptr @gs, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp ne i32 %86, 104
  br i1 %87, label %then49, label %else50

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4
  %88 = load i32, ptr %err, align 4
  br label %if.end51

else50:                                           ; preds = %if.end48
  br label %if.end51

if.end51:                                         ; preds = %else50, %then49
  %89 = load i8, ptr getelementptr (i8, ptr @gs, i32 1), align 1
  %90 = sext i8 %89 to i32
  %91 = icmp ne i32 %90, 105
  br i1 %91, label %then52, label %else53

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4
  %92 = load i32, ptr %err, align 4
  br label %if.end54

else53:                                           ; preds = %if.end51
  br label %if.end54

if.end54:                                         ; preds = %else53, %then52
  %93 = load i8, ptr getelementptr (i8, ptr @gs, i32 2), align 1
  %94 = sext i8 %93 to i32
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %then55, label %else56

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4
  %96 = load i32, ptr %err, align 4
  br label %if.end57

else56:                                           ; preds = %if.end54
  br label %if.end57

if.end57:                                         ; preds = %else56, %then55
  %97 = load i8, ptr @gt, align 1
  %98 = sext i8 %97 to i32
  %99 = icmp ne i32 %98, 104
  br i1 %99, label %then58, label %else59

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4
  %100 = load i32, ptr %err, align 4
  br label %if.end60

else59:                                           ; preds = %if.end57
  br label %if.end60

if.end60:                                         ; preds = %else59, %then58
  %101 = load i8, ptr getelementptr (i8, ptr @gt, i32 1), align 1
  %102 = sext i8 %101 to i32
  %103 = icmp ne i32 %102, 101
  br i1 %103, label %then61, label %else62

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4
  %104 = load i32, ptr %err, align 4
  br label %if.end63

else62:                                           ; preds = %if.end60
  br label %if.end63

if.end63:                                         ; preds = %else62, %then61
  %105 = load i8, ptr getelementptr (i8, ptr @gt, i32 2), align 1
  %106 = sext i8 %105 to i32
  %107 = icmp ne i32 %106, 121
  br i1 %107, label %then64, label %else65

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4
  %108 = load i32, ptr %err, align 4
  br label %if.end66

else65:                                           ; preds = %if.end63
  br label %if.end66

if.end66:                                         ; preds = %else65, %then64
  %109 = load i8, ptr getelementptr (i8, ptr @gt, i32 3), align 1
  %110 = sext i8 %109 to i32
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %then67, label %else68

then67:                                           ; preds = %if.end66
  store i32 1, ptr %err, align 4
  %112 = load i32, ptr %err, align 4
  br label %if.end69

else68:                                           ; preds = %if.end66
  br label %if.end69

if.end69:                                         ; preds = %else68, %then67
  %113 = load i32, ptr %err, align 4
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %then70, label %else71

then70:                                           ; preds = %if.end69
  %115 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end72

else71:                                           ; preds = %if.end69
  %116 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end72

if.end72:                                         ; preds = %else71, %then70
  %117 = load i32, ptr %err, align 4
  ret i32 %117
}
