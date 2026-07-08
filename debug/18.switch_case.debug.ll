; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i8 @gradeOfScore(i32 %0) !dbg !4 {
entry:
  %grade = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %grade, metadata !10, metadata !DIExpression()), !dbg !11
  %score = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %score, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %0, i32* %score, align 4, !dbg !13
  %1 = load i32, i32* %score, align 4, !dbg !14
  switch i32 %1, label %case.10 [
    i32 1, label %case.4
    i32 2, label %case.4
    i32 3, label %case.4
    i32 4, label %case.4
    i32 5, label %case.4
    i32 6, label %case.5
    i32 7, label %case.7
    i32 8, label %case.7
    i32 9, label %case.9
    i32 10, label %case.9
  ], !dbg !14

case.4:                                           ; preds = %entry, %entry, %entry, %entry, %entry
  store i8 68, i8* %grade, align 1, !dbg !15
  %2 = load i8, i8* %grade, align 1, !dbg !15
  br label %switch.end, !dbg !16

case.5:                                           ; preds = %entry
  store i8 67, i8* %grade, align 1, !dbg !17
  %3 = load i8, i8* %grade, align 1, !dbg !17
  br label %switch.end, !dbg !18

case.7:                                           ; preds = %entry, %entry
  store i8 66, i8* %grade, align 1, !dbg !19
  %4 = load i8, i8* %grade, align 1, !dbg !19
  br label %switch.end, !dbg !20

case.9:                                           ; preds = %entry, %entry
  store i8 65, i8* %grade, align 1, !dbg !21
  %5 = load i8, i8* %grade, align 1, !dbg !21
  br label %switch.end, !dbg !22

case.10:                                          ; preds = %entry
  store i8 69, i8* %grade, align 1, !dbg !23
  %6 = load i8, i8* %grade, align 1, !dbg !23
  br label %switch.end, !dbg !24

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %7 = load i8, i8* %grade, align 1, !dbg !25
  ret i8 %7, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !26 {
entry:
  %boundary = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %boundary, metadata !29, metadata !DIExpression()), !dbg !30
  %grade = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %grade, metadata !31, metadata !DIExpression()), !dbg !32
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %err, align 4, !dbg !34
  %0 = call i8 @gradeOfScore(i32 3), !dbg !35
  %1 = sext i8 %0 to i32, !dbg !35
  %2 = icmp ne i32 %1, 68, !dbg !35
  br i1 %2, label %then, label %if.end, !dbg !35

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !36
  %3 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end, !dbg !36

if.end:                                           ; preds = %entry, %then
  %4 = call i8 @gradeOfScore(i32 5), !dbg !37
  %5 = sext i8 %4 to i32, !dbg !37
  %6 = icmp ne i32 %5, 68, !dbg !37
  br i1 %6, label %then1, label %if.end3, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !38
  %7 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %then1
  %8 = call i8 @gradeOfScore(i32 6), !dbg !39
  %9 = sext i8 %8 to i32, !dbg !39
  %10 = icmp ne i32 %9, 67, !dbg !39
  br i1 %10, label %then4, label %if.end6, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !40
  %11 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %if.end3, %then4
  %12 = call i8 @gradeOfScore(i32 8), !dbg !41
  %13 = sext i8 %12 to i32, !dbg !41
  %14 = icmp ne i32 %13, 66, !dbg !41
  br i1 %14, label %then7, label %if.end9, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !42
  %15 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %if.end6, %then7
  %16 = call i8 @gradeOfScore(i32 9), !dbg !43
  %17 = sext i8 %16 to i32, !dbg !43
  %18 = icmp ne i32 %17, 65, !dbg !43
  br i1 %18, label %then10, label %if.end12, !dbg !43

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !44
  %19 = load i32, i32* %err, align 4, !dbg !44
  br label %if.end12, !dbg !44

if.end12:                                         ; preds = %if.end9, %then10
  store i32 0, i32* %boundary, align 4, !dbg !30
  %20 = load i32, i32* %boundary, align 4, !dbg !45
  store i8 69, i8* %grade, align 1, !dbg !46
  %21 = load i8, i8* %grade, align 1, !dbg !46
  %22 = load i8, i8* %grade, align 1, !dbg !47
  %23 = sext i8 %22 to i32, !dbg !47
  %24 = icmp ne i32 %23, 69, !dbg !47
  br i1 %24, label %then13, label %if.end15, !dbg !47

then13:                                           ; preds = %if.end12
  store i32 1, i32* %err, align 4, !dbg !48
  %25 = load i32, i32* %err, align 4, !dbg !48
  br label %if.end15, !dbg !48

if.end15:                                         ; preds = %if.end12, %then13
  %26 = load i32, i32* %err, align 4, !dbg !49
  %27 = icmp eq i32 %26, 0, !dbg !49
  %. = select i1 %27, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @1, i32 0, i32 0), !dbg !50
  %28 = call i32 (i8*, ...) @printf(i8* %.), !dbg !50
  %29 = load i32, i32* %err, align 4, !dbg !51
  ret i32 %29, !dbg !51
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "18.switch_case.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "gradeOfScore", linkageName: "gradeOfScore", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8}
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{}
!10 = !DILocalVariable(name: "grade", scope: !4, file: !1, line: 4, type: !7)
!11 = !DILocation(line: 4, column: 3, scope: !4)
!12 = !DILocalVariable(name: "score", arg: 1, scope: !4, file: !1, line: 3, type: !8)
!13 = !DILocation(line: 3, column: 6, scope: !4)
!14 = !DILocation(line: 5, column: 3, scope: !4)
!15 = !DILocation(line: 11, column: 7, scope: !4)
!16 = !DILocation(line: 12, column: 7, scope: !4)
!17 = !DILocation(line: 14, column: 7, scope: !4)
!18 = !DILocation(line: 15, column: 7, scope: !4)
!19 = !DILocation(line: 18, column: 7, scope: !4)
!20 = !DILocation(line: 19, column: 7, scope: !4)
!21 = !DILocation(line: 22, column: 7, scope: !4)
!22 = !DILocation(line: 23, column: 7, scope: !4)
!23 = !DILocation(line: 25, column: 7, scope: !4)
!24 = !DILocation(line: 26, column: 7, scope: !4)
!25 = !DILocation(line: 28, column: 3, scope: !4)
!26 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 31, type: !27, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !9)
!27 = !DISubroutineType(types: !28)
!28 = !{!8}
!29 = !DILocalVariable(name: "boundary", scope: !26, file: !1, line: 41, type: !8)
!30 = !DILocation(line: 41, column: 3, scope: !26)
!31 = !DILocalVariable(name: "grade", scope: !26, file: !1, line: 40, type: !7)
!32 = !DILocation(line: 40, column: 3, scope: !26)
!33 = !DILocalVariable(name: "err", scope: !26, file: !1, line: 32, type: !8)
!34 = !DILocation(line: 32, column: 3, scope: !26)
!35 = !DILocation(line: 34, column: 3, scope: !26)
!36 = !DILocation(line: 34, column: 31, scope: !26)
!37 = !DILocation(line: 35, column: 3, scope: !26)
!38 = !DILocation(line: 35, column: 31, scope: !26)
!39 = !DILocation(line: 36, column: 3, scope: !26)
!40 = !DILocation(line: 36, column: 31, scope: !26)
!41 = !DILocation(line: 37, column: 3, scope: !26)
!42 = !DILocation(line: 37, column: 31, scope: !26)
!43 = !DILocation(line: 38, column: 3, scope: !26)
!44 = !DILocation(line: 38, column: 31, scope: !26)
!45 = !DILocation(line: 42, column: 3, scope: !26)
!46 = !DILocation(line: 44, column: 7, scope: !26)
!47 = !DILocation(line: 47, column: 3, scope: !26)
!48 = !DILocation(line: 47, column: 21, scope: !26)
!49 = !DILocation(line: 49, column: 3, scope: !26)
!50 = !DILocation(line: 0, scope: !26)
!51 = !DILocation(line: 54, column: 3, scope: !26)
