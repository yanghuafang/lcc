; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"1.builtin_types.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %const18 = bitcast i64 -1234567890 to i64
  %const17 = bitcast i64 9876043210 to i64
  %const16 = bitcast i32 -12345678 to i32
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
  store i32 %const16, i32* %in, align 4
  store i64 %const18, i64* %ln, align 4
  store i8 -6, i8* %uch, align 1
  store i32 %const, i32* %uint, align 4
  store i64 %const17, i64* %uln, align 4
  store float 0x400921FB40000000, float* %fl, align 4
  store double 0x400921FB54442D11, double* %db, align 8
  store i1 true, i1* %bt, align 1
  store i1 false, i1* %bf, align 1
  %0 = load i8, i8* %ch, align 1
  %1 = icmp ne i8 %0, 65
  br i1 %1, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %2 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %3 = load i32, i32* %in, align 4
  %4 = icmp ne i32 %3, %const16
  br i1 %4, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %5 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %6 = load i64, i64* %ln, align 4
  %7 = icmp ne i64 %6, %const18
  br i1 %7, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %8 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %9 = load i32, i32* %uint, align 4
  %10 = icmp ne i32 %9, %const
  br i1 %10, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %11 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i64, i64* %uln, align 4
  %13 = icmp ne i64 %12, %const17
  br i1 %13, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %14 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4
  %16 = icmp eq i32 %15, 0
  %. = select i1 %16, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %17 = call i32 (i8*, ...) @printf(i8* %.)
  %18 = load i32, i32* %err, align 4
  ret i32 %18
}
