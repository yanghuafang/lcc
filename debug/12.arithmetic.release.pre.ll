; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"12.arithmetic.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %mixedUi = alloca i32, align 4
  %mixedSi = alloca i32, align 4
  %negB = alloca i32, align 4
  %negA = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %modeq = alloca i32, align 4
  %diveq = alloca i32, align 4
  %muleq = alloca i32, align 4
  %subeq = alloca i32, align 4
  %sumeq = alloca i32, align 4
  %mod = alloca i32, align 4
  %div = alloca i32, align 4
  %mul = alloca i32, align 4
  %sub2 = alloca i32, align 4
  %sub = alloca i32, align 4
  %sum = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 37, ptr %a, align 4
  store i32 8, ptr %b, align 4
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %2 = add i32 %0, %1
  store i32 %2, ptr %sum, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %b, align 4
  %5 = sub i32 %3, %4
  store i32 %5, ptr %sub, align 4
  %6 = load i32, ptr %b, align 4
  %7 = load i32, ptr %a, align 4
  %8 = sub i32 %6, %7
  store i32 %8, ptr %sub2, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %b, align 4
  %11 = mul i32 %9, %10
  store i32 %11, ptr %mul, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %14 = sdiv i32 %12, %13
  store i32 %14, ptr %div, align 4
  %15 = load i32, ptr %a, align 4
  %16 = load i32, ptr %b, align 4
  %17 = srem i32 %15, %16
  store i32 %17, ptr %mod, align 4
  %18 = load i32, ptr %sum, align 4
  store i32 %18, ptr %sumeq, align 4
  %19 = load i32, ptr %b, align 4
  %20 = load i32, ptr %sumeq, align 4
  %21 = add i32 %20, %19
  store i32 %21, ptr %sumeq, align 4
  %22 = load i32, ptr %sumeq, align 4
  %23 = load i32, ptr %sumeq, align 4
  store i32 %23, ptr %subeq, align 4
  %24 = load i32, ptr %b, align 4
  %25 = load i32, ptr %subeq, align 4
  %26 = sub i32 %25, %24
  store i32 %26, ptr %subeq, align 4
  %27 = load i32, ptr %subeq, align 4
  %28 = load i32, ptr %subeq, align 4
  store i32 %28, ptr %muleq, align 4
  %29 = load i32, ptr %b, align 4
  %30 = load i32, ptr %muleq, align 4
  %31 = mul i32 %30, %29
  store i32 %31, ptr %muleq, align 4
  %32 = load i32, ptr %muleq, align 4
  %33 = load i32, ptr %muleq, align 4
  store i32 %33, ptr %diveq, align 4
  %34 = load i32, ptr %b, align 4
  %35 = load i32, ptr %diveq, align 4
  %36 = sdiv i32 %35, %34
  store i32 %36, ptr %diveq, align 4
  %37 = load i32, ptr %diveq, align 4
  %38 = load i32, ptr %diveq, align 4
  store i32 %38, ptr %modeq, align 4
  %39 = load i32, ptr %b, align 4
  %40 = load i32, ptr %modeq, align 4
  %41 = srem i32 %40, %39
  store i32 %41, ptr %modeq, align 4
  %42 = load i32, ptr %modeq, align 4
  %43 = load i32, ptr %sum, align 4
  %44 = icmp ne i32 %43, 45
  br i1 %44, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %45 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %46 = load i32, ptr %sub, align 4
  %47 = icmp ne i32 %46, 29
  br i1 %47, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %48 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %49 = load i32, ptr %sub2, align 4
  %50 = icmp ne i32 %49, -29
  br i1 %50, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %51 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %52 = load i32, ptr %mul, align 4
  %53 = icmp ne i32 %52, 296
  br i1 %53, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %54 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %55 = load i32, ptr %div, align 4
  %56 = icmp ne i32 %55, 4
  br i1 %56, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %57 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %58 = load i32, ptr %mod, align 4
  %59 = icmp ne i32 %58, 5
  br i1 %59, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %60 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %61 = load i32, ptr %sumeq, align 4
  %62 = icmp ne i32 %61, 53
  br i1 %62, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %63 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %64 = load i32, ptr %subeq, align 4
  %65 = icmp ne i32 %64, 45
  br i1 %65, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %66 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %67 = load i32, ptr %muleq, align 4
  %68 = icmp ne i32 %67, 360
  br i1 %68, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %69 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %70 = load i32, ptr %diveq, align 4
  %71 = icmp ne i32 %70, 45
  br i1 %71, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %72 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %73 = load i32, ptr %modeq, align 4
  %74 = icmp ne i32 %73, 5
  br i1 %74, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %75 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  store i32 10, ptr %ua, align 4
  store i32 3, ptr %ub, align 4
  %76 = load i32, ptr %ua, align 4
  %77 = load i32, ptr %ub, align 4
  %78 = udiv i32 %76, %77
  %79 = icmp ne i32 %78, 3
  br i1 %79, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %80 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %81 = load i32, ptr %ua, align 4
  %82 = load i32, ptr %ub, align 4
  %83 = urem i32 %81, %82
  %84 = icmp ne i32 %83, 1
  br i1 %84, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %85 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  store i32 -8, ptr %negA, align 4
  store i32 3, ptr %negB, align 4
  %86 = load i32, ptr %negA, align 4
  %87 = load i32, ptr %negB, align 4
  %88 = srem i32 %86, %87
  %89 = icmp ne i32 %88, -2
  br i1 %89, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %90 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  store i32 -1, ptr %mixedSi, align 4
  store i32 1, ptr %mixedUi, align 4
  %91 = load i32, ptr %mixedSi, align 4
  %92 = load i32, ptr %mixedUi, align 4
  %93 = add i32 %91, %92
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %then40, label %else41

then40:                                           ; preds = %if.end39
  store i32 1, ptr %err, align 4
  %95 = load i32, ptr %err, align 4
  br label %if.end42

else41:                                           ; preds = %if.end39
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %96 = load i32, ptr %err, align 4
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %then43, label %else44

then43:                                           ; preds = %if.end42
  %98 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end45

else44:                                           ; preds = %if.end42
  %99 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end45

if.end45:                                         ; preds = %else44, %then43
  %100 = load i32, ptr %err, align 4
  ret i32 %100
}
