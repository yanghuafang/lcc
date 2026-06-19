; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

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
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 65
  br i1 %16, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %17 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %18 = load i8*, i8** %pc, align 8
  %19 = getelementptr i8, i8* %18, i32 1
  store i8* %19, i8** %pc, align 8
  %20 = load i8*, i8** %pc, align 8
  %21 = load i8*, i8** %pc, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 66
  br i1 %24, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %25 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %26 = load i8*, i8** %pc, align 8
  %27 = getelementptr i8, i8* %26, i32 1
  store i8* %27, i8** %pc, align 8
  %28 = load i8*, i8** %pc, align 8
  %29 = load i8*, i8** %pc, align 8
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 67
  br i1 %32, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %34 = load i8*, i8** %pc, align 8
  %35 = getelementptr i8, i8* %34, i32 1
  store i8* %35, i8** %pc, align 8
  %36 = load i8*, i8** %pc, align 8
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 68
  br i1 %39, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %40 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [4 x i8]* %c to i8*
  %42 = getelementptr i8, i8* %41, i32 3
  store i8* %42, i8** %pc, align 8
  %43 = load i8*, i8** %pc, align 8
  %44 = load i8*, i8** %pc, align 8
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp ne i32 %46, 68
  br i1 %47, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %48 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %49 = load i8*, i8** %pc, align 8
  %50 = getelementptr i8, i8* %49, i32 -1
  store i8* %50, i8** %pc, align 8
  %51 = load i8*, i8** %pc, align 8
  %52 = load i8*, i8** %pc, align 8
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 67
  br i1 %55, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %56 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %57 = load i8*, i8** %pc, align 8
  %58 = getelementptr i8, i8* %57, i32 -1
  store i8* %58, i8** %pc, align 8
  %59 = load i8*, i8** %pc, align 8
  %60 = load i8*, i8** %pc, align 8
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp ne i32 %62, 66
  br i1 %63, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %64 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %65 = load i8*, i8** %pc, align 8
  %66 = getelementptr i8, i8* %65, i32 -1
  store i8* %66, i8** %pc, align 8
  %67 = load i8*, i8** %pc, align 8
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp ne i32 %69, 65
  br i1 %70, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %71 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %72 = load i32, i32* %err, align 4
  %73 = icmp eq i32 %72, 0
  %. = select i1 %73, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0)
  %74 = call i32 (i8*, ...) @printf(i8* %.)
  %75 = load i32, i32* %err, align 4
  ret i32 %75
}
