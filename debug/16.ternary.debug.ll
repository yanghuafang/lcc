; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !4 {
entry:
  %ternarySame = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ternarySame, metadata !9, metadata !DIExpression()), !dbg !10
  %same = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %same, metadata !11, metadata !DIExpression()), !dbg !12
  %maxNeg = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %maxNeg, metadata !13, metadata !DIExpression()), !dbg !14
  %minNeg = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %minNeg, metadata !15, metadata !DIExpression()), !dbg !16
  %e = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %e, metadata !17, metadata !DIExpression()), !dbg !18
  %d = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %d, metadata !19, metadata !DIExpression()), !dbg !20
  %maxVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %maxVal, metadata !21, metadata !DIExpression()), !dbg !22
  %minVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %minVal, metadata !23, metadata !DIExpression()), !dbg !24
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !25, metadata !DIExpression()), !dbg !26
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !27, metadata !DIExpression()), !dbg !28
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %err, align 4, !dbg !30
  store i32 3, i32* %a, align 4, !dbg !28
  store i32 7, i32* %c, align 4, !dbg !26
  %0 = load i32, i32* %a, align 4, !dbg !24
  %1 = load i32, i32* %c, align 4, !dbg !24
  %2 = icmp slt i32 %0, %1, !dbg !24
  %3 = load i32, i32* %a, align 4, !dbg !24
  %4 = load i32, i32* %c, align 4, !dbg !24
  %5 = select i1 %2, i32 %3, i32 %4, !dbg !24
  store i32 %5, i32* %minVal, align 4, !dbg !24
  %6 = load i32, i32* %a, align 4, !dbg !22
  %7 = load i32, i32* %c, align 4, !dbg !22
  %8 = icmp slt i32 %6, %7, !dbg !22
  %9 = load i32, i32* %c, align 4, !dbg !22
  %10 = load i32, i32* %a, align 4, !dbg !22
  %11 = select i1 %8, i32 %9, i32 %10, !dbg !22
  store i32 %11, i32* %maxVal, align 4, !dbg !22
  %12 = load i32, i32* %minVal, align 4, !dbg !31
  %13 = icmp ne i32 %12, 3, !dbg !31
  br i1 %13, label %then, label %if.end, !dbg !31

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !32
  %14 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end, !dbg !32

if.end:                                           ; preds = %entry, %then
  %15 = load i32, i32* %maxVal, align 4, !dbg !33
  %16 = icmp ne i32 %15, 7, !dbg !33
  br i1 %16, label %then1, label %if.end3, !dbg !33

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !34
  %17 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %then1
  store i32 -5, i32* %d, align 4, !dbg !20
  store i32 2, i32* %e, align 4, !dbg !18
  %18 = load i32, i32* %d, align 4, !dbg !16
  %19 = load i32, i32* %e, align 4, !dbg !16
  %20 = icmp slt i32 %18, %19, !dbg !16
  %21 = load i32, i32* %d, align 4, !dbg !16
  %22 = load i32, i32* %e, align 4, !dbg !16
  %23 = select i1 %20, i32 %21, i32 %22, !dbg !16
  store i32 %23, i32* %minNeg, align 4, !dbg !16
  %24 = load i32, i32* %d, align 4, !dbg !14
  %25 = load i32, i32* %e, align 4, !dbg !14
  %26 = icmp slt i32 %24, %25, !dbg !14
  %27 = load i32, i32* %e, align 4, !dbg !14
  %28 = load i32, i32* %d, align 4, !dbg !14
  %29 = select i1 %26, i32 %27, i32 %28, !dbg !14
  store i32 %29, i32* %maxNeg, align 4, !dbg !14
  %30 = load i32, i32* %minNeg, align 4, !dbg !35
  %31 = icmp ne i32 %30, -5, !dbg !35
  br i1 %31, label %then4, label %if.end6, !dbg !35

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !36
  %32 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end6, !dbg !36

if.end6:                                          ; preds = %if.end3, %then4
  %33 = load i32, i32* %maxNeg, align 4, !dbg !37
  %34 = icmp ne i32 %33, 2, !dbg !37
  br i1 %34, label %then7, label %if.end9, !dbg !37

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !38
  %35 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end9, !dbg !38

if.end9:                                          ; preds = %if.end6, %then7
  store i32 42, i32* %same, align 4, !dbg !12
  %36 = load i32, i32* %same, align 4, !dbg !10
  %37 = load i32, i32* %same, align 4, !dbg !10
  %38 = icmp slt i32 %36, %37, !dbg !10
  %39 = select i1 %38, i32 0, i32 1, !dbg !10
  store i32 %39, i32* %ternarySame, align 4, !dbg !10
  %40 = load i32, i32* %ternarySame, align 4, !dbg !39
  %41 = icmp ne i32 %40, 1, !dbg !39
  br i1 %41, label %then10, label %if.end12, !dbg !39

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !40
  %42 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end12, !dbg !40

if.end12:                                         ; preds = %if.end9, %then10
  %43 = load i32, i32* %err, align 4, !dbg !41
  %44 = icmp eq i32 %43, 0, !dbg !41
  %. = select i1 %44, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !42
  %45 = call i32 (i8*, ...) @printf(i8* %.), !dbg !42
  %46 = load i32, i32* %err, align 4, !dbg !43
  ret i32 %46, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "ternarySame", scope: !4, file: !1, line: 21, type: !7)
!10 = !DILocation(line: 21, column: 3, scope: !4)
!11 = !DILocalVariable(name: "same", scope: !4, file: !1, line: 20, type: !7)
!12 = !DILocation(line: 20, column: 3, scope: !4)
!13 = !DILocalVariable(name: "maxNeg", scope: !4, file: !1, line: 16, type: !7)
!14 = !DILocation(line: 16, column: 3, scope: !4)
!15 = !DILocalVariable(name: "minNeg", scope: !4, file: !1, line: 15, type: !7)
!16 = !DILocation(line: 15, column: 3, scope: !4)
!17 = !DILocalVariable(name: "e", scope: !4, file: !1, line: 14, type: !7)
!18 = !DILocation(line: 14, column: 3, scope: !4)
!19 = !DILocalVariable(name: "d", scope: !4, file: !1, line: 13, type: !7)
!20 = !DILocation(line: 13, column: 3, scope: !4)
!21 = !DILocalVariable(name: "maxVal", scope: !4, file: !1, line: 9, type: !7)
!22 = !DILocation(line: 9, column: 3, scope: !4)
!23 = !DILocalVariable(name: "minVal", scope: !4, file: !1, line: 8, type: !7)
!24 = !DILocation(line: 8, column: 3, scope: !4)
!25 = !DILocalVariable(name: "c", scope: !4, file: !1, line: 6, type: !7)
!26 = !DILocation(line: 6, column: 3, scope: !4)
!27 = !DILocalVariable(name: "a", scope: !4, file: !1, line: 5, type: !7)
!28 = !DILocation(line: 5, column: 3, scope: !4)
!29 = !DILocalVariable(name: "err", scope: !4, file: !1, line: 4, type: !7)
!30 = !DILocation(line: 4, column: 3, scope: !4)
!31 = !DILocation(line: 10, column: 3, scope: !4)
!32 = !DILocation(line: 10, column: 20, scope: !4)
!33 = !DILocation(line: 11, column: 3, scope: !4)
!34 = !DILocation(line: 11, column: 20, scope: !4)
!35 = !DILocation(line: 17, column: 3, scope: !4)
!36 = !DILocation(line: 17, column: 21, scope: !4)
!37 = !DILocation(line: 18, column: 3, scope: !4)
!38 = !DILocation(line: 18, column: 20, scope: !4)
!39 = !DILocation(line: 22, column: 3, scope: !4)
!40 = !DILocation(line: 22, column: 25, scope: !4)
!41 = !DILocation(line: 24, column: 3, scope: !4)
!42 = !DILocation(line: 0, scope: !4)
!43 = !DILocation(line: 29, column: 3, scope: !4)
