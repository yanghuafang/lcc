; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"28.pointer_move.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %pc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !7, metadata !DIExpression()), !dbg !10
  %c = alloca [4 x i8], align 1
  call void @llvm.dbg.declare(metadata [4 x i8]* %c, metadata !11, metadata !DIExpression()), !dbg !15
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %err, align 4, !dbg !17
  %0 = bitcast [4 x i8]* %c to i8*, !dbg !18
  %1 = bitcast i8* %0 to i8*, !dbg !18
  store i8 65, i8* %1, align 1, !dbg !18
  %2 = load i8, i8* %1, align 1, !dbg !18
  %3 = bitcast [4 x i8]* %c to i8*, !dbg !19
  %4 = getelementptr i8, i8* %3, i32 1, !dbg !19
  store i8 66, i8* %4, align 1, !dbg !19
  %5 = load i8, i8* %4, align 1, !dbg !19
  %6 = bitcast [4 x i8]* %c to i8*, !dbg !20
  %7 = getelementptr i8, i8* %6, i32 2, !dbg !20
  store i8 67, i8* %7, align 1, !dbg !20
  %8 = load i8, i8* %7, align 1, !dbg !20
  %9 = bitcast [4 x i8]* %c to i8*, !dbg !21
  %10 = getelementptr i8, i8* %9, i32 3, !dbg !21
  store i8 68, i8* %10, align 1, !dbg !21
  %11 = load i8, i8* %10, align 1, !dbg !21
  %12 = bitcast [4 x i8]* %c to i8*, !dbg !10
  store i8* %12, i8** %pc, align 8, !dbg !10
  %13 = load i8*, i8** %pc, align 8, !dbg !22
  %14 = load i8, i8* %13, align 1, !dbg !22
  %15 = sext i8 %14 to i32, !dbg !22
  %16 = icmp ne i32 %15, 65, !dbg !22
  br i1 %16, label %then, label %if.end, !dbg !22

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !23
  %17 = load i32, i32* %err, align 4, !dbg !23
  br label %if.end, !dbg !23

if.end:                                           ; preds = %entry, %then
  %18 = load i8*, i8** %pc, align 8, !dbg !24
  %19 = getelementptr i8, i8* %18, i32 1, !dbg !24
  store i8* %19, i8** %pc, align 8, !dbg !24
  %20 = load i8*, i8** %pc, align 8, !dbg !24
  %21 = load i8*, i8** %pc, align 8, !dbg !25
  %22 = load i8, i8* %21, align 1, !dbg !25
  %23 = sext i8 %22 to i32, !dbg !25
  %24 = icmp ne i32 %23, 66, !dbg !25
  br i1 %24, label %then1, label %if.end3, !dbg !25

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !26
  %25 = load i32, i32* %err, align 4, !dbg !26
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.end, %then1
  %26 = load i8*, i8** %pc, align 8, !dbg !27
  %27 = getelementptr i8, i8* %26, i32 1, !dbg !27
  store i8* %27, i8** %pc, align 8, !dbg !27
  %28 = load i8*, i8** %pc, align 8, !dbg !27
  %29 = load i8*, i8** %pc, align 8, !dbg !28
  %30 = load i8, i8* %29, align 1, !dbg !28
  %31 = sext i8 %30 to i32, !dbg !28
  %32 = icmp ne i32 %31, 67, !dbg !28
  br i1 %32, label %then4, label %if.end6, !dbg !28

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !29
  %33 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end6, !dbg !29

if.end6:                                          ; preds = %if.end3, %then4
  %34 = load i8*, i8** %pc, align 8, !dbg !30
  %35 = getelementptr i8, i8* %34, i32 1, !dbg !30
  store i8* %35, i8** %pc, align 8, !dbg !30
  %36 = load i8*, i8** %pc, align 8, !dbg !31
  %37 = load i8, i8* %36, align 1, !dbg !31
  %38 = sext i8 %37 to i32, !dbg !31
  %39 = icmp ne i32 %38, 68, !dbg !31
  br i1 %39, label %then7, label %if.end9, !dbg !31

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !32
  %40 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end9, !dbg !32

if.end9:                                          ; preds = %if.end6, %then7
  %41 = bitcast [4 x i8]* %c to i8*, !dbg !33
  %42 = getelementptr i8, i8* %41, i32 3, !dbg !33
  store i8* %42, i8** %pc, align 8, !dbg !33
  %43 = load i8*, i8** %pc, align 8, !dbg !33
  %44 = load i8*, i8** %pc, align 8, !dbg !34
  %45 = load i8, i8* %44, align 1, !dbg !34
  %46 = sext i8 %45 to i32, !dbg !34
  %47 = icmp ne i32 %46, 68, !dbg !34
  br i1 %47, label %then10, label %if.end12, !dbg !34

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !35
  %48 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end12, !dbg !35

if.end12:                                         ; preds = %if.end9, %then10
  %49 = load i8*, i8** %pc, align 8, !dbg !36
  %50 = getelementptr i8, i8* %49, i32 -1, !dbg !36
  store i8* %50, i8** %pc, align 8, !dbg !36
  %51 = load i8*, i8** %pc, align 8, !dbg !36
  %52 = load i8*, i8** %pc, align 8, !dbg !37
  %53 = load i8, i8* %52, align 1, !dbg !37
  %54 = sext i8 %53 to i32, !dbg !37
  %55 = icmp ne i32 %54, 67, !dbg !37
  br i1 %55, label %then13, label %if.end15, !dbg !37

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !38
  %56 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end15, !dbg !38

if.end15:                                         ; preds = %if.end12, %then13
  %57 = load i8*, i8** %pc, align 8, !dbg !39
  %58 = getelementptr i8, i8* %57, i32 -1, !dbg !39
  store i8* %58, i8** %pc, align 8, !dbg !39
  %59 = load i8*, i8** %pc, align 8, !dbg !39
  %60 = load i8*, i8** %pc, align 8, !dbg !40
  %61 = load i8, i8* %60, align 1, !dbg !40
  %62 = sext i8 %61 to i32, !dbg !40
  %63 = icmp ne i32 %62, 66, !dbg !40
  br i1 %63, label %then16, label %if.end18, !dbg !40

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !41
  %64 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end18, !dbg !41

if.end18:                                         ; preds = %if.end15, %then16
  %65 = load i8*, i8** %pc, align 8, !dbg !42
  %66 = getelementptr i8, i8* %65, i32 -1, !dbg !42
  store i8* %66, i8** %pc, align 8, !dbg !42
  %67 = load i8*, i8** %pc, align 8, !dbg !43
  %68 = load i8, i8* %67, align 1, !dbg !43
  %69 = sext i8 %68 to i32, !dbg !43
  %70 = icmp ne i32 %69, 65, !dbg !43
  br i1 %70, label %then19, label %if.end21, !dbg !43

then19:                                           ; preds = %if.end18
  store i32 1, i32* %err, align 4, !dbg !44
  %71 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end21, !dbg !44

if.end21:                                         ; preds = %if.end18, %then19
  %72 = load i32, i32* %err, align 4, !dbg !45
  %73 = icmp eq i32 %72, 0, !dbg !45
  %. = select i1 %73, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @1, i32 0, i32 0), !dbg !46
  %74 = call i32 (i8*, ...) @printf(i8* %.), !dbg !46
  %75 = load i32, i32* %err, align 4, !dbg !47
  ret i32 %75, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "28.pointer_move.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "pc", scope: !2, file: !1, line: 11, type: !8)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DILocation(line: 11, column: 3, scope: !2)
!11 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 5, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, align: 8, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 4, lowerBound: 0)
!15 = !DILocation(line: 5, column: 3, scope: !2)
!16 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!17 = !DILocation(line: 4, column: 3, scope: !2)
!18 = !DILocation(line: 6, column: 3, scope: !2)
!19 = !DILocation(line: 7, column: 3, scope: !2)
!20 = !DILocation(line: 8, column: 3, scope: !2)
!21 = !DILocation(line: 9, column: 3, scope: !2)
!22 = !DILocation(line: 12, column: 3, scope: !2)
!23 = !DILocation(line: 12, column: 19, scope: !2)
!24 = !DILocation(line: 13, column: 3, scope: !2)
!25 = !DILocation(line: 14, column: 3, scope: !2)
!26 = !DILocation(line: 14, column: 19, scope: !2)
!27 = !DILocation(line: 15, column: 3, scope: !2)
!28 = !DILocation(line: 16, column: 3, scope: !2)
!29 = !DILocation(line: 16, column: 19, scope: !2)
!30 = !DILocation(line: 17, column: 3, scope: !2)
!31 = !DILocation(line: 18, column: 3, scope: !2)
!32 = !DILocation(line: 18, column: 19, scope: !2)
!33 = !DILocation(line: 20, column: 3, scope: !2)
!34 = !DILocation(line: 21, column: 3, scope: !2)
!35 = !DILocation(line: 21, column: 19, scope: !2)
!36 = !DILocation(line: 22, column: 3, scope: !2)
!37 = !DILocation(line: 23, column: 3, scope: !2)
!38 = !DILocation(line: 23, column: 19, scope: !2)
!39 = !DILocation(line: 24, column: 3, scope: !2)
!40 = !DILocation(line: 25, column: 3, scope: !2)
!41 = !DILocation(line: 25, column: 19, scope: !2)
!42 = !DILocation(line: 26, column: 3, scope: !2)
!43 = !DILocation(line: 27, column: 3, scope: !2)
!44 = !DILocation(line: 27, column: 19, scope: !2)
!45 = !DILocation(line: 29, column: 3, scope: !2)
!46 = !DILocation(line: 0, scope: !2)
!47 = !DILocation(line: 34, column: 3, scope: !2)
