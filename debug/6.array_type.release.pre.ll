; ModuleID = 'lcc'
source_filename = "lcc"

@gs = global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global ptr @0
@gi = global [4 x i32] undef
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %i = alloca [4 x i32], align 4
  %s = alloca [16 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr i8, ptr %s, i32 0
  store i8 103, ptr %0, align 1
  %1 = load i8, ptr %0, align 1
  %2 = getelementptr i8, ptr %s, i32 1
  store i8 111, ptr %2, align 1
  %3 = load i8, ptr %2, align 1
  %4 = getelementptr i8, ptr %s, i32 2
  store i8 111, ptr %4, align 1
  %5 = load i8, ptr %4, align 1
  %6 = getelementptr i8, ptr %s, i32 3
  store i8 100, ptr %6, align 1
  %7 = load i8, ptr %6, align 1
  %8 = getelementptr i8, ptr %s, i32 4
  store i8 0, ptr %8, align 1
  %9 = load i8, ptr %8, align 1
  store i8 108, ptr @gs, align 1
  %10 = load i8, ptr @gs, align 1
  store i8 117, ptr getelementptr (i8, ptr @gs, i32 1), align 1
  %11 = load i8, ptr getelementptr (i8, ptr @gs, i32 1), align 1
  store i8 99, ptr getelementptr (i8, ptr @gs, i32 2), align 1
  %12 = load i8, ptr getelementptr (i8, ptr @gs, i32 2), align 1
  store i8 107, ptr getelementptr (i8, ptr @gs, i32 3), align 1
  %13 = load i8, ptr getelementptr (i8, ptr @gs, i32 3), align 1
  store i8 121, ptr getelementptr (i8, ptr @gs, i32 4), align 1
  %14 = load i8, ptr getelementptr (i8, ptr @gs, i32 4), align 1
  store i8 0, ptr getelementptr (i8, ptr @gs, i32 5), align 1
  %15 = load i8, ptr getelementptr (i8, ptr @gs, i32 5), align 1
  %16 = getelementptr i32, ptr %i, i32 0
  store i32 128, ptr %16, align 4
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr i32, ptr %i, i32 1
  store i32 256, ptr %18, align 4
  %19 = load i32, ptr %18, align 4
  store i32 1024, ptr @gi, align 4
  %20 = load i32, ptr @gi, align 4
  store i32 2048, ptr getelementptr (i32, ptr @gi, i32 1), align 4
  %21 = load i32, ptr getelementptr (i32, ptr @gi, i32 1), align 4
  %22 = getelementptr i32, ptr %i, i32 0
  %23 = load i32, ptr %22, align 4
  %24 = icmp ne i32 %23, 128
  br i1 %24, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %26 = getelementptr i32, ptr %i, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = icmp ne i32 %27, 256
  br i1 %28, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %29 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %30 = load i32, ptr @gi, align 4
  %31 = icmp ne i32 %30, 1024
  br i1 %31, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %32 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %33 = load i32, ptr getelementptr (i32, ptr @gi, i32 1), align 4
  %34 = icmp ne i32 %33, 2048
  br i1 %34, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %36 = getelementptr i8, ptr %s, i32 0
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 103
  br i1 %39, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %40 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %41 = load i8, ptr @gs, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 108
  br i1 %43, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %44 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %45 = getelementptr i32, ptr %i, i32 2
  store i32 0, ptr %45, align 4
  %46 = load i32, ptr %45, align 4
  %47 = getelementptr i32, ptr %i, i32 3
  store i32 -1, ptr %47, align 4
  %48 = load i32, ptr %47, align 4
  %49 = getelementptr i32, ptr %i, i32 2
  %50 = load i32, ptr %49, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %52 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %53 = getelementptr i32, ptr %i, i32 3
  %54 = load i32, ptr %53, align 4
  %55 = icmp ne i32 %54, -1
  br i1 %55, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %56 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %57 = load i32, ptr %err, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %then22, label %else23

then22:                                           ; preds = %if.end21
  %59 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end24

else23:                                           ; preds = %if.end21
  %60 = call i32 (ptr, ...) @printf(ptr @2)
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %61 = load i32, ptr %err, align 4
  ret i32 %61
}
