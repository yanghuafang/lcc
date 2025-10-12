; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Employee = type { ptr, i8, i32, i32, float }

@0 = private unnamed_addr constant [9 x i8] c"employee\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"2.struct_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [22 x i8] c"2.struct_type.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %age = alloca i32, align 4
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %employee = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 0
  store ptr @0, ptr %0, align 8
  %1 = load ptr, ptr %0, align 8
  %2 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1
  store i8 77, ptr %2, align 1
  %3 = load i8, ptr %2, align 1
  %4 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2
  store i32 100, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3
  store i32 22, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 4
  store float 3.000000e+03, ptr %8, align 4
  %9 = load float, ptr %8, align 4
  %10 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 2
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %id, align 4
  %12 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 1
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  store i32 %14, ptr %sex, align 4
  %15 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %age, align 4
  %17 = load i32, ptr %id, align 4
  %18 = icmp ne i32 %17, 100
  br i1 %18, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  %20 = load i32, ptr %sex, align 4
  %21 = icmp ne i32 %20, 77
  br i1 %21, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %22 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  %23 = load i32, ptr %age, align 4
  %24 = icmp ne i32 %23, 22
  br i1 %24, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %25 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  %26 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3
  store i32 0, ptr %26, align 4
  %27 = load i32, ptr %26, align 4
  %28 = getelementptr %struct.Employee, ptr %employee, i32 0, i32 3
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %age, align 4
  %30 = load i32, ptr %age, align 4
  %31 = load i32, ptr %age, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %33 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %34 = load i32, ptr %err, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %then10, label %else11

then10:                                           ; preds = %if.end9
  %36 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end12

else11:                                           ; preds = %if.end9
  %37 = call i32 (ptr, ...) @printf(ptr @2)
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %38 = load i32, ptr %err, align 4
  ret i32 %38
}
