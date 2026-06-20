; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countSum(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !7, metadata !DIExpression()), !dbg !8
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !9, metadata !DIExpression()), !dbg !10
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %0, i32* %n, align 4, !dbg !12
  store i32 0, i32* %sum, align 4, !dbg !10
  store i32 1, i32* %i, align 4, !dbg !8
  br label %while.cond, !dbg !13

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !13
  %2 = load i32, i32* %n, align 4, !dbg !13
  %3 = icmp sle i32 %1, %2, !dbg !13
  br i1 %3, label %while.loop, label %while.end, !dbg !13

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4, !dbg !14
  %5 = load i32, i32* %sum, align 4, !dbg !14
  %6 = add i32 %5, %4, !dbg !14
  store i32 %6, i32* %sum, align 4, !dbg !14
  %7 = load i32, i32* %sum, align 4, !dbg !14
  %8 = load i32, i32* %i, align 4, !dbg !16
  %9 = add i32 %8, 1, !dbg !16
  store i32 %9, i32* %i, align 4, !dbg !16
  %10 = load i32, i32* %i, align 4, !dbg !16
  br label %while.cond, !dbg !16

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %sum, align 4, !dbg !17
  ret i32 %11, !dbg !17
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @countSum2(i32 %0) !dbg !18 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !21, metadata !DIExpression()), !dbg !22
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 %0, i32* %n, align 4, !dbg !24
  store i32 0, i32* %sum, align 4, !dbg !22
  store i32 0, i32* %i, align 4, !dbg !20
  br label %do.loop, !dbg !25

do.loop:                                          ; preds = %do.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !26
  %2 = load i32, i32* %sum, align 4, !dbg !26
  %3 = add i32 %2, %1, !dbg !26
  store i32 %3, i32* %sum, align 4, !dbg !26
  %4 = load i32, i32* %sum, align 4, !dbg !26
  %5 = load i32, i32* %i, align 4, !dbg !28
  %6 = add i32 %5, 1, !dbg !28
  store i32 %6, i32* %i, align 4, !dbg !28
  %7 = load i32, i32* %i, align 4, !dbg !28
  %8 = load i32, i32* %i, align 4, !dbg !28
  %9 = load i32, i32* %n, align 4, !dbg !28
  %10 = icmp sle i32 %8, %9, !dbg !28
  br i1 %10, label %do.loop, label %do.end, !dbg !28

do.end:                                           ; preds = %do.loop
  %11 = load i32, i32* %sum, align 4, !dbg !29
  ret i32 %11, !dbg !29
}

define i32 @main() !dbg !30 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %err, align 4, !dbg !34
  %0 = call i32 @countSum(i32 100), !dbg !35
  %1 = icmp ne i32 %0, 5050, !dbg !35
  br i1 %1, label %then, label %if.end, !dbg !35

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !36
  %2 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end, !dbg !36

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !37
  %4 = icmp ne i32 %3, 5050, !dbg !37
  br i1 %4, label %then1, label %if.end3, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !38
  %5 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum(i32 0), !dbg !39
  %7 = icmp ne i32 %6, 0, !dbg !39
  br i1 %7, label %then4, label %if.end6, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !40
  %8 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !41
  %10 = icmp ne i32 %9, 0, !dbg !41
  br i1 %10, label %then7, label %if.end9, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !42
  %11 = load i32, i32* %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, i32* %err, align 4, !dbg !43
  %13 = icmp eq i32 %12, 0, !dbg !43
  %. = select i1 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !44
  %14 = call i32 (i8*, ...) @printf(i8* %.), !dbg !44
  %15 = load i32, i32* %err, align 4, !dbg !45
  ret i32 %15, !dbg !45
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "20.do_while.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 3, scope: !2)
!9 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!12 = !DILocation(line: 3, column: 5, scope: !2)
!13 = !DILocation(line: 6, column: 3, scope: !2)
!14 = !DILocation(line: 7, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !2, file: !1, line: 6, column: 18)
!16 = !DILocation(line: 8, column: 5, scope: !15)
!17 = !DILocation(line: 10, column: 3, scope: !2)
!18 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!19 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 15, type: !5)
!20 = !DILocation(line: 15, column: 3, scope: !18)
!21 = !DILocalVariable(name: "sum", scope: !18, file: !1, line: 14, type: !5)
!22 = !DILocation(line: 14, column: 3, scope: !18)
!23 = !DILocalVariable(name: "n", arg: 1, scope: !18, file: !1, line: 13, type: !5)
!24 = !DILocation(line: 13, column: 5, scope: !18)
!25 = !DILocation(line: 16, column: 3, scope: !18)
!26 = !DILocation(line: 17, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !1, line: 16, column: 6)
!28 = !DILocation(line: 18, column: 5, scope: !27)
!29 = !DILocation(line: 20, column: 3, scope: !18)
!30 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 23, type: !31, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!31 = !DISubroutineType(types: !32)
!32 = !{!5}
!33 = !DILocalVariable(name: "err", scope: !30, file: !1, line: 24, type: !5)
!34 = !DILocation(line: 24, column: 3, scope: !30)
!35 = !DILocation(line: 26, column: 3, scope: !30)
!36 = !DILocation(line: 26, column: 30, scope: !30)
!37 = !DILocation(line: 27, column: 3, scope: !30)
!38 = !DILocation(line: 27, column: 31, scope: !30)
!39 = !DILocation(line: 28, column: 3, scope: !30)
!40 = !DILocation(line: 28, column: 25, scope: !30)
!41 = !DILocation(line: 29, column: 3, scope: !30)
!42 = !DILocation(line: 29, column: 26, scope: !30)
!43 = !DILocation(line: 31, column: 3, scope: !30)
!44 = !DILocation(line: 0, scope: !30)
!45 = !DILocation(line: 36, column: 3, scope: !30)
