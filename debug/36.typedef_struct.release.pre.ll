; ModuleID = 'lcc'
source_filename = "lcc"

%struct.Employee = type { i32, i8 }
%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

declare ptr @malloc(i64)

declare i64 @strlen(ptr)

define void @fill_employee(ptr %0, i32 %1, i8 %2) {
entry:
  %sex = alloca i8, align 1
  %id = alloca i32, align 4
  %employee = alloca ptr, align 8
  store ptr %0, ptr %employee, align 8
  store i32 %1, ptr %id, align 4
  store i8 %2, ptr %sex, align 1
  %3 = load ptr, ptr %employee, align 8
  %4 = getelementptr %struct.Employee, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %id, align 4
  store i32 %5, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %employee, align 8
  %8 = getelementptr %struct.Employee, ptr %7, i32 0, i32 1
  %9 = load i8, ptr %sex, align 1
  store i8 %9, ptr %8, align 1
  %10 = load i8, ptr %8, align 1
  ret void
}

define i32 @main() {
entry:
  %len = alloca i64, align 8
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %sz = alloca i32, align 4
  %origin = alloca %struct.Point, align 8
  %workerPtr = alloca ptr, align 8
  %worker = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, ptr %err, align 4
  %0 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 1
  store i8 77, ptr %0, align 1
  %1 = load i8, ptr %0, align 1
  store ptr %worker, ptr %workerPtr, align 8
  %2 = load ptr, ptr %workerPtr, align 8
  %3 = load ptr, ptr %workerPtr, align 8
  call void @fill_employee(ptr %3, i32 11, i8 70)
  %4 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0
  store i32 3, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1
  store i32 4, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  store i32 8, ptr %sz, align 4
  %8 = load i32, ptr %sz, align 4
  %9 = load i32, ptr %sz, align 4
  %10 = icmp ne i32 %9, 8
  br i1 %10, label %then, label %else

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4
  %11 = load i32, ptr %err, align 4
  br label %if.end

else:                                             ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %else, %then
  store i32 8, ptr %sz, align 4
  %12 = load i32, ptr %sz, align 4
  %13 = load i32, ptr %sz, align 4
  %14 = icmp ne i32 %13, 8
  br i1 %14, label %then1, label %else2

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4
  %15 = load i32, ptr %err, align 4
  br label %if.end3

else2:                                            ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %else2, %then1
  store i32 8, ptr %sz, align 4
  %16 = load i32, ptr %sz, align 4
  %17 = load i32, ptr %sz, align 4
  %18 = icmp ne i32 %17, 8
  br i1 %18, label %then4, label %else5

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4
  %19 = load i32, ptr %err, align 4
  br label %if.end6

else5:                                            ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %else5, %then4
  store i32 8, ptr %sz, align 4
  %20 = load i32, ptr %sz, align 4
  %21 = load i32, ptr %sz, align 4
  %22 = icmp ne i32 %21, 8
  br i1 %22, label %then7, label %else8

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4
  %23 = load i32, ptr %err, align 4
  br label %if.end9

else8:                                            ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %else8, %then7
  %24 = call i64 @strlen(ptr @0)
  store i64 %24, ptr %len, align 4
  %25 = load i64, ptr %len, align 4
  %26 = load i64, ptr %len, align 4
  %27 = icmp ne i64 %26, 2
  br i1 %27, label %then10, label %else11

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4
  %28 = load i32, ptr %err, align 4
  br label %if.end12

else11:                                           ; preds = %if.end9
  br label %if.end12

if.end12:                                         ; preds = %else11, %then10
  %29 = getelementptr %struct.Employee, ptr %worker, i32 0, i32 0
  %30 = load i32, ptr %29, align 4
  store i32 %30, ptr %id, align 4
  %31 = load i32, ptr %id, align 4
  %32 = load i32, ptr %id, align 4
  %33 = icmp ne i32 %32, 11
  br i1 %33, label %then13, label %else14

then13:                                           ; preds = %if.end12
  store i32 1, ptr %err, align 4
  %34 = load i32, ptr %err, align 4
  br label %if.end15

else14:                                           ; preds = %if.end12
  br label %if.end15

if.end15:                                         ; preds = %else14, %then13
  %35 = load ptr, ptr %workerPtr, align 8
  %36 = getelementptr %struct.Employee, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %id, align 4
  %38 = load i32, ptr %id, align 4
  %39 = load i32, ptr %id, align 4
  %40 = icmp ne i32 %39, 11
  br i1 %40, label %then16, label %else17

then16:                                           ; preds = %if.end15
  store i32 1, ptr %err, align 4
  %41 = load i32, ptr %err, align 4
  br label %if.end18

else17:                                           ; preds = %if.end15
  br label %if.end18

if.end18:                                         ; preds = %else17, %then16
  %42 = load ptr, ptr %workerPtr, align 8
  %43 = getelementptr %struct.Employee, ptr %42, i32 0, i32 1
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  store i32 %45, ptr %sex, align 4
  %46 = load i32, ptr %sex, align 4
  %47 = load i32, ptr %sex, align 4
  %48 = icmp ne i32 %47, 70
  br i1 %48, label %then19, label %else20

then19:                                           ; preds = %if.end18
  store i32 1, ptr %err, align 4
  %49 = load i32, ptr %err, align 4
  br label %if.end21

else20:                                           ; preds = %if.end18
  br label %if.end21

if.end21:                                         ; preds = %else20, %then19
  %50 = getelementptr %struct.Point, ptr %origin, i32 0, i32 0
  %51 = load i32, ptr %50, align 4
  store i32 %51, ptr %id, align 4
  %52 = load i32, ptr %id, align 4
  %53 = load i32, ptr %id, align 4
  %54 = icmp ne i32 %53, 3
  br i1 %54, label %then22, label %else23

then22:                                           ; preds = %if.end21
  store i32 1, ptr %err, align 4
  %55 = load i32, ptr %err, align 4
  br label %if.end24

else23:                                           ; preds = %if.end21
  br label %if.end24

if.end24:                                         ; preds = %else23, %then22
  %56 = getelementptr %struct.Point, ptr %origin, i32 0, i32 1
  %57 = load i32, ptr %56, align 4
  store i32 %57, ptr %sex, align 4
  %58 = load i32, ptr %sex, align 4
  %59 = load i32, ptr %sex, align 4
  %60 = icmp ne i32 %59, 4
  br i1 %60, label %then25, label %else26

then25:                                           ; preds = %if.end24
  store i32 1, ptr %err, align 4
  %61 = load i32, ptr %err, align 4
  br label %if.end27

else26:                                           ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %else26, %then25
  %62 = load i32, ptr %err, align 4
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %then28, label %else29

then28:                                           ; preds = %if.end27
  %64 = call i32 (ptr, ...) @printf(ptr @1)
  br label %if.end30

else29:                                           ; preds = %if.end27
  %65 = call i32 (ptr, ...) @printf(ptr @2)
  br label %if.end30

if.end30:                                         ; preds = %else29, %then28
  %66 = load i32, ptr %err, align 4
  ret i32 %66
}
