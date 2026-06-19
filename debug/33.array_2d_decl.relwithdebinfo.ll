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
  call void @llvm.dbg.declare(metadata i32* %v, metadata !7, metadata !DIExpression()), !dbg !8
  %grid = alloca [2 x [2 x %struct.Cell]], align 8
  call void @llvm.dbg.declare(metadata [2 x [2 x %struct.Cell]]* %grid, metadata !9, metadata !DIExpression()), !dbg !15
  %scalar = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %scalar, metadata !16, metadata !DIExpression()), !dbg !17
  %m = alloca [2 x [3 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %m, metadata !18, metadata !DIExpression()), !dbg !17
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %err, align 4, !dbg !24
  %0 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !25
  %1 = bitcast [3 x i32]* %0 to [3 x i32]*, !dbg !25
  %2 = bitcast [3 x i32]* %1 to i32*, !dbg !25
  %3 = bitcast i32* %2 to i32*, !dbg !25
  store i32 1, i32* %3, align 4, !dbg !25
  %4 = load i32, i32* %3, align 4, !dbg !25
  %5 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !26
  %6 = bitcast [3 x i32]* %5 to [3 x i32]*, !dbg !26
  %7 = bitcast [3 x i32]* %6 to i32*, !dbg !26
  %8 = getelementptr i32, i32* %7, i32 1, !dbg !26
  store i32 2, i32* %8, align 4, !dbg !26
  %9 = load i32, i32* %8, align 4, !dbg !26
  %10 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !27
  %11 = bitcast [3 x i32]* %10 to [3 x i32]*, !dbg !27
  %12 = bitcast [3 x i32]* %11 to i32*, !dbg !27
  %13 = getelementptr i32, i32* %12, i32 2, !dbg !27
  store i32 3, i32* %13, align 4, !dbg !27
  %14 = load i32, i32* %13, align 4, !dbg !27
  %15 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !28
  %16 = getelementptr [3 x i32], [3 x i32]* %15, i32 1, !dbg !28
  %17 = bitcast [3 x i32]* %16 to i32*, !dbg !28
  %18 = bitcast i32* %17 to i32*, !dbg !28
  store i32 4, i32* %18, align 4, !dbg !28
  %19 = load i32, i32* %18, align 4, !dbg !28
  %20 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !29
  %21 = getelementptr [3 x i32], [3 x i32]* %20, i32 1, !dbg !29
  %22 = bitcast [3 x i32]* %21 to i32*, !dbg !29
  %23 = getelementptr i32, i32* %22, i32 1, !dbg !29
  store i32 5, i32* %23, align 4, !dbg !29
  %24 = load i32, i32* %23, align 4, !dbg !29
  %25 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !30
  %26 = getelementptr [3 x i32], [3 x i32]* %25, i32 1, !dbg !30
  %27 = bitcast [3 x i32]* %26 to i32*, !dbg !30
  %28 = getelementptr i32, i32* %27, i32 2, !dbg !30
  store i32 6, i32* %28, align 4, !dbg !30
  %29 = load i32, i32* %28, align 4, !dbg !30
  store i32 99, i32* %scalar, align 4, !dbg !31
  %30 = load i32, i32* %scalar, align 4, !dbg !31
  store i32 10, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !32
  %31 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !32
  store i32 20, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !33
  %32 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !33
  store i32 30, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !34
  %33 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !34
  %34 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !35
  %35 = bitcast [2 x %struct.Cell]* %34 to [2 x %struct.Cell]*, !dbg !35
  %36 = bitcast [2 x %struct.Cell]* %35 to %struct.Cell*, !dbg !35
  %37 = getelementptr %struct.Cell, %struct.Cell* %36, i32 1, !dbg !35
  %38 = bitcast %struct.Cell* %37 to i32*, !dbg !35
  store i32 7, i32* %38, align 4, !dbg !35
  %39 = load i32, i32* %38, align 4, !dbg !35
  %40 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !36
  %41 = bitcast [2 x %struct.Cell]* %40 to [2 x %struct.Cell]*, !dbg !36
  %42 = bitcast [2 x %struct.Cell]* %41 to %struct.Cell*, !dbg !36
  %43 = getelementptr %struct.Cell, %struct.Cell* %42, i32 1, !dbg !36
  %44 = getelementptr %struct.Cell, %struct.Cell* %43, i32 0, i32 1, !dbg !36
  store i32 70, i32* %44, align 4, !dbg !36
  %45 = load i32, i32* %44, align 4, !dbg !36
  %46 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !37
  %47 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %46, i32 1, !dbg !37
  %48 = bitcast [2 x %struct.Cell]* %47 to %struct.Cell*, !dbg !37
  %49 = bitcast %struct.Cell* %48 to %struct.Cell*, !dbg !37
  %50 = bitcast %struct.Cell* %49 to i32*, !dbg !37
  store i32 8, i32* %50, align 4, !dbg !37
  %51 = load i32, i32* %50, align 4, !dbg !37
  %52 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !38
  %53 = bitcast [3 x i32]* %52 to [3 x i32]*, !dbg !38
  %54 = bitcast [3 x i32]* %53 to i32*, !dbg !38
  %55 = bitcast i32* %54 to i32*, !dbg !38
  %56 = load i32, i32* %55, align 4, !dbg !38
  store i32 %56, i32* %v, align 4, !dbg !38
  %57 = load i32, i32* %v, align 4, !dbg !38
  %58 = load i32, i32* %v, align 4, !dbg !39
  %59 = icmp ne i32 %58, 1, !dbg !39
  br i1 %59, label %then, label %if.end, !dbg !39

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !40
  %60 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end, !dbg !40

if.end:                                           ; preds = %entry, %then
  %61 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !41
  %62 = bitcast [3 x i32]* %61 to [3 x i32]*, !dbg !41
  %63 = bitcast [3 x i32]* %62 to i32*, !dbg !41
  %64 = getelementptr i32, i32* %63, i32 2, !dbg !41
  %65 = load i32, i32* %64, align 4, !dbg !41
  store i32 %65, i32* %v, align 4, !dbg !41
  %66 = load i32, i32* %v, align 4, !dbg !41
  %67 = load i32, i32* %v, align 4, !dbg !42
  %68 = icmp ne i32 %67, 3, !dbg !42
  br i1 %68, label %then1, label %if.end3, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !43
  %69 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %if.end, %then1
  %70 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !44
  %71 = getelementptr [3 x i32], [3 x i32]* %70, i32 1, !dbg !44
  %72 = bitcast [3 x i32]* %71 to i32*, !dbg !44
  %73 = getelementptr i32, i32* %72, i32 1, !dbg !44
  %74 = load i32, i32* %73, align 4, !dbg !44
  store i32 %74, i32* %v, align 4, !dbg !44
  %75 = load i32, i32* %v, align 4, !dbg !44
  %76 = load i32, i32* %v, align 4, !dbg !45
  %77 = icmp ne i32 %76, 5, !dbg !45
  br i1 %77, label %then4, label %if.end6, !dbg !45

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !46
  %78 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end6, !dbg !46

if.end6:                                          ; preds = %if.end3, %then4
  %79 = bitcast [2 x [3 x i32]]* %m to [3 x i32]*, !dbg !47
  %80 = getelementptr [3 x i32], [3 x i32]* %79, i32 1, !dbg !47
  %81 = bitcast [3 x i32]* %80 to i32*, !dbg !47
  %82 = getelementptr i32, i32* %81, i32 2, !dbg !47
  %83 = load i32, i32* %82, align 4, !dbg !47
  store i32 %83, i32* %v, align 4, !dbg !47
  %84 = load i32, i32* %v, align 4, !dbg !47
  %85 = load i32, i32* %v, align 4, !dbg !48
  %86 = icmp ne i32 %85, 6, !dbg !48
  br i1 %86, label %then7, label %if.end9, !dbg !48

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !49
  %87 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end9, !dbg !49

if.end9:                                          ; preds = %if.end6, %then7
  %88 = load i32, i32* %scalar, align 4, !dbg !50
  %89 = icmp ne i32 %88, 99, !dbg !50
  br i1 %89, label %then10, label %if.end12, !dbg !50

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !51
  %90 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end12, !dbg !51

if.end12:                                         ; preds = %if.end9, %then10
  %91 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 0), align 4, !dbg !52
  store i32 %91, i32* %v, align 4, !dbg !52
  %92 = load i32, i32* %v, align 4, !dbg !52
  %93 = load i32, i32* %v, align 4, !dbg !53
  %94 = icmp ne i32 %93, 10, !dbg !53
  br i1 %94, label %then13, label %if.end15, !dbg !53

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !54
  %95 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %if.end12, %then13
  %96 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 1, i32 2), align 4, !dbg !55
  store i32 %96, i32* %v, align 4, !dbg !55
  %97 = load i32, i32* %v, align 4, !dbg !55
  %98 = load i32, i32* %v, align 4, !dbg !56
  %99 = icmp ne i32 %98, 20, !dbg !56
  br i1 %99, label %then16, label %if.end18, !dbg !56

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !57
  %100 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %if.end15, %then16
  %101 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 2, i32 3), align 4, !dbg !58
  store i32 %101, i32* %v, align 4, !dbg !58
  %102 = load i32, i32* %v, align 4, !dbg !58
  %103 = load i32, i32* %v, align 4, !dbg !59
  %104 = icmp ne i32 %103, 30, !dbg !59
  br i1 %104, label %then19, label %if.end21, !dbg !59

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !60
  %105 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end21, !dbg !60

if.end21:                                         ; preds = %if.end18, %then19
  %106 = load i32, i32* getelementptr inbounds ([3 x [4 x i32]], [3 x [4 x i32]]* @gm, i32 0, i32 0, i32 1), align 4, !dbg !61
  store i32 %106, i32* %v, align 4, !dbg !61
  %107 = load i32, i32* %v, align 4, !dbg !61
  %108 = load i32, i32* %v, align 4, !dbg !62
  %109 = icmp ne i32 %108, 0, !dbg !62
  br i1 %109, label %then22, label %if.end24, !dbg !62

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !63
  %110 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end24, !dbg !63

if.end24:                                         ; preds = %if.end21, %then22
  %111 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !64
  %112 = bitcast [2 x %struct.Cell]* %111 to [2 x %struct.Cell]*, !dbg !64
  %113 = bitcast [2 x %struct.Cell]* %112 to %struct.Cell*, !dbg !64
  %114 = getelementptr %struct.Cell, %struct.Cell* %113, i32 1, !dbg !64
  %115 = bitcast %struct.Cell* %114 to i32*, !dbg !64
  %116 = load i32, i32* %115, align 4, !dbg !64
  store i32 %116, i32* %v, align 4, !dbg !64
  %117 = load i32, i32* %v, align 4, !dbg !64
  %118 = load i32, i32* %v, align 4, !dbg !65
  %119 = icmp ne i32 %118, 7, !dbg !65
  br i1 %119, label %then25, label %if.end27, !dbg !65

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !66
  %120 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end27, !dbg !66

if.end27:                                         ; preds = %if.end24, %then25
  %121 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !67
  %122 = bitcast [2 x %struct.Cell]* %121 to [2 x %struct.Cell]*, !dbg !67
  %123 = bitcast [2 x %struct.Cell]* %122 to %struct.Cell*, !dbg !67
  %124 = getelementptr %struct.Cell, %struct.Cell* %123, i32 1, !dbg !67
  %125 = getelementptr %struct.Cell, %struct.Cell* %124, i32 0, i32 1, !dbg !67
  %126 = load i32, i32* %125, align 4, !dbg !67
  store i32 %126, i32* %v, align 4, !dbg !67
  %127 = load i32, i32* %v, align 4, !dbg !67
  %128 = load i32, i32* %v, align 4, !dbg !68
  %129 = icmp ne i32 %128, 70, !dbg !68
  br i1 %129, label %then28, label %if.end30, !dbg !68

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !69
  %130 = load i32, i32* %err, align 4, !dbg !69
  br label %if.end30, !dbg !69

if.end30:                                         ; preds = %if.end27, %then28
  %131 = bitcast [2 x [2 x %struct.Cell]]* %grid to [2 x %struct.Cell]*, !dbg !70
  %132 = getelementptr [2 x %struct.Cell], [2 x %struct.Cell]* %131, i32 1, !dbg !70
  %133 = bitcast [2 x %struct.Cell]* %132 to %struct.Cell*, !dbg !70
  %134 = bitcast %struct.Cell* %133 to %struct.Cell*, !dbg !70
  %135 = bitcast %struct.Cell* %134 to i32*, !dbg !70
  %136 = load i32, i32* %135, align 4, !dbg !70
  store i32 %136, i32* %v, align 4, !dbg !70
  %137 = load i32, i32* %v, align 4, !dbg !70
  %138 = load i32, i32* %v, align 4, !dbg !71
  %139 = icmp ne i32 %138, 8, !dbg !71
  br i1 %139, label %then31, label %if.end33, !dbg !71

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !72
  %140 = load i32, i32* %err, align 4, !dbg !72
  br label %if.end33, !dbg !72

if.end33:                                         ; preds = %if.end30, %then31
  %141 = load i32, i32* %err, align 4, !dbg !73
  %142 = icmp eq i32 %141, 0, !dbg !73
  %. = select i1 %142, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @1, i32 0, i32 0), !dbg !74
  %143 = call i32 (i8*, ...) @printf(i8* %.), !dbg !74
  %144 = load i32, i32* %err, align 4, !dbg !75
  ret i32 %144, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "33.array_2d_decl.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 10, type: !3, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "v", scope: !2, file: !1, line: 14, type: !5)
!8 = !DILocation(line: 14, column: 3, scope: !2)
!9 = !DILocalVariable(name: "grid", scope: !2, file: !1, line: 13, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, align: 32, elements: !13)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, align: 32, elements: !13)
!12 = !DIBasicType(name: "struct.Cell", size: 64, encoding: DW_ATE_unsigned)
!13 = !{!14}
!14 = !DISubrange(count: 2, lowerBound: 0)
!15 = !DILocation(line: 13, column: 3, scope: !2)
!16 = !DILocalVariable(name: "scalar", scope: !2, file: !1, line: 12, type: !5)
!17 = !DILocation(line: 12, column: 3, scope: !2)
!18 = !DILocalVariable(name: "m", scope: !2, file: !1, line: 12, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 192, align: 32, elements: !13)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 3, lowerBound: 0)
!23 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 11, type: !5)
!24 = !DILocation(line: 11, column: 3, scope: !2)
!25 = !DILocation(line: 16, column: 3, scope: !2)
!26 = !DILocation(line: 17, column: 3, scope: !2)
!27 = !DILocation(line: 18, column: 3, scope: !2)
!28 = !DILocation(line: 19, column: 3, scope: !2)
!29 = !DILocation(line: 20, column: 3, scope: !2)
!30 = !DILocation(line: 21, column: 3, scope: !2)
!31 = !DILocation(line: 22, column: 3, scope: !2)
!32 = !DILocation(line: 24, column: 3, scope: !2)
!33 = !DILocation(line: 25, column: 3, scope: !2)
!34 = !DILocation(line: 26, column: 3, scope: !2)
!35 = !DILocation(line: 28, column: 3, scope: !2)
!36 = !DILocation(line: 29, column: 3, scope: !2)
!37 = !DILocation(line: 30, column: 3, scope: !2)
!38 = !DILocation(line: 32, column: 3, scope: !2)
!39 = !DILocation(line: 33, column: 3, scope: !2)
!40 = !DILocation(line: 33, column: 15, scope: !2)
!41 = !DILocation(line: 34, column: 3, scope: !2)
!42 = !DILocation(line: 35, column: 3, scope: !2)
!43 = !DILocation(line: 35, column: 15, scope: !2)
!44 = !DILocation(line: 36, column: 3, scope: !2)
!45 = !DILocation(line: 37, column: 3, scope: !2)
!46 = !DILocation(line: 37, column: 15, scope: !2)
!47 = !DILocation(line: 38, column: 3, scope: !2)
!48 = !DILocation(line: 39, column: 3, scope: !2)
!49 = !DILocation(line: 39, column: 15, scope: !2)
!50 = !DILocation(line: 40, column: 3, scope: !2)
!51 = !DILocation(line: 40, column: 21, scope: !2)
!52 = !DILocation(line: 42, column: 3, scope: !2)
!53 = !DILocation(line: 43, column: 3, scope: !2)
!54 = !DILocation(line: 43, column: 16, scope: !2)
!55 = !DILocation(line: 44, column: 3, scope: !2)
!56 = !DILocation(line: 45, column: 3, scope: !2)
!57 = !DILocation(line: 45, column: 16, scope: !2)
!58 = !DILocation(line: 46, column: 3, scope: !2)
!59 = !DILocation(line: 47, column: 3, scope: !2)
!60 = !DILocation(line: 47, column: 16, scope: !2)
!61 = !DILocation(line: 48, column: 3, scope: !2)
!62 = !DILocation(line: 49, column: 3, scope: !2)
!63 = !DILocation(line: 49, column: 15, scope: !2)
!64 = !DILocation(line: 51, column: 3, scope: !2)
!65 = !DILocation(line: 52, column: 3, scope: !2)
!66 = !DILocation(line: 52, column: 15, scope: !2)
!67 = !DILocation(line: 53, column: 3, scope: !2)
!68 = !DILocation(line: 54, column: 3, scope: !2)
!69 = !DILocation(line: 54, column: 16, scope: !2)
!70 = !DILocation(line: 55, column: 3, scope: !2)
!71 = !DILocation(line: 56, column: 3, scope: !2)
!72 = !DILocation(line: 56, column: 15, scope: !2)
!73 = !DILocation(line: 58, column: 3, scope: !2)
!74 = !DILocation(line: 0, scope: !2)
!75 = !DILocation(line: 63, column: 3, scope: !2)
