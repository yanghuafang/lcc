; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %pc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !9, metadata !DIExpression()), !dbg !12
  %c = alloca [4 x i8], align 1
  call void @llvm.dbg.declare(metadata [4 x i8]* %c, metadata !13, metadata !DIExpression()), !dbg !17
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %err, align 4, !dbg !19
  %0 = bitcast [4 x i8]* %c to i8*, !dbg !20
  %1 = bitcast i8* %0 to i8*, !dbg !20
  store i8 65, i8* %1, align 1, !dbg !20
  %2 = load i8, i8* %1, align 1, !dbg !20
  %3 = bitcast [4 x i8]* %c to i8*, !dbg !21
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !21
  store i8 66, i8* %4, align 1, !dbg !21
  %5 = load i8, i8* %4, align 1, !dbg !21
  %6 = bitcast [4 x i8]* %c to i8*, !dbg !22
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !22
  store i8 67, i8* %7, align 1, !dbg !22
  %8 = load i8, i8* %7, align 1, !dbg !22
  %9 = bitcast [4 x i8]* %c to i8*, !dbg !23
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !23
  store i8 68, i8* %10, align 1, !dbg !23
  %11 = load i8, i8* %10, align 1, !dbg !23
  %12 = bitcast [4 x i8]* %c to i8*, !dbg !12
  store i8* %12, i8** %pc, align 8, !dbg !12
  %13 = load i8*, i8** %pc, align 8, !dbg !24
  %14 = load i8, i8* %13, align 1, !dbg !24
  %15 = sext i8 %14 to i32, !dbg !24
  %16 = icmp ne i32 %15, 65, !dbg !24
  br i1 %16, label %then, label %if.end, !dbg !24

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !25
  %17 = load i32, i32* %err, align 4, !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %entry, %then
  %18 = load i8*, i8** %pc, align 8, !dbg !26
  %19 = getelementptr i8, i8* %18, i32 1, !dbg !26
  store i8* %19, i8** %pc, align 8, !dbg !26
  %20 = load i8*, i8** %pc, align 8, !dbg !26
  %21 = load i8*, i8** %pc, align 8, !dbg !27
  %22 = load i8, i8* %21, align 1, !dbg !27
  %23 = sext i8 %22 to i32, !dbg !27
  %24 = icmp ne i32 %23, 66, !dbg !27
  br i1 %24, label %then1, label %if.end3, !dbg !27

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !28
  %25 = load i32, i32* %err, align 4, !dbg !28
  br label %if.end3, !dbg !28

if.end3:                                          ; preds = %if.end, %then1
  %26 = load i8*, i8** %pc, align 8, !dbg !29
  %27 = getelementptr i8, i8* %26, i32 1, !dbg !29
  store i8* %27, i8** %pc, align 8, !dbg !29
  %28 = load i8*, i8** %pc, align 8, !dbg !29
  %29 = load i8*, i8** %pc, align 8, !dbg !30
  %30 = load i8, i8* %29, align 1, !dbg !30
  %31 = sext i8 %30 to i32, !dbg !30
  %32 = icmp ne i32 %31, 67, !dbg !30
  br i1 %32, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !31
  %33 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %34 = load i8*, i8** %pc, align 8, !dbg !32
  %35 = getelementptr i8, i8* %34, i32 1, !dbg !32
  store i8* %35, i8** %pc, align 8, !dbg !32
  %36 = load i8*, i8** %pc, align 8, !dbg !33
  %37 = load i8, i8* %36, align 1, !dbg !33
  %38 = sext i8 %37 to i32, !dbg !33
  %39 = icmp ne i32 %38, 68, !dbg !33
  br i1 %39, label %then7, label %if.end9, !dbg !33

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !34
  %40 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end9, !dbg !34

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [4 x i8]* %c to i8*, !dbg !35
  %42 = getelementptr i8, i8* %41, i32 3, !dbg !35
  store i8* %42, i8** %pc, align 8, !dbg !35
  %43 = load i8*, i8** %pc, align 8, !dbg !35
  %44 = load i8*, i8** %pc, align 8, !dbg !36
  %45 = load i8, i8* %44, align 1, !dbg !36
  %46 = sext i8 %45 to i32, !dbg !36
  %47 = icmp ne i32 %46, 68, !dbg !36
  br i1 %47, label %then10, label %if.end12, !dbg !36

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !37
  %48 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end12, !dbg !37

if.end12:                                         ; preds = %if.end9, %then10
  %49 = load i8*, i8** %pc, align 8, !dbg !38
  %50 = getelementptr i8, i8* %49, i32 -1, !dbg !38
  store i8* %50, i8** %pc, align 8, !dbg !38
  %51 = load i8*, i8** %pc, align 8, !dbg !38
  %52 = load i8*, i8** %pc, align 8, !dbg !39
  %53 = load i8, i8* %52, align 1, !dbg !39
  %54 = sext i8 %53 to i32, !dbg !39
  %55 = icmp ne i32 %54, 67, !dbg !39
  br i1 %55, label %then13, label %if.end15, !dbg !39

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !40
  %56 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end15, !dbg !40

if.end15:                                         ; preds = %if.end12, %then13
  %57 = load i8*, i8** %pc, align 8, !dbg !41
  %58 = getelementptr i8, i8* %57, i32 -1, !dbg !41
  store i8* %58, i8** %pc, align 8, !dbg !41
  %59 = load i8*, i8** %pc, align 8, !dbg !41
  %60 = load i8*, i8** %pc, align 8, !dbg !42
  %61 = load i8, i8* %60, align 1, !dbg !42
  %62 = sext i8 %61 to i32, !dbg !42
  %63 = icmp ne i32 %62, 66, !dbg !42
  br i1 %63, label %then16, label %if.end18, !dbg !42

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !43
  %64 = load i32, i32* %err, align 4, !dbg !43
  br label %if.end18, !dbg !43

if.end18:                                         ; preds = %if.end15, %then16
  %65 = load i8*, i8** %pc, align 8, !dbg !44
  %66 = getelementptr i8, i8* %65, i32 -1, !dbg !44
  store i8* %66, i8** %pc, align 8, !dbg !44
  %67 = load i8*, i8** %pc, align 8, !dbg !45
  %68 = load i8, i8* %67, align 1, !dbg !45
  %69 = sext i8 %68 to i32, !dbg !45
  %70 = icmp ne i32 %69, 65, !dbg !45
  br i1 %70, label %then19, label %if.end21, !dbg !45

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !46
  %71 = load i32, i32* %err, align 4, !dbg !46
  br label %if.end21, !dbg !46

if.end21:                                         ; preds = %if.end18, %then19
  %72 = load i32, i32* %err, align 4, !dbg !47
  %73 = icmp eq i32 %72, 0, !dbg !47
  %. = select i1 %73, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !48
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !48
  %75 = load i32, i32* %err, align 4, !dbg !49
  ret i32 %75, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "28.pointer_move.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "pc", scope: !4, file: !1, line: 11, type: !10)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DILocation(line: 11, column: 3, scope: !4)
!13 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 5, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 32, align: 8, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 4, lowerBound: 0)
!17 = !DILocation(line: 5, column: 3, scope: !4)
!18 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!19 = !DILocation(line: 4, column: 3, scope: !4)
!20 = !DILocation(line: 6, column: 3, scope: !4)
!21 = !DILocation(line: 7, column: 3, scope: !4)
!22 = !DILocation(line: 8, column: 3, scope: !4)
!23 = !DILocation(line: 9, column: 3, scope: !4)
!24 = !DILocation(line: 12, column: 3, scope: !4)
!25 = !DILocation(line: 12, column: 19, scope: !4)
!26 = !DILocation(line: 13, column: 3, scope: !4)
!27 = !DILocation(line: 14, column: 3, scope: !4)
!28 = !DILocation(line: 14, column: 19, scope: !4)
!29 = !DILocation(line: 15, column: 3, scope: !4)
!30 = !DILocation(line: 16, column: 3, scope: !4)
!31 = !DILocation(line: 16, column: 19, scope: !4)
!32 = !DILocation(line: 17, column: 3, scope: !4)
!33 = !DILocation(line: 18, column: 3, scope: !4)
!34 = !DILocation(line: 18, column: 19, scope: !4)
!35 = !DILocation(line: 20, column: 3, scope: !4)
!36 = !DILocation(line: 21, column: 3, scope: !4)
!37 = !DILocation(line: 21, column: 19, scope: !4)
!38 = !DILocation(line: 22, column: 3, scope: !4)
!39 = !DILocation(line: 23, column: 3, scope: !4)
!40 = !DILocation(line: 23, column: 19, scope: !4)
!41 = !DILocation(line: 24, column: 3, scope: !4)
!42 = !DILocation(line: 25, column: 3, scope: !4)
!43 = !DILocation(line: 25, column: 19, scope: !4)
!44 = !DILocation(line: 26, column: 3, scope: !4)
!45 = !DILocation(line: 27, column: 3, scope: !4)
!46 = !DILocation(line: 27, column: 19, scope: !4)
!47 = !DILocation(line: 29, column: 3, scope: !4)
!48 = !DILocation(line: 0, scope: !4)
!49 = !DILocation(line: 34, column: 3, scope: !4)
