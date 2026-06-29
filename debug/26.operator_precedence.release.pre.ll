; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"26.operator_precedence.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define void @subFunc(i32 %0) {
entry:
  %i = alloca i32, align 4
  store i32 %0, ptr %i, align 4
  ret void
}

define i32 @main() {
entry:
  %decB = alloca i32, align 4
  %decA = alloca i32, align 4
  %incB = alloca i32, align 4
  %incA = alloca i32, align 4
  %callI = alloca i64, align 8
  %mulC = alloca ptr, align 8
  %mulB = alloca i32, align 4
  %mulA = alloca i32, align 4
  %minusA = alloca i32, align 4
  %plusA = alloca i32, align 4
  %d = alloca i64, align 8
  %c = alloca i64, align 8
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i64 1311768465173141112, ptr %a, align 4
  store i64 -7296712171277459728, ptr %b, align 4
  %0 = ptrtoint ptr %a to i64
  store i64 %0, ptr %c, align 4
  %1 = ptrtoint ptr %c to i64
  %2 = load i64, ptr %a, align 4
  %3 = and i64 %1, %2
  %4 = load i64, ptr %b, align 4
  %5 = and i64 %3, %4
  store i64 %5, ptr %d, align 4
  %6 = load i64, ptr %a, align 4
  %7 = icmp ne i64 %6, 1311768465173141112
  br i1 %7, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %8 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %9 = load i64, ptr %b, align 4
  %10 = icmp ne i64 %9, -7296712171277459728
  br i1 %10, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i32 13, ptr %plusA, align 4
  %12 = load i32, ptr %plusA, align 4
  %13 = add i32 3, %12
  %14 = icmp ne i32 %13, 16
  br i1 %14, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %16 = load i32, ptr %plusA, align 4
  %17 = sub i32 3, %16
  %18 = icmp ne i32 %17, -10
  br i1 %18, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  br i1 false, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  br i1 false, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %21 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  store i32 13, ptr %minusA, align 4
  %22 = load i32, ptr %minusA, align 4
  %23 = sub i32 0, %22
  %24 = sub i32 3, %23
  %25 = icmp ne i32 %24, 16
  br i1 %25, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %26 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  br i1 false, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %27 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  store i32 3, ptr %mulA, align 4
  store i32 4, ptr %mulB, align 4
  store ptr %mulB, ptr %mulC, align 8
  %28 = load i32, ptr %mulA, align 4
  %29 = load i32, ptr %mulB, align 4
  %30 = mul i32 %28, %29
  %31 = load ptr, ptr %mulC, align 8
  %32 = load i32, ptr %31, align 4
  %33 = mul i32 %30, %32
  %34 = icmp ne i32 %33, 48
  br i1 %34, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  store i64 1234, ptr %callI, align 4
  %36 = load i64, ptr %callI, align 4
  %37 = trunc i64 %36 to i32
  call void @subFunc(i32 %37)
  %38 = load i64, ptr %callI, align 4
  %39 = trunc i64 %38 to i32
  %40 = icmp ne i32 %39, 1234
  br i1 %40, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %41 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  store i32 10, ptr %incA, align 4
  %42 = load i32, ptr %incA, align 4
  %43 = add i32 %42, 1
  store i32 %43, ptr %incA, align 4
  %44 = load i32, ptr %incA, align 4
  %45 = add i32 %44, 1
  store i32 %45, ptr %incA, align 4
  store i32 %44, ptr %incB, align 4
  %46 = load i32, ptr %incA, align 4
  %47 = icmp ne i32 %46, 12
  br i1 %47, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %48 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %49 = load i32, ptr %incB, align 4
  %50 = icmp ne i32 %49, 11
  br i1 %50, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %51 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  store i32 10, ptr %decA, align 4
  %52 = load i32, ptr %decA, align 4
  %53 = sub i32 %52, 1
  store i32 %53, ptr %decA, align 4
  %54 = load i32, ptr %decA, align 4
  %55 = sub i32 %54, 1
  store i32 %55, ptr %decA, align 4
  store i32 %54, ptr %decB, align 4
  %56 = load i32, ptr %decA, align 4
  %57 = icmp ne i32 %56, 8
  br i1 %57, label %then34, label %else35

then34:                                           ; preds = %if.end33
  store i32 1, ptr %err, align 4
  %58 = load i32, ptr %err, align 4
  br label %if.end36

else35:                                           ; preds = %if.end33
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %59 = load i32, ptr %decB, align 4
  %60 = icmp ne i32 %59, 9
  br i1 %60, label %then37, label %else38

then37:                                           ; preds = %if.end36
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end39

else38:                                           ; preds = %if.end36
  br label %if.end39

if.end39:                                         ; preds = %else38, %then37
  %62 = load i32, ptr %err, align 4
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %then40, label %else41

then40:                                           ; preds = %if.end39
  %64 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end42

else41:                                           ; preds = %if.end39
  %65 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end42

if.end42:                                         ; preds = %else41, %then40
  %66 = load i32, ptr %err, align 4
  ret i32 %66
}
