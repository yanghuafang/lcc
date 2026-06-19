; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %data = alloca i32, align 4
  %id = alloca i32, align 4
  %da = alloca [2 x %struct.Data], align 8
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %1 = bitcast %struct.Data* %0 to %struct.Data*
  %2 = bitcast %struct.Data* %1 to i32*
  store i32 0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %5 = bitcast %struct.Data* %4 to %struct.Data*
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1
  store i32 0, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1
  %10 = bitcast %struct.Data* %9 to i32*
  store i32 10, i32* %10, align 4
  %11 = load i32, i32* %10, align 4
  %12 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1
  store i32 80, i32* %14, align 4
  %15 = load i32, i32* %14, align 4
  %16 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 1
  %18 = bitcast %struct.Data* %17 to i32*
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %id, align 4
  %20 = load i32, i32* %id, align 4
  %21 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 1
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %data, align 4
  %25 = load i32, i32* %data, align 4
  %26 = load i32, i32* %id, align 4
  %27 = icmp ne i32 %26, 10
  br i1 %27, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %29 = load i32, i32* %data, align 4
  %30 = icmp ne i32 %29, 80
  br i1 %30, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %31 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %33 = bitcast %struct.Data* %32 to %struct.Data*
  %34 = bitcast %struct.Data* %33 to i32*
  %35 = load i32, i32* %34, align 4
  store i32 %35, i32* %id, align 4
  %36 = load i32, i32* %id, align 4
  %37 = bitcast [2 x %struct.Data]* %da to %struct.Data*
  %38 = bitcast %struct.Data* %37 to %struct.Data*
  %39 = getelementptr %struct.Data, %struct.Data* %38, i32 0, i32 1
  %40 = load i32, i32* %39, align 4
  store i32 %40, i32* %data, align 4
  %41 = load i32, i32* %data, align 4
  %42 = load i32, i32* %id, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %44 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %45 = load i32, i32* %data, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %47 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %48 = load i32, i32* %err, align 4
  %49 = icmp eq i32 %48, 0
  %. = select i1 %49, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %50 = call i32 (i8*, ...) @printf(i8* %.)
  %51 = load i32, i32* %err, align 4
  ret i32 %51
}
