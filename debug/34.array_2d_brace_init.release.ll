; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.6.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@gd = global [2 x [2 x i32]] zeroinitializer
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %ld = alloca [2 x [2 x i32]], align 4
  %lc = alloca [2 x [3 x i32]], align 4
  %lb = alloca [2 x [3 x i32]], align 4
  %la = alloca [2 x [3 x i32]], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4
  %0 = bitcast [2 x [3 x i32]]* %la to i32*
  store i32 1, i32* %0, align 4
  %1 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 1
  store i32 2, i32* %1, align 4
  %2 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 2
  store i32 0, i32* %2, align 4
  %3 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 0
  store i32 3, i32* %3, align 4
  %4 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 1
  store i32 0, i32* %4, align 4
  %5 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 2
  store i32 0, i32* %5, align 4
  %6 = bitcast [2 x [3 x i32]]* %lb to i32*
  store i32 7, i32* %6, align 4
  %7 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 1
  store i32 8, i32* %7, align 4
  %8 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 2
  store i32 9, i32* %8, align 4
  %9 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 0
  store i32 10, i32* %9, align 4
  %10 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 1
  store i32 11, i32* %10, align 4
  %11 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 2
  store i32 12, i32* %11, align 4
  %12 = bitcast [2 x [3 x i32]]* %lc to i32*
  store i32 1, i32* %12, align 4
  %13 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 1
  store i32 2, i32* %13, align 4
  %14 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 2
  store i32 3, i32* %14, align 4
  %15 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 0
  store i32 4, i32* %15, align 4
  %16 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 1
  store i32 0, i32* %16, align 4
  %17 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 2
  store i32 0, i32* %17, align 4
  %18 = bitcast [2 x [2 x i32]]* %ld to i32*
  store i32 0, i32* %18, align 4
  %19 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %ld, i32 0, i32 0, i32 1
  store i32 0, i32* %19, align 4
  %20 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %ld, i32 0, i32 1, i32 0
  store i32 0, i32* %20, align 4
  %21 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %ld, i32 0, i32 1, i32 1
  store i32 0, i32* %21, align 4
  %22 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %23 = bitcast [3 x i32]* %22 to [3 x i32]*
  %24 = bitcast [3 x i32]* %23 to i32*
  %25 = bitcast i32* %24 to i32*
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %then, label %if.end

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4
  %28 = load i32, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %then
  %29 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %30 = bitcast [3 x i32]* %29 to [3 x i32]*
  %31 = bitcast [3 x i32]* %30 to i32*
  %32 = getelementptr i32, i32* %31, i32 2
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %then1, label %if.end3

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4
  %35 = load i32, i32* %err, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %then1
  %36 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %37 = getelementptr [3 x i32], [3 x i32]* %36, i32 1
  %38 = bitcast [3 x i32]* %37 to i32*
  %39 = bitcast i32* %38 to i32*
  %40 = load i32, i32* %39, align 4
  %41 = icmp ne i32 %40, 3
  br i1 %41, label %then4, label %if.end6

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4
  %42 = load i32, i32* %err, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %then4
  %43 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*
  %44 = getelementptr [3 x i32], [3 x i32]* %43, i32 1
  %45 = bitcast [3 x i32]* %44 to i32*
  %46 = getelementptr i32, i32* %45, i32 2
  %47 = load i32, i32* %46, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %then7, label %if.end9

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4
  %49 = load i32, i32* %err, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %then7
  %50 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*
  %51 = bitcast [3 x i32]* %50 to [3 x i32]*
  %52 = bitcast [3 x i32]* %51 to i32*
  %53 = bitcast i32* %52 to i32*
  %54 = load i32, i32* %53, align 4
  %55 = icmp ne i32 %54, 7
  br i1 %55, label %then10, label %if.end12

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4
  %56 = load i32, i32* %err, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end9, %then10
  %57 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*
  %58 = getelementptr [3 x i32], [3 x i32]* %57, i32 1
  %59 = bitcast [3 x i32]* %58 to i32*
  %60 = getelementptr i32, i32* %59, i32 2
  %61 = load i32, i32* %60, align 4
  %62 = icmp ne i32 %61, 12
  br i1 %62, label %then13, label %if.end15

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4
  %63 = load i32, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end12, %then13
  %64 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*
  %65 = bitcast [3 x i32]* %64 to [3 x i32]*
  %66 = bitcast [3 x i32]* %65 to i32*
  %67 = getelementptr i32, i32* %66, i32 2
  %68 = load i32, i32* %67, align 4
  %69 = icmp ne i32 %68, 3
  br i1 %69, label %then16, label %if.end18

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4
  %70 = load i32, i32* %err, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end15, %then16
  %71 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*
  %72 = getelementptr [3 x i32], [3 x i32]* %71, i32 1
  %73 = bitcast [3 x i32]* %72 to i32*
  %74 = bitcast i32* %73 to i32*
  %75 = load i32, i32* %74, align 4
  %76 = icmp ne i32 %75, 4
  br i1 %76, label %then19, label %if.end21

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4
  %77 = load i32, i32* %err, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end18, %then19
  %78 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*
  %79 = getelementptr [3 x i32], [3 x i32]* %78, i32 1
  %80 = bitcast [3 x i32]* %79 to i32*
  %81 = getelementptr i32, i32* %80, i32 2
  %82 = load i32, i32* %81, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %then22, label %if.end24

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4
  %84 = load i32, i32* %err, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %then22
  %85 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*
  %86 = bitcast [2 x i32]* %85 to [2 x i32]*
  %87 = bitcast [2 x i32]* %86 to i32*
  %88 = bitcast i32* %87 to i32*
  %89 = load i32, i32* %88, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %then25, label %if.end27

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4
  %91 = load i32, i32* %err, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %then25
  %92 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*
  %93 = bitcast [2 x i32]* %92 to [2 x i32]*
  %94 = bitcast [2 x i32]* %93 to i32*
  %95 = getelementptr i32, i32* %94, i32 1
  %96 = load i32, i32* %95, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %then28, label %if.end30

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4
  %98 = load i32, i32* %err, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %then28
  %99 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*
  %100 = getelementptr [2 x i32], [2 x i32]* %99, i32 1
  %101 = bitcast [2 x i32]* %100 to i32*
  %102 = bitcast i32* %101 to i32*
  %103 = load i32, i32* %102, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %then31, label %if.end33

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4
  %105 = load i32, i32* %err, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.end30, %then31
  %106 = bitcast [2 x [2 x i32]]* %ld to [2 x i32]*
  %107 = getelementptr [2 x i32], [2 x i32]* %106, i32 1
  %108 = bitcast [2 x i32]* %107 to i32*
  %109 = getelementptr i32, i32* %108, i32 1
  %110 = load i32, i32* %109, align 4
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %then34, label %if.end36

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4
  %112 = load i32, i32* %err, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %then34
  %113 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 0, i32 0), align 4
  %114 = icmp ne i32 %113, 1
  br i1 %114, label %then37, label %if.end39

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4
  %115 = load i32, i32* %err, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %then37
  %116 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 1, i32 2), align 4
  %117 = icmp ne i32 %116, 6
  br i1 %117, label %then40, label %if.end42

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4
  %118 = load i32, i32* %err, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end39, %then40
  %119 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 0, i32 1), align 4
  %120 = icmp ne i32 %119, 1
  br i1 %120, label %then43, label %if.end45

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4
  %121 = load i32, i32* %err, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.end42, %then43
  %122 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 1, i32 0), align 4
  %123 = icmp ne i32 %122, 3
  br i1 %123, label %then46, label %if.end48

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4
  %124 = load i32, i32* %err, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.end45, %then46
  %125 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 0, i32 1), align 4
  %126 = icmp ne i32 %125, 11
  br i1 %126, label %then49, label %if.end51

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4
  %127 = load i32, i32* %err, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.end48, %then49
  %128 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 0), align 4
  %129 = icmp ne i32 %128, 20
  br i1 %129, label %then52, label %if.end54

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4
  %130 = load i32, i32* %err, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.end51, %then52
  %131 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 1), align 4
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %then55, label %if.end57

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4
  %133 = load i32, i32* %err, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %then55
  %134 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 0, i32 0), align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %then58, label %if.end60

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4
  %136 = load i32, i32* %err, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.end57, %then58
  %137 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 0, i32 1), align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %then61, label %if.end63

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4
  %139 = load i32, i32* %err, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.end60, %then61
  %140 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 1, i32 0), align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %then64, label %if.end66

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4
  %142 = load i32, i32* %err, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.end63, %then64
  %143 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gd, i32 0, i32 1, i32 1), align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %then67, label %if.end69

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4
  %145 = load i32, i32* %err, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.end66, %then67
  %146 = load i32, i32* %err, align 4
  %147 = icmp eq i32 %146, 0
  %. = select i1 %147, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0)
  %148 = call i32 (i8*, ...) @printf(i8* %.)
  %149 = load i32, i32* %err, align 4
  ret i32 %149
}
