; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %const30 = bitcast i64 -1234567890 to i64
  %const29 = bitcast i64 9876043210 to i64
  %const28 = bitcast i32 -12345678 to i32
  %const = bitcast i32 180150000 to i32
  %bf = alloca i1, align 1
  %bt = alloca i1, align 1
  %db = alloca double, align 8
  %fl = alloca float, align 4
  %uln = alloca i64, align 8
  %uint = alloca i32, align 4
  %uch = alloca i8, align 1
  %ln = alloca i64, align 8
  %in = alloca i32, align 4
  %sh = alloca i16, align 2
  %ch = alloca i8, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  store i8 65, i8* %ch, align 1
  store i16 -1024, i16* %sh, align 2
  store i32 %const28, i32* %in, align 4
  store i64 %const30, i64* %ln, align 4
  store i8 -6, i8* %uch, align 1
  store i32 %const, i32* %uint, align 4
  store i64 %const29, i64* %uln, align 4
  store float 0x400921FB40000000, float* %fl, align 4
  store double 0x400921FB54442D11, double* %db, align 8
  store i1 true, i1* %bt, align 1
  store i1 false, i1* %bf, align 1
  %0 = load i8, i8* %ch, align 1
  %1 = sext i8 %0 to i32
  %2 = icmp ne i32 %1, 65
  br i1 %2, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %3 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %4 = load i16, i16* %sh, align 2
  %5 = sext i16 %4 to i32
  %6 = icmp ne i32 %5, -1024
  br i1 %6, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %7 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i32, i32* %in, align 4
  %9 = icmp ne i32 %8, %const28
  br i1 %9, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %10 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %11 = load i64, i64* %ln, align 4
  %12 = icmp ne i64 %11, %const30
  br i1 %12, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %13 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %14 = load i8, i8* %uch, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 250
  br i1 %16, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %18 = load i32, i32* %uint, align 4
  %19 = icmp ne i32 %18, %const
  br i1 %19, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %20 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %21 = load i64, i64* %uln, align 4
  %22 = icmp ne i64 %21, %const29
  br i1 %22, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %24 = load i1, i1* %bt, align 1
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 1
  br i1 %26, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %27 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %28 = load i1, i1* %bf, align 1
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %31 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %32 = load i32, i32* %err, align 4
  %33 = icmp eq i32 %32, 0
  %. = select i1 %33, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %34 = call i32 (i8*, ...) @printf(i8* %.)
  %35 = load i32, i32* %err, align 4
  ret i32 %35
}
