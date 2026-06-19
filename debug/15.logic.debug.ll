; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"15.logic.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"15.logic.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %ui = alloca i32, align 4
  %si = alloca i32, align 4
  %ub = alloca i32, align 4
  %ua = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %v = alloca i32, align 4
  %f = alloca i1, align 1
  %t = alloca i1, align 1
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  store i1 true, i1* %t, align 1, !dbg !7
  store i1 false, i1* %f, align 1, !dbg !7
  %0 = load i1, i1* %t, align 1, !dbg !7
  %1 = zext i1 %0 to i32, !dbg !7
  %2 = icmp eq i32 %1, 0, !dbg !7
  br i1 %2, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %3 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %4 = load i1, i1* %f, align 1, !dbg !7
  %5 = zext i1 %4 to i32, !dbg !7
  %6 = icmp ne i32 %5, 0, !dbg !7
  br i1 %6, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %7 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %8 = load i1, i1* %t, align 1, !dbg !7
  %9 = load i1, i1* %f, align 1, !dbg !7
  %10 = select i1 %8, i1 %9, i1 false, !dbg !7
  %11 = sext i1 %10 to i32, !dbg !7
  store i32 %11, i32* %v, align 4, !dbg !7
  %12 = load i32, i32* %v, align 4, !dbg !7
  %13 = load i32, i32* %v, align 4, !dbg !7
  %14 = icmp ne i32 %13, 0, !dbg !7
  br i1 %14, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %15 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %16 = load i1, i1* %t, align 1, !dbg !7
  %17 = load i1, i1* %t, align 1, !dbg !7
  %18 = select i1 %16, i1 %17, i1 false, !dbg !7
  %19 = sext i1 %18 to i32, !dbg !7
  store i32 %19, i32* %v, align 4, !dbg !7
  %20 = load i32, i32* %v, align 4, !dbg !7
  %21 = load i32, i32* %v, align 4, !dbg !7
  %22 = icmp eq i32 %21, 0, !dbg !7
  br i1 %22, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %23 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i1, i1* %f, align 1, !dbg !7
  %25 = load i1, i1* %f, align 1, !dbg !7
  %26 = select i1 %24, i1 %25, i1 false, !dbg !7
  %27 = sext i1 %26 to i32, !dbg !7
  store i32 %27, i32* %v, align 4, !dbg !7
  %28 = load i32, i32* %v, align 4, !dbg !7
  %29 = load i32, i32* %v, align 4, !dbg !7
  %30 = icmp ne i32 %29, 0, !dbg !7
  br i1 %30, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %31 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %32 = load i1, i1* %t, align 1, !dbg !7
  %33 = load i1, i1* %f, align 1, !dbg !7
  %34 = select i1 %32, i1 true, i1 %33, !dbg !7
  %35 = sext i1 %34 to i32, !dbg !7
  store i32 %35, i32* %v, align 4, !dbg !7
  %36 = load i32, i32* %v, align 4, !dbg !7
  %37 = load i32, i32* %v, align 4, !dbg !7
  %38 = icmp eq i32 %37, 0, !dbg !7
  br i1 %38, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %39 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %40 = load i1, i1* %t, align 1, !dbg !7
  %41 = load i1, i1* %t, align 1, !dbg !7
  %42 = select i1 %40, i1 true, i1 %41, !dbg !7
  %43 = sext i1 %42 to i32, !dbg !7
  store i32 %43, i32* %v, align 4, !dbg !7
  %44 = load i32, i32* %v, align 4, !dbg !7
  %45 = load i32, i32* %v, align 4, !dbg !7
  %46 = icmp eq i32 %45, 0, !dbg !7
  br i1 %46, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %47 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %48 = load i1, i1* %f, align 1, !dbg !7
  %49 = load i1, i1* %f, align 1, !dbg !7
  %50 = select i1 %48, i1 true, i1 %49, !dbg !7
  %51 = sext i1 %50 to i32, !dbg !7
  store i32 %51, i32* %v, align 4, !dbg !7
  %52 = load i32, i32* %v, align 4, !dbg !7
  %53 = load i32, i32* %v, align 4, !dbg !7
  %54 = icmp ne i32 %53, 0, !dbg !7
  br i1 %54, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %55 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %56 = load i1, i1* %t, align 1, !dbg !7
  %57 = icmp eq i1 %56, false, !dbg !7
  %58 = sext i1 %57 to i32, !dbg !7
  store i32 %58, i32* %v, align 4, !dbg !7
  %59 = load i32, i32* %v, align 4, !dbg !7
  %60 = load i32, i32* %v, align 4, !dbg !7
  %61 = icmp ne i32 %60, 0, !dbg !7
  br i1 %61, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %62 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %63 = load i1, i1* %f, align 1, !dbg !7
  %64 = icmp eq i1 %63, false, !dbg !7
  %65 = sext i1 %64 to i32, !dbg !7
  store i32 %65, i32* %v, align 4, !dbg !7
  %66 = load i32, i32* %v, align 4, !dbg !7
  %67 = load i32, i32* %v, align 4, !dbg !7
  %68 = icmp eq i32 %67, 0, !dbg !7
  br i1 %68, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %69 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  store i32 100, i32* %a, align 4, !dbg !7
  store i32 100, i32* %b, align 4, !dbg !7
  store i32 128, i32* %c, align 4, !dbg !7
  %70 = load i32, i32* %a, align 4, !dbg !7
  %71 = load i32, i32* %b, align 4, !dbg !7
  %72 = icmp eq i32 %70, %71, !dbg !7
  %73 = sext i1 %72 to i32, !dbg !7
  store i32 %73, i32* %v, align 4, !dbg !7
  %74 = load i32, i32* %v, align 4, !dbg !7
  %75 = load i32, i32* %v, align 4, !dbg !7
  %76 = icmp eq i32 %75, 0, !dbg !7
  br i1 %76, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %77 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* %a, align 4, !dbg !7
  %79 = load i32, i32* %c, align 4, !dbg !7
  %80 = icmp eq i32 %78, %79, !dbg !7
  %81 = sext i1 %80 to i32, !dbg !7
  store i32 %81, i32* %v, align 4, !dbg !7
  %82 = load i32, i32* %v, align 4, !dbg !7
  %83 = load i32, i32* %v, align 4, !dbg !7
  %84 = icmp ne i32 %83, 0, !dbg !7
  br i1 %84, label %then31, label %if.end33, !dbg !7

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !7
  %85 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end33, !dbg !7

if.end33:                                         ; preds = %if.end30, %then31
  %86 = load i32, i32* %a, align 4, !dbg !7
  %87 = load i32, i32* %b, align 4, !dbg !7
  %88 = icmp ne i32 %86, %87, !dbg !7
  %89 = sext i1 %88 to i32, !dbg !7
  store i32 %89, i32* %v, align 4, !dbg !7
  %90 = load i32, i32* %v, align 4, !dbg !7
  %91 = load i32, i32* %v, align 4, !dbg !7
  %92 = icmp ne i32 %91, 0, !dbg !7
  br i1 %92, label %then34, label %if.end36, !dbg !7

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !7
  %93 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end36, !dbg !7

if.end36:                                         ; preds = %if.end33, %then34
  %94 = load i32, i32* %a, align 4, !dbg !7
  %95 = load i32, i32* %c, align 4, !dbg !7
  %96 = icmp ne i32 %94, %95, !dbg !7
  %97 = sext i1 %96 to i32, !dbg !7
  store i32 %97, i32* %v, align 4, !dbg !7
  %98 = load i32, i32* %v, align 4, !dbg !7
  %99 = load i32, i32* %v, align 4, !dbg !7
  %100 = icmp eq i32 %99, 0, !dbg !7
  br i1 %100, label %then37, label %if.end39, !dbg !7

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !7
  %101 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end39, !dbg !7

if.end39:                                         ; preds = %if.end36, %then37
  %102 = load i32, i32* %a, align 4, !dbg !7
  %103 = load i32, i32* %b, align 4, !dbg !7
  %104 = icmp slt i32 %102, %103, !dbg !7
  %105 = sext i1 %104 to i32, !dbg !7
  store i32 %105, i32* %v, align 4, !dbg !7
  %106 = load i32, i32* %v, align 4, !dbg !7
  %107 = load i32, i32* %v, align 4, !dbg !7
  %108 = icmp ne i32 %107, 0, !dbg !7
  br i1 %108, label %then40, label %if.end42, !dbg !7

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !7
  %109 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end42, !dbg !7

if.end42:                                         ; preds = %if.end39, %then40
  %110 = load i32, i32* %a, align 4, !dbg !7
  %111 = load i32, i32* %c, align 4, !dbg !7
  %112 = icmp slt i32 %110, %111, !dbg !7
  %113 = sext i1 %112 to i32, !dbg !7
  store i32 %113, i32* %v, align 4, !dbg !7
  %114 = load i32, i32* %v, align 4, !dbg !7
  %115 = load i32, i32* %v, align 4, !dbg !7
  %116 = icmp eq i32 %115, 0, !dbg !7
  br i1 %116, label %then43, label %if.end45, !dbg !7

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !7
  %117 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end45, !dbg !7

if.end45:                                         ; preds = %if.end42, %then43
  %118 = load i32, i32* %c, align 4, !dbg !7
  %119 = load i32, i32* %a, align 4, !dbg !7
  %120 = icmp slt i32 %118, %119, !dbg !7
  %121 = sext i1 %120 to i32, !dbg !7
  store i32 %121, i32* %v, align 4, !dbg !7
  %122 = load i32, i32* %v, align 4, !dbg !7
  %123 = load i32, i32* %v, align 4, !dbg !7
  %124 = icmp ne i32 %123, 0, !dbg !7
  br i1 %124, label %then46, label %if.end48, !dbg !7

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4, !dbg !7
  %125 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end48, !dbg !7

if.end48:                                         ; preds = %if.end45, %then46
  %126 = load i32, i32* %a, align 4, !dbg !7
  %127 = load i32, i32* %b, align 4, !dbg !7
  %128 = icmp sle i32 %126, %127, !dbg !7
  %129 = sext i1 %128 to i32, !dbg !7
  store i32 %129, i32* %v, align 4, !dbg !7
  %130 = load i32, i32* %v, align 4, !dbg !7
  %131 = load i32, i32* %v, align 4, !dbg !7
  %132 = icmp eq i32 %131, 0, !dbg !7
  br i1 %132, label %then49, label %if.end51, !dbg !7

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4, !dbg !7
  %133 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end51, !dbg !7

if.end51:                                         ; preds = %if.end48, %then49
  %134 = load i32, i32* %a, align 4, !dbg !7
  %135 = load i32, i32* %c, align 4, !dbg !7
  %136 = icmp sle i32 %134, %135, !dbg !7
  %137 = sext i1 %136 to i32, !dbg !7
  store i32 %137, i32* %v, align 4, !dbg !7
  %138 = load i32, i32* %v, align 4, !dbg !7
  %139 = load i32, i32* %v, align 4, !dbg !7
  %140 = icmp eq i32 %139, 0, !dbg !7
  br i1 %140, label %then52, label %if.end54, !dbg !7

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4, !dbg !7
  %141 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end54, !dbg !7

if.end54:                                         ; preds = %if.end51, %then52
  %142 = load i32, i32* %c, align 4, !dbg !7
  %143 = load i32, i32* %a, align 4, !dbg !7
  %144 = icmp sle i32 %142, %143, !dbg !7
  %145 = sext i1 %144 to i32, !dbg !7
  store i32 %145, i32* %v, align 4, !dbg !7
  %146 = load i32, i32* %v, align 4, !dbg !7
  %147 = load i32, i32* %v, align 4, !dbg !7
  %148 = icmp ne i32 %147, 0, !dbg !7
  br i1 %148, label %then55, label %if.end57, !dbg !7

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4, !dbg !7
  %149 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end57, !dbg !7

if.end57:                                         ; preds = %if.end54, %then55
  %150 = load i32, i32* %a, align 4, !dbg !7
  %151 = load i32, i32* %b, align 4, !dbg !7
  %152 = icmp sgt i32 %150, %151, !dbg !7
  %153 = sext i1 %152 to i32, !dbg !7
  store i32 %153, i32* %v, align 4, !dbg !7
  %154 = load i32, i32* %v, align 4, !dbg !7
  %155 = load i32, i32* %v, align 4, !dbg !7
  %156 = icmp ne i32 %155, 0, !dbg !7
  br i1 %156, label %then58, label %if.end60, !dbg !7

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4, !dbg !7
  %157 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end60, !dbg !7

if.end60:                                         ; preds = %if.end57, %then58
  %158 = load i32, i32* %a, align 4, !dbg !7
  %159 = load i32, i32* %c, align 4, !dbg !7
  %160 = icmp sgt i32 %158, %159, !dbg !7
  %161 = sext i1 %160 to i32, !dbg !7
  store i32 %161, i32* %v, align 4, !dbg !7
  %162 = load i32, i32* %v, align 4, !dbg !7
  %163 = load i32, i32* %v, align 4, !dbg !7
  %164 = icmp ne i32 %163, 0, !dbg !7
  br i1 %164, label %then61, label %if.end63, !dbg !7

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4, !dbg !7
  %165 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end63, !dbg !7

if.end63:                                         ; preds = %if.end60, %then61
  %166 = load i32, i32* %c, align 4, !dbg !7
  %167 = load i32, i32* %a, align 4, !dbg !7
  %168 = icmp sgt i32 %166, %167, !dbg !7
  %169 = sext i1 %168 to i32, !dbg !7
  store i32 %169, i32* %v, align 4, !dbg !7
  %170 = load i32, i32* %v, align 4, !dbg !7
  %171 = load i32, i32* %v, align 4, !dbg !7
  %172 = icmp eq i32 %171, 0, !dbg !7
  br i1 %172, label %then64, label %if.end66, !dbg !7

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4, !dbg !7
  %173 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end66, !dbg !7

if.end66:                                         ; preds = %if.end63, %then64
  %174 = load i32, i32* %a, align 4, !dbg !7
  %175 = load i32, i32* %b, align 4, !dbg !7
  %176 = icmp sge i32 %174, %175, !dbg !7
  %177 = sext i1 %176 to i32, !dbg !7
  store i32 %177, i32* %v, align 4, !dbg !7
  %178 = load i32, i32* %v, align 4, !dbg !7
  %179 = load i32, i32* %v, align 4, !dbg !7
  %180 = icmp eq i32 %179, 0, !dbg !7
  br i1 %180, label %then67, label %if.end69, !dbg !7

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4, !dbg !7
  %181 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end69, !dbg !7

if.end69:                                         ; preds = %if.end66, %then67
  %182 = load i32, i32* %a, align 4, !dbg !7
  %183 = load i32, i32* %c, align 4, !dbg !7
  %184 = icmp sge i32 %182, %183, !dbg !7
  %185 = sext i1 %184 to i32, !dbg !7
  store i32 %185, i32* %v, align 4, !dbg !7
  %186 = load i32, i32* %v, align 4, !dbg !7
  %187 = load i32, i32* %v, align 4, !dbg !7
  %188 = icmp ne i32 %187, 0, !dbg !7
  br i1 %188, label %then70, label %if.end72, !dbg !7

then70:                                           ; preds = %if.end69
  store i32 1, i32* %err, align 4, !dbg !7
  %189 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end72, !dbg !7

if.end72:                                         ; preds = %if.end69, %then70
  %190 = load i32, i32* %c, align 4, !dbg !7
  %191 = load i32, i32* %a, align 4, !dbg !7
  %192 = icmp sge i32 %190, %191, !dbg !7
  %193 = sext i1 %192 to i32, !dbg !7
  store i32 %193, i32* %v, align 4, !dbg !7
  %194 = load i32, i32* %v, align 4, !dbg !7
  %195 = load i32, i32* %v, align 4, !dbg !7
  %196 = icmp eq i32 %195, 0, !dbg !7
  br i1 %196, label %then73, label %if.end75, !dbg !7

then73:                                           ; preds = %if.end72
  store i32 1, i32* %err, align 4, !dbg !7
  %197 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end75, !dbg !7

if.end75:                                         ; preds = %if.end72, %then73
  store i32 1, i32* %ua, align 4, !dbg !7
  store i32 -1, i32* %ub, align 4, !dbg !7
  %198 = load i32, i32* %ua, align 4, !dbg !7
  %199 = load i32, i32* %ub, align 4, !dbg !7
  %200 = icmp ult i32 %198, %199, !dbg !7
  %201 = sext i1 %200 to i32, !dbg !7
  store i32 %201, i32* %v, align 4, !dbg !7
  %202 = load i32, i32* %v, align 4, !dbg !7
  %203 = load i32, i32* %v, align 4, !dbg !7
  %204 = icmp eq i32 %203, 0, !dbg !7
  br i1 %204, label %then76, label %if.end78, !dbg !7

then76:                                           ; preds = %if.end75
  store i32 1, i32* %err, align 4, !dbg !7
  %205 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end78, !dbg !7

if.end78:                                         ; preds = %if.end75, %then76
  %206 = load i32, i32* %ub, align 4, !dbg !7
  %207 = load i32, i32* %ua, align 4, !dbg !7
  %208 = icmp ugt i32 %206, %207, !dbg !7
  %209 = sext i1 %208 to i32, !dbg !7
  store i32 %209, i32* %v, align 4, !dbg !7
  %210 = load i32, i32* %v, align 4, !dbg !7
  %211 = load i32, i32* %v, align 4, !dbg !7
  %212 = icmp eq i32 %211, 0, !dbg !7
  br i1 %212, label %then79, label %if.end81, !dbg !7

then79:                                           ; preds = %if.end78
  store i32 1, i32* %err, align 4, !dbg !7
  %213 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end81, !dbg !7

if.end81:                                         ; preds = %if.end78, %then79
  store i32 -1, i32* %si, align 4, !dbg !7
  store i32 1, i32* %ui, align 4, !dbg !7
  %214 = load i32, i32* %si, align 4, !dbg !7
  %215 = load i32, i32* %ui, align 4, !dbg !7
  %216 = icmp ult i32 %214, %215, !dbg !7
  %217 = sext i1 %216 to i32, !dbg !7
  store i32 %217, i32* %v, align 4, !dbg !7
  %218 = load i32, i32* %v, align 4, !dbg !7
  %219 = load i32, i32* %v, align 4, !dbg !7
  %220 = icmp ne i32 %219, 0, !dbg !7
  br i1 %220, label %then82, label %if.end84, !dbg !7

then82:                                           ; preds = %if.end81
  store i32 1, i32* %err, align 4, !dbg !7
  %221 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end84, !dbg !7

if.end84:                                         ; preds = %if.end81, %then82
  %222 = load i32, i32* %si, align 4, !dbg !7
  %223 = load i32, i32* %ui, align 4, !dbg !7
  %224 = icmp ugt i32 %222, %223, !dbg !7
  %225 = sext i1 %224 to i32, !dbg !7
  store i32 %225, i32* %v, align 4, !dbg !7
  %226 = load i32, i32* %v, align 4, !dbg !7
  %227 = load i32, i32* %v, align 4, !dbg !7
  %228 = icmp eq i32 %227, 0, !dbg !7
  br i1 %228, label %then85, label %if.end87, !dbg !7

then85:                                           ; preds = %if.end84
  store i32 1, i32* %err, align 4, !dbg !7
  %229 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end87, !dbg !7

if.end87:                                         ; preds = %if.end84, %then85
  %230 = load i32, i32* %err, align 4, !dbg !7
  %231 = icmp eq i32 %230, 0, !dbg !7
  %. = select i1 %231, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !7
  %232 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %233 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %233, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "15.logic.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
