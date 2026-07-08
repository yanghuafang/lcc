; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@gc = global i8 97
@gi = global i32 1024
@0 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"5.pointer_type.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %pgi = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %pgi, metadata !9, metadata !DIExpression()), !dbg !11
  %pgc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pgc, metadata !12, metadata !DIExpression()), !dbg !15
  %pi = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %pi, metadata !16, metadata !DIExpression()), !dbg !17
  %pc = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !18, metadata !DIExpression()), !dbg !19
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  %c = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %c, metadata !22, metadata !DIExpression()), !dbg !23
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %err, align 4, !dbg !25
  store i8 65, i8* %c, align 1, !dbg !23
  store i32 128, i32* %i, align 4, !dbg !21
  store i8* %c, i8** %pc, align 8, !dbg !19
  store i32* %i, i32** %pi, align 8, !dbg !17
  %0 = load i8*, i8** %pc, align 8, !dbg !26
  store i8 66, i8* %0, align 1, !dbg !26
  %1 = load i8, i8* %0, align 1, !dbg !26
  %2 = load i32*, i32** %pi, align 8, !dbg !27
  store i32 256, i32* %2, align 4, !dbg !27
  %3 = load i32, i32* %2, align 4, !dbg !27
  store i8* @gc, i8** %pgc, align 8, !dbg !15
  store i32* @gi, i32** %pgi, align 8, !dbg !11
  %4 = load i8*, i8** %pgc, align 8, !dbg !28
  store i8 98, i8* %4, align 1, !dbg !28
  %5 = load i8, i8* %4, align 1, !dbg !28
  %6 = load i32*, i32** %pgi, align 8, !dbg !29
  store i32 2048, i32* %6, align 4, !dbg !29
  %7 = load i32, i32* %6, align 4, !dbg !29
  %8 = load i8, i8* %c, align 1, !dbg !30
  %9 = sext i8 %8 to i32, !dbg !30
  %10 = icmp ne i32 %9, 66, !dbg !30
  br i1 %10, label %then, label %if.end, !dbg !30

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !31
  %11 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end, !dbg !31

if.end:                                           ; preds = %entry, %then
  %12 = load i8*, i8** %pc, align 8, !dbg !32
  %13 = load i8, i8* %12, align 1, !dbg !32
  %14 = sext i8 %13 to i32, !dbg !32
  %15 = icmp ne i32 %14, 66, !dbg !32
  br i1 %15, label %then1, label %if.end3, !dbg !32

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !33
  %16 = load i32, i32* %err, align 4, !dbg !33
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %then1
  %17 = load i32, i32* %i, align 4, !dbg !34
  %18 = icmp ne i32 %17, 256, !dbg !34
  br i1 %18, label %then4, label %if.end6, !dbg !34

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !35
  %19 = load i32, i32* %err, align 4, !dbg !35
  br label %if.end6, !dbg !35

if.end6:                                          ; preds = %if.end3, %then4
  %20 = load i32*, i32** %pi, align 8, !dbg !36
  %21 = load i32, i32* %20, align 4, !dbg !36
  %22 = icmp ne i32 %21, 256, !dbg !36
  br i1 %22, label %then7, label %if.end9, !dbg !36

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !37
  %23 = load i32, i32* %err, align 4, !dbg !37
  br label %if.end9, !dbg !37

if.end9:                                          ; preds = %if.end6, %then7
  %24 = load i8, i8* @gc, align 1, !dbg !38
  %25 = sext i8 %24 to i32, !dbg !38
  %26 = icmp ne i32 %25, 98, !dbg !38
  br i1 %26, label %then10, label %if.end12, !dbg !38

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !39
  %27 = load i32, i32* %err, align 4, !dbg !39
  br label %if.end12, !dbg !39

if.end12:                                         ; preds = %if.end9, %then10
  %28 = load i32, i32* @gi, align 4, !dbg !40
  %29 = icmp ne i32 %28, 2048, !dbg !40
  br i1 %29, label %then13, label %if.end15, !dbg !40

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !41
  %30 = load i32, i32* %err, align 4, !dbg !41
  br label %if.end15, !dbg !41

if.end15:                                         ; preds = %if.end12, %then13
  %31 = load i32*, i32** %pi, align 8, !dbg !42
  store i32 0, i32* %31, align 4, !dbg !42
  %32 = load i32, i32* %31, align 4, !dbg !42
  %33 = load i32, i32* %i, align 4, !dbg !43
  %34 = icmp ne i32 %33, 0, !dbg !43
  br i1 %34, label %then16, label %if.end18, !dbg !43

then16:                                           ; preds = %if.end15
  store i32 1, i32* %err, align 4, !dbg !44
  %35 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end18, !dbg !44

if.end18:                                         ; preds = %if.end15, %then16
  %36 = load i32, i32* %err, align 4, !dbg !45
  %37 = icmp eq i32 %36, 0, !dbg !45
  %. = select i1 %37, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0), !dbg !46
  %38 = call i32 (i8*, ...) @printf(i8* %.), !dbg !46
  %39 = load i32, i32* %err, align 4, !dbg !47
  ret i32 %39, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "5.pointer_type.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "pgi", scope: !4, file: !1, line: 17, type: !10)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!11 = !DILocation(line: 17, column: 3, scope: !4)
!12 = !DILocalVariable(name: "pgc", scope: !4, file: !1, line: 16, type: !13)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocation(line: 16, column: 3, scope: !4)
!16 = !DILocalVariable(name: "pi", scope: !4, file: !1, line: 11, type: !10)
!17 = !DILocation(line: 11, column: 3, scope: !4)
!18 = !DILocalVariable(name: "pc", scope: !4, file: !1, line: 10, type: !13)
!19 = !DILocation(line: 10, column: 3, scope: !4)
!20 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !7)
!21 = !DILocation(line: 9, column: 3, scope: !4)
!22 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 8, type: !14)
!23 = !DILocation(line: 8, column: 3, scope: !4)
!24 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 7, type: !7)
!25 = !DILocation(line: 7, column: 3, scope: !4)
!26 = !DILocation(line: 13, column: 3, scope: !4)
!27 = !DILocation(line: 14, column: 3, scope: !4)
!28 = !DILocation(line: 18, column: 3, scope: !4)
!29 = !DILocation(line: 19, column: 3, scope: !4)
!30 = !DILocation(line: 21, column: 3, scope: !4)
!31 = !DILocation(line: 21, column: 17, scope: !4)
!32 = !DILocation(line: 22, column: 3, scope: !4)
!33 = !DILocation(line: 22, column: 19, scope: !4)
!34 = !DILocation(line: 23, column: 3, scope: !4)
!35 = !DILocation(line: 23, column: 17, scope: !4)
!36 = !DILocation(line: 24, column: 3, scope: !4)
!37 = !DILocation(line: 24, column: 19, scope: !4)
!38 = !DILocation(line: 25, column: 3, scope: !4)
!39 = !DILocation(line: 25, column: 18, scope: !4)
!40 = !DILocation(line: 26, column: 3, scope: !4)
!41 = !DILocation(line: 26, column: 19, scope: !4)
!42 = !DILocation(line: 28, column: 3, scope: !4)
!43 = !DILocation(line: 29, column: 3, scope: !4)
!44 = !DILocation(line: 29, column: 15, scope: !4)
!45 = !DILocation(line: 31, column: 3, scope: !4)
!46 = !DILocation(line: 0, scope: !4)
!47 = !DILocation(line: 36, column: 3, scope: !4)
