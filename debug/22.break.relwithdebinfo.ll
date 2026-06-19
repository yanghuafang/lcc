; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [17 x i8] c"22.break.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [17 x i8] c"22.break.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countNumber(i32 %0, i32 %1) !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !7, metadata !DIExpression()), !dbg !8
  %recordi = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %recordi, metadata !9, metadata !DIExpression()), !dbg !10
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !11, metadata !DIExpression()), !dbg !12
  %smallRange = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %smallRange, metadata !13, metadata !DIExpression()), !dbg !14
  %maxRange = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %maxRange, metadata !15, metadata !DIExpression()), !dbg !14
  store i32 %0, i32* %maxRange, align 4, !dbg !14
  store i32 %1, i32* %smallRange, align 4, !dbg !14
  store i32 0, i32* %count, align 4, !dbg !12
  store i32 0, i32* %recordi, align 4, !dbg !10
  store i32 1, i32* %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4, !dbg !8
  %3 = load i32, i32* %maxRange, align 4, !dbg !8
  %4 = icmp sle i32 %2, %3, !dbg !8
  br i1 %4, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !16
  %6 = load i32, i32* %smallRange, align 4, !dbg !16
  %7 = icmp sgt i32 %5, %6, !dbg !16
  br i1 %7, label %then, label %if.end, !dbg !16

then:                                             ; preds = %for.loop
  %8 = load i32, i32* %i, align 4, !dbg !17
  store i32 %8, i32* %recordi, align 4, !dbg !17
  %9 = load i32, i32* %recordi, align 4, !dbg !17
  br label %for.end, !dbg !18

if.end:                                           ; preds = %for.loop
  %10 = load i32, i32* %count, align 4, !dbg !19
  %11 = add i32 %10, 1, !dbg !19
  store i32 %11, i32* %count, align 4, !dbg !19
  %12 = load i32, i32* %count, align 4, !dbg !19
  %13 = load i32, i32* %i, align 4, !dbg !19
  %14 = add i32 %13, 1, !dbg !19
  store i32 %14, i32* %i, align 4, !dbg !19
  %15 = load i32, i32* %i, align 4, !dbg !19
  br label %for.cond, !dbg !19

for.end:                                          ; preds = %for.cond, %then
  %16 = load i32, i32* %count, align 4, !dbg !20
  ret i32 %16, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @main() !dbg !21 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %err, align 4, !dbg !25
  %0 = call i32 @countNumber(i32 100, i32 37), !dbg !26
  %1 = icmp ne i32 %0, 37, !dbg !26
  br i1 %1, label %then, label %if.end, !dbg !26

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !27
  %2 = load i32, i32* %err, align 4, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countNumber(i32 10, i32 10), !dbg !28
  %4 = icmp ne i32 %3, 10, !dbg !28
  br i1 %4, label %then1, label %if.end3, !dbg !28

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !29
  %5 = load i32, i32* %err, align 4, !dbg !29
  br label %if.end3, !dbg !29

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countNumber(i32 5, i32 0), !dbg !30
  %7 = icmp ne i32 %6, 0, !dbg !30
  br i1 %7, label %then4, label %if.end6, !dbg !30

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !31
  %8 = load i32, i32* %err, align 4, !dbg !31
  br label %if.end6, !dbg !31

if.end6:                                          ; preds = %if.end3, %then4
  %9 = load i32, i32* %err, align 4, !dbg !32
  %10 = icmp eq i32 %9, 0, !dbg !32
  %. = select i1 %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @1, i32 0, i32 0), !dbg !33
  %11 = call i32 (i8*, ...) @printf(i8* %.), !dbg !33
  %12 = load i32, i32* %err, align 4, !dbg !34
  ret i32 %12, !dbg !34
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "22.break.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countNumber", linkageName: "countNumber", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 6, type: !5)
!8 = !DILocation(line: 6, column: 8, scope: !2)
!9 = !DILocalVariable(name: "recordi", scope: !2, file: !1, line: 5, type: !5)
!10 = !DILocation(line: 5, column: 3, scope: !2)
!11 = !DILocalVariable(name: "count", scope: !2, file: !1, line: 4, type: !5)
!12 = !DILocation(line: 4, column: 3, scope: !2)
!13 = !DILocalVariable(name: "smallRange", arg: 2, scope: !2, file: !1, line: 3, type: !5)
!14 = !DILocation(line: 3, column: 5, scope: !2)
!15 = !DILocalVariable(name: "maxRange", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!16 = !DILocation(line: 7, column: 5, scope: !2)
!17 = !DILocation(line: 8, column: 7, scope: !2)
!18 = !DILocation(line: 9, column: 7, scope: !2)
!19 = !DILocation(line: 11, column: 5, scope: !2)
!20 = !DILocation(line: 13, column: 3, scope: !2)
!21 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 16, type: !22, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!22 = !DISubroutineType(types: !23)
!23 = !{!5}
!24 = !DILocalVariable(name: "err", scope: !21, file: !1, line: 17, type: !5)
!25 = !DILocation(line: 17, column: 3, scope: !21)
!26 = !DILocation(line: 19, column: 3, scope: !21)
!27 = !DILocation(line: 19, column: 35, scope: !21)
!28 = !DILocation(line: 20, column: 3, scope: !21)
!29 = !DILocation(line: 20, column: 34, scope: !21)
!30 = !DILocation(line: 21, column: 3, scope: !21)
!31 = !DILocation(line: 21, column: 31, scope: !21)
!32 = !DILocation(line: 23, column: 3, scope: !21)
!33 = !DILocation(line: 0, scope: !21)
!34 = !DILocation(line: 28, column: 3, scope: !21)
