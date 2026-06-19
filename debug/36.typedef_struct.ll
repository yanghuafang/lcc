; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Employee = type { i32, i8 }
%struct.Point = type { i32, i32 }

@0 = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@1 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [26 x i8] c"36.typedef_struct.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

declare void* @malloc(i64)

declare i64 @strlen(i8*)

define void @fill_employee(%struct.Employee* %0, i32 %1, i8 %2) {
entry:
  %sex = alloca i8, align 1
  %id = alloca i32, align 4
  %employee = alloca %struct.Employee*, align 8
  store %struct.Employee* %0, %struct.Employee** %employee, align 8
  store i32 %1, i32* %id, align 4
  store i8 %2, i8* %sex, align 1
  %3 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %4 = bitcast %struct.Employee* %3 to i32*
  %5 = load i32, i32* %id, align 4
  store i32 %5, i32* %4, align 4
  %6 = load i32, i32* %4, align 4
  %7 = load %struct.Employee*, %struct.Employee** %employee, align 8
  %8 = getelementptr %struct.Employee, %struct.Employee* %7, i32 0, i32 1
  %9 = load i8, i8* %sex, align 1
  store i8 %9, i8* %8, align 1
  %10 = load i8, i8* %8, align 1
  ret void
}

define i32 @main() {
entry:
  %len = alloca i64, align 8
  %sex = alloca i32, align 4
  %id = alloca i32, align 4
  %sz = alloca i32, align 4
  %origin = alloca %struct.Point, align 8
  %workerPtr = alloca %struct.Employee*, align 8
  %worker = alloca %struct.Employee, align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = getelementptr %struct.Employee, %struct.Employee* %worker, i32 0, i32 1
  store i8 77, i8* %0, align 1
  %1 = load i8, i8* %0, align 1
  store %struct.Employee* %worker, %struct.Employee** %workerPtr, align 8
  %2 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  %3 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  call void @fill_employee(%struct.Employee* %3, i32 11, i8 70)
  %4 = bitcast %struct.Point* %origin to i32*
  store i32 3, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1
  store i32 4, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  store i32 8, i32* %sz, align 4
  %8 = load i32, i32* %sz, align 4
  %9 = load i32, i32* %sz, align 4
  %10 = icmp ne i32 %9, 8
  br i1 %10, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  store i32 8, i32* %sz, align 4
  %12 = load i32, i32* %sz, align 4
  %13 = load i32, i32* %sz, align 4
  %14 = icmp ne i32 %13, 8
  br i1 %14, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %15 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  store i32 8, i32* %sz, align 4
  %16 = load i32, i32* %sz, align 4
  %17 = load i32, i32* %sz, align 4
  %18 = icmp ne i32 %17, 8
  br i1 %18, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  store i32 8, i32* %sz, align 4
  %20 = load i32, i32* %sz, align 4
  %21 = load i32, i32* %sz, align 4
  %22 = icmp ne i32 %21, 8
  br i1 %22, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %24 = call i64 @strlen(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0))
  store i64 %24, i64* %len, align 4
  %25 = load i64, i64* %len, align 4
  %26 = load i64, i64* %len, align 4
  %27 = icmp ne i64 %26, 2
  br i1 %27, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %29 = bitcast %struct.Employee* %worker to i32*
  %30 = load i32, i32* %29, align 4
  store i32 %30, i32* %id, align 4
  %31 = load i32, i32* %id, align 4
  %32 = load i32, i32* %id, align 4
  %33 = icmp ne i32 %32, 11
  br i1 %33, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %34 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %35 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  %36 = bitcast %struct.Employee* %35 to i32*
  %37 = load i32, i32* %36, align 4
  store i32 %37, i32* %id, align 4
  %38 = load i32, i32* %id, align 4
  %39 = load i32, i32* %id, align 4
  %40 = icmp ne i32 %39, 11
  br i1 %40, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %41 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %42 = load %struct.Employee*, %struct.Employee** %workerPtr, align 8
  %43 = getelementptr %struct.Employee, %struct.Employee* %42, i32 0, i32 1
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  store i32 %45, i32* %sex, align 4
  %46 = load i32, i32* %sex, align 4
  %47 = load i32, i32* %sex, align 4
  %48 = icmp ne i32 %47, 70
  br i1 %48, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %49 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %50 = bitcast %struct.Point* %origin to i32*
  %51 = load i32, i32* %50, align 4
  store i32 %51, i32* %id, align 4
  %52 = load i32, i32* %id, align 4
  %53 = load i32, i32* %id, align 4
  %54 = icmp ne i32 %53, 3
  br i1 %54, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %55 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %56 = getelementptr %struct.Point, %struct.Point* %origin, i32 0, i32 1
  %57 = load i32, i32* %56, align 4
  store i32 %57, i32* %sex, align 4
  %58 = load i32, i32* %sex, align 4
  %59 = load i32, i32* %sex, align 4
  %60 = icmp ne i32 %59, 4
  br i1 %60, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %61 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %62 = load i32, i32* %err, align 4
  %63 = icmp eq i32 %62, 0
  %. = select i1 %63, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0)
  %64 = call i32 (i8*, ...) @printf(i8* %.)
  %65 = load i32, i32* %err, align 4
  ret i32 %65
}
