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

define i32 @main() !dbg !2 {
entry:
  %lb = alloca [6 x i8], align 1
  %ls = alloca [6 x i8], align 1
  %la = alloca [3 x i32], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [3 x i32]* %la to i32*, !dbg !7
  store i32 1, i32* %0, align 4, !dbg !7
  %1 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 1, !dbg !7
  store i32 2, i32* %1, align 4, !dbg !7
  %2 = getelementptr [3 x i32], [3 x i32]* %la, i32 0, i32 2, !dbg !7
  store i32 3, i32* %2, align 4, !dbg !7
  %3 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  store i8 104, i8* %3, align 1, !dbg !7
  %4 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 1, !dbg !7
  store i8 101, i8* %4, align 1, !dbg !7
  %5 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 2, !dbg !7
  store i8 108, i8* %5, align 1, !dbg !7
  %6 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 3, !dbg !7
  store i8 108, i8* %6, align 1, !dbg !7
  %7 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 4, !dbg !7
  store i8 111, i8* %7, align 1, !dbg !7
  %8 = getelementptr [6 x i8], [6 x i8]* %ls, i32 0, i32 5, !dbg !7
  store i8 0, i8* %8, align 1, !dbg !7
  %9 = bitcast [6 x i8]* %lb to i8*, !dbg !7
  store i8 104, i8* %9, align 1, !dbg !7
  %10 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 1, !dbg !7
  store i8 101, i8* %10, align 1, !dbg !7
  %11 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 2, !dbg !7
  store i8 108, i8* %11, align 1, !dbg !7
  %12 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 3, !dbg !7
  store i8 108, i8* %12, align 1, !dbg !7
  %13 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 4, !dbg !7
  store i8 111, i8* %13, align 1, !dbg !7
  %14 = getelementptr [6 x i8], [6 x i8]* %lb, i32 0, i32 5, !dbg !7
  store i8 0, i8* %14, align 1, !dbg !7
  %15 = bitcast [3 x i32]* %la to i32*, !dbg !7
  %16 = bitcast i32* %15 to i32*, !dbg !7
  %17 = load i32, i32* %16, align 4, !dbg !7
  %18 = icmp ne i32 %17, 1, !dbg !7
  br i1 %18, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %19 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %20 = bitcast [3 x i32]* %la to i32*, !dbg !7
  %21 = getelementptr i32, i32* %20, i32 1, !dbg !7
  %22 = load i32, i32* %21, align 4, !dbg !7
  %23 = icmp ne i32 %22, 2, !dbg !7
  br i1 %23, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %24 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %25 = bitcast [3 x i32]* %la to i32*, !dbg !7
  %26 = getelementptr i32, i32* %25, i32 2, !dbg !7
  %27 = load i32, i32* %26, align 4, !dbg !7
  %28 = icmp ne i32 %27, 3, !dbg !7
  br i1 %28, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %29 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %30 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  %31 = bitcast i8* %30 to i8*, !dbg !7
  %32 = load i8, i8* %31, align 1, !dbg !7
  %33 = sext i8 %32 to i32, !dbg !7
  %34 = icmp ne i32 %33, 104, !dbg !7
  br i1 %34, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %35 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %36 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  %37 = getelementptr i8, i8* %36, i32 1, !dbg !7
  %38 = load i8, i8* %37, align 1, !dbg !7
  %39 = sext i8 %38 to i32, !dbg !7
  %40 = icmp ne i32 %39, 101, !dbg !7
  br i1 %40, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %41 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %42 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  %43 = getelementptr i8, i8* %42, i32 2, !dbg !7
  %44 = load i8, i8* %43, align 1, !dbg !7
  %45 = sext i8 %44 to i32, !dbg !7
  %46 = icmp ne i32 %45, 108, !dbg !7
  br i1 %46, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %47 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %48 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  %49 = getelementptr i8, i8* %48, i32 3, !dbg !7
  %50 = load i8, i8* %49, align 1, !dbg !7
  %51 = sext i8 %50 to i32, !dbg !7
  %52 = icmp ne i32 %51, 108, !dbg !7
  br i1 %52, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %53 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %54 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  %55 = getelementptr i8, i8* %54, i32 4, !dbg !7
  %56 = load i8, i8* %55, align 1, !dbg !7
  %57 = sext i8 %56 to i32, !dbg !7
  %58 = icmp ne i32 %57, 111, !dbg !7
  br i1 %58, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %59 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %60 = bitcast [6 x i8]* %ls to i8*, !dbg !7
  %61 = getelementptr i8, i8* %60, i32 5, !dbg !7
  %62 = load i8, i8* %61, align 1, !dbg !7
  %63 = sext i8 %62 to i32, !dbg !7
  %64 = icmp ne i32 %63, 0, !dbg !7
  br i1 %64, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %65 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %66 = bitcast [6 x i8]* %lb to i8*, !dbg !7
  %67 = bitcast i8* %66 to i8*, !dbg !7
  %68 = load i8, i8* %67, align 1, !dbg !7
  %69 = sext i8 %68 to i32, !dbg !7
  %70 = icmp ne i32 %69, 104, !dbg !7
  br i1 %70, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %71 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  %72 = bitcast [6 x i8]* %lb to i8*, !dbg !7
  %73 = getelementptr i8, i8* %72, i32 5, !dbg !7
  %74 = load i8, i8* %73, align 1, !dbg !7
  %75 = sext i8 %74 to i32, !dbg !7
  %76 = icmp ne i32 %75, 0, !dbg !7
  br i1 %76, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %77 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  %78 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 0), align 4, !dbg !7
  %79 = icmp ne i32 %78, 10, !dbg !7
  br i1 %79, label %then31, label %if.end33, !dbg !7

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !7
  %80 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end33, !dbg !7

if.end33:                                         ; preds = %if.end30, %then31
  %81 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 1), align 4, !dbg !7
  %82 = icmp ne i32 %81, 7, !dbg !7
  br i1 %82, label %then34, label %if.end36, !dbg !7

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !7
  %83 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end36, !dbg !7

if.end36:                                         ; preds = %if.end33, %then34
  %84 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 2), align 4, !dbg !7
  %85 = icmp ne i32 %84, 8, !dbg !7
  br i1 %85, label %then37, label %if.end39, !dbg !7

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !7
  %86 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end39, !dbg !7

if.end39:                                         ; preds = %if.end36, %then37
  %87 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 3), align 4, !dbg !7
  %88 = icmp ne i32 %87, 9, !dbg !7
  br i1 %88, label %then40, label %if.end42, !dbg !7

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !7
  %89 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end42, !dbg !7

if.end42:                                         ; preds = %if.end39, %then40
  %90 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 4), align 4, !dbg !7
  %91 = icmp ne i32 %90, 1, !dbg !7
  br i1 %91, label %then43, label %if.end45, !dbg !7

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !7
  %92 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end45, !dbg !7

if.end45:                                         ; preds = %if.end42, %then43
  %93 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @ga, i32 0, i32 5), align 4, !dbg !7
  %94 = icmp ne i32 %93, 5, !dbg !7
  br i1 %94, label %then46, label %if.end48, !dbg !7

then46:                                           ; preds = %if.end45
  store i32 1, i32* %err, align 4, !dbg !7
  %95 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end48, !dbg !7

if.end48:                                         ; preds = %if.end45, %then46
  %96 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 0), align 1, !dbg !7
  %97 = sext i8 %96 to i32, !dbg !7
  %98 = icmp ne i32 %97, 104, !dbg !7
  br i1 %98, label %then49, label %if.end51, !dbg !7

then49:                                           ; preds = %if.end48
  store i32 1, i32* %err, align 4, !dbg !7
  %99 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end51, !dbg !7

if.end51:                                         ; preds = %if.end48, %then49
  %100 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 1), align 1, !dbg !7
  %101 = sext i8 %100 to i32, !dbg !7
  %102 = icmp ne i32 %101, 105, !dbg !7
  br i1 %102, label %then52, label %if.end54, !dbg !7

then52:                                           ; preds = %if.end51
  store i32 1, i32* %err, align 4, !dbg !7
  %103 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end54, !dbg !7

if.end54:                                         ; preds = %if.end51, %then52
  %104 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @gs, i32 0, i32 2), align 1, !dbg !7
  %105 = sext i8 %104 to i32, !dbg !7
  %106 = icmp ne i32 %105, 0, !dbg !7
  br i1 %106, label %then55, label %if.end57, !dbg !7

then55:                                           ; preds = %if.end54
  store i32 1, i32* %err, align 4, !dbg !7
  %107 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end57, !dbg !7

if.end57:                                         ; preds = %if.end54, %then55
  %108 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 0), align 1, !dbg !7
  %109 = sext i8 %108 to i32, !dbg !7
  %110 = icmp ne i32 %109, 104, !dbg !7
  br i1 %110, label %then58, label %if.end60, !dbg !7

then58:                                           ; preds = %if.end57
  store i32 1, i32* %err, align 4, !dbg !7
  %111 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end60, !dbg !7

if.end60:                                         ; preds = %if.end57, %then58
  %112 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 1), align 1, !dbg !7
  %113 = sext i8 %112 to i32, !dbg !7
  %114 = icmp ne i32 %113, 101, !dbg !7
  br i1 %114, label %then61, label %if.end63, !dbg !7

then61:                                           ; preds = %if.end60
  store i32 1, i32* %err, align 4, !dbg !7
  %115 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end63, !dbg !7

if.end63:                                         ; preds = %if.end60, %then61
  %116 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 2), align 1, !dbg !7
  %117 = sext i8 %116 to i32, !dbg !7
  %118 = icmp ne i32 %117, 121, !dbg !7
  br i1 %118, label %then64, label %if.end66, !dbg !7

then64:                                           ; preds = %if.end63
  store i32 1, i32* %err, align 4, !dbg !7
  %119 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end66, !dbg !7

if.end66:                                         ; preds = %if.end63, %then64
  %120 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @gt, i32 0, i32 3), align 1, !dbg !7
  %121 = sext i8 %120 to i32, !dbg !7
  %122 = icmp ne i32 %121, 0, !dbg !7
  br i1 %122, label %then67, label %if.end69, !dbg !7

then67:                                           ; preds = %if.end66
  store i32 1, i32* %err, align 4, !dbg !7
  %123 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end69, !dbg !7

if.end69:                                         ; preds = %if.end66, %then67
  %124 = load i32, i32* %err, align 4, !dbg !7
  %125 = icmp eq i32 %124, 0, !dbg !7
  %. = select i1 %125, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0), !dbg !7
  %126 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %127 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %127, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "32.array_1d_inferred_string_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
