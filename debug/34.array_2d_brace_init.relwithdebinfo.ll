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
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %lc, metadata !7, metadata !DIExpression()), !dbg !14
  %lb = alloca [2 x [3 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %lb, metadata !15, metadata !DIExpression()), !dbg !16
  %la = alloca [2 x [3 x i32]], align 4
  call void @llvm.dbg.declare(metadata [2 x [3 x i32]]* %la, metadata !17, metadata !DIExpression()), !dbg !18
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %err, align 4, !dbg !20
  %0 = bitcast [2 x [3 x i32]]* %la to i32*, !dbg !18
  store i32 1, i32* %0, align 4, !dbg !18
  %1 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 1, !dbg !18
  store i32 2, i32* %1, align 4, !dbg !18
  %2 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 0, i32 2, !dbg !18
  store i32 0, i32* %2, align 4, !dbg !18
  %3 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 0, !dbg !18
  store i32 3, i32* %3, align 4, !dbg !18
  %4 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 1, !dbg !18
  store i32 0, i32* %4, align 4, !dbg !18
  %5 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %la, i32 0, i32 1, i32 2, !dbg !18
  store i32 0, i32* %5, align 4, !dbg !18
  %6 = bitcast [2 x [3 x i32]]* %lb to i32*, !dbg !16
  store i32 7, i32* %6, align 4, !dbg !16
  %7 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 1, !dbg !16
  store i32 8, i32* %7, align 4, !dbg !16
  %8 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 0, i32 2, !dbg !16
  store i32 9, i32* %8, align 4, !dbg !16
  %9 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 0, !dbg !16
  store i32 10, i32* %9, align 4, !dbg !16
  %10 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 1, !dbg !16
  store i32 11, i32* %10, align 4, !dbg !16
  %11 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lb, i32 0, i32 1, i32 2, !dbg !16
  store i32 12, i32* %11, align 4, !dbg !16
  %12 = bitcast [2 x [3 x i32]]* %lc to i32*, !dbg !14
  store i32 1, i32* %12, align 4, !dbg !14
  %13 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 1, !dbg !14
  store i32 2, i32* %13, align 4, !dbg !14
  %14 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 0, i32 2, !dbg !14
  store i32 3, i32* %14, align 4, !dbg !14
  %15 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 0, !dbg !14
  store i32 4, i32* %15, align 4, !dbg !14
  %16 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 1, !dbg !14
  store i32 0, i32* %16, align 4, !dbg !14
  %17 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %lc, i32 0, i32 1, i32 2, !dbg !14
  store i32 0, i32* %17, align 4, !dbg !14
  %18 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !21
  %19 = bitcast [3 x i32]* %18 to [3 x i32]*, !dbg !21
  %20 = bitcast [3 x i32]* %19 to i32*, !dbg !21
  %21 = bitcast i32* %20 to i32*, !dbg !21
  %22 = load i32, i32* %21, align 4, !dbg !21
  %23 = icmp ne i32 %22, 1, !dbg !21
  br i1 %23, label %then, label %if.end, !dbg !21

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !22
  %24 = load i32, i32* %err, align 4, !dbg !22
  br label %if.end, !dbg !22

if.end:                                           ; preds = %entry, %then
  %25 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !23
  %26 = bitcast [3 x i32]* %25 to [3 x i32]*, !dbg !23
  %27 = bitcast [3 x i32]* %26 to i32*, !dbg !23
  %28 = getelementptr i32, i32* %27, i32 2, !dbg !23
  %29 = load i32, i32* %28, align 4, !dbg !23
  %30 = icmp ne i32 %29, 0, !dbg !23
  br i1 %30, label %then1, label %if.end3, !dbg !23

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !24
  %31 = load i32, i32* %err, align 4, !dbg !24
  br label %if.end3, !dbg !24

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !25
  %33 = getelementptr [3 x i32], [3 x i32]* %32, i32 1, !dbg !25
  %34 = bitcast [3 x i32]* %33 to i32*, !dbg !25
  %35 = bitcast i32* %34 to i32*, !dbg !25
  %36 = load i32, i32* %35, align 4, !dbg !25
  %37 = icmp ne i32 %36, 3, !dbg !25
  br i1 %37, label %then4, label %if.end6, !dbg !25

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !26
  %38 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end6, !dbg !26

if.end6:                                          ; preds = %if.end3, %then4
  %39 = bitcast [2 x [3 x i32]]* %la to [3 x i32]*, !dbg !27
  %40 = getelementptr [3 x i32], [3 x i32]* %39, i32 1, !dbg !27
  %41 = bitcast [3 x i32]* %40 to i32*, !dbg !27
  %42 = getelementptr i32, i32* %41, i32 2, !dbg !27
  %43 = load i32, i32* %42, align 4, !dbg !27
  %44 = icmp ne i32 %43, 0, !dbg !27
  br i1 %44, label %then7, label %if.end9, !dbg !27

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !28
  %45 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end9, !dbg !28

if.end9:                                          ; preds = %if.end6, %then7
  %46 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*, !dbg !29
  %47 = bitcast [3 x i32]* %46 to [3 x i32]*, !dbg !29
  %48 = bitcast [3 x i32]* %47 to i32*, !dbg !29
  %49 = bitcast i32* %48 to i32*, !dbg !29
  %50 = load i32, i32* %49, align 4, !dbg !29
  %51 = icmp ne i32 %50, 7, !dbg !29
  br i1 %51, label %then10, label %if.end12, !dbg !29

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !30
  %52 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end12, !dbg !30

if.end12:                                         ; preds = %if.end9, %then10
  %53 = bitcast [2 x [3 x i32]]* %lb to [3 x i32]*, !dbg !31
  %54 = getelementptr [3 x i32], [3 x i32]* %53, i32 1, !dbg !31
  %55 = bitcast [3 x i32]* %54 to i32*, !dbg !31
  %56 = getelementptr i32, i32* %55, i32 2, !dbg !31
  %57 = load i32, i32* %56, align 4, !dbg !31
  %58 = icmp ne i32 %57, 12, !dbg !31
  br i1 %58, label %then13, label %if.end15, !dbg !31

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !32
  %59 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end15, !dbg !32

if.end15:                                         ; preds = %if.end12, %then13
  %60 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !33
  %61 = bitcast [3 x i32]* %60 to [3 x i32]*, !dbg !33
  %62 = bitcast [3 x i32]* %61 to i32*, !dbg !33
  %63 = getelementptr i32, i32* %62, i32 2, !dbg !33
  %64 = load i32, i32* %63, align 4, !dbg !33
  %65 = icmp ne i32 %64, 3, !dbg !33
  br i1 %65, label %then16, label %if.end18, !dbg !33

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !34
  %66 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end18, !dbg !34

if.end18:                                         ; preds = %if.end15, %then16
  %67 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !35
  %68 = getelementptr [3 x i32], [3 x i32]* %67, i32 1, !dbg !35
  %69 = bitcast [3 x i32]* %68 to i32*, !dbg !35
  %70 = bitcast i32* %69 to i32*, !dbg !35
  %71 = load i32, i32* %70, align 4, !dbg !35
  %72 = icmp ne i32 %71, 4, !dbg !35
  br i1 %72, label %then19, label %if.end21, !dbg !35

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !36
  %73 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end21, !dbg !36

if.end21:                                         ; preds = %if.end18, %then19
  %74 = bitcast [2 x [3 x i32]]* %lc to [3 x i32]*, !dbg !37
  %75 = getelementptr [3 x i32], [3 x i32]* %74, i32 1, !dbg !37
  %76 = bitcast [3 x i32]* %75 to i32*, !dbg !37
  %77 = getelementptr i32, i32* %76, i32 2, !dbg !37
  %78 = load i32, i32* %77, align 4, !dbg !37
  %79 = icmp ne i32 %78, 0, !dbg !37
  br i1 %79, label %then22, label %if.end24, !dbg !37

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !38
  %80 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end24, !dbg !38

if.end24:                                         ; preds = %if.end21, %then22
  %81 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 0, i32 0), align 4, !dbg !39
  %82 = icmp ne i32 %81, 1, !dbg !39
  br i1 %82, label %then25, label %if.end27, !dbg !39

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !40
  %83 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end27, !dbg !40

if.end27:                                         ; preds = %if.end24, %then25
  %84 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @ga, i32 0, i32 1, i32 2), align 4, !dbg !41
  %85 = icmp ne i32 %84, 6, !dbg !41
  br i1 %85, label %then28, label %if.end30, !dbg !41

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !42
  %86 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end30, !dbg !42

if.end30:                                         ; preds = %if.end27, %then28
  %87 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 0, i32 1), align 4, !dbg !43
  %88 = icmp ne i32 %87, 1, !dbg !43
  br i1 %88, label %then31, label %if.end33, !dbg !43

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !44
  %89 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end33, !dbg !44

if.end33:                                         ; preds = %if.end30, %then31
  %90 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @gb, i32 0, i32 1, i32 0), align 4, !dbg !45
  %91 = icmp ne i32 %90, 3, !dbg !45
  br i1 %91, label %then34, label %if.end36, !dbg !45

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !46
  %92 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end36, !dbg !46

if.end36:                                         ; preds = %if.end33, %then34
  %93 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 0, i32 1), align 4, !dbg !47
  %94 = icmp ne i32 %93, 11, !dbg !47
  br i1 %94, label %then37, label %if.end39, !dbg !47

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !48
  %95 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end39, !dbg !48

if.end39:                                         ; preds = %if.end36, %then37
  %96 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 0), align 4, !dbg !49
  %97 = icmp ne i32 %96, 20, !dbg !49
  br i1 %97, label %then40, label %if.end42, !dbg !49

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !50
  %98 = load i32, i32* %err, align 4, !dbg !50
  br label %if.end42, !dbg !50

if.end42:                                         ; preds = %if.end39, %then40
  %99 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @gc, i32 0, i32 1, i32 1), align 4, !dbg !51
  %100 = icmp ne i32 %99, 0, !dbg !51
  br i1 %100, label %then43, label %if.end45, !dbg !51

then43:                                           ; preds = %if.end42
  store i32 1, i32* %err, align 4, !dbg !52
  %101 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end45, !dbg !52

if.end45:                                         ; preds = %if.end42, %then43
  %102 = load i32, i32* %err, align 4, !dbg !53
  %103 = icmp eq i32 %102, 0, !dbg !53
  %. = select i1 %103, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !54
  %104 = call i32 (i8*, ...) @printf(i8* %.), !dbg !54
  %105 = load i32, i32* %err, align 4, !dbg !55
  ret i32 %105, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "34.array_2d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !3, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "lc", scope: !2, file: !1, line: 11, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !12)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3, lowerBound: 0)
!12 = !{!13}
!13 = !DISubrange(count: 2, lowerBound: 0)
!14 = !DILocation(line: 11, column: 3, scope: !2)
!15 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 10, type: !8)
!16 = !DILocation(line: 10, column: 3, scope: !2)
!17 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 9, type: !8)
!18 = !DILocation(line: 9, column: 3, scope: !2)
!19 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 8, type: !5)
!20 = !DILocation(line: 8, column: 3, scope: !2)
!21 = !DILocation(line: 13, column: 3, scope: !2)
!22 = !DILocation(line: 13, column: 22, scope: !2)
!23 = !DILocation(line: 14, column: 3, scope: !2)
!24 = !DILocation(line: 14, column: 22, scope: !2)
!25 = !DILocation(line: 15, column: 3, scope: !2)
!26 = !DILocation(line: 15, column: 22, scope: !2)
!27 = !DILocation(line: 16, column: 3, scope: !2)
!28 = !DILocation(line: 16, column: 22, scope: !2)
!29 = !DILocation(line: 18, column: 3, scope: !2)
!30 = !DILocation(line: 18, column: 22, scope: !2)
!31 = !DILocation(line: 19, column: 3, scope: !2)
!32 = !DILocation(line: 19, column: 23, scope: !2)
!33 = !DILocation(line: 21, column: 3, scope: !2)
!34 = !DILocation(line: 21, column: 22, scope: !2)
!35 = !DILocation(line: 22, column: 3, scope: !2)
!36 = !DILocation(line: 22, column: 22, scope: !2)
!37 = !DILocation(line: 23, column: 3, scope: !2)
!38 = !DILocation(line: 23, column: 22, scope: !2)
!39 = !DILocation(line: 25, column: 3, scope: !2)
!40 = !DILocation(line: 25, column: 22, scope: !2)
!41 = !DILocation(line: 26, column: 3, scope: !2)
!42 = !DILocation(line: 26, column: 22, scope: !2)
!43 = !DILocation(line: 28, column: 3, scope: !2)
!44 = !DILocation(line: 28, column: 22, scope: !2)
!45 = !DILocation(line: 29, column: 3, scope: !2)
!46 = !DILocation(line: 29, column: 22, scope: !2)
!47 = !DILocation(line: 31, column: 3, scope: !2)
!48 = !DILocation(line: 31, column: 23, scope: !2)
!49 = !DILocation(line: 32, column: 3, scope: !2)
!50 = !DILocation(line: 32, column: 23, scope: !2)
!51 = !DILocation(line: 33, column: 3, scope: !2)
!52 = !DILocation(line: 33, column: 22, scope: !2)
!53 = !DILocation(line: 35, column: 3, scope: !2)
!54 = !DILocation(line: 0, scope: !2)
!55 = !DILocation(line: 40, column: 3, scope: !2)
