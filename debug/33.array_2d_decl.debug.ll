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
  %0 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !8
  %1 = bitcast [3 x i32]* %0 to [3 x i32]*, !dbg !8
  %2 = bitcast [3 x i32]* %1 to i32*, !dbg !8
  %3 = bitcast i32* %2 to i32*, !dbg !8
  store i32 1, i32* %3, align 4, !dbg !8
  %4 = load i32, i32* %3, align 4, !dbg !8
  %5 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !9
  %6 = bitcast [3 x i32]* %5 to [3 x i32]*, !dbg !9
  %7 = bitcast [3 x i32]* %6 to i32*, !dbg !9
  %8 = getelementptr i32, i32* %7, i32 1, !dbg !9
  store i32 2, i32* %8, align 4, !dbg !9
  %9 = load i32, i32* %8, align 4, !dbg !9
  %10 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !10
  %11 = bitcast [3 x i32]* %10 to [3 x i32]*, !dbg !10
  %12 = bitcast [3 x i32]* %11 to i32*, !dbg !10
  %13 = getelementptr i32, i32* %12, i32 2, !dbg !10
  store i32 3, i32* %13, align 4, !dbg !10
  %14 = load i32, i32* %13, align 4, !dbg !10
  %15 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !11
  %16 = getelementptr [3 x i32], [3 x i32]* %15, i32 1, !dbg !11
  %17 = bitcast [3 x i32]* %16 to i32*, !dbg !11
  %18 = bitcast i32* %17 to i32*, !dbg !11
  store i32 4, i32* %18, align 4, !dbg !11
  %19 = load i32, i32* %18, align 4, !dbg !11
  %20 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !12
  %21 = getelementptr [3 x i32], [3 x i32]* %20, i32 1, !dbg !12
  %22 = bitcast [3 x i32]* %21 to i32*, !dbg !12
  %23 = getelementptr i32, i32* %22, i32 1, !dbg !12
  store i32 5, i32* %23, align 4, !dbg !12
  %24 = load i32, i32* %23, align 4, !dbg !12
  %25 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !13
  %26 = getelementptr [3 x i32], [3 x i32]* %25, i32 1, !dbg !13
  %27 = bitcast [3 x i32]* %26 to i32*, !dbg !13
  %28 = getelementptr i32, i32* %27, i32 2, !dbg !13
  store i32 6, i32* %28, align 4, !dbg !13
  %29 = load i32, i32* %28, align 4, !dbg !13
  store i32 99, i32* %scalar, align 4, !dbg !14
  %30 = load i32, i32* %scalar, align 4, !dbg !14
  store i32 10, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !15
  %31 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !15
  store i32 20, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !16
  %32 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !16
  store i32 30, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !17
  %33 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !17
  %34 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !18
  %35 = bitcast [2 x %struct.Cell]* %34 to [2 x %struct.Cell]*, !dbg !18
  %36 = bitcast [2 x %struct.Cell]* %35 to %struct.Cell*, !dbg !18
  %37 = getelementptr %struct.Cell, %struct.Cell* %36, i32 1, !dbg !18
  %38 = bitcast %struct.Cell* %37 to i32*, !dbg !18
  store i32 7, i32* %38, align 4, !dbg !18
  %39 = load i32, i32* %38, align 4, !dbg !18
  %40 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !19
  %41 = bitcast [2 x %struct.Cell]* %40 to [2 x %struct.Cell]*, !dbg !19
  %42 = bitcast [2 x %struct.Cell]* %41 to %struct.Cell*, !dbg !19
  %43 = getelementptr %struct.Cell, %struct.Cell* %42, i32 1, !dbg !19
  %44 = getelementptr %struct.Cell, %struct.Cell* %43, i32 0, i32 1, !dbg !19
  store i32 70, i32* %44, align 4, !dbg !19
  %45 = load i32, i32* %44, align 4, !dbg !19
  %46 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !20
  %47 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %46, i32 1, !dbg !20
  %48 = bitcast [2 x %struct.Cell]* %47 to %struct.Cell*, !dbg !20
  %49 = bitcast %struct.Cell* %48 to %struct.Cell*, !dbg !20
  %50 = bitcast %struct.Cell* %49 to i32*, !dbg !20
  store i32 8, i32* %50, align 4, !dbg !20
  %51 = load i32, i32* %50, align 4, !dbg !20
  %52 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !21
  %53 = bitcast [3 x i32]* %52 to [3 x i32]*, !dbg !21
  %54 = bitcast [3 x i32]* %53 to i32*, !dbg !21
  %55 = bitcast i32* %54 to i32*, !dbg !21
  %56 = load i32, i32* %55, align 4, !dbg !21
  store i32 %56, i32* %v, align 4, !dbg !21
  %57 = load i32, i32* %v, align 4, !dbg !21
  %58 = load i32, i32* %v, align 4, !dbg !22
  %59 = icmp ne i32 %58, 1, !dbg !22
  br i1 %59, label %then, label %if.end, !dbg !22

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !23
  %60 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end, !dbg !23

if.end:                                           ; preds = %entry, %then
  %61 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !24
  %62 = bitcast [3 x i32]* %61 to [3 x i32]*, !dbg !24
  %63 = bitcast [3 x i32]* %62 to i32*, !dbg !24
  %64 = getelementptr i32, i32* %63, i32 2, !dbg !24
  %65 = load i32, i32* %64, align 4, !dbg !24
  store i32 %65, i32* %v, align 4, !dbg !24
  %66 = load i32, i32* %v, align 4, !dbg !24
  %67 = load i32, i32* %v, align 4, !dbg !25
  %68 = icmp ne i32 %67, 3, !dbg !25
  br i1 %68, label %then1, label %if.end3, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !26
  %69 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.end, %then1
  %70 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !27
  %71 = getelementptr [3 x i32], [3 x i32]* %70, i32 1, !dbg !27
  %72 = bitcast [3 x i32]* %71 to i32*, !dbg !27
  %73 = getelementptr i32, i32* %72, i32 1, !dbg !27
  %74 = load i32, i32* %73, align 4, !dbg !27
  store i32 %74, i32* %v, align 4, !dbg !27
  %75 = load i32, i32* %v, align 4, !dbg !27
  %76 = load i32, i32* %v, align 4, !dbg !28
  %77 = icmp ne i32 %76, 5, !dbg !28
  br i1 %77, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %78 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %79 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !30
  %80 = getelementptr [3 x i32], [3 x i32]* %79, i32 1, !dbg !30
  %81 = bitcast [3 x i32]* %80 to i32*, !dbg !30
  %82 = getelementptr i32, i32* %81, i32 2, !dbg !30
  %83 = load i32, i32* %82, align 4, !dbg !30
  store i32 %83, i32* %v, align 4, !dbg !30
  %84 = load i32, i32* %v, align 4, !dbg !30
  %85 = load i32, i32* %v, align 4, !dbg !31
  %86 = icmp ne i32 %85, 6, !dbg !31
  br i1 %86, label %then7, label %if.end9, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !32
  %87 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %if.end6, %then7
  %88 = load i32, i32* %scalar, align 4, !dbg !33
  %89 = icmp ne i32 %88, 99, !dbg !33
  br i1 %89, label %then10, label %if.end12, !dbg !33

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !34
  %90 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end12, !dbg !34

if.end12:                                         ; preds = %if.end9, %then10
  %91 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !35
  store i32 %91, i32* %v, align 4, !dbg !35
  %92 = load i32, i32* %v, align 4, !dbg !35
  %93 = load i32, i32* %v, align 4, !dbg !36
  %94 = icmp ne i32 %93, 10, !dbg !36
  br i1 %94, label %then13, label %if.end15, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !37
  %95 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %if.end12, %then13
  %96 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !38
  store i32 %96, i32* %v, align 4, !dbg !38
  %97 = load i32, i32* %v, align 4, !dbg !38
  %98 = load i32, i32* %v, align 4, !dbg !39
  %99 = icmp ne i32 %98, 20, !dbg !39
  br i1 %99, label %then16, label %if.end18, !dbg !39

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !40
  %100 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end18, !dbg !40

if.end18:                                         ; preds = %if.end15, %then16
  %101 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !41
  store i32 %101, i32* %v, align 4, !dbg !41
  %102 = load i32, i32* %v, align 4, !dbg !41
  %103 = load i32, i32* %v, align 4, !dbg !42
  %104 = icmp ne i32 %103, 30, !dbg !42
  br i1 %104, label %then19, label %if.end21, !dbg !42

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !43
  %105 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end21, !dbg !43

if.end21:                                         ; preds = %if.end18, %then19
  %106 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 1), align 4, !dbg !44
  store i32 %106, i32* %v, align 4, !dbg !44
  %107 = load i32, i32* %v, align 4, !dbg !44
  %108 = load i32, i32* %v, align 4, !dbg !45
  %109 = icmp ne i32 %108, 0, !dbg !45
  br i1 %109, label %then22, label %if.end24, !dbg !45

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !46
  %110 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end24, !dbg !46

if.end24:                                         ; preds = %if.end21, %then22
  %111 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !47
  %112 = bitcast [2 x %struct.Cell]* %111 to [2 x %struct.Cell]*, !dbg !47
  %113 = bitcast [2 x %struct.Cell]* %112 to %struct.Cell*, !dbg !47
  %114 = getelementptr %struct.Cell, %struct.Cell* %113, i32 1, !dbg !47
  %115 = bitcast %struct.Cell* %114 to i32*, !dbg !47
  %116 = load i32, i32* %115, align 4, !dbg !47
  store i32 %116, i32* %v, align 4, !dbg !47
  %117 = load i32, i32* %v, align 4, !dbg !47
  %118 = load i32, i32* %v, align 4, !dbg !48
  %119 = icmp ne i32 %118, 7, !dbg !48
  br i1 %119, label %then25, label %if.end27, !dbg !48

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !49
  %120 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end27, !dbg !49

if.end27:                                         ; preds = %if.end24, %then25
  %121 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !50
  %122 = bitcast [2 x %struct.Cell]* %121 to [2 x %struct.Cell]*, !dbg !50
  %123 = bitcast [2 x %struct.Cell]* %122 to %struct.Cell*, !dbg !50
  %124 = getelementptr %struct.Cell, %struct.Cell* %123, i32 1, !dbg !50
  %125 = getelementptr %struct.Cell, %struct.Cell* %124, i32 0, i32 1, !dbg !50
  %126 = load i32, i32* %125, align 4, !dbg !50
  store i32 %126, i32* %v, align 4, !dbg !50
  %127 = load i32, i32* %v, align 4, !dbg !50
  %128 = load i32, i32* %v, align 4, !dbg !51
  %129 = icmp ne i32 %128, 70, !dbg !51
  br i1 %129, label %then28, label %if.end30, !dbg !51

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !52
  %130 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end30, !dbg !52

if.end30:                                         ; preds = %if.end27, %then28
  %131 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !53
  %132 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %131, i32 1, !dbg !53
  %133 = bitcast [2 x %struct.Cell]* %132 to %struct.Cell*, !dbg !53
  %134 = bitcast %struct.Cell* %133 to %struct.Cell*, !dbg !53
  %135 = bitcast %struct.Cell* %134 to i32*, !dbg !53
  %136 = load i32, i32* %135, align 4, !dbg !53
  store i32 %136, i32* %v, align 4, !dbg !53
  %137 = load i32, i32* %v, align 4, !dbg !53
  %138 = load i32, i32* %v, align 4, !dbg !54
  %139 = icmp ne i32 %138, 8, !dbg !54
  br i1 %139, label %then31, label %if.end33, !dbg !54

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !55
  %140 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end33, !dbg !55

if.end33:                                         ; preds = %if.end30, %then31
  %141 = load i32, i32* %err, align 4, !dbg !56
  %142 = icmp eq i32 %141, 0, !dbg !56
  %. = select i1 %142, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @1, i32 0, i32 0), !dbg !57
  %143 = call i32 (i8*, ...) @printf(i8* %.), !dbg !57
  %144 = load i32, i32* %err, align 4, !dbg !58
  ret i32 %144, !dbg !58
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "33.array_2d_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 10, type: !3, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 11, column: 3, scope: !2)
!8 = !DILocation(line: 16, column: 3, scope: !2)
!9 = !DILocation(line: 17, column: 3, scope: !2)
!10 = !DILocation(line: 18, column: 3, scope: !2)
!11 = !DILocation(line: 19, column: 3, scope: !2)
!12 = !DILocation(line: 20, column: 3, scope: !2)
!13 = !DILocation(line: 21, column: 3, scope: !2)
!14 = !DILocation(line: 22, column: 3, scope: !2)
!15 = !DILocation(line: 24, column: 3, scope: !2)
!16 = !DILocation(line: 25, column: 3, scope: !2)
!17 = !DILocation(line: 26, column: 3, scope: !2)
!18 = !DILocation(line: 28, column: 3, scope: !2)
!19 = !DILocation(line: 29, column: 3, scope: !2)
!20 = !DILocation(line: 30, column: 3, scope: !2)
!21 = !DILocation(line: 32, column: 3, scope: !2)
!22 = !DILocation(line: 33, column: 3, scope: !2)
!23 = !DILocation(line: 33, column: 15, scope: !2)
!24 = !DILocation(line: 34, column: 3, scope: !2)
!25 = !DILocation(line: 35, column: 3, scope: !2)
!26 = !DILocation(line: 35, column: 15, scope: !2)
!27 = !DILocation(line: 36, column: 3, scope: !2)
!28 = !DILocation(line: 37, column: 3, scope: !2)
!29 = !DILocation(line: 37, column: 15, scope: !2)
!30 = !DILocation(line: 38, column: 3, scope: !2)
!31 = !DILocation(line: 39, column: 3, scope: !2)
!32 = !DILocation(line: 39, column: 15, scope: !2)
!33 = !DILocation(line: 40, column: 3, scope: !2)
!34 = !DILocation(line: 40, column: 21, scope: !2)
!35 = !DILocation(line: 42, column: 3, scope: !2)
!36 = !DILocation(line: 43, column: 3, scope: !2)
!37 = !DILocation(line: 43, column: 16, scope: !2)
!38 = !DILocation(line: 44, column: 3, scope: !2)
!39 = !DILocation(line: 45, column: 3, scope: !2)
!40 = !DILocation(line: 45, column: 16, scope: !2)
!41 = !DILocation(line: 46, column: 3, scope: !2)
!42 = !DILocation(line: 47, column: 3, scope: !2)
!43 = !DILocation(line: 47, column: 16, scope: !2)
!44 = !DILocation(line: 48, column: 3, scope: !2)
!45 = !DILocation(line: 49, column: 3, scope: !2)
!46 = !DILocation(line: 49, column: 15, scope: !2)
!47 = !DILocation(line: 51, column: 3, scope: !2)
!48 = !DILocation(line: 52, column: 3, scope: !2)
!49 = !DILocation(line: 52, column: 15, scope: !2)
!50 = !DILocation(line: 53, column: 3, scope: !2)
!51 = !DILocation(line: 54, column: 3, scope: !2)
!52 = !DILocation(line: 54, column: 16, scope: !2)
!53 = !DILocation(line: 55, column: 3, scope: !2)
!54 = !DILocation(line: 56, column: 3, scope: !2)
!55 = !DILocation(line: 56, column: 15, scope: !2)
!56 = !DILocation(line: 58, column: 3, scope: !2)
!57 = !DILocation(line: 0, scope: !2)
!58 = !DILocation(line: 63, column: 3, scope: !2)
