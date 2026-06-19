; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !7, metadata !DIExpression()), !dbg !8
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !9, metadata !DIExpression()), !dbg !10
  %da = alloca [2 x %struct.Data], align 8
  call void @llvm.dbg.declare(metadata [2 x %struct.Data]* %da, metadata !11, metadata !DIExpression()), !dbg !16
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %err, align 4, !dbg !18
  %0 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !19
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !19
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !19
  store i32 0, i32* %2, align 4, !dbg !19
  %3 = load i32, i32* %2, align 4, !dbg !19
  %4 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !20
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !20
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !20
  store i32 0, i32* %6, align 4, !dbg !20
  %7 = load i32, i32* %6, align 4, !dbg !20
  %8 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !21
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !21
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !21
  store i32 10, i32* %10, align 4, !dbg !21
  %11 = load i32, i32* %10, align 4, !dbg !21
  %12 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !22
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !22
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !22
  store i32 80, i32* %14, align 4, !dbg !22
  %15 = load i32, i32* %14, align 4, !dbg !22
  %16 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !23
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 1, !dbg !23
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !23
  %19 = load i32, i32* %18, align 4, !dbg !23
  store i32 %19, i32* %id, align 4, !dbg !23
  %20 = load i32, i32* %id, align 4, !dbg !23
  %21 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !24
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 1, !dbg !24
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1, !dbg !24
  %24 = load i32, i32* %23, align 4, !dbg !24
  store i32 %24, i32* %data, align 4, !dbg !24
  %25 = load i32, i32* %data, align 4, !dbg !24
  %26 = load i32, i32* %id, align 4, !dbg !25
  %27 = icmp ne i32 %26, 10, !dbg !25
  br i1 %27, label %then, label %if.end, !dbg !25

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !26
  %28 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end, !dbg !26

if.end:                                           ; preds = %entry, %then
  %29 = load i32, i32* %data, align 4, !dbg !27
  %30 = icmp ne i32 %29, 80, !dbg !27
  br i1 %30, label %then1, label %if.end3, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !28
  %31 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !29
  %33 = bitcast %struct.Data* %32 to %struct.Data*, !dbg !29
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !29
  %35 = load i32, i32* %34, align 4, !dbg !29
  store i32 %35, i32* %id, align 4, !dbg !29
  %36 = load i32, i32* %id, align 4, !dbg !29
  %37 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !30
  %38 = bitcast %struct.Data* %37 to %struct.Data*, !dbg !30
  %39 = getelementptr %struct.Data, %struct.Data* %38, i32 0, i32 1, !dbg !30
  %40 = load i32, i32* %39, align 4, !dbg !30
  store i32 %40, i32* %data, align 4, !dbg !30
  %41 = load i32, i32* %data, align 4, !dbg !30
  %42 = load i32, i32* %id, align 4, !dbg !31
  %43 = icmp ne i32 %42, 0, !dbg !31
  br i1 %43, label %then4, label %if.end6, !dbg !31

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !32
  %44 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %if.end3, %then4
  %45 = load i32, i32* %data, align 4, !dbg !33
  %46 = icmp ne i32 %45, 0, !dbg !33
  br i1 %46, label %then7, label %if.end9, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !34
  %47 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %if.end6, %then7
  %48 = load i32, i32* %err, align 4, !dbg !35
  %49 = icmp eq i32 %48, 0, !dbg !35
  %. = select i1 %49, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !36
  %50 = call i32 (i8*, ...) @printf(i8* %.), !dbg !36
  %51 = load i32, i32* %err, align 4, !dbg !37
  ret i32 %51, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !3, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "data", scope: !2, file: !1, line: 12, type: !5)
!8 = !DILocation(line: 12, column: 3, scope: !2)
!9 = !DILocalVariable(name: "id", scope: !2, file: !1, line: 11, type: !5)
!10 = !DILocation(line: 11, column: 3, scope: !2)
!11 = !DILocalVariable(name: "da", scope: !2, file: !1, line: 10, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, align: 32, elements: !14)
!13 = !DIBasicType(name: "struct.Data", size: 64, encoding: DW_ATE_unsigned)
!14 = !{!15}
!15 = !DISubrange(count: 2, lowerBound: 0)
!16 = !DILocation(line: 10, column: 3, scope: !2)
!17 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 9, type: !5)
!18 = !DILocation(line: 9, column: 3, scope: !2)
!19 = !DILocation(line: 14, column: 3, scope: !2)
!20 = !DILocation(line: 15, column: 3, scope: !2)
!21 = !DILocation(line: 16, column: 3, scope: !2)
!22 = !DILocation(line: 17, column: 3, scope: !2)
!23 = !DILocation(line: 19, column: 3, scope: !2)
!24 = !DILocation(line: 20, column: 3, scope: !2)
!25 = !DILocation(line: 21, column: 3, scope: !2)
!26 = !DILocation(line: 21, column: 17, scope: !2)
!27 = !DILocation(line: 22, column: 3, scope: !2)
!28 = !DILocation(line: 22, column: 19, scope: !2)
!29 = !DILocation(line: 24, column: 3, scope: !2)
!30 = !DILocation(line: 25, column: 3, scope: !2)
!31 = !DILocation(line: 26, column: 3, scope: !2)
!32 = !DILocation(line: 26, column: 16, scope: !2)
!33 = !DILocation(line: 27, column: 3, scope: !2)
!34 = !DILocation(line: 27, column: 18, scope: !2)
!35 = !DILocation(line: 29, column: 3, scope: !2)
!36 = !DILocation(line: 0, scope: !2)
!37 = !DILocation(line: 34, column: 3, scope: !2)
