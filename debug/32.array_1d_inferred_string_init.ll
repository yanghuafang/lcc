; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [6 x i32] [i32 10, i32 7, i32 8, i32 9, i32 1, i32 5]
@gs = global [3 x i8] c"hi\00"
@gt = global [4 x i8] c"hey\00"
@0 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [41 x i8] c"32.array_1d_inferred_string_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %lb = alloca [6 x i8], align 1
  %ls = alloca [6 x i8], align 1
  %la = alloca [3 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [3 x i32]* %la to i32*
  store i32 1, i32* %0, align 4
  %1 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 1
  store i32 2, i32* %1, align 4
  %2 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 2
  store i32 3, i32* %2, align 4
  %3 = bitcast [6 x i8]* %ls to i8*
  store i8 104, i8* %3, align 1
  %4 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 1
  store i8 101, i8* %4, align 1
  %5 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 2
  store i8 108, i8* %5, align 1
  %6 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 3
  store i8 108, i8* %6, align 1
  %7 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 4
  store i8 111, i8* %7, align 1
  %8 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 5
  store i8 0, i8* %8, align 1
  %9 = bitcast [6 x i8]* %lb to i8*
  store i8 104, i8* %9, align 1
  %10 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 1
  store i8 101, i8* %10, align 1
  %11 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 2
  store i8 108, i8* %11, align 1
  %12 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 3
  store i8 108, i8* %12, align 1
  %13 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 4
  store i8 111, i8* %13, align 1
  %14 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 5
  store i8 0, i8* %14, align 1
  %15 = bitcast [3 x i32]* %la to i32*
  %16 = bitcast i32* %15 to i32*
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 1
  br i1 %18, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %19 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %20 = bitcast [3 x i32]* %la to i32*
  %21 = getelementptr i32, i32* %20, i32 1
  %22 = load i32, i32* %21, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %24 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %25 = bitcast [3 x i32]* %la to i32*
  %26 = getelementptr i32, i32* %25, i32 2
  %27 = load i32, i32* %26, align 4
  %28 = icmp ne i32 %27, 3
  br i1 %28, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %29 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %30 = bitcast [6 x i8]* %ls to i8*
  %31 = bitcast i8* %30 to i8*
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 104
  br i1 %34, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %35 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %36 = bitcast [6 x i8]* %ls to i8*
  %37 = getelementptr i8, i8* %36, i32 1
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 101
  br i1 %40, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %41 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %42 = bitcast [6 x i8]* %ls to i8*
  %43 = getelementptr i8, i8* %42, i32 2
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp ne i32 %45, 108
  br i1 %46, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %47 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %48 = bitcast [6 x i8]* %ls to i8*
  %49 = getelementptr i8, i8* %48, i32 3
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 108
  br i1 %52, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %53 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %54 = bitcast [6 x i8]* %ls to i8*
  %55 = getelementptr i8, i8* %54, i32 4
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp ne i32 %57, 111
  br i1 %58, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %59 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %60 = bitcast [6 x i8]* %ls to i8*
  %61 = getelementptr i8, i8* %60, i32 5
  %62 = load i8, i8* %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %65 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %66 = bitcast [6 x i8]* %lb to i8*
  %67 = bitcast i8* %66 to i8*
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp ne i32 %69, 104
  br i1 %70, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %71 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %72 = bitcast [6 x i8]* %lb to i8*
  %73 = getelementptr i8, i8* %72, i32 5
  %74 = load i8, i8* %73, align 1
  %75 = sext i8 %74 to i32
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %77 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 0), align 4
  %79 = icmp ne i32 %78, 10
  br i1 %79, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %80 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 1), align 4
  %82 = icmp ne i32 %81, 7
  br i1 %82, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %83 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %84 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 2), align 4
  %85 = icmp ne i32 %84, 8
  br i1 %85, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %86 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  %87 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 3), align 4
  %88 = icmp ne i32 %87, 9
  br i1 %88, label %then40, label %if.end42

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4
  %89 = load i32, i32* %err, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end39, %then40
  %90 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 4), align 4
  %91 = icmp ne i32 %90, 1
  br i1 %91, label %then43, label %if.end45

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4
  %92 = load i32, i32* %err, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.end42, %then43
  %93 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 5), align 4
  %94 = icmp ne i32 %93, 5
  br i1 %94, label %then46, label %if.end48

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4
  %95 = load i32, i32* %err, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.end45, %then46
  %96 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 0), align 1
  %97 = sext i8 %96 to i32
  %98 = icmp ne i32 %97, 104
  br i1 %98, label %then49, label %if.end51

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4
  %99 = load i32, i32* %err, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.end48, %then49
  %100 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 1), align 1
  %101 = sext i8 %100 to i32
  %102 = icmp ne i32 %101, 105
  br i1 %102, label %then52, label %if.end54

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4
  %103 = load i32, i32* %err, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.end51, %then52
  %104 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 2), align 1
  %105 = sext i8 %104 to i32
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %then55, label %if.end57

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4
  %107 = load i32, i32* %err, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %then55
  %108 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 0), align 1
  %109 = sext i8 %108 to i32
  %110 = icmp ne i32 %109, 104
  br i1 %110, label %then58, label %if.end60

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4
  %111 = load i32, i32* %err, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.end57, %then58
  %112 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 1), align 1
  %113 = sext i8 %112 to i32
  %114 = icmp ne i32 %113, 101
  br i1 %114, label %then61, label %if.end63

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4
  %115 = load i32, i32* %err, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.end60, %then61
  %116 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 2), align 1
  %117 = sext i8 %116 to i32
  %118 = icmp ne i32 %117, 121
  br i1 %118, label %then64, label %if.end66

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4
  %119 = load i32, i32* %err, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.end63, %then64
  %120 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 3), align 1
  %121 = sext i8 %120 to i32
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %then67, label %if.end69

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4
  %123 = load i32, i32* %err, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.end66, %then67
  %124 = load i32, i32* %err, align 4
  %125 = icmp eq i32 %124, 0
  %. = select i1 %125, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0)
  %126 = call i32 (i8*, ...) @printf(i8* %.)
  %127 = load i32, i32* %err, align 4
  ret i32 %127
}
