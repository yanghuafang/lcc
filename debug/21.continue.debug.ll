; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @countEvenNumber(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !7, metadata !DIExpression()), !dbg !8
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !9, metadata !DIExpression()), !dbg !10
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %0, i32* %n, align 4, !dbg !12
  store i32 0, i32* %count, align 4, !dbg !10
  store i32 1, i32* %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, i32* %i, align 4, !dbg !8
  %2 = load i32, i32* %n, align 4, !dbg !8
  %3 = icmp sle i32 %1, %2, !dbg !8
  br i1 %3, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !13
  %5 = srem i32 %4, 2, !dbg !13
  %6 = icmp ne i32 %5, 0, !dbg !13
  br i1 %6, label %for.update, label %if.end, !dbg !13

if.end:                                           ; preds = %for.loop
  %7 = load i32, i32* %count, align 4, !dbg !15
  %8 = add i32 %7, 1, !dbg !15
  store i32 %8, i32* %count, align 4, !dbg !15
  %9 = load i32, i32* %count, align 4, !dbg !15
  br label %for.update, !dbg !15

for.update:                                       ; preds = %for.loop, %if.end
  %10 = load i32, i32* %i, align 4, !dbg !15
  %11 = add i32 %10, 1, !dbg !15
  store i32 %11, i32* %i, align 4, !dbg !15
  %12 = load i32, i32* %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %count, align 4, !dbg !16
  ret i32 %13, !dbg !16
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @countEvenNumber2(i32 %0) !dbg !17 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !20, metadata !DIExpression()), !dbg !21
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %0, i32* %n, align 4, !dbg !23
  store i32 0, i32* %count, align 4, !dbg !21
  store i32 1, i32* %i, align 4, !dbg !19
  br label %while.cond, !dbg !24

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, i32* %i, align 4, !dbg !24
  %2 = load i32, i32* %n, align 4, !dbg !24
  %3 = icmp sle i32 %1, %2, !dbg !24
  br i1 %3, label %while.loop, label %while.end, !dbg !24

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4, !dbg !25
  %5 = srem i32 %4, 2, !dbg !25
  %6 = icmp ne i32 %5, 0, !dbg !25
  br i1 %6, label %then, label %if.end, !dbg !25

then:                                             ; preds = %while.loop
  %7 = load i32, i32* %i, align 4, !dbg !27
  %8 = add i32 %7, 1, !dbg !27
  store i32 %8, i32* %i, align 4, !dbg !27
  %9 = load i32, i32* %i, align 4, !dbg !27
  br label %while.cond, !dbg !29

if.end:                                           ; preds = %while.loop
  %10 = load i32, i32* %count, align 4, !dbg !30
  %11 = add i32 %10, 1, !dbg !30
  store i32 %11, i32* %count, align 4, !dbg !30
  %12 = load i32, i32* %count, align 4, !dbg !30
  %13 = load i32, i32* %i, align 4, !dbg !31
  %14 = add i32 %13, 1, !dbg !31
  store i32 %14, i32* %i, align 4, !dbg !31
  %15 = load i32, i32* %i, align 4, !dbg !31
  br label %while.cond, !dbg !31

while.end:                                        ; preds = %while.cond
  %16 = load i32, i32* %count, align 4, !dbg !32
  ret i32 %16, !dbg !32
}

define i32 @countEvenNumber3(i32 %0) !dbg !33 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !36, metadata !DIExpression()), !dbg !37
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 %0, i32* %n, align 4, !dbg !39
  store i32 0, i32* %count, align 4, !dbg !37
  store i32 1, i32* %i, align 4, !dbg !35
  br label %do.loop, !dbg !40

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %i, align 4, !dbg !41
  %2 = srem i32 %1, 2, !dbg !41
  %3 = icmp ne i32 %2, 0, !dbg !41
  br i1 %3, label %then, label %if.end, !dbg !41

then:                                             ; preds = %do.loop
  %4 = load i32, i32* %i, align 4, !dbg !43
  %5 = add i32 %4, 1, !dbg !43
  store i32 %5, i32* %i, align 4, !dbg !43
  %6 = load i32, i32* %i, align 4, !dbg !43
  br label %do.cond, !dbg !45

if.end:                                           ; preds = %do.loop
  %7 = load i32, i32* %count, align 4, !dbg !46
  %8 = add i32 %7, 1, !dbg !46
  store i32 %8, i32* %count, align 4, !dbg !46
  %9 = load i32, i32* %count, align 4, !dbg !46
  %10 = load i32, i32* %i, align 4, !dbg !47
  %11 = add i32 %10, 1, !dbg !47
  store i32 %11, i32* %i, align 4, !dbg !47
  %12 = load i32, i32* %i, align 4, !dbg !47
  br label %do.cond, !dbg !47

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, i32* %i, align 4, !dbg !47
  %14 = load i32, i32* %n, align 4, !dbg !47
  %15 = icmp sle i32 %13, %14, !dbg !47
  br i1 %15, label %do.loop, label %do.end, !dbg !47

do.end:                                           ; preds = %do.cond
  %16 = load i32, i32* %count, align 4, !dbg !48
  ret i32 %16, !dbg !48
}

define i32 @main() !dbg !49 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 0, i32* %err, align 4, !dbg !53
  %0 = call i32 @countEvenNumber(i32 32), !dbg !54
  %1 = icmp ne i32 %0, 16, !dbg !54
  br i1 %1, label %then, label %if.end, !dbg !54

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !55
  %2 = load i32, i32* %err, align 4, !dbg !55
  br label %if.end, !dbg !55

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !56
  %4 = icmp ne i32 %3, 16, !dbg !56
  br i1 %4, label %then1, label %if.end3, !dbg !56

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !57
  %5 = load i32, i32* %err, align 4, !dbg !57
  br label %if.end3, !dbg !57

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !58
  %7 = icmp ne i32 %6, 16, !dbg !58
  br i1 %7, label %then4, label %if.end6, !dbg !58

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !59
  %8 = load i32, i32* %err, align 4, !dbg !59
  br label %if.end6, !dbg !59

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !60
  %10 = icmp ne i32 %9, 0, !dbg !60
  br i1 %10, label %then7, label %if.end9, !dbg !60

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !61
  %11 = load i32, i32* %err, align 4, !dbg !61
  br label %if.end9, !dbg !61

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !62
  %13 = icmp ne i32 %12, 0, !dbg !62
  br i1 %13, label %then10, label %if.end12, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !63
  %14 = load i32, i32* %err, align 4, !dbg !63
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !64
  %16 = icmp eq i32 %15, 0, !dbg !64
  %. = select i1 %16, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !65
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !65
  %18 = load i32, i32* %err, align 4, !dbg !66
  ret i32 %18, !dbg !66
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "21.continue.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countEvenNumber", linkageName: "countEvenNumber", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocalVariable(name: "count", scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!12 = !DILocation(line: 3, column: 5, scope: !2)
!13 = !DILocation(line: 6, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 35)
!15 = !DILocation(line: 9, column: 5, scope: !14)
!16 = !DILocation(line: 11, column: 3, scope: !2)
!17 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !1, line: 14, type: !3, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!18 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 16, type: !5)
!19 = !DILocation(line: 16, column: 3, scope: !17)
!20 = !DILocalVariable(name: "count", scope: !17, file: !1, line: 15, type: !5)
!21 = !DILocation(line: 15, column: 3, scope: !17)
!22 = !DILocalVariable(name: "n", arg: 1, scope: !17, file: !1, line: 14, type: !5)
!23 = !DILocation(line: 14, column: 5, scope: !17)
!24 = !DILocation(line: 17, column: 3, scope: !17)
!25 = !DILocation(line: 18, column: 5, scope: !26)
!26 = distinct !DILexicalBlock(scope: !17, file: !1, line: 17, column: 18)
!27 = !DILocation(line: 19, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !26, file: !1, line: 18, column: 21)
!29 = !DILocation(line: 20, column: 7, scope: !28)
!30 = !DILocation(line: 22, column: 5, scope: !26)
!31 = !DILocation(line: 23, column: 5, scope: !26)
!32 = !DILocation(line: 25, column: 3, scope: !17)
!33 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !1, line: 28, type: !3, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!34 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 30, type: !5)
!35 = !DILocation(line: 30, column: 3, scope: !33)
!36 = !DILocalVariable(name: "count", scope: !33, file: !1, line: 29, type: !5)
!37 = !DILocation(line: 29, column: 3, scope: !33)
!38 = !DILocalVariable(name: "n", arg: 1, scope: !33, file: !1, line: 28, type: !5)
!39 = !DILocation(line: 28, column: 5, scope: !33)
!40 = !DILocation(line: 31, column: 3, scope: !33)
!41 = !DILocation(line: 32, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !1, line: 31, column: 6)
!43 = !DILocation(line: 33, column: 7, scope: !44)
!44 = distinct !DILexicalBlock(scope: !42, file: !1, line: 32, column: 21)
!45 = !DILocation(line: 34, column: 7, scope: !44)
!46 = !DILocation(line: 36, column: 5, scope: !42)
!47 = !DILocation(line: 37, column: 5, scope: !42)
!48 = !DILocation(line: 39, column: 3, scope: !33)
!49 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 42, type: !50, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!50 = !DISubroutineType(types: !51)
!51 = !{!5}
!52 = !DILocalVariable(name: "err", scope: !49, file: !1, line: 43, type: !5)
!53 = !DILocation(line: 43, column: 3, scope: !49)
!54 = !DILocation(line: 45, column: 3, scope: !49)
!55 = !DILocation(line: 45, column: 34, scope: !49)
!56 = !DILocation(line: 46, column: 3, scope: !49)
!57 = !DILocation(line: 46, column: 35, scope: !49)
!58 = !DILocation(line: 47, column: 3, scope: !49)
!59 = !DILocation(line: 47, column: 35, scope: !49)
!60 = !DILocation(line: 48, column: 3, scope: !49)
!61 = !DILocation(line: 48, column: 32, scope: !49)
!62 = !DILocation(line: 49, column: 3, scope: !49)
!63 = !DILocation(line: 49, column: 32, scope: !49)
!64 = !DILocation(line: 51, column: 3, scope: !49)
!65 = !DILocation(line: 0, scope: !49)
!66 = !DILocation(line: 56, column: 3, scope: !49)
