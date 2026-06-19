; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %lc = alloca [2 x i32], align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %lc, metadata !7, metadata !DIExpression()), !dbg !11
  %lb = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %lb, metadata !12, metadata !DIExpression()), !dbg !16
  %la = alloca [4 x i32], align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %la, metadata !17, metadata !DIExpression()), !dbg !21
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %err, align 4, !dbg !23
  %0 = bitcast [4 x i32]* %la to i32*, !dbg !21
  store i32 1, i32* %0, align 4, !dbg !21
  %1 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 1, !dbg !21
  store i32 2, i32* %1, align 4, !dbg !21
  %2 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 2, !dbg !21
  store i32 3, i32* %2, align 4, !dbg !21
  %3 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 3, !dbg !21
  store i32 0, i32* %3, align 4, !dbg !21
  %4 = bitcast [3 x i32]* %lb to i32*, !dbg !16
  store i32 4, i32* %4, align 4, !dbg !16
  %5 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 1, !dbg !16
  store i32 5, i32* %5, align 4, !dbg !16
  %6 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 2, !dbg !16
  store i32 6, i32* %6, align 4, !dbg !16
  %7 = bitcast [2 x i32]* %lc to i32*, !dbg !11
  store i32 0, i32* %7, align 4, !dbg !11
  %8 = getelementptr [2 x i32], [2 x i32]* %lc, i32 0, i32 1, !dbg !11
  store i32 0, i32* %8, align 4, !dbg !11
  %9 = bitcast [4 x i32]* %la to i32*, !dbg !24
  %10 = bitcast i32* %9 to i32*, !dbg !24
  %11 = load i32, i32* %10, align 4, !dbg !24
  %12 = icmp ne i32 %11, 1, !dbg !24
  br i1 %12, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !25
  %13 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %14 = bitcast [4 x i32]* %la to i32*, !dbg !26
  %15 = getelementptr i32, i32* %14, i32 1, !dbg !26
  %16 = load i32, i32* %15, align 4, !dbg !26
  %17 = icmp ne i32 %16, 2, !dbg !26
  br i1 %17, label %then1, label %if.end3, !dbg !26

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !27
  %18 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end3, !dbg !27

if.end3:                                          ; preds = %if.end, %then1
  %19 = bitcast [4 x i32]* %la to i32*, !dbg !28
  %20 = getelementptr i32, i32* %19, i32 2, !dbg !28
  %21 = load i32, i32* %20, align 4, !dbg !28
  %22 = icmp ne i32 %21, 3, !dbg !28
  br i1 %22, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %23 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %24 = bitcast [4 x i32]* %la to i32*, !dbg !30
  %25 = getelementptr i32, i32* %24, i32 3, !dbg !30
  %26 = load i32, i32* %25, align 4, !dbg !30
  %27 = icmp ne i32 %26, 0, !dbg !30
  br i1 %27, label %then7, label %if.end9, !dbg !30

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !31
  %28 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end9, !dbg !31

if.end9:                                          ; preds = %if.end6, %then7
  %29 = bitcast [3 x i32]* %lb to i32*, !dbg !32
  %30 = bitcast i32* %29 to i32*, !dbg !32
  %31 = load i32, i32* %30, align 4, !dbg !32
  %32 = icmp ne i32 %31, 4, !dbg !32
  br i1 %32, label %then10, label %if.end12, !dbg !32

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !33
  %33 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end12, !dbg !33

if.end12:                                         ; preds = %if.end9, %then10
  %34 = bitcast [3 x i32]* %lb to i32*, !dbg !34
  %35 = getelementptr i32, i32* %34, i32 1, !dbg !34
  %36 = load i32, i32* %35, align 4, !dbg !34
  %37 = icmp ne i32 %36, 5, !dbg !34
  br i1 %37, label %then13, label %if.end15, !dbg !34

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !35
  %38 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end15, !dbg !35

if.end15:                                         ; preds = %if.end12, %then13
  %39 = bitcast [3 x i32]* %lb to i32*, !dbg !36
  %40 = getelementptr i32, i32* %39, i32 2, !dbg !36
  %41 = load i32, i32* %40, align 4, !dbg !36
  %42 = icmp ne i32 %41, 6, !dbg !36
  br i1 %42, label %then16, label %if.end18, !dbg !36

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !37
  %43 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end18, !dbg !37

if.end18:                                         ; preds = %if.end15, %then16
  %44 = bitcast [2 x i32]* %lc to i32*, !dbg !38
  %45 = bitcast i32* %44 to i32*, !dbg !38
  %46 = load i32, i32* %45, align 4, !dbg !38
  %47 = icmp ne i32 %46, 0, !dbg !38
  br i1 %47, label %then19, label %if.end21, !dbg !38

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !39
  %48 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end21, !dbg !39

if.end21:                                         ; preds = %if.end18, %then19
  %49 = bitcast [2 x i32]* %lc to i32*, !dbg !40
  %50 = getelementptr i32, i32* %49, i32 1, !dbg !40
  %51 = load i32, i32* %50, align 4, !dbg !40
  %52 = icmp ne i32 %51, 0, !dbg !40
  br i1 %52, label %then22, label %if.end24, !dbg !40

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !41
  %53 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end24, !dbg !41

if.end24:                                         ; preds = %if.end21, %then22
  %54 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 0), align 4, !dbg !42
  %55 = icmp ne i32 %54, 1, !dbg !42
  br i1 %55, label %then25, label %if.end27, !dbg !42

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !43
  %56 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end27, !dbg !43

if.end27:                                         ; preds = %if.end24, %then25
  %57 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 1), align 4, !dbg !44
  %58 = icmp ne i32 %57, 2, !dbg !44
  br i1 %58, label %then28, label %if.end30, !dbg !44

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !45
  %59 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end30, !dbg !45

if.end30:                                         ; preds = %if.end27, %then28
  %60 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 2), align 4, !dbg !46
  %61 = icmp ne i32 %60, 3, !dbg !46
  br i1 %61, label %then31, label %if.end33, !dbg !46

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !47
  %62 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end33, !dbg !47

if.end33:                                         ; preds = %if.end30, %then31
  %63 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 3), align 4, !dbg !48
  %64 = icmp ne i32 %63, 0, !dbg !48
  br i1 %64, label %then34, label %if.end36, !dbg !48

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !49
  %65 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end36, !dbg !49

if.end36:                                         ; preds = %if.end33, %then34
  %66 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 0), align 4, !dbg !50
  %67 = icmp ne i32 %66, 10, !dbg !50
  br i1 %67, label %then37, label %if.end39, !dbg !50

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !51
  %68 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end39, !dbg !51

if.end39:                                         ; preds = %if.end36, %then37
  %69 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 1), align 4, !dbg !52
  %70 = icmp ne i32 %69, 20, !dbg !52
  br i1 %70, label %then40, label %if.end42, !dbg !52

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !53
  %71 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end42, !dbg !53

if.end42:                                         ; preds = %if.end39, %then40
  %72 = load i32, i32* %err, align 4, !dbg !54
  %73 = icmp eq i32 %72, 0, !dbg !54
  %. = select i1 %73, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !55
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !55
  %75 = load i32, i32* %err, align 4, !dbg !56
  ret i32 %75, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !3, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "lc", scope: !2, file: !1, line: 10, type: !8)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 64, align: 32, elements: !9)
!9 = !{!10}
!10 = !DISubrange(count: 2, lowerBound: 0)
!11 = !DILocation(line: 10, column: 3, scope: !2)
!12 = !DILocalVariable(name: "lb", scope: !2, file: !1, line: 9, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, align: 32, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 3, lowerBound: 0)
!16 = !DILocation(line: 9, column: 3, scope: !2)
!17 = !DILocalVariable(name: "la", scope: !2, file: !1, line: 8, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, align: 32, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 4, lowerBound: 0)
!21 = !DILocation(line: 8, column: 3, scope: !2)
!22 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 7, type: !5)
!23 = !DILocation(line: 7, column: 3, scope: !2)
!24 = !DILocation(line: 12, column: 3, scope: !2)
!25 = !DILocation(line: 12, column: 19, scope: !2)
!26 = !DILocation(line: 13, column: 3, scope: !2)
!27 = !DILocation(line: 13, column: 19, scope: !2)
!28 = !DILocation(line: 14, column: 3, scope: !2)
!29 = !DILocation(line: 14, column: 19, scope: !2)
!30 = !DILocation(line: 15, column: 3, scope: !2)
!31 = !DILocation(line: 15, column: 19, scope: !2)
!32 = !DILocation(line: 17, column: 3, scope: !2)
!33 = !DILocation(line: 17, column: 19, scope: !2)
!34 = !DILocation(line: 18, column: 3, scope: !2)
!35 = !DILocation(line: 18, column: 19, scope: !2)
!36 = !DILocation(line: 19, column: 3, scope: !2)
!37 = !DILocation(line: 19, column: 19, scope: !2)
!38 = !DILocation(line: 21, column: 3, scope: !2)
!39 = !DILocation(line: 21, column: 19, scope: !2)
!40 = !DILocation(line: 22, column: 3, scope: !2)
!41 = !DILocation(line: 22, column: 19, scope: !2)
!42 = !DILocation(line: 24, column: 3, scope: !2)
!43 = !DILocation(line: 24, column: 19, scope: !2)
!44 = !DILocation(line: 25, column: 3, scope: !2)
!45 = !DILocation(line: 25, column: 19, scope: !2)
!46 = !DILocation(line: 26, column: 3, scope: !2)
!47 = !DILocation(line: 26, column: 19, scope: !2)
!48 = !DILocation(line: 27, column: 3, scope: !2)
!49 = !DILocation(line: 27, column: 19, scope: !2)
!50 = !DILocation(line: 29, column: 3, scope: !2)
!51 = !DILocation(line: 29, column: 20, scope: !2)
!52 = !DILocation(line: 30, column: 3, scope: !2)
!53 = !DILocation(line: 30, column: 20, scope: !2)
!54 = !DILocation(line: 32, column: 3, scope: !2)
!55 = !DILocation(line: 0, scope: !2)
!56 = !DILocation(line: 37, column: 3, scope: !2)
