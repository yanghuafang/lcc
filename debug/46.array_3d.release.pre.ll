; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@g3 = global [2 x [3 x [4 x i32]]] zeroinitializer
@g4 = global [2 x [2 x [2 x [2 x i32]]]] zeroinitializer
@0 = private unnamed_addr constant [20 x i8] c"46.array_3d.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"46.array_3d.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %sum = alloca i32, align 4
  %l = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %b = alloca [2 x [2 x [2 x [2 x i32]]]], align 4
  %a = alloca [2 x [3 x [4 x i32]]], align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 0, ptr %sum, align 4
  store i32 0, ptr %i, align 4
  %0 = load i32, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.update7, %entry
  %1 = load i32, ptr %i, align 4
  %2 = icmp slt i32 %1, 2
  br i1 %2, label %for.loop, label %for.end8

for.loop:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  %3 = load i32, ptr %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.update5, %for.loop
  %4 = load i32, ptr %j, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %for.loop2, label %for.end6

for.loop2:                                        ; preds = %for.cond1
  store i32 0, ptr %k, align 4
  %6 = load i32, ptr %k, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.update, %for.loop2
  %7 = load i32, ptr %k, align 4
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %for.loop4, label %for.end

for.loop4:                                        ; preds = %for.cond3
  %9 = load i32, ptr %i, align 4
  %10 = getelementptr [3 x [4 x i32]], ptr %a, i32 %9
  %11 = load i32, ptr %j, align 4
  %12 = getelementptr [4 x i32], ptr %10, i32 %11
  %13 = load i32, ptr %k, align 4
  %14 = getelementptr i32, ptr %12, i32 %13
  %15 = load i32, ptr %i, align 4
  %16 = mul i32 %15, 100
  %17 = load i32, ptr %j, align 4
  %18 = mul i32 %17, 10
  %19 = add i32 %16, %18
  %20 = load i32, ptr %k, align 4
  %21 = add i32 %19, %20
  store i32 %21, ptr %14, align 4
  %22 = load i32, ptr %14, align 4
  br label %for.update

for.update:                                       ; preds = %for.loop4
  %23 = load i32, ptr %k, align 4
  %24 = add i32 %23, 1
  store i32 %24, ptr %k, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  br label %for.update5

for.update5:                                      ; preds = %for.end
  %25 = load i32, ptr %j, align 4
  %26 = add i32 %25, 1
  store i32 %26, ptr %j, align 4
  br label %for.cond1

for.end6:                                         ; preds = %for.cond1
  br label %for.update7

for.update7:                                      ; preds = %for.end6
  %27 = load i32, ptr %i, align 4
  %28 = add i32 %27, 1
  store i32 %28, ptr %i, align 4
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  store i32 0, ptr %i, align 4
  %29 = load i32, ptr %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.update19, %for.end8
  %30 = load i32, ptr %i, align 4
  %31 = icmp slt i32 %30, 2
  br i1 %31, label %for.loop10, label %for.end20

for.loop10:                                       ; preds = %for.cond9
  store i32 0, ptr %j, align 4
  %32 = load i32, ptr %j, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.update17, %for.loop10
  %33 = load i32, ptr %j, align 4
  %34 = icmp slt i32 %33, 3
  br i1 %34, label %for.loop12, label %for.end18

for.loop12:                                       ; preds = %for.cond11
  store i32 0, ptr %k, align 4
  %35 = load i32, ptr %k, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.update15, %for.loop12
  %36 = load i32, ptr %k, align 4
  %37 = icmp slt i32 %36, 4
  br i1 %37, label %for.loop14, label %for.end16

for.loop14:                                       ; preds = %for.cond13
  %38 = load i32, ptr %i, align 4
  %39 = getelementptr [3 x [4 x i32]], ptr %a, i32 %38
  %40 = load i32, ptr %j, align 4
  %41 = getelementptr [4 x i32], ptr %39, i32 %40
  %42 = load i32, ptr %k, align 4
  %43 = getelementptr i32, ptr %41, i32 %42
  %44 = load i32, ptr %43, align 4
  %45 = load i32, ptr %sum, align 4
  %46 = add i32 %45, %44
  store i32 %46, ptr %sum, align 4
  %47 = load i32, ptr %sum, align 4
  br label %for.update15

for.update15:                                     ; preds = %for.loop14
  %48 = load i32, ptr %k, align 4
  %49 = add i32 %48, 1
  store i32 %49, ptr %k, align 4
  br label %for.cond13

for.end16:                                        ; preds = %for.cond13
  br label %for.update17

for.update17:                                     ; preds = %for.end16
  %50 = load i32, ptr %j, align 4
  %51 = add i32 %50, 1
  store i32 %51, ptr %j, align 4
  br label %for.cond11

for.end18:                                        ; preds = %for.cond11
  br label %for.update19

for.update19:                                     ; preds = %for.end18
  %52 = load i32, ptr %i, align 4
  %53 = add i32 %52, 1
  store i32 %53, ptr %i, align 4
  br label %for.cond9

for.end20:                                        ; preds = %for.cond9
  %54 = getelementptr [3 x [4 x i32]], ptr %a, i32 0
  %55 = getelementptr [4 x i32], ptr %54, i32 0
  %56 = getelementptr i32, ptr %55, i32 0
  %57 = load i32, ptr %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %then, label %else

then:                                             ; preds = %for.end20
  store i32 1, ptr %err, align 4
  %59 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %for.end20
  br label %if.end

if.end:                                           ; preds = %else, %then
  %60 = getelementptr [3 x [4 x i32]], ptr %a, i32 1
  %61 = getelementptr [4 x i32], ptr %60, i32 2
  %62 = getelementptr i32, ptr %61, i32 3
  %63 = load i32, ptr %62, align 4
  %64 = icmp ne i32 %63, 123
  br i1 %64, label %then21, label %else22

then21:                                           ; preds = %if.end
  store i32 1, ptr %err, align 4
  %65 = load i32, ptr %err, align 4
  br label %if.end23

else22:                                           ; preds = %if.end
  br label %if.end23

if.end23:                                         ; preds = %else22, %then21
  %66 = load i32, ptr %sum, align 4
  %67 = icmp ne i32 %66, 1476
  br i1 %67, label %then24, label %else25

then24:                                           ; preds = %if.end23
  store i32 1, ptr %err, align 4
  %68 = load i32, ptr %err, align 4
  br label %if.end26

else25:                                           ; preds = %if.end23
  br label %if.end26

if.end26:                                         ; preds = %else25, %then24
  store i32 0, ptr %i, align 4
  %69 = load i32, ptr %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.update41, %if.end26
  %70 = load i32, ptr %i, align 4
  %71 = icmp slt i32 %70, 2
  br i1 %71, label %for.loop28, label %for.end42

for.loop28:                                       ; preds = %for.cond27
  store i32 0, ptr %j, align 4
  %72 = load i32, ptr %j, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.update39, %for.loop28
  %73 = load i32, ptr %j, align 4
  %74 = icmp slt i32 %73, 2
  br i1 %74, label %for.loop30, label %for.end40

for.loop30:                                       ; preds = %for.cond29
  store i32 0, ptr %k, align 4
  %75 = load i32, ptr %k, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.update37, %for.loop30
  %76 = load i32, ptr %k, align 4
  %77 = icmp slt i32 %76, 2
  br i1 %77, label %for.loop32, label %for.end38

for.loop32:                                       ; preds = %for.cond31
  store i32 0, ptr %l, align 4
  %78 = load i32, ptr %l, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.update35, %for.loop32
  %79 = load i32, ptr %l, align 4
  %80 = icmp slt i32 %79, 2
  br i1 %80, label %for.loop34, label %for.end36

for.loop34:                                       ; preds = %for.cond33
  %81 = load i32, ptr %i, align 4
  %82 = getelementptr [2 x [2 x [2 x i32]]], ptr %b, i32 %81
  %83 = load i32, ptr %j, align 4
  %84 = getelementptr [2 x [2 x i32]], ptr %82, i32 %83
  %85 = load i32, ptr %k, align 4
  %86 = getelementptr [2 x i32], ptr %84, i32 %85
  %87 = load i32, ptr %l, align 4
  %88 = getelementptr i32, ptr %86, i32 %87
  %89 = load i32, ptr %i, align 4
  %90 = load i32, ptr %j, align 4
  %91 = add i32 %89, %90
  %92 = load i32, ptr %k, align 4
  %93 = add i32 %91, %92
  %94 = load i32, ptr %l, align 4
  %95 = add i32 %93, %94
  store i32 %95, ptr %88, align 4
  %96 = load i32, ptr %88, align 4
  br label %for.update35

for.update35:                                     ; preds = %for.loop34
  %97 = load i32, ptr %l, align 4
  %98 = add i32 %97, 1
  store i32 %98, ptr %l, align 4
  br label %for.cond33

for.end36:                                        ; preds = %for.cond33
  br label %for.update37

for.update37:                                     ; preds = %for.end36
  %99 = load i32, ptr %k, align 4
  %100 = add i32 %99, 1
  store i32 %100, ptr %k, align 4
  br label %for.cond31

for.end38:                                        ; preds = %for.cond31
  br label %for.update39

for.update39:                                     ; preds = %for.end38
  %101 = load i32, ptr %j, align 4
  %102 = add i32 %101, 1
  store i32 %102, ptr %j, align 4
  br label %for.cond29

for.end40:                                        ; preds = %for.cond29
  br label %for.update41

for.update41:                                     ; preds = %for.end40
  %103 = load i32, ptr %i, align 4
  %104 = add i32 %103, 1
  store i32 %104, ptr %i, align 4
  br label %for.cond27

for.end42:                                        ; preds = %for.cond27
  %105 = getelementptr [2 x [2 x [2 x i32]]], ptr %b, i32 0
  %106 = getelementptr [2 x [2 x i32]], ptr %105, i32 1
  %107 = getelementptr [2 x i32], ptr %106, i32 0
  %108 = getelementptr i32, ptr %107, i32 1
  %109 = load i32, ptr %108, align 4
  %110 = icmp ne i32 %109, 2
  br i1 %110, label %then43, label %else44

then43:                                           ; preds = %for.end42
  store i32 1, ptr %err, align 4
  %111 = load i32, ptr %err, align 4
  br label %if.end45

else44:                                           ; preds = %for.end42
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %112 = getelementptr [2 x [2 x [2 x i32]]], ptr %b, i32 1
  %113 = getelementptr [2 x [2 x i32]], ptr %112, i32 1
  %114 = getelementptr [2 x i32], ptr %113, i32 1
  %115 = getelementptr i32, ptr %114, i32 1
  %116 = load i32, ptr %115, align 4
  %117 = icmp ne i32 %116, 4
  br i1 %117, label %then46, label %else47

then46:                                           ; preds = %if.end45
  store i32 1, ptr %err, align 4
  %118 = load i32, ptr %err, align 4
  br label %if.end48

else47:                                           ; preds = %if.end45
  br label %if.end48

if.end48:                                         ; preds = %else47, %then46
  store i32 7, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr getelementptr ([3 x [4 x i32]], ptr @g3, i32 1), i32 2), i32 3), align 4
  %119 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr getelementptr ([3 x [4 x i32]], ptr @g3, i32 1), i32 2), i32 3), align 4
  %120 = load i32, ptr getelementptr (i32, ptr getelementptr ([4 x i32], ptr getelementptr ([3 x [4 x i32]], ptr @g3, i32 1), i32 2), i32 3), align 4
  %121 = icmp ne i32 %120, 7
  br i1 %121, label %then49, label %else50

then49:                                           ; preds = %if.end48
  store i32 1, ptr %err, align 4
  %122 = load i32, ptr %err, align 4
  br label %if.end51

else50:                                           ; preds = %if.end48
  br label %if.end51

if.end51:                                         ; preds = %else50, %then49
  %123 = load i32, ptr @g3, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %then52, label %else53

then52:                                           ; preds = %if.end51
  store i32 1, ptr %err, align 4
  %125 = load i32, ptr %err, align 4
  br label %if.end54

else53:                                           ; preds = %if.end51
  br label %if.end54

if.end54:                                         ; preds = %else53, %then52
  store i32 9, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr getelementptr ([2 x [2 x i32]], ptr getelementptr ([2 x [2 x [2 x i32]]], ptr @g4, i32 1), i32 1), i32 1), i32 1), align 4
  %126 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr getelementptr ([2 x [2 x i32]], ptr getelementptr ([2 x [2 x [2 x i32]]], ptr @g4, i32 1), i32 1), i32 1), i32 1), align 4
  %127 = load i32, ptr getelementptr (i32, ptr getelementptr ([2 x i32], ptr getelementptr ([2 x [2 x i32]], ptr getelementptr ([2 x [2 x [2 x i32]]], ptr @g4, i32 1), i32 1), i32 1), i32 1), align 4
  %128 = icmp ne i32 %127, 9
  br i1 %128, label %then55, label %else56

then55:                                           ; preds = %if.end54
  store i32 1, ptr %err, align 4
  %129 = load i32, ptr %err, align 4
  br label %if.end57

else56:                                           ; preds = %if.end54
  br label %if.end57

if.end57:                                         ; preds = %else56, %then55
  br i1 false, label %then58, label %else59

then58:                                           ; preds = %if.end57
  store i32 1, ptr %err, align 4
  %130 = load i32, ptr %err, align 4
  br label %if.end60

else59:                                           ; preds = %if.end57
  br label %if.end60

if.end60:                                         ; preds = %else59, %then58
  br i1 false, label %then61, label %else62

then61:                                           ; preds = %if.end60
  store i32 1, ptr %err, align 4
  %131 = load i32, ptr %err, align 4
  br label %if.end63

else62:                                           ; preds = %if.end60
  br label %if.end63

if.end63:                                         ; preds = %else62, %then61
  br i1 false, label %then64, label %else65

then64:                                           ; preds = %if.end63
  store i32 1, ptr %err, align 4
  %132 = load i32, ptr %err, align 4
  br label %if.end66

else65:                                           ; preds = %if.end63
  br label %if.end66

if.end66:                                         ; preds = %else65, %then64
  %133 = load i32, ptr %err, align 4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %then67, label %else68

then67:                                           ; preds = %if.end66
  %135 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end69

else68:                                           ; preds = %if.end66
  %136 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end69

if.end69:                                         ; preds = %else68, %then67
  %137 = load i32, ptr %err, align 4
  ret i32 %137
}

!llvm.module.flags = !{!0, !1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
