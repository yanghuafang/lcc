; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %pc = alloca ptr, align 8
  %c = alloca [4 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr i8, ptr %c, i32 0
  store i8 65, ptr %0, align 1
  %1 = load i8, ptr %0, align 1
  %2 = getelementptr i8, ptr %c, i32 1
  store i8 66, ptr %2, align 1
  %3 = load i8, ptr %2, align 1
  %4 = getelementptr i8, ptr %c, i32 2
  store i8 67, ptr %4, align 1
  %5 = load i8, ptr %4, align 1
  %6 = getelementptr i8, ptr %c, i32 3
  store i8 68, ptr %6, align 1
  %7 = load i8, ptr %6, align 1
  store ptr %c, ptr %pc, align 8
  %8 = load ptr, ptr %pc, align 8
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 65
  br i1 %11, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %12 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %13 = load ptr, ptr %pc, align 8
  %14 = getelementptr i8, ptr %13, i32 1
  store ptr %14, ptr %pc, align 8
  %15 = load ptr, ptr %pc, align 8
  %16 = load ptr, ptr %pc, align 8
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp ne i32 %18, 66
  br i1 %19, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %20 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %21 = load ptr, ptr %pc, align 8
  %22 = getelementptr i8, ptr %21, i64 1
  store ptr %22, ptr %pc, align 8
  %23 = load ptr, ptr %pc, align 8
  %24 = load ptr, ptr %pc, align 8
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 67
  br i1 %27, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %28 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %29 = load ptr, ptr %pc, align 8
  %30 = getelementptr i8, ptr %29, i64 1
  store ptr %30, ptr %pc, align 8
  %31 = load ptr, ptr %pc, align 8
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 68
  br i1 %34, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %35 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %36 = getelementptr i8, ptr %c, i32 3
  store ptr %36, ptr %pc, align 8
  %37 = load ptr, ptr %pc, align 8
  %38 = load ptr, ptr %pc, align 8
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp ne i32 %40, 68
  br i1 %41, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %42 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %43 = load ptr, ptr %pc, align 8
  %44 = getelementptr i8, ptr %43, i32 -1
  store ptr %44, ptr %pc, align 8
  %45 = load ptr, ptr %pc, align 8
  %46 = load ptr, ptr %pc, align 8
  %47 = load i8, ptr %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp ne i32 %48, 67
  br i1 %49, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %50 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %51 = load ptr, ptr %pc, align 8
  %52 = getelementptr i8, ptr %51, i64 -1
  store ptr %52, ptr %pc, align 8
  %53 = load ptr, ptr %pc, align 8
  %54 = load ptr, ptr %pc, align 8
  %55 = load i8, ptr %54, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp ne i32 %56, 66
  br i1 %57, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %58 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %59 = load ptr, ptr %pc, align 8
  %60 = getelementptr i8, ptr %59, i64 -1
  store ptr %60, ptr %pc, align 8
  %61 = load ptr, ptr %pc, align 8
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp ne i32 %63, 65
  br i1 %64, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %65 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %66 = load i32, ptr %err, align 4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %then22, label %else23

then22:                                           ; preds = %if.end21
  %68 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end24

else23:                                           ; preds = %if.end21
  %69 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %70 = load i32, ptr %err, align 4
  ret i32 %70
}
