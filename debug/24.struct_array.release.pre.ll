; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %data = alloca i32, align 4
  %id = alloca i32, align 4
  %da = alloca [2 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr %struct.Data, ptr %da, i32 0
  %1 = getelementptr %struct.Data, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = load i32, ptr %1, align 4
  %3 = getelementptr %struct.Data, ptr %da, i32 0
  %4 = getelementptr %struct.Data, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr %struct.Data, ptr %da, i32 1
  %7 = getelementptr %struct.Data, ptr %6, i32 0, i32 0
  store i32 10, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr %struct.Data, ptr %da, i32 1
  %10 = getelementptr %struct.Data, ptr %9, i32 0, i32 1
  store i32 80, ptr %10, align 4
  %11 = load i32, ptr %10, align 4
  %12 = getelementptr %struct.Data, ptr %da, i32 1
  %13 = getelementptr %struct.Data, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr %id, align 4
  %15 = load i32, ptr %id, align 4
  %16 = getelementptr %struct.Data, ptr %da, i32 1
  %17 = getelementptr %struct.Data, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  store i32 %18, ptr %data, align 4
  %19 = load i32, ptr %data, align 4
  %20 = load i32, ptr %id, align 4
  %21 = icmp ne i32 %20, 10
  br i1 %21, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %22 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %23 = load i32, ptr %data, align 4
  %24 = icmp ne i32 %23, 80
  br i1 %24, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %26 = getelementptr %struct.Data, ptr %da, i32 0
  %27 = getelementptr %struct.Data, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 4
  store i32 %28, ptr %id, align 4
  %29 = load i32, ptr %id, align 4
  %30 = getelementptr %struct.Data, ptr %da, i32 0
  %31 = getelementptr %struct.Data, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  store i32 %32, ptr %data, align 4
  %33 = load i32, ptr %data, align 4
  %34 = load i32, ptr %id, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %36 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %37 = load i32, ptr %data, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %39 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %40 = load i32, ptr %err, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %then10, label %else11

then10:                                           ; preds = %if.end9
  %42 = call i32 (ptr, ...) @printf(ptr @0)
  br label %if.end12

else11:                                           ; preds = %if.end9
  %43 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %44 = load i32, ptr %err, align 4
  ret i32 %44
}
