; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Cell = type { i32, i32 }

@gm = global [3 x [4 x i32]] undef
@0 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [25 x i8] c"33.array_2d_decl.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %v = alloca i32, align 4
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
  %scalar = alloca i32, align 4
  %m = alloca [2 x [3 x i32]], align 4
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !7
  %0 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %1 = bitcast [3 x i32]* %0 to [3 x i32]*, !dbg !7
  %2 = bitcast [3 x i32]* %1 to i32*, !dbg !7
  %3 = bitcast i32* %2 to i32*, !dbg !7
  store i32 1, i32* %3, align 4, !dbg !7
  %4 = load i32, i32* %3, align 4, !dbg !7
  %5 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %6 = bitcast [3 x i32]* %5 to [3 x i32]*, !dbg !7
  %7 = bitcast [3 x i32]* %6 to i32*, !dbg !7
  %8 = getelementptr i32, i32* %7, i32 1, !dbg !7
  store i32 2, i32* %8, align 4, !dbg !7
  %9 = load i32, i32* %8, align 4, !dbg !7
  %10 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %11 = bitcast [3 x i32]* %10 to [3 x i32]*, !dbg !7
  %12 = bitcast [3 x i32]* %11 to i32*, !dbg !7
  %13 = getelementptr i32, i32* %12, i32 2, !dbg !7
  store i32 3, i32* %13, align 4, !dbg !7
  %14 = load i32, i32* %13, align 4, !dbg !7
  %15 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %16 = getelementptr [3 x i32], [3 x i32]* %15, i32 1, !dbg !7
  %17 = bitcast [3 x i32]* %16 to i32*, !dbg !7
  %18 = bitcast i32* %17 to i32*, !dbg !7
  store i32 4, i32* %18, align 4, !dbg !7
  %19 = load i32, i32* %18, align 4, !dbg !7
  %20 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %21 = getelementptr [3 x i32], [3 x i32]* %20, i32 1, !dbg !7
  %22 = bitcast [3 x i32]* %21 to i32*, !dbg !7
  %23 = getelementptr i32, i32* %22, i32 1, !dbg !7
  store i32 5, i32* %23, align 4, !dbg !7
  %24 = load i32, i32* %23, align 4, !dbg !7
  %25 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %26 = getelementptr [3 x i32], [3 x i32]* %25, i32 1, !dbg !7
  %27 = bitcast [3 x i32]* %26 to i32*, !dbg !7
  %28 = getelementptr i32, i32* %27, i32 2, !dbg !7
  store i32 6, i32* %28, align 4, !dbg !7
  %29 = load i32, i32* %28, align 4, !dbg !7
  store i32 99, i32* %scalar, align 4, !dbg !7
  %30 = load i32, i32* %scalar, align 4, !dbg !7
  store i32 10, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !7
  %31 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !7
  store i32 20, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !7
  %32 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !7
  store i32 30, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !7
  %33 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !7
  %34 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !7
  %35 = bitcast [2 x %struct.Cell]* %34 to [2 x %struct.Cell]*, !dbg !7
  %36 = bitcast [2 x %struct.Cell]* %35 to %struct.Cell*, !dbg !7
  %37 = getelementptr %struct.Cell, %struct.Cell* %36, i32 1, !dbg !7
  %38 = bitcast %struct.Cell* %37 to i32*, !dbg !7
  store i32 7, i32* %38, align 4, !dbg !7
  %39 = load i32, i32* %38, align 4, !dbg !7
  %40 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !7
  %41 = bitcast [2 x %struct.Cell]* %40 to [2 x %struct.Cell]*, !dbg !7
  %42 = bitcast [2 x %struct.Cell]* %41 to %struct.Cell*, !dbg !7
  %43 = getelementptr %struct.Cell, %struct.Cell* %42, i32 1, !dbg !7
  %44 = getelementptr %struct.Cell, %struct.Cell* %43, i32 0, i32 1, !dbg !7
  store i32 70, i32* %44, align 4, !dbg !7
  %45 = load i32, i32* %44, align 4, !dbg !7
  %46 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !7
  %47 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %46, i32 1, !dbg !7
  %48 = bitcast [2 x %struct.Cell]* %47 to %struct.Cell*, !dbg !7
  %49 = bitcast %struct.Cell* %48 to %struct.Cell*, !dbg !7
  %50 = bitcast %struct.Cell* %49 to i32*, !dbg !7
  store i32 8, i32* %50, align 4, !dbg !7
  %51 = load i32, i32* %50, align 4, !dbg !7
  %52 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %53 = bitcast [3 x i32]* %52 to [3 x i32]*, !dbg !7
  %54 = bitcast [3 x i32]* %53 to i32*, !dbg !7
  %55 = bitcast i32* %54 to i32*, !dbg !7
  %56 = load i32, i32* %55, align 4, !dbg !7
  store i32 %56, i32* %v, align 4, !dbg !7
  %57 = load i32, i32* %v, align 4, !dbg !7
  %58 = load i32, i32* %v, align 4, !dbg !7
  %59 = icmp ne i32 %58, 1, !dbg !7
  br i1 %59, label %then, label %if.end, !dbg !7

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !7
  %60 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end, !dbg !7

if.end:                                           ; preds = %entry, %then
  %61 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %62 = bitcast [3 x i32]* %61 to [3 x i32]*, !dbg !7
  %63 = bitcast [3 x i32]* %62 to i32*, !dbg !7
  %64 = getelementptr i32, i32* %63, i32 2, !dbg !7
  %65 = load i32, i32* %64, align 4, !dbg !7
  store i32 %65, i32* %v, align 4, !dbg !7
  %66 = load i32, i32* %v, align 4, !dbg !7
  %67 = load i32, i32* %v, align 4, !dbg !7
  %68 = icmp ne i32 %67, 3, !dbg !7
  br i1 %68, label %then1, label %if.end3, !dbg !7

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !7
  %69 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end, %then1
  %70 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %71 = getelementptr [3 x i32], [3 x i32]* %70, i32 1, !dbg !7
  %72 = bitcast [3 x i32]* %71 to i32*, !dbg !7
  %73 = getelementptr i32, i32* %72, i32 1, !dbg !7
  %74 = load i32, i32* %73, align 4, !dbg !7
  store i32 %74, i32* %v, align 4, !dbg !7
  %75 = load i32, i32* %v, align 4, !dbg !7
  %76 = load i32, i32* %v, align 4, !dbg !7
  %77 = icmp ne i32 %76, 5, !dbg !7
  br i1 %77, label %then4, label %if.end6, !dbg !7

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !7
  %78 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end6, !dbg !7

if.end6:                                          ; preds = %if.end3, %then4
  %79 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !7
  %80 = getelementptr [3 x i32], [3 x i32]* %79, i32 1, !dbg !7
  %81 = bitcast [3 x i32]* %80 to i32*, !dbg !7
  %82 = getelementptr i32, i32* %81, i32 2, !dbg !7
  %83 = load i32, i32* %82, align 4, !dbg !7
  store i32 %83, i32* %v, align 4, !dbg !7
  %84 = load i32, i32* %v, align 4, !dbg !7
  %85 = load i32, i32* %v, align 4, !dbg !7
  %86 = icmp ne i32 %85, 6, !dbg !7
  br i1 %86, label %then7, label %if.end9, !dbg !7

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !7
  %87 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end9, !dbg !7

if.end9:                                          ; preds = %if.end6, %then7
  %88 = load i32, i32* %scalar, align 4, !dbg !7
  %89 = icmp ne i32 %88, 99, !dbg !7
  br i1 %89, label %then10, label %if.end12, !dbg !7

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !7
  %90 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end12, !dbg !7

if.end12:                                         ; preds = %if.end9, %then10
  %91 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !7
  store i32 %91, i32* %v, align 4, !dbg !7
  %92 = load i32, i32* %v, align 4, !dbg !7
  %93 = load i32, i32* %v, align 4, !dbg !7
  %94 = icmp ne i32 %93, 10, !dbg !7
  br i1 %94, label %then13, label %if.end15, !dbg !7

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !7
  %95 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end15, !dbg !7

if.end15:                                         ; preds = %if.end12, %then13
  %96 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !7
  store i32 %96, i32* %v, align 4, !dbg !7
  %97 = load i32, i32* %v, align 4, !dbg !7
  %98 = load i32, i32* %v, align 4, !dbg !7
  %99 = icmp ne i32 %98, 20, !dbg !7
  br i1 %99, label %then16, label %if.end18, !dbg !7

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !7
  %100 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end18, !dbg !7

if.end18:                                         ; preds = %if.end15, %then16
  %101 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !7
  store i32 %101, i32* %v, align 4, !dbg !7
  %102 = load i32, i32* %v, align 4, !dbg !7
  %103 = load i32, i32* %v, align 4, !dbg !7
  %104 = icmp ne i32 %103, 30, !dbg !7
  br i1 %104, label %then19, label %if.end21, !dbg !7

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !7
  %105 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end21, !dbg !7

if.end21:                                         ; preds = %if.end18, %then19
  %106 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 1), align 4, !dbg !7
  store i32 %106, i32* %v, align 4, !dbg !7
  %107 = load i32, i32* %v, align 4, !dbg !7
  %108 = load i32, i32* %v, align 4, !dbg !7
  %109 = icmp ne i32 %108, 0, !dbg !7
  br i1 %109, label %then22, label %if.end24, !dbg !7

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !7
  %110 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end24, !dbg !7

if.end24:                                         ; preds = %if.end21, %then22
  %111 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !7
  %112 = bitcast [2 x %struct.Cell]* %111 to [2 x %struct.Cell]*, !dbg !7
  %113 = bitcast [2 x %struct.Cell]* %112 to %struct.Cell*, !dbg !7
  %114 = getelementptr %struct.Cell, %struct.Cell* %113, i32 1, !dbg !7
  %115 = bitcast %struct.Cell* %114 to i32*, !dbg !7
  %116 = load i32, i32* %115, align 4, !dbg !7
  store i32 %116, i32* %v, align 4, !dbg !7
  %117 = load i32, i32* %v, align 4, !dbg !7
  %118 = load i32, i32* %v, align 4, !dbg !7
  %119 = icmp ne i32 %118, 7, !dbg !7
  br i1 %119, label %then25, label %if.end27, !dbg !7

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !7
  %120 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end27, !dbg !7

if.end27:                                         ; preds = %if.end24, %then25
  %121 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !7
  %122 = bitcast [2 x %struct.Cell]* %121 to [2 x %struct.Cell]*, !dbg !7
  %123 = bitcast [2 x %struct.Cell]* %122 to %struct.Cell*, !dbg !7
  %124 = getelementptr %struct.Cell, %struct.Cell* %123, i32 1, !dbg !7
  %125 = getelementptr %struct.Cell, %struct.Cell* %124, i32 0, i32 1, !dbg !7
  %126 = load i32, i32* %125, align 4, !dbg !7
  store i32 %126, i32* %v, align 4, !dbg !7
  %127 = load i32, i32* %v, align 4, !dbg !7
  %128 = load i32, i32* %v, align 4, !dbg !7
  %129 = icmp ne i32 %128, 70, !dbg !7
  br i1 %129, label %then28, label %if.end30, !dbg !7

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !7
  %130 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end30, !dbg !7

if.end30:                                         ; preds = %if.end27, %then28
  %131 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !7
  %132 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %131, i32 1, !dbg !7
  %133 = bitcast [2 x %struct.Cell]* %132 to %struct.Cell*, !dbg !7
  %134 = bitcast %struct.Cell* %133 to %struct.Cell*, !dbg !7
  %135 = bitcast %struct.Cell* %134 to i32*, !dbg !7
  %136 = load i32, i32* %135, align 4, !dbg !7
  store i32 %136, i32* %v, align 4, !dbg !7
  %137 = load i32, i32* %v, align 4, !dbg !7
  %138 = load i32, i32* %v, align 4, !dbg !7
  %139 = icmp ne i32 %138, 8, !dbg !7
  br i1 %139, label %then31, label %if.end33, !dbg !7

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !7
  %140 = load i32, i32* %err, align 4, !dbg !7
  br label %if.end33, !dbg !7

if.end33:                                         ; preds = %if.end30, %then31
  %141 = load i32, i32* %err, align 4, !dbg !7
  %142 = icmp eq i32 %141, 0, !dbg !7
  %. = select i1 %142, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @1, i32 0, i32 0), !dbg !7
  %143 = call i32 (i8*, ...) @printf(i8* %.), !dbg !7
  %144 = load i32, i32* %err, align 4, !dbg !7
  ret i32 %144, !dbg !7
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "33.array_2d_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
