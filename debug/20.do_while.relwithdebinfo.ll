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
  %8 = load i32, i32* %i, align 4, !dbg !15
  %9 = add i32 %8, 1, !dbg !15
  store i32 %9, i32* %i, align 4, !dbg !15
  %10 = load i32, i32* %i, align 4, !dbg !15
  br label %while.cond, !dbg !15

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %sum, align 4, !dbg !16
  ret i32 %11, !dbg !16
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @countSum2(i32 %0) !dbg !17 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !20, metadata !DIExpression()), !dbg !21
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %0, i32* %n, align 4, !dbg !23
  store i32 0, i32* %sum, align 4, !dbg !21
  store i32 0, i32* %i, align 4, !dbg !19
  br label %do.loop, !dbg !24

do.loop:                                          ; preds = %do.loop, %entry
  %1 = load i32, i32* %i, align 4, !dbg !25
  %2 = load i32, i32* %sum, align 4, !dbg !25
  %3 = add i32 %2, %1, !dbg !25
  store i32 %3, i32* %sum, align 4, !dbg !25
  %4 = load i32, i32* %sum, align 4, !dbg !25
  %5 = load i32, i32* %i, align 4, !dbg !26
  %6 = add i32 %5, 1, !dbg !26
  store i32 %6, i32* %i, align 4, !dbg !26
  %7 = load i32, i32* %i, align 4, !dbg !26
  %8 = load i32, i32* %i, align 4, !dbg !26
  %9 = load i32, i32* %n, align 4, !dbg !26
  %10 = icmp sle i32 %8, %9, !dbg !26
  br i1 %10, label %do.loop, label %do.end, !dbg !26

do.end:                                           ; preds = %do.loop
  %11 = load i32, i32* %sum, align 4, !dbg !27
  ret i32 %11, !dbg !27
}

define i32 @main() !dbg !28 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %err, align 4, !dbg !32
  %0 = call i32 @countSum(i32 100), !dbg !33
  %1 = icmp ne i32 %0, 5050, !dbg !33
  br i1 %1, label %then, label %if.end, !dbg !33

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !34
  %2 = load i32, i32* %err, align 4, !dbg !34
  br label %if.end, !dbg !34

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !35
  %4 = icmp ne i32 %3, 5050, !dbg !35
  br i1 %4, label %then1, label %if.end3, !dbg !35

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !36
  %5 = load i32, i32* %err, align 4, !dbg !36
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum(i32 0), !dbg !37
  %7 = icmp ne i32 %6, 0, !dbg !37
  br i1 %7, label %then4, label %if.end6, !dbg !37

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !38
  %8 = load i32, i32* %err, align 4, !dbg !38
  br label %if.end6, !dbg !38

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !39
  %10 = icmp ne i32 %9, 0, !dbg !39
  br i1 %10, label %then7, label %if.end9, !dbg !39

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !40
  %11 = load i32, i32* %err, align 4, !dbg !40
  br label %if.end9, !dbg !40

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, i32* %err, align 4, !dbg !41
  %13 = icmp eq i32 %12, 0, !dbg !41
  %. = select i1 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !42
  %14 = call i32 (i8*, ...) @printf(i8* %.), !dbg !42
  %15 = load i32, i32* %err, align 4, !dbg !43
  ret i32 %15, !dbg !43
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
!14 = !DILocation(line: 7, column: 5, scope: !2)
!15 = !DILocation(line: 8, column: 5, scope: !2)
!16 = !DILocation(line: 10, column: 3, scope: !2)
!17 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!18 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 15, type: !5)
!19 = !DILocation(line: 15, column: 3, scope: !17)
!20 = !DILocalVariable(name: "sum", scope: !17, file: !1, line: 14, type: !5)
!21 = !DILocation(line: 14, column: 3, scope: !17)
!22 = !DILocalVariable(name: "n", arg: 1, scope: !17, file: !1, line: 13, type: !5)
!23 = !DILocation(line: 13, column: 5, scope: !17)
!24 = !DILocation(line: 16, column: 3, scope: !17)
!25 = !DILocation(line: 17, column: 5, scope: !17)
!26 = !DILocation(line: 18, column: 5, scope: !17)
!27 = !DILocation(line: 20, column: 3, scope: !17)
!28 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 23, type: !29, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!29 = !DISubroutineType(types: !30)
!30 = !{!5}
!31 = !DILocalVariable(name: "err", scope: !28, file: !1, line: 24, type: !5)
!32 = !DILocation(line: 24, column: 3, scope: !28)
!33 = !DILocation(line: 26, column: 3, scope: !28)
!34 = !DILocation(line: 26, column: 30, scope: !28)
!35 = !DILocation(line: 27, column: 3, scope: !28)
!36 = !DILocation(line: 27, column: 31, scope: !28)
!37 = !DILocation(line: 28, column: 3, scope: !28)
!38 = !DILocation(line: 28, column: 25, scope: !28)
!39 = !DILocation(line: 29, column: 3, scope: !28)
!40 = !DILocation(line: 29, column: 26, scope: !28)
!41 = !DILocation(line: 31, column: 3, scope: !28)
!42 = !DILocation(line: 0, scope: !28)
!43 = !DILocation(line: 36, column: 3, scope: !28)
