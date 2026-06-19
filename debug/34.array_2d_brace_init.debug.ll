; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]]
@gb = global [2 x [3 x i32]] [[3 x i32] [i32 0, i32 1, i32 2], [3 x i32] [i32 3, i32 4, i32 5]]
@gc = global [2 x [2 x i32]] [[2 x i32] [i32 10, i32 11], [2 x i32] [i32 20, i32 0]]
@0 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"34.array_2d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %lc = alloca [2 x [3 x i32]], align 4
  %lb = alloca [2 x [3 x i32]], align 4
  %la = alloca [2 x [3 x i32]], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [2 x [3 x i32]]* %la to i32*, !dbg !7
  store i32 1, i32* %0, align 4, !dbg !7
  %1 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 1, !dbg !7
  store i32 2, i32* %1, align 4, !dbg !7
  %2 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 2, !dbg !7
  store i32 0, i32* %2, align 4, !dbg !7
  %3 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 0, !dbg !7
  store i32 3, i32* %3, align 4, !dbg !7
  %4 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 1, !dbg !7
  store i32 0, i32* %4, align 4, !dbg !7
  %5 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 2, !dbg !7
  store i32 0, i32* %5, align 4, !dbg !7
  %6 = bitcast [2 x [3 x i32]]* %lb to i32*, !dbg !7
  store i32 7, i32* %6, align 4, !dbg !7
  %7 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 1, !dbg !7
  store i32 8, i32* %7, align 4, !dbg !7
  %8 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 2, !dbg !7
  store i32 9, i32* %8, align 4, !dbg !7
  %9 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 0, !dbg !7
  store i32 10, i32* %9, align 4, !dbg !7
  %10 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 1, !dbg !7
  store i32 11, i32* %10, align 4, !dbg !7
  %11 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 2, !dbg !7
  store i32 12, i32* %11, align 4, !dbg !7
  %12 = bitcast [2 x [3 x i32]]* %lc to i32*, !dbg !7
  store i32 1, i32* %12, align 4, !dbg !7
  %13 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 1, !dbg !7
  store i32 2, i32* %13, align 4, !dbg !7
  %14 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 2, !dbg !7
  store i32 3, i32* %14, align 4, !dbg !7
  %15 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 0, !dbg !7
  store i32 4, i32* %15, align 4, !dbg !7
  %16 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 1, !dbg !7
  store i32 0, i32* %16, align 4, !dbg !7
  %17 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 2, !dbg !7
  store i32 0, i32* %17, align 4, !dbg !7
  %18 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !7
  %19 = bitcast [3 x i32]* %18 to [3 x i32]*, !dbg !7
  %20 = bitcast [3 x i32]* %19 to i32*, !dbg !7
  %21 = bitcast i32* %20 to i32*, !dbg !7
  %22 = load i32, i32* %21, align 4, !dbg !7
  %23 = icmp ne i32 %22, 1, !dbg !7
  br i1 %23, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %24 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %25 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !7
  %26 = bitcast [3 x i32]* %25 to [3 x i32]*, !dbg !7
  %27 = bitcast [3 x i32]* %26 to i32*, !dbg !7
  %28 = getelementptr i32, i32* %27, i32 2, !dbg !7
  %29 = load i32, i32* %28, align 4, !dbg !7
  %30 = icmp ne i32 %29, 0, !dbg !7
  br i1 %30, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %31 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !7
  %33 = getelementptr [3 x i32], [3 x i32]* %32, i32 1, !dbg !7
  %34 = bitcast [3 x i32]* %33 to i32*, !dbg !7
  %35 = bitcast i32* %34 to i32*, !dbg !7
  %36 = load i32, i32* %35, align 4, !dbg !7
  %37 = icmp ne i32 %36, 3, !dbg !7
  br i1 %37, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %38 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %39 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !7
  %40 = getelementptr [3 x i32], [3 x i32]* %39, i32 1, !dbg !7
  %41 = bitcast [3 x i32]* %40 to i32*, !dbg !7
  %42 = getelementptr i32, i32* %41, i32 2, !dbg !7
  %43 = load i32, i32* %42, align 4, !dbg !7
  %44 = icmp ne i32 %43, 0, !dbg !7
  br i1 %44, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %45 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %46 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*, !dbg !7
  %47 = bitcast [3 x i32]* %46 to [3 x i32]*, !dbg !7
  %48 = bitcast [3 x i32]* %47 to i32*, !dbg !7
  %49 = bitcast i32* %48 to i32*, !dbg !7
  %50 = load i32, i32* %49, align 4, !dbg !7
  %51 = icmp ne i32 %50, 7, !dbg !7
  br i1 %51, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %52 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %53 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*, !dbg !7
  %54 = getelementptr [3 x i32], [3 x i32]* %53, i32 1, !dbg !7
  %55 = bitcast [3 x i32]* %54 to i32*, !dbg !7
  %56 = getelementptr i32, i32* %55, i32 2, !dbg !7
  %57 = load i32, i32* %56, align 4, !dbg !7
  %58 = icmp ne i32 %57, 12, !dbg !7
  br i1 %58, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %59 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %60 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !7
  %61 = bitcast [3 x i32]* %60 to [3 x i32]*, !dbg !7
  %62 = bitcast [3 x i32]* %61 to i32*, !dbg !7
  %63 = getelementptr i32, i32* %62, i32 2, !dbg !7
  %64 = load i32, i32* %63, align 4, !dbg !7
  %65 = icmp ne i32 %64, 3, !dbg !7
  br i1 %65, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %66 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %67 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !7
  %68 = getelementptr [3 x i32], [3 x i32]* %67, i32 1, !dbg !7
  %69 = bitcast [3 x i32]* %68 to i32*, !dbg !7
  %70 = bitcast i32* %69 to i32*, !dbg !7
  %71 = load i32, i32* %70, align 4, !dbg !7
  %72 = icmp ne i32 %71, 4, !dbg !7
  br i1 %72, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %73 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %74 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !7
  %75 = getelementptr [3 x i32], [3 x i32]* %74, i32 1, !dbg !7
  %76 = bitcast [3 x i32]* %75 to i32*, !dbg !7
  %77 = getelementptr i32, i32* %76, i32 2, !dbg !7
  %78 = load i32, i32* %77, align 4, !dbg !7
  %79 = icmp ne i32 %78, 0, !dbg !7
  br i1 %79, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %80 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %81 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 0, i32 0), align 4, !dbg !7
  %82 = icmp ne i32 %81, 1, !dbg !7
  br i1 %82, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %83 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  %84 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 1, i32 2), align 4, !dbg !7
  %85 = icmp ne i32 %84, 6, !dbg !7
  br i1 %85, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %86 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  %87 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 0, i32 1), align 4, !dbg !7
  %88 = icmp ne i32 %87, 1, !dbg !7
  br i1 %88, label %then31, label %if.end33, !dbg !7

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !7
  %89 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end33, !dbg !7

if.end33:                                         ; preds = %if.end30, %then31
  %90 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 1, i32 0), align 4, !dbg !7
  %91 = icmp ne i32 %90, 3, !dbg !7
  br i1 %91, label %then34, label %if.end36, !dbg !7

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !7
  %92 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end36, !dbg !7

if.end36:                                         ; preds = %if.end33, %then34
  %93 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 0, i32 1), align 4, !dbg !7
  %94 = icmp ne i32 %93, 11, !dbg !7
  br i1 %94, label %then37, label %if.end39, !dbg !7

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !7
  %95 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end39, !dbg !7

if.end39:                                         ; preds = %if.end36, %then37
  %96 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 0), align 4, !dbg !7
  %97 = icmp ne i32 %96, 20, !dbg !7
  br i1 %97, label %then40, label %if.end42, !dbg !7

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !7
  %98 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end42, !dbg !7

if.end42:                                         ; preds = %if.end39, %then40
  %99 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 1), align 4, !dbg !7
  %100 = icmp ne i32 %99, 0, !dbg !7
  br i1 %100, label %then43, label %if.end45, !dbg !7

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !7
  %101 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end45, !dbg !7

if.end45:                                         ; preds = %if.end42, %then43
  %102 = load i32, i32* %err, align 4, !dbg !7
  %103 = icmp eq i32 %102, 0, !dbg !7
  %. = select i1 %103, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !7
  %104 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %105 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %105, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
