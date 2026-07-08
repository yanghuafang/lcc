; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@ga = global [4 x i32] [i32 1, i32 2, i32 3, i32 0]
@gb = global [2 x i32] [i32 10, i32 20]
@0 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [31 x i8] c"31.array_1d_brace_init.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %lc = alloca [2 x i32], align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %lc, metadata !9, metadata !DIExpression()), !dbg !13
  %lb = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %lb, metadata !14, metadata !DIExpression()), !dbg !18
  %la = alloca [4 x i32], align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %la, metadata !19, metadata !DIExpression()), !dbg !23
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %err, align 4, !dbg !25
  %0 = bitcast [4 x i32]* %la to i32*, !dbg !23
  store i32 1, i32* %0, align 4, !dbg !23
  %1 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 1, !dbg !23
  store i32 2, i32* %1, align 4, !dbg !23
  %2 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 2, !dbg !23
  store i32 3, i32* %2, align 4, !dbg !23
  %3 = getelementptr [4 x i32], [4 x i32]* %la, i32 0, i32 3, !dbg !23
  store i32 0, i32* %3, align 4, !dbg !23
  %4 = bitcast [3 x i32]* %lb to i32*, !dbg !18
  store i32 4, i32* %4, align 4, !dbg !18
  %5 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 1, !dbg !18
  store i32 5, i32* %5, align 4, !dbg !18
  %6 = getelementptr [3 x i32], [3 x i32]* %lb, i32 0, i32 2, !dbg !18
  store i32 6, i32* %6, align 4, !dbg !18
  %7 = bitcast [2 x i32]* %lc to i32*, !dbg !13
  store i32 0, i32* %7, align 4, !dbg !13
  %8 = getelementptr [2 x i32], [2 x i32]* %lc, i32 0, i32 1, !dbg !13
  store i32 0, i32* %8, align 4, !dbg !13
  %9 = bitcast [4 x i32]* %la to i32*, !dbg !26
  %10 = bitcast i32* %9 to i32*, !dbg !26
  %11 = load i32, i32* %10, align 4, !dbg !26
  %12 = icmp ne i32 %11, 1, !dbg !26
  br i1 %12, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !27
  %13 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %14 = bitcast [4 x i32]* %la to i32*, !dbg !28
  %15 = getelementptr i32, i32* %14, i32 1, !dbg !28
  %16 = load i32, i32* %15, align 4, !dbg !28
  %17 = icmp ne i32 %16, 2, !dbg !28
  br i1 %17, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !29
  %18 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %19 = bitcast [4 x i32]* %la to i32*, !dbg !30
  %20 = getelementptr i32, i32* %19, i32 2, !dbg !30
  %21 = load i32, i32* %20, align 4, !dbg !30
  %22 = icmp ne i32 %21, 3, !dbg !30
  br i1 %22, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !31
  %23 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %24 = bitcast [4 x i32]* %la to i32*, !dbg !32
  %25 = getelementptr i32, i32* %24, i32 3, !dbg !32
  %26 = load i32, i32* %25, align 4, !dbg !32
  %27 = icmp ne i32 %26, 0, !dbg !32
  br i1 %27, label %then7, label %if.end9, !dbg !32

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !33
  %28 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end9, !dbg !33

if.end9:                                          ; preds = %if.end6, %then7
  %29 = bitcast [3 x i32]* %lb to i32*, !dbg !34
  %30 = bitcast i32* %29 to i32*, !dbg !34
  %31 = load i32, i32* %30, align 4, !dbg !34
  %32 = icmp ne i32 %31, 4, !dbg !34
  br i1 %32, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !35
  %33 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  %34 = bitcast [3 x i32]* %lb to i32*, !dbg !36
  %35 = getelementptr i32, i32* %34, i32 1, !dbg !36
  %36 = load i32, i32* %35, align 4, !dbg !36
  %37 = icmp ne i32 %36, 5, !dbg !36
  br i1 %37, label %then13, label %if.end15, !dbg !36

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !37
  %38 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end15, !dbg !37

if.end15:                                         ; preds = %if.end12, %then13
  %39 = bitcast [3 x i32]* %lb to i32*, !dbg !38
  %40 = getelementptr i32, i32* %39, i32 2, !dbg !38
  %41 = load i32, i32* %40, align 4, !dbg !38
  %42 = icmp ne i32 %41, 6, !dbg !38
  br i1 %42, label %then16, label %if.end18, !dbg !38

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !39
  %43 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end18, !dbg !39

if.end18:                                         ; preds = %if.end15, %then16
  %44 = bitcast [2 x i32]* %lc to i32*, !dbg !40
  %45 = bitcast i32* %44 to i32*, !dbg !40
  %46 = load i32, i32* %45, align 4, !dbg !40
  %47 = icmp ne i32 %46, 0, !dbg !40
  br i1 %47, label %then19, label %if.end21, !dbg !40

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !41
  %48 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end21, !dbg !41

if.end21:                                         ; preds = %if.end18, %then19
  %49 = bitcast [2 x i32]* %lc to i32*, !dbg !42
  %50 = getelementptr i32, i32* %49, i32 1, !dbg !42
  %51 = load i32, i32* %50, align 4, !dbg !42
  %52 = icmp ne i32 %51, 0, !dbg !42
  br i1 %52, label %then22, label %if.end24, !dbg !42

then22:                                           ; preds = %if.end21
  store i32 1, i32* %err, align 4, !dbg !43
  %53 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end24, !dbg !43

if.end24:                                         ; preds = %if.end21, %then22
  %54 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 0), align 4, !dbg !44
  %55 = icmp ne i32 %54, 1, !dbg !44
  br i1 %55, label %then25, label %if.end27, !dbg !44

then25:                                           ; preds = %if.end24
  store i32 1, i32* %err, align 4, !dbg !45
  %56 = load i32, i32* %err, align 4, !dbg !45
  br label %if.end27, !dbg !45

if.end27:                                         ; preds = %if.end24, %then25
  %57 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 1), align 4, !dbg !46
  %58 = icmp ne i32 %57, 2, !dbg !46
  br i1 %58, label %then28, label %if.end30, !dbg !46

then28:                                           ; preds = %if.end27
  store i32 1, i32* %err, align 4, !dbg !47
  %59 = load i32, i32* %err, align 4, !dbg !47
  br label %if.end30, !dbg !47

if.end30:                                         ; preds = %if.end27, %then28
  %60 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 2), align 4, !dbg !48
  %61 = icmp ne i32 %60, 3, !dbg !48
  br i1 %61, label %then31, label %if.end33, !dbg !48

then31:                                           ; preds = %if.end30
  store i32 1, i32* %err, align 4, !dbg !49
  %62 = load i32, i32* %err, align 4, !dbg !49
  br label %if.end33, !dbg !49

if.end33:                                         ; preds = %if.end30, %then31
  %63 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ga, i32 0, i32 3), align 4, !dbg !50
  %64 = icmp ne i32 %63, 0, !dbg !50
  br i1 %64, label %then34, label %if.end36, !dbg !50

then34:                                           ; preds = %if.end33
  store i32 1, i32* %err, align 4, !dbg !51
  %65 = load i32, i32* %err, align 4, !dbg !51
  br label %if.end36, !dbg !51

if.end36:                                         ; preds = %if.end33, %then34
  %66 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 0), align 4, !dbg !52
  %67 = icmp ne i32 %66, 10, !dbg !52
  br i1 %67, label %then37, label %if.end39, !dbg !52

then37:                                           ; preds = %if.end36
  store i32 1, i32* %err, align 4, !dbg !53
  %68 = load i32, i32* %err, align 4, !dbg !53
  br label %if.end39, !dbg !53

if.end39:                                         ; preds = %if.end36, %then37
  %69 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @gb, i32 0, i32 1), align 4, !dbg !54
  %70 = icmp ne i32 %69, 20, !dbg !54
  br i1 %70, label %then40, label %if.end42, !dbg !54

then40:                                           ; preds = %if.end39
  store i32 1, i32* %err, align 4, !dbg !55
  %71 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end42, !dbg !55

if.end42:                                         ; preds = %if.end39, %then40
  %72 = load i32, i32* %err, align 4, !dbg !56
  %73 = icmp eq i32 %72, 0, !dbg !56
  %. = select i1 %73, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @1, i32 0, i32 0), !dbg !57
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !57
  %75 = load i32, i32* %err, align 4, !dbg !58
  ret i32 %75, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "31.array_1d_brace_init.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "lc", scope: !4, file: !1, line: 10, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, align: 32, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 2, lowerBound: 0)
!13 = !DILocation(line: 10, column: 3, scope: !4)
!14 = !DILocalVariable(name: "lb", scope: !4, file: !1, line: 9, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 3, lowerBound: 0)
!18 = !DILocation(line: 9, column: 3, scope: !4)
!19 = !DILocalVariable(name: "la", scope: !4, file: !1, line: 8, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 4, lowerBound: 0)
!23 = !DILocation(line: 8, column: 3, scope: !4)
!24 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 7, type: !7)
!25 = !DILocation(line: 7, column: 3, scope: !4)
!26 = !DILocation(line: 12, column: 3, scope: !4)
!27 = !DILocation(line: 12, column: 19, scope: !4)
!28 = !DILocation(line: 13, column: 3, scope: !4)
!29 = !DILocation(line: 13, column: 19, scope: !4)
!30 = !DILocation(line: 14, column: 3, scope: !4)
!31 = !DILocation(line: 14, column: 19, scope: !4)
!32 = !DILocation(line: 15, column: 3, scope: !4)
!33 = !DILocation(line: 15, column: 19, scope: !4)
!34 = !DILocation(line: 17, column: 3, scope: !4)
!35 = !DILocation(line: 17, column: 19, scope: !4)
!36 = !DILocation(line: 18, column: 3, scope: !4)
!37 = !DILocation(line: 18, column: 19, scope: !4)
!38 = !DILocation(line: 19, column: 3, scope: !4)
!39 = !DILocation(line: 19, column: 19, scope: !4)
!40 = !DILocation(line: 21, column: 3, scope: !4)
!41 = !DILocation(line: 21, column: 19, scope: !4)
!42 = !DILocation(line: 22, column: 3, scope: !4)
!43 = !DILocation(line: 22, column: 19, scope: !4)
!44 = !DILocation(line: 24, column: 3, scope: !4)
!45 = !DILocation(line: 24, column: 19, scope: !4)
!46 = !DILocation(line: 25, column: 3, scope: !4)
!47 = !DILocation(line: 25, column: 19, scope: !4)
!48 = !DILocation(line: 26, column: 3, scope: !4)
!49 = !DILocation(line: 26, column: 19, scope: !4)
!50 = !DILocation(line: 27, column: 3, scope: !4)
!51 = !DILocation(line: 27, column: 19, scope: !4)
!52 = !DILocation(line: 29, column: 3, scope: !4)
!53 = !DILocation(line: 29, column: 20, scope: !4)
!54 = !DILocation(line: 30, column: 3, scope: !4)
!55 = !DILocation(line: 30, column: 20, scope: !4)
!56 = !DILocation(line: 32, column: 3, scope: !4)
!57 = !DILocation(line: 0, scope: !4)
!58 = !DILocation(line: 37, column: 3, scope: !4)
