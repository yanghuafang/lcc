; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

%struct.Data = type { i32, i32 }

@0 = private unnamed_addr constant [24 x i8] c"24.struct_array.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"24.struct_array.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !9, metadata !DIExpression()), !dbg !10
  %id = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %id, metadata !11, metadata !DIExpression()), !dbg !12
  %da = alloca [2 x %struct.Data], align 8
  call void @llvm.dbg.declare(metadata [2 x %struct.Data]* %da, metadata !13, metadata !DIExpression()), !dbg !21
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %err, align 4, !dbg !23
  %0 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !24
  %1 = bitcast %struct.Data* %0 to %struct.Data*, !dbg !24
  %2 = bitcast %struct.Data* %1 to i32*, !dbg !24
  store i32 0, i32* %2, align 4, !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !25
  %5 = bitcast %struct.Data* %4 to %struct.Data*, !dbg !25
  %6 = getelementptr %struct.Data, %struct.Data* %5, i32 0, i32 1, !dbg !25
  store i32 0, i32* %6, align 4, !dbg !25
  %7 = load i32, i32* %6, align 4, !dbg !25
  %8 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !26
  %9 = getelementptr %struct.Data, %struct.Data* %8, i32 1, !dbg !26
  %10 = bitcast %struct.Data* %9 to i32*, !dbg !26
  store i32 10, i32* %10, align 4, !dbg !26
  %11 = load i32, i32* %10, align 4, !dbg !26
  %12 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !27
  %13 = getelementptr %struct.Data, %struct.Data* %12, i32 1, !dbg !27
  %14 = getelementptr %struct.Data, %struct.Data* %13, i32 0, i32 1, !dbg !27
  store i32 80, i32* %14, align 4, !dbg !27
  %15 = load i32, i32* %14, align 4, !dbg !27
  %16 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !28
  %17 = getelementptr %struct.Data, %struct.Data* %16, i32 1, !dbg !28
  %18 = bitcast %struct.Data* %17 to i32*, !dbg !28
  %19 = load i32, i32* %18, align 4, !dbg !28
  store i32 %19, i32* %id, align 4, !dbg !28
  %20 = load i32, i32* %id, align 4, !dbg !28
  %21 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !29
  %22 = getelementptr %struct.Data, %struct.Data* %21, i32 1, !dbg !29
  %23 = getelementptr %struct.Data, %struct.Data* %22, i32 0, i32 1, !dbg !29
  %24 = load i32, i32* %23, align 4, !dbg !29
  store i32 %24, i32* %data, align 4, !dbg !29
  %25 = load i32, i32* %data, align 4, !dbg !29
  %26 = load i32, i32* %id, align 4, !dbg !30
  %27 = icmp ne i32 %26, 10, !dbg !30
  br i1 %27, label %then, label %if.end, !dbg !30

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !31
  %28 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end, !dbg !31

if.end:                                           ; preds = %entry, %then
  %29 = load i32, i32* %data, align 4, !dbg !32
  %30 = icmp ne i32 %29, 80, !dbg !32
  br i1 %30, label %then1, label %if.end3, !dbg !32

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !33
  %31 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %then1
  %32 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !34
  %33 = bitcast %struct.Data* %32 to %struct.Data*, !dbg !34
  %34 = bitcast %struct.Data* %33 to i32*, !dbg !34
  %35 = load i32, i32* %34, align 4, !dbg !34
  store i32 %35, i32* %id, align 4, !dbg !34
  %36 = load i32, i32* %id, align 4, !dbg !34
  %37 = bitcast [2 x %struct.Data]* %da to %struct.Data*, !dbg !35
  %38 = bitcast %struct.Data* %37 to %struct.Data*, !dbg !35
  %39 = getelementptr %struct.Data, %struct.Data* %38, i32 0, i32 1, !dbg !35
  %40 = load i32, i32* %39, align 4, !dbg !35
  store i32 %40, i32* %data, align 4, !dbg !35
  %41 = load i32, i32* %data, align 4, !dbg !35
  %42 = load i32, i32* %id, align 4, !dbg !36
  %43 = icmp ne i32 %42, 0, !dbg !36
  br i1 %43, label %then4, label %if.end6, !dbg !36

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !37
  %44 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end6, !dbg !37

if.end6:                                          ; preds = %if.end3, %then4
  %45 = load i32, i32* %data, align 4, !dbg !38
  %46 = icmp ne i32 %45, 0, !dbg !38
  br i1 %46, label %then7, label %if.end9, !dbg !38

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !39
  %47 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end9, !dbg !39

if.end9:                                          ; preds = %if.end6, %then7
  %48 = load i32, i32* %err, align 4, !dbg !40
  %49 = icmp eq i32 %48, 0, !dbg !40
  %. = select i1 %49, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !41
  %50 = call i32 (i8*, ...) @printf(i8* %.), !dbg !41
  %51 = load i32, i32* %err, align 4, !dbg !42
  ret i32 %51, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "24.struct_array.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 8, type: !5, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "data", scope: !4, file: !1, line: 12, type: !7)
!10 = !DILocation(line: 12, column: 3, scope: !4)
!11 = !DILocalVariable(name: "id", scope: !4, file: !1, line: 11, type: !7)
!12 = !DILocation(line: 11, column: 3, scope: !4)
!13 = !DILocalVariable(name: "da", scope: !4, file: !1, line: 10, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, align: 32, elements: !19)
!15 = !DICompositeType(tag: DW_TAG_structure_type, name: "Data", file: !1, size: 64, align: 32, elements: !16)
!16 = !{!17, !18}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "id", file: !1, baseType: !7, size: 32, align: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "data", file: !1, baseType: !7, size: 32, align: 32, offset: 32)
!19 = !{!20}
!20 = !DISubrange(count: 2, lowerBound: 0)
!21 = !DILocation(line: 10, column: 3, scope: !4)
!22 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 9, type: !7)
!23 = !DILocation(line: 9, column: 3, scope: !4)
!24 = !DILocation(line: 14, column: 3, scope: !4)
!25 = !DILocation(line: 15, column: 3, scope: !4)
!26 = !DILocation(line: 16, column: 3, scope: !4)
!27 = !DILocation(line: 17, column: 3, scope: !4)
!28 = !DILocation(line: 19, column: 3, scope: !4)
!29 = !DILocation(line: 20, column: 3, scope: !4)
!30 = !DILocation(line: 21, column: 3, scope: !4)
!31 = !DILocation(line: 21, column: 17, scope: !4)
!32 = !DILocation(line: 22, column: 3, scope: !4)
!33 = !DILocation(line: 22, column: 19, scope: !4)
!34 = !DILocation(line: 24, column: 3, scope: !4)
!35 = !DILocation(line: 25, column: 3, scope: !4)
!36 = !DILocation(line: 26, column: 3, scope: !4)
!37 = !DILocation(line: 26, column: 16, scope: !4)
!38 = !DILocation(line: 27, column: 3, scope: !4)
!39 = !DILocation(line: 27, column: 18, scope: !4)
!40 = !DILocation(line: 29, column: 3, scope: !4)
!41 = !DILocation(line: 0, scope: !4)
!42 = !DILocation(line: 34, column: 3, scope: !4)
