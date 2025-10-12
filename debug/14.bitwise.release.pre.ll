; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [19 x i8] c"14.bitwise.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"14.bitwise.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %signedVal = alloca i32, align 4
  %msbSet = alloca i32, align 4
  %rightShiftVal = alloca i32, align 4
  %leftShiftVal = alloca i32, align 4
  %xoreqVal = alloca i32, align 4
  %oreqVal = alloca i32, align 4
  %andeqVal = alloca i32, align 4
  %notVal2 = alloca i32, align 4
  %notVal1 = alloca i32, align 4
  %xorVal = alloca i32, align 4
  %orVal = alloca i32, align 4
  %andVal = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  store i32 305419896, ptr %a, align 4
  store i32 -2023406815, ptr %b, align 4
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %2 = and i32 %0, %1
  store i32 %2, ptr %andVal, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %b, align 4
  %5 = or i32 %3, %4
  store i32 %5, ptr %orVal, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %b, align 4
  %8 = xor i32 %6, %7
  store i32 %8, ptr %xorVal, align 4
  %9 = load i32, ptr %a, align 4
  %10 = xor i32 %9, -1
  store i32 %10, ptr %notVal1, align 4
  %11 = load i32, ptr %b, align 4
  %12 = xor i32 %11, -1
  store i32 %12, ptr %notVal2, align 4
  %13 = load i32, ptr %andVal, align 4
  store i32 %13, ptr %andeqVal, align 4
  %14 = load i32, ptr %a, align 4
  %15 = load i32, ptr %andeqVal, align 4
  %16 = and i32 %15, %14
  store i32 %16, ptr %andeqVal, align 4
  %17 = load i32, ptr %andeqVal, align 4
  %18 = load i32, ptr %orVal, align 4
  store i32 %18, ptr %oreqVal, align 4
  %19 = load i32, ptr %a, align 4
  %20 = load i32, ptr %oreqVal, align 4
  %21 = or i32 %20, %19
  store i32 %21, ptr %oreqVal, align 4
  %22 = load i32, ptr %oreqVal, align 4
  %23 = load i32, ptr %xorVal, align 4
  store i32 %23, ptr %xoreqVal, align 4
  %24 = load i32, ptr %a, align 4
  %25 = load i32, ptr %xoreqVal, align 4
  %26 = xor i32 %25, %24
  store i32 %26, ptr %xoreqVal, align 4
  %27 = load i32, ptr %xoreqVal, align 4
  %28 = load i32, ptr %a, align 4
  %29 = shl i32 %28, 8
  store i32 %29, ptr %leftShiftVal, align 4
  %30 = load i32, ptr %b, align 4
  %31 = lshr i32 %30, 8
  store i32 %31, ptr %rightShiftVal, align 4
  %32 = load i32, ptr %leftShiftVal, align 4
  %33 = shl i32 %32, 8
  store i32 %33, ptr %leftShiftVal, align 4
  %34 = load i32, ptr %leftShiftVal, align 4
  %35 = load i32, ptr %rightShiftVal, align 4
  %36 = lshr i32 %35, 8
  store i32 %36, ptr %rightShiftVal, align 4
  %37 = load i32, ptr %rightShiftVal, align 4
  %38 = load i32, ptr %andVal, align 4
  %39 = icmp ne i32 %38, 35930656
  br i1 %39, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %40 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %41 = load i32, ptr %orVal, align 4
  %42 = icmp ne i32 %41, -1753917575
  br i1 %42, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %43 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %44 = load i32, ptr %xorVal, align 4
  %45 = icmp ne i32 %44, -1789848231
  br i1 %45, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %46 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %47 = load i32, ptr %notVal1, align 4
  %48 = icmp ne i32 %47, -305419897
  br i1 %48, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %49 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %50 = load i32, ptr %notVal2, align 4
  %51 = icmp ne i32 %50, 2023406814
  br i1 %51, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %52 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %53 = load i32, ptr %andeqVal, align 4
  %54 = icmp ne i32 %53, 35930656
  br i1 %54, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %55 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %56 = load i32, ptr %oreqVal, align 4
  %57 = icmp ne i32 %56, -1753917575
  br i1 %57, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %58 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %59 = load i32, ptr %xoreqVal, align 4
  %60 = icmp ne i32 %59, -2023406815
  br i1 %60, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %62 = load i32, ptr %leftShiftVal, align 4
  %63 = icmp ne i32 %62, 1450704896
  br i1 %63, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %64 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %65 = load i32, ptr %rightShiftVal, align 4
  %66 = icmp ne i32 %65, 34661
  br i1 %66, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %67 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  store i32 -2147483648, ptr %msbSet, align 4
  %68 = load i32, ptr %msbSet, align 4
  %69 = lshr i32 %68, 1
  %70 = icmp ne i32 %69, 1073741824
  br i1 %70, label %then28, label %else29

then28:                                           ; preds = %if.end27
  store i32 1, ptr %err, align 4
  %71 = load i32, ptr %err, align 4
  br label %if.end30

else29:                                           ; preds = %if.end27
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  store i32 -8, ptr %signedVal, align 4
  %72 = load i32, ptr %signedVal, align 4
  %73 = ashr i32 %72, 1
  %74 = icmp ne i32 %73, -4
  br i1 %74, label %then31, label %else32

then31:                                           ; preds = %if.end30
  store i32 1, ptr %err, align 4
  %75 = load i32, ptr %err, align 4
  br label %if.end33

else32:                                           ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %else32, %then31
  %76 = load i32, ptr %err, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %then34, label %else35

then34:                                           ; preds = %if.end33
  %78 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end36

else35:                                           ; preds = %if.end33
  %79 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end36

if.end36:                                         ; preds = %else35, %then34
  %80 = load i32, ptr %err, align 4
  ret i32 %80
}
