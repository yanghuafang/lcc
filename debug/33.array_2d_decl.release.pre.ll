; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Cell = type { i32, i32 }

@gm = global [3 x [4 x i32]] undef
@0 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %v = alloca i32, align 4
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
  %scalar = alloca i32, align 4
  %m = alloca [2 x [3 x i32]], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr [3 x i32], ptr %m, i32 0
  %1 = getelementptr i32, ptr %0, i32 0
  store i32 1, ptr %1, align 4
  %2 = load i32, ptr %1, align 4
  %3 = getelementptr [3 x i32], ptr %m, i32 0
  %4 = getelementptr i32, ptr %3, i32 1
  store i32 2, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr [3 x i32], ptr %m, i32 0
  %7 = getelementptr i32, ptr %6, i32 2
  store i32 3, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr [3 x i32], ptr %m, i32 1
  %10 = getelementptr i32, ptr %9, i32 0
  store i32 4, ptr %10, align 4
  %11 = load i32, ptr %10, align 4
  %12 = getelementptr [3 x i32], ptr %m, i32 1
  %13 = getelementptr i32, ptr %12, i32 1
  store i32 5, ptr %13, align 4
  %14 = load i32, ptr %13, align 4
  %15 = getelementptr [3 x i32], ptr %m, i32 1
  %16 = getelementptr i32, ptr %15, i32 2
  store i32 6, ptr %16, align 4
  %17 = load i32, ptr %16, align 4
  store i32 99, ptr %scalar, align 4
  %18 = load i32, ptr %scalar, align 4
  store i32 10, ptr @gm, align 4
  %19 = load i32, ptr @gm, align 4
  store i32 20, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4
  %20 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4
  store i32 30, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4
  %21 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4
  %22 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0
  %23 = getelementptr %struct.Cell, ptr %22, i32 1
  %24 = getelementptr %struct.Cell, ptr %23, i32 0, i32 0
  store i32 7, ptr %24, align 4
  %25 = load i32, ptr %24, align 4
  %26 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0
  %27 = getelementptr %struct.Cell, ptr %26, i32 1
  %28 = getelementptr %struct.Cell, ptr %27, i32 0, i32 1
  store i32 70, ptr %28, align 4
  %29 = load i32, ptr %28, align 4
  %30 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1
  %31 = getelementptr %struct.Cell, ptr %30, i32 0
  %32 = getelementptr %struct.Cell, ptr %31, i32 0, i32 0
  store i32 8, ptr %32, align 4
  %33 = load i32, ptr %32, align 4
  %34 = getelementptr [3 x i32], ptr %m, i32 0
  %35 = getelementptr i32, ptr %34, i32 0
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr %v, align 4
  %37 = load i32, ptr %v, align 4
  %38 = load i32, ptr %v, align 4
  %39 = icmp ne i32 %38, 1
  br i1 %39, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %40 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %41 = getelementptr [3 x i32], ptr %m, i32 0
  %42 = getelementptr i32, ptr %41, i32 2
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %v, align 4
  %44 = load i32, ptr %v, align 4
  %45 = load i32, ptr %v, align 4
  %46 = icmp ne i32 %45, 3
  br i1 %46, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %47 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %48 = getelementptr [3 x i32], ptr %m, i32 1
  %49 = getelementptr i32, ptr %48, i32 1
  %50 = load i32, ptr %49, align 4
  store i32 %50, ptr %v, align 4
  %51 = load i32, ptr %v, align 4
  %52 = load i32, ptr %v, align 4
  %53 = icmp ne i32 %52, 5
  br i1 %53, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %54 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %55 = getelementptr [3 x i32], ptr %m, i32 1
  %56 = getelementptr i32, ptr %55, i32 2
  %57 = load i32, ptr %56, align 4
  store i32 %57, ptr %v, align 4
  %58 = load i32, ptr %v, align 4
  %59 = load i32, ptr %v, align 4
  %60 = icmp ne i32 %59, 6
  br i1 %60, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %62 = load i32, ptr %scalar, align 4
  %63 = icmp ne i32 %62, 99
  br i1 %63, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %64 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %65 = load i32, ptr @gm, align 4
  store i32 %65, ptr %v, align 4
  %66 = load i32, ptr %v, align 4
  %67 = load i32, ptr %v, align 4
  %68 = icmp ne i32 %67, 10
  br i1 %68, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %69 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %70 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 1), i32 2), align 4
  store i32 %70, ptr %v, align 4
  %71 = load i32, ptr %v, align 4
  %72 = load i32, ptr %v, align 4
  %73 = icmp ne i32 %72, 20
  br i1 %73, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %74 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %75 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr @gm, i32 2), i32 3), align 4
  store i32 %75, ptr %v, align 4
  %76 = load i32, ptr %v, align 4
  %77 = load i32, ptr %v, align 4
  %78 = icmp ne i32 %77, 30
  br i1 %78, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %79 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %80 = load i32, ptr getelementptr (i32, ptr @gm, i32 1), align 4
  store i32 %80, ptr %v, align 4
  %81 = load i32, ptr %v, align 4
  %82 = load i32, ptr %v, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %84 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %85 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0
  %86 = getelementptr %struct.Cell, ptr %85, i32 1
  %87 = getelementptr %struct.Cell, ptr %86, i32 0, i32 0
  %88 = load i32, ptr %87, align 4
  store i32 %88, ptr %v, align 4
  %89 = load i32, ptr %v, align 4
  %90 = load i32, ptr %v, align 4
  %91 = icmp ne i32 %90, 7
  br i1 %91, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %92 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %93 = getelementptr [2 x %struct.Cell], ptr %grid, i32 0
  %94 = getelementptr %struct.Cell, ptr %93, i32 1
  %95 = getelementptr %struct.Cell, ptr %94, i32 0, i32 1
  %96 = load i32, ptr %95, align 4
  store i32 %96, ptr %v, align 4
  %97 = load i32, ptr %v, align 4
  %98 = load i32, ptr %v, align 4
  %99 = icmp ne i32 %98, 70
  br i1 %99, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %100 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %101 = getelementptr [2 x %struct.Cell], ptr %grid, i32 1
  %102 = getelementptr %struct.Cell, ptr %101, i32 0
  %103 = getelementptr %struct.Cell, ptr %102, i32 0, i32 0
  %104 = load i32, ptr %103, align 4
  store i32 %104, ptr %v, align 4
  %105 = load i32, ptr %v, align 4
  %106 = load i32, ptr %v, align 4
  %107 = icmp ne i32 %106, 8
  br i1 %107, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %108 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %109 = load i32, ptr %err, align 4
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %then34, label %else35

then34:                                           ; preds = %if.end33
  %111 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end36

else35:                                           ; preds = %if.end33
  %112 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %113 = load i32, ptr %err, align 4
  ret i32 %113
}
