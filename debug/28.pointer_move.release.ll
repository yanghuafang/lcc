; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %pc = alloca i8*, align 8
  %c = alloca [4 x i8], align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [4 x i8]* %c to i8*
  %1 = bitcast i8* %0 to i8*
  store i8 65, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = bitcast [4 x i8]* %c to i8*
  %4 = getelementptr i8, i8* %3, i32 1
  store i8 66, i8* %4, align 1
  %5 = load i8, i8* %4, align 1
  %6 = bitcast [4 x i8]* %c to i8*
  %7 = getelementptr i8, i8* %6, i32 2
  store i8 67, i8* %7, align 1
  %8 = load i8, i8* %7, align 1
  %9 = bitcast [4 x i8]* %c to i8*
  %10 = getelementptr i8, i8* %9, i32 3
  store i8 68, i8* %10, align 1
  %11 = load i8, i8* %10, align 1
  %12 = bitcast [4 x i8]* %c to i8*
  store i8* %12, i8** %pc, align 8
  %13 = load i8*, i8** %pc, align 8
  %14 = load i8, i8* %13, align 1
  %15 = icmp ne i8 %14, 65
  br i1 %15, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %16 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %17 = load i8*, i8** %pc, align 8
  %18 = getelementptr i8, i8* %17, i32 1
  store i8* %18, i8** %pc, align 8
  %19 = load i8*, i8** %pc, align 8
  %20 = load i8*, i8** %pc, align 8
  %21 = load i8, i8* %20, align 1
  %22 = icmp ne i8 %21, 66
  br i1 %22, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %24 = load i8*, i8** %pc, align 8
  %25 = getelementptr i8, i8* %24, i32 1
  store i8* %25, i8** %pc, align 8
  %26 = load i8*, i8** %pc, align 8
  %27 = load i8*, i8** %pc, align 8
  %28 = load i8, i8* %27, align 1
  %29 = icmp ne i8 %28, 67
  br i1 %29, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %30 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %31 = load i8*, i8** %pc, align 8
  %32 = getelementptr i8, i8* %31, i32 1
  store i8* %32, i8** %pc, align 8
  %33 = load i8*, i8** %pc, align 8
  %34 = load i8, i8* %33, align 1
  %35 = icmp ne i8 %34, 68
  br i1 %35, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %36 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %37 = bitcast [4 x i8]* %c to i8*
  %38 = getelementptr i8, i8* %37, i32 3
  store i8* %38, i8** %pc, align 8
  %39 = load i8*, i8** %pc, align 8
  %40 = load i8*, i8** %pc, align 8
  %41 = load i8, i8* %40, align 1
  %42 = icmp ne i8 %41, 68
  br i1 %42, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %43 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %44 = load i8*, i8** %pc, align 8
  %45 = getelementptr i8, i8* %44, i32 -1
  store i8* %45, i8** %pc, align 8
  %46 = load i8*, i8** %pc, align 8
  %47 = load i8*, i8** %pc, align 8
  %48 = load i8, i8* %47, align 1
  %49 = icmp ne i8 %48, 67
  br i1 %49, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %50 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %51 = load i8*, i8** %pc, align 8
  %52 = getelementptr i8, i8* %51, i32 -1
  store i8* %52, i8** %pc, align 8
  %53 = load i8*, i8** %pc, align 8
  %54 = load i8*, i8** %pc, align 8
  %55 = load i8, i8* %54, align 1
  %56 = icmp ne i8 %55, 66
  br i1 %56, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %57 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %58 = load i8*, i8** %pc, align 8
  %59 = getelementptr i8, i8* %58, i32 -1
  store i8* %59, i8** %pc, align 8
  %60 = load i8*, i8** %pc, align 8
  %61 = load i8, i8* %60, align 1
  %62 = icmp ne i8 %61, 65
  br i1 %62, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %63 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %64 = load i32, i32* %err, align 4
  %65 = icmp eq i32 %64, 0
  %. = select i1 %65, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %66 = call i32 (i8*, ...) @printf(i8* %.)
  %67 = load i32, i32* %err, align 4
  ret i32 %67
}
