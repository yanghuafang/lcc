; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %lc = alloca [2 x i32], align 4
  %lb = alloca [3 x i32], align 4
  %la = alloca [4 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [4 x i32]* %la to i32*
  store i32 1, i32* %0, align 4
  %1 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 1
  store i32 2, i32* %1, align 4
  %2 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 2
  store i32 3, i32* %2, align 4
  %3 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 3
  store i32 0, i32* %3, align 4
  %4 = bitcast [3 x i32]* %lb to i32*
  store i32 4, i32* %4, align 4
  %5 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 1
  store i32 5, i32* %5, align 4
  %6 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 2
  store i32 6, i32* %6, align 4
  %7 = bitcast [2 x i32]* %lc to i32*
  store i32 0, i32* %7, align 4
  %8 = getelementptr [2 x i32], [2 x i32]* %lc, i32 0, i32 1
  store i32 0, i32* %8, align 4
  %9 = bitcast [4 x i32]* %la to i32*
  %10 = bitcast i32* %9 to i32*
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 1
  br i1 %12, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %13 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %14 = bitcast [4 x i32]* %la to i32*
  %15 = getelementptr i32, i32* %14, i32 1
  %16 = load i32, i32* %15, align 4
  %17 = icmp ne i32 %16, 2
  br i1 %17, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %18 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %19 = bitcast [4 x i32]* %la to i32*
  %20 = getelementptr i32, i32* %19, i32 2
  %21 = load i32, i32* %20, align 4
  %22 = icmp ne i32 %21, 3
  br i1 %22, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %23 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %24 = bitcast [4 x i32]* %la to i32*
  %25 = getelementptr i32, i32* %24, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %29 = bitcast [3 x i32]* %lb to i32*
  %30 = bitcast i32* %29 to i32*
  %31 = load i32, i32* %30, align 4
  %32 = icmp ne i32 %31, 4
  br i1 %32, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %33 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %34 = bitcast [3 x i32]* %lb to i32*
  %35 = getelementptr i32, i32* %34, i32 1
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %36, 5
  br i1 %37, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %38 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %39 = bitcast [3 x i32]* %lb to i32*
  %40 = getelementptr i32, i32* %39, i32 2
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %41, 6
  br i1 %42, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %43 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %44 = bitcast [2 x i32]* %lc to i32*
  %45 = bitcast i32* %44 to i32*
  %46 = load i32, i32* %45, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %48 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %49 = bitcast [2 x i32]* %lc to i32*
  %50 = getelementptr i32, i32* %49, i32 1
  %51 = load i32, i32* %50, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %53 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %54 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 0), align 4
  %55 = icmp ne i32 %54, 1
  br i1 %55, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %56 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %57 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 1), align 4
  %58 = icmp ne i32 %57, 2
  br i1 %58, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %59 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %60 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 2), align 4
  %61 = icmp ne i32 %60, 3
  br i1 %61, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %62 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  %63 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 3), align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %65 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %66 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 0), align 4
  %67 = icmp ne i32 %66, 10
  br i1 %67, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %68 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  %69 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 1), align 4
  %70 = icmp ne i32 %69, 20
  br i1 %70, label %then40, label %if.end42

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4
  %71 = load i32, i32* %err, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end39, %then40
  %72 = load i32, i32* %err, align 4
  %73 = icmp eq i32 %72, 0
  %. = select i1 %73, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0)
  %74 = call i32 (i8*, ...) @printf(i8* %.)
  %75 = load i32, i32* %err, align 4
  ret i32 %75
}
