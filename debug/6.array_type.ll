; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gs = global [16 x i8] undef
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0)
@gi = global [4 x i32] undef
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %i = alloca [4 x i32], align 4
  %s = alloca [16 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [16 x i8]* %s to i8*
  %1 = bitcast i8* %0 to i8*
  store i8 103, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = bitcast [16 x i8]* %s to i8*
  %4 = getelementptr i8, i8* %3, i32 1
  store i8 111, i8* %4, align 1
  %5 = load i8, i8* %4, align 1
  %6 = bitcast [16 x i8]* %s to i8*
  %7 = getelementptr i8, i8* %6, i32 2
  store i8 111, i8* %7, align 1
  %8 = load i8, i8* %7, align 1
  %9 = bitcast [16 x i8]* %s to i8*
  %10 = getelementptr i8, i8* %9, i32 3
  store i8 100, i8* %10, align 1
  %11 = load i8, i8* %10, align 1
  %12 = bitcast [16 x i8]* %s to i8*
  %13 = getelementptr i8, i8* %12, i32 4
  store i8 0, i8* %13, align 1
  %14 = load i8, i8* %13, align 1
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  %15 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1
  %16 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1
  %17 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1
  %18 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1
  %19 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1
  %20 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1
  %21 = bitcast [4 x i32]* %i to i32*
  %22 = bitcast i32* %21 to i32*
  store i32 128, i32* %22, align 4
  %23 = load i32, i32* %22, align 4
  %24 = bitcast [4 x i32]* %i to i32*
  %25 = getelementptr i32, i32* %24, i32 1
  store i32 256, i32* %25, align 4
  %26 = load i32, i32* %25, align 4
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  %27 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %28 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %29 = bitcast [4 x i32]* %i to i32*
  %30 = bitcast i32* %29 to i32*
  %31 = load i32, i32* %30, align 4
  %32 = icmp ne i32 %31, 128
  br i1 %32, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %34 = bitcast [4 x i32]* %i to i32*
  %35 = getelementptr i32, i32* %34, i32 1
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %36, 256
  br i1 %37, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %38 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %39 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4
  %40 = icmp ne i32 %39, 1024
  br i1 %40, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %41 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %42 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4
  %43 = icmp ne i32 %42, 2048
  br i1 %43, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %44 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %45 = bitcast [16 x i8]* %s to i8*
  %46 = bitcast i8* %45 to i8*
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp ne i32 %48, 103
  br i1 %49, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %50 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %51 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1
  %52 = sext i8 %51 to i32
  %53 = icmp ne i32 %52, 108
  br i1 %53, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %54 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %55 = bitcast [4 x i32]* %i to i32*
  %56 = getelementptr i32, i32* %55, i32 2
  store i32 0, i32* %56, align 4
  %57 = load i32, i32* %56, align 4
  %58 = bitcast [4 x i32]* %i to i32*
  %59 = getelementptr i32, i32* %58, i32 3
  store i32 -1, i32* %59, align 4
  %60 = load i32, i32* %59, align 4
  %61 = bitcast [4 x i32]* %i to i32*
  %62 = getelementptr i32, i32* %61, i32 2
  %63 = load i32, i32* %62, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %65 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %66 = bitcast [4 x i32]* %i to i32*
  %67 = getelementptr i32, i32* %66, i32 3
  %68 = load i32, i32* %67, align 4
  %69 = icmp ne i32 %68, -1
  br i1 %69, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %70 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %71 = load i32, i32* %err, align 4
  %72 = icmp eq i32 %71, 0
  %. = select i1 %72, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @2, i32 0, i32 0)
  %73 = call i32 (i8*, ...) @printf(i8* %.)
  %74 = load i32, i32* %err, align 4
  ret i32 %74
}
