; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gs = global [16 x i8] zeroinitializer
@0 = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1
@gps = global i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0)
@gi = global [4 x i32] zeroinitializer
@1 = private unnamed_addr constant [21 x i8] c"6.array_type.c PASS\0A\00", align 1
@2 = private unnamed_addr constant [21 x i8] c"6.array_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %i = alloca [4 x i32], align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %i, metadata !9, metadata !DIExpression()), !dbg !13
  %s = alloca [16 x i8], align 1
  call void @llvm.dbg.declare(metadata [16 x i8]* %s, metadata !14, metadata !DIExpression()), !dbg !19
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %err, align 4, !dbg !21
  %0 = bitcast [16 x i8]* %s to i8*, !dbg !22
  %1 = bitcast i8* %0 to i8*, !dbg !22
  store i8 103, i8* %1, align 1, !dbg !22
  %2 = load i8, i8* %1, align 1, !dbg !22
  %3 = bitcast [16 x i8]* %s to i8*, !dbg !23
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !23
  store i8 111, i8* %4, align 1, !dbg !23
  %5 = load i8, i8* %4, align 1, !dbg !23
  %6 = bitcast [16 x i8]* %s to i8*, !dbg !24
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !24
  store i8 111, i8* %7, align 1, !dbg !24
  %8 = load i8, i8* %7, align 1, !dbg !24
  %9 = bitcast [16 x i8]* %s to i8*, !dbg !25
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !25
  store i8 100, i8* %10, align 1, !dbg !25
  %11 = load i8, i8* %10, align 1, !dbg !25
  %12 = bitcast [16 x i8]* %s to i8*, !dbg !26
  %13 = getelementptr i8, i8* %12, i32 4, !dbg !26
  store i8 0, i8* %13, align 1, !dbg !26
  %14 = load i8, i8* %13, align 1, !dbg !26
  store i8 108, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !27
  %15 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !27
  store i8 117, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1, !dbg !28
  %16 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 1), align 1, !dbg !28
  store i8 99, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1, !dbg !29
  %17 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 2), align 1, !dbg !29
  store i8 107, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1, !dbg !30
  %18 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 3), align 1, !dbg !30
  store i8 121, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1, !dbg !31
  %19 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 4), align 1, !dbg !31
  store i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1, !dbg !32
  %20 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 5), align 1, !dbg !32
  %21 = bitcast [4 x i32]* %i to i32*, !dbg !33
  %22 = bitcast i32* %21 to i32*, !dbg !33
  store i32 128, i32* %22, align 4, !dbg !33
  %23 = load i32, i32* %22, align 4, !dbg !33
  %24 = bitcast [4 x i32]* %i to i32*, !dbg !34
  %25 = getelementptr i32, i32* %24, i32 1, !dbg !34
  store i32 256, i32* %25, align 4, !dbg !34
  %26 = load i32, i32* %25, align 4, !dbg !34
  store i32 1024, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !35
  %27 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !35
  store i32 2048, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !36
  %28 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !36
  %29 = bitcast [4 x i32]* %i to i32*, !dbg !37
  %30 = bitcast i32* %29 to i32*, !dbg !37
  %31 = load i32, i32* %30, align 4, !dbg !37
  %32 = icmp ne i32 %31, 128, !dbg !37
  br i1 %32, label %then, label %if.end, !dbg !37

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !38
  %33 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end, !dbg !38

if.end:                                           ; preds = %entry, %then
  %34 = bitcast [4 x i32]* %i to i32*, !dbg !39
  %35 = getelementptr i32, i32* %34, i32 1, !dbg !39
  %36 = load i32, i32* %35, align 4, !dbg !39
  %37 = icmp ne i32 %36, 256, !dbg !39
  br i1 %37, label %then1, label %if.end3, !dbg !39

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !40
  %38 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %then1
  %39 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 0), align 4, !dbg !41
  %40 = icmp ne i32 %39, 1024, !dbg !41
  br i1 %40, label %then4, label %if.end6, !dbg !41

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !42
  %41 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end6, !dbg !42

if.end6:                                          ; preds = %if.end3, %then4
  %42 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @gi, i32 0, i32 1), align 4, !dbg !43
  %43 = icmp ne i32 %42, 2048, !dbg !43
  br i1 %43, label %then7, label %if.end9, !dbg !43

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !44
  %44 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end9, !dbg !44

if.end9:                                          ; preds = %if.end6, %then7
  %45 = bitcast [16 x i8]* %s to i8*, !dbg !45
  %46 = bitcast i8* %45 to i8*, !dbg !45
  %47 = load i8, i8* %46, align 1, !dbg !45
  %48 = sext i8 %47 to i32, !dbg !45
  %49 = icmp ne i32 %48, 103, !dbg !45
  br i1 %49, label %then10, label %if.end12, !dbg !45

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !46
  %50 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end12, !dbg !46

if.end12:                                         ; preds = %if.end9, %then10
  %51 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @gs, i32 0, i32 0), align 1, !dbg !47
  %52 = sext i8 %51 to i32, !dbg !47
  %53 = icmp ne i32 %52, 108, !dbg !47
  br i1 %53, label %then13, label %if.end15, !dbg !47

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !48
  %54 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end15, !dbg !48

if.end15:                                         ; preds = %if.end12, %then13
  %55 = bitcast [4 x i32]* %i to i32*, !dbg !49
  %56 = getelementptr i32, i32* %55, i32 2, !dbg !49
  store i32 0, i32* %56, align 4, !dbg !49
  %57 = load i32, i32* %56, align 4, !dbg !49
  %58 = bitcast [4 x i32]* %i to i32*, !dbg !50
  %59 = getelementptr i32, i32* %58, i32 3, !dbg !50
  store i32 -1, i32* %59, align 4, !dbg !50
  %60 = load i32, i32* %59, align 4, !dbg !50
  %61 = bitcast [4 x i32]* %i to i32*, !dbg !51
  %62 = getelementptr i32, i32* %61, i32 2, !dbg !51
  %63 = load i32, i32* %62, align 4, !dbg !51
  %64 = icmp ne i32 %63, 0, !dbg !51
  br i1 %64, label %then16, label %if.end18, !dbg !51

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !52
  %65 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end18, !dbg !52

if.end18:                                         ; preds = %if.end15, %then16
  %66 = bitcast [4 x i32]* %i to i32*, !dbg !53
  %67 = getelementptr i32, i32* %66, i32 3, !dbg !53
  %68 = load i32, i32* %67, align 4, !dbg !53
  %69 = icmp ne i32 %68, -1, !dbg !53
  br i1 %69, label %then19, label %if.end21, !dbg !53

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !54
  %70 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end21, !dbg !54

if.end21:                                         ; preds = %if.end18, %then19
  %71 = load i32, i32* %err, align 4, !dbg !55
  %72 = icmp eq i32 %71, 0, !dbg !55
  %. = select i1 %72, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @2, i32 0, i32 0), !dbg !56
  %73 = call i32 (i8*, ...) @printf(i8* %.), !dbg !56
  %74 = load i32, i32* %err, align 4, !dbg !57
  ret i32 %74, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "6.array_type.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 10, type: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 128, align: 32, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 4, lowerBound: 0)
!13 = !DILocation(line: 10, column: 3, scope: !4)
!14 = !DILocalVariable(name: "s", scope: !4, file: !1, line: 9, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 128, align: 8, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 16, lowerBound: 0)
!19 = !DILocation(line: 9, column: 3, scope: !4)
!20 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 8, type: !7)
!21 = !DILocation(line: 8, column: 3, scope: !4)
!22 = !DILocation(line: 12, column: 3, scope: !4)
!23 = !DILocation(line: 13, column: 3, scope: !4)
!24 = !DILocation(line: 14, column: 3, scope: !4)
!25 = !DILocation(line: 15, column: 3, scope: !4)
!26 = !DILocation(line: 16, column: 3, scope: !4)
!27 = !DILocation(line: 18, column: 3, scope: !4)
!28 = !DILocation(line: 19, column: 3, scope: !4)
!29 = !DILocation(line: 20, column: 3, scope: !4)
!30 = !DILocation(line: 21, column: 3, scope: !4)
!31 = !DILocation(line: 22, column: 3, scope: !4)
!32 = !DILocation(line: 23, column: 3, scope: !4)
!33 = !DILocation(line: 25, column: 3, scope: !4)
!34 = !DILocation(line: 26, column: 3, scope: !4)
!35 = !DILocation(line: 27, column: 3, scope: !4)
!36 = !DILocation(line: 28, column: 3, scope: !4)
!37 = !DILocation(line: 30, column: 3, scope: !4)
!38 = !DILocation(line: 30, column: 20, scope: !4)
!39 = !DILocation(line: 31, column: 3, scope: !4)
!40 = !DILocation(line: 31, column: 20, scope: !4)
!41 = !DILocation(line: 32, column: 3, scope: !4)
!42 = !DILocation(line: 32, column: 22, scope: !4)
!43 = !DILocation(line: 33, column: 3, scope: !4)
!44 = !DILocation(line: 33, column: 22, scope: !4)
!45 = !DILocation(line: 34, column: 3, scope: !4)
!46 = !DILocation(line: 34, column: 20, scope: !4)
!47 = !DILocation(line: 35, column: 3, scope: !4)
!48 = !DILocation(line: 35, column: 21, scope: !4)
!49 = !DILocation(line: 37, column: 3, scope: !4)
!50 = !DILocation(line: 38, column: 3, scope: !4)
!51 = !DILocation(line: 39, column: 3, scope: !4)
!52 = !DILocation(line: 39, column: 18, scope: !4)
!53 = !DILocation(line: 40, column: 3, scope: !4)
!54 = !DILocation(line: 40, column: 19, scope: !4)
!55 = !DILocation(line: 42, column: 3, scope: !4)
!56 = !DILocation(line: 0, scope: !4)
!57 = !DILocation(line: 47, column: 3, scope: !4)
