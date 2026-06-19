; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [19 x i8] c"16.ternary.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [19 x i8] c"16.ternary.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() !dbg !2 {
entry:
  %ternarySame = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ternarySame, metadata !7, metadata !DIExpression()), !dbg !8
  %same = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %same, metadata !9, metadata !DIExpression()), !dbg !10
  %maxNeg = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %maxNeg, metadata !11, metadata !DIExpression()), !dbg !12
  %minNeg = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %minNeg, metadata !13, metadata !DIExpression()), !dbg !14
  %e = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %e, metadata !15, metadata !DIExpression()), !dbg !16
  %d = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %d, metadata !17, metadata !DIExpression()), !dbg !18
  %maxVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %maxVal, metadata !19, metadata !DIExpression()), !dbg !20
  %minVal = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %minVal, metadata !21, metadata !DIExpression()), !dbg !22
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !23, metadata !DIExpression()), !dbg !24
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !25, metadata !DIExpression()), !dbg !26
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %err, align 4, !dbg !28
  store i32 3, i32* %a, align 4, !dbg !26
  store i32 7, i32* %c, align 4, !dbg !24
  %0 = load i32, i32* %a, align 4, !dbg !22
  %1 = load i32, i32* %c, align 4, !dbg !22
  %2 = icmp slt i32 %0, %1, !dbg !22
  %3 = load i32, i32* %a, align 4, !dbg !22
  %4 = load i32, i32* %c, align 4, !dbg !22
  %5 = select i1 %2, i32 %3, i32 %4, !dbg !22
  store i32 %5, i32* %minVal, align 4, !dbg !22
  %6 = load i32, i32* %a, align 4, !dbg !20
  %7 = load i32, i32* %c, align 4, !dbg !20
  %8 = icmp slt i32 %6, %7, !dbg !20
  %9 = load i32, i32* %c, align 4, !dbg !20
  %10 = load i32, i32* %a, align 4, !dbg !20
  %11 = select i1 %8, i32 %9, i32 %10, !dbg !20
  store i32 %11, i32* %maxVal, align 4, !dbg !20
  %12 = load i32, i32* %minVal, align 4, !dbg !29
  %13 = icmp ne i32 %12, 3, !dbg !29
  br i1 %13, label %then, label %if.end, !dbg !29

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !30
  %14 = load i32, i32* %err, align 4, !dbg !30
  br label %if.end, !dbg !30

if.end:                                           ; preds = %entry, %then
  %15 = load i32, i32* %maxVal, align 4, !dbg !31
  %16 = icmp ne i32 %15, 7, !dbg !31
  br i1 %16, label %then1, label %if.end3, !dbg !31

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !32
  %17 = load i32, i32* %err, align 4, !dbg !32
  br label %if.end3, !dbg !32

if.end3:                                          ; preds = %if.end, %then1
  store i32 -5, i32* %d, align 4, !dbg !18
  store i32 2, i32* %e, align 4, !dbg !16
  %18 = load i32, i32* %d, align 4, !dbg !14
  %19 = load i32, i32* %e, align 4, !dbg !14
  %20 = icmp slt i32 %18, %19, !dbg !14
  %21 = load i32, i32* %d, align 4, !dbg !14
  %22 = load i32, i32* %e, align 4, !dbg !14
  %23 = select i1 %20, i32 %21, i32 %22, !dbg !14
  store i32 %23, i32* %minNeg, align 4, !dbg !14
  %24 = load i32, i32* %d, align 4, !dbg !12
  %25 = load i32, i32* %e, align 4, !dbg !12
  %26 = icmp slt i32 %24, %25, !dbg !12
  %27 = load i32, i32* %e, align 4, !dbg !12
  %28 = load i32, i32* %d, align 4, !dbg !12
  %29 = select i1 %26, i32 %27, i32 %28, !dbg !12
  store i32 %29, i32* %maxNeg, align 4, !dbg !12
  %30 = load i32, i32* %minNeg, align 4, !dbg !33
  %31 = icmp ne i32 %30, -5, !dbg !33
  br i1 %31, label %then4, label %if.end6, !dbg !33

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !34
  %32 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end6, !dbg !34

if.end6:                                          ; preds = %if.end3, %then4
  %33 = load i32, i32* %maxNeg, align 4, !dbg !35
  %34 = icmp ne i32 %33, 2, !dbg !35
  br i1 %34, label %then7, label %if.end9, !dbg !35

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !36
  %35 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end9, !dbg !36

if.end9:                                          ; preds = %if.end6, %then7
  store i32 42, i32* %same, align 4, !dbg !10
  %36 = load i32, i32* %same, align 4, !dbg !8
  %37 = load i32, i32* %same, align 4, !dbg !8
  %38 = icmp slt i32 %36, %37, !dbg !8
  %39 = select i1 %38, i32 0, i32 1, !dbg !8
  store i32 %39, i32* %ternarySame, align 4, !dbg !8
  %40 = load i32, i32* %ternarySame, align 4, !dbg !37
  %41 = icmp ne i32 %40, 1, !dbg !37
  br i1 %41, label %then10, label %if.end12, !dbg !37

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !38
  %42 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end12, !dbg !38

if.end12:                                         ; preds = %if.end9, %then10
  %43 = load i32, i32* %err, align 4, !dbg !39
  %44 = icmp eq i32 %43, 0, !dbg !39
  %. = select i1 %44, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @1, i32 0, i32 0), !dbg !40
  %45 = call i32 (i8*, ...) @printf(i8* %.), !dbg !40
  %46 = load i32, i32* %err, align 4, !dbg !41
  ret i32 %46, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "16.ternary.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "ternarySame", scope: !2, file: !1, line: 21, type: !5)
!8 = !DILocation(line: 21, column: 3, scope: !2)
!9 = !DILocalVariable(name: "same", scope: !2, file: !1, line: 20, type: !5)
!10 = !DILocation(line: 20, column: 3, scope: !2)
!11 = !DILocalVariable(name: "maxNeg", scope: !2, file: !1, line: 16, type: !5)
!12 = !DILocation(line: 16, column: 3, scope: !2)
!13 = !DILocalVariable(name: "minNeg", scope: !2, file: !1, line: 15, type: !5)
!14 = !DILocation(line: 15, column: 3, scope: !2)
!15 = !DILocalVariable(name: "e", scope: !2, file: !1, line: 14, type: !5)
!16 = !DILocation(line: 14, column: 3, scope: !2)
!17 = !DILocalVariable(name: "d", scope: !2, file: !1, line: 13, type: !5)
!18 = !DILocation(line: 13, column: 3, scope: !2)
!19 = !DILocalVariable(name: "maxVal", scope: !2, file: !1, line: 9, type: !5)
!20 = !DILocation(line: 9, column: 3, scope: !2)
!21 = !DILocalVariable(name: "minVal", scope: !2, file: !1, line: 8, type: !5)
!22 = !DILocation(line: 8, column: 3, scope: !2)
!23 = !DILocalVariable(name: "c", scope: !2, file: !1, line: 6, type: !5)
!24 = !DILocation(line: 6, column: 3, scope: !2)
!25 = !DILocalVariable(name: "a", scope: !2, file: !1, line: 5, type: !5)
!26 = !DILocation(line: 5, column: 3, scope: !2)
!27 = !DILocalVariable(name: "err", scope: !2, file: !1, line: 4, type: !5)
!28 = !DILocation(line: 4, column: 3, scope: !2)
!29 = !DILocation(line: 10, column: 3, scope: !2)
!30 = !DILocation(line: 10, column: 20, scope: !2)
!31 = !DILocation(line: 11, column: 3, scope: !2)
!32 = !DILocation(line: 11, column: 20, scope: !2)
!33 = !DILocation(line: 17, column: 3, scope: !2)
!34 = !DILocation(line: 17, column: 21, scope: !2)
!35 = !DILocation(line: 18, column: 3, scope: !2)
!36 = !DILocation(line: 18, column: 20, scope: !2)
!37 = !DILocation(line: 22, column: 3, scope: !2)
!38 = !DILocation(line: 22, column: 25, scope: !2)
!39 = !DILocation(line: 24, column: 3, scope: !2)
!40 = !DILocation(line: 0, scope: !2)
!41 = !DILocation(line: 29, column: 3, scope: !2)
