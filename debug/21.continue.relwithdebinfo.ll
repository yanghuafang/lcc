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
  %7 = load i32, i32* %count, align 4, !dbg !14
  %8 = add i32 %7, 1, !dbg !14
  store i32 %8, i32* %count, align 4, !dbg !14
  %9 = load i32, i32* %count, align 4, !dbg !14
  br label %for.update, !dbg !14

for.update:                                       ; preds = %for.loop, %if.end
  %10 = load i32, i32* %i, align 4, !dbg !14
  %11 = add i32 %10, 1, !dbg !14
  store i32 %11, i32* %i, align 4, !dbg !14
  %12 = load i32, i32* %i, align 4, !dbg !14
  br label %for.cond, !dbg !14

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %count, align 4, !dbg !15
  ret i32 %13, !dbg !15
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @countEvenNumber2(i32 %0) !dbg !16 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !19, metadata !DIExpression()), !dbg !20
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 %0, i32* %n, align 4, !dbg !22
  store i32 0, i32* %count, align 4, !dbg !20
  store i32 1, i32* %i, align 4, !dbg !18
  br label %while.cond, !dbg !23

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, i32* %i, align 4, !dbg !23
  %2 = load i32, i32* %n, align 4, !dbg !23
  %3 = icmp sle i32 %1, %2, !dbg !23
  br i1 %3, label %while.loop, label %while.end, !dbg !23

while.loop:                                       ; preds = %while.cond
  %4 = load i32, i32* %i, align 4, !dbg !24
  %5 = srem i32 %4, 2, !dbg !24
  %6 = icmp ne i32 %5, 0, !dbg !24
  br i1 %6, label %then, label %if.end, !dbg !24

then:                                             ; preds = %while.loop
  %7 = load i32, i32* %i, align 4, !dbg !25
  %8 = add i32 %7, 1, !dbg !25
  store i32 %8, i32* %i, align 4, !dbg !25
  %9 = load i32, i32* %i, align 4, !dbg !25
  br label %while.cond, !dbg !26

if.end:                                           ; preds = %while.loop
  %10 = load i32, i32* %count, align 4, !dbg !27
  %11 = add i32 %10, 1, !dbg !27
  store i32 %11, i32* %count, align 4, !dbg !27
  %12 = load i32, i32* %count, align 4, !dbg !27
  %13 = load i32, i32* %i, align 4, !dbg !28
  %14 = add i32 %13, 1, !dbg !28
  store i32 %14, i32* %i, align 4, !dbg !28
  %15 = load i32, i32* %i, align 4, !dbg !28
  br label %while.cond, !dbg !28

while.end:                                        ; preds = %while.cond
  %16 = load i32, i32* %count, align 4, !dbg !29
  ret i32 %16, !dbg !29
}

define i32 @countEvenNumber3(i32 %0) !dbg !30 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !32
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !33, metadata !DIExpression()), !dbg !34
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %0, i32* %n, align 4, !dbg !36
  store i32 0, i32* %count, align 4, !dbg !34
  store i32 1, i32* %i, align 4, !dbg !32
  br label %do.loop, !dbg !37

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %i, align 4, !dbg !38
  %2 = srem i32 %1, 2, !dbg !38
  %3 = icmp ne i32 %2, 0, !dbg !38
  br i1 %3, label %then, label %if.end, !dbg !38

then:                                             ; preds = %do.loop
  %4 = load i32, i32* %i, align 4, !dbg !39
  %5 = add i32 %4, 1, !dbg !39
  store i32 %5, i32* %i, align 4, !dbg !39
  %6 = load i32, i32* %i, align 4, !dbg !39
  br label %do.cond, !dbg !40

if.end:                                           ; preds = %do.loop
  %7 = load i32, i32* %count, align 4, !dbg !41
  %8 = add i32 %7, 1, !dbg !41
  store i32 %8, i32* %count, align 4, !dbg !41
  %9 = load i32, i32* %count, align 4, !dbg !41
  %10 = load i32, i32* %i, align 4, !dbg !42
  %11 = add i32 %10, 1, !dbg !42
  store i32 %11, i32* %i, align 4, !dbg !42
  %12 = load i32, i32* %i, align 4, !dbg !42
  br label %do.cond, !dbg !42

do.cond:                                          ; preds = %if.end, %then
  %13 = load i32, i32* %i, align 4, !dbg !42
  %14 = load i32, i32* %n, align 4, !dbg !42
  %15 = icmp sle i32 %13, %14, !dbg !42
  br i1 %15, label %do.loop, label %do.end, !dbg !42

do.end:                                           ; preds = %do.cond
  %16 = load i32, i32* %count, align 4, !dbg !43
  ret i32 %16, !dbg !43
}

define i32 @main() !dbg !44 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 0, i32* %err, align 4, !dbg !48
  %0 = call i32 @countEvenNumber(i32 32), !dbg !49
  %1 = icmp ne i32 %0, 16, !dbg !49
  br i1 %1, label %then, label %if.end, !dbg !49

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !50
  %2 = load i32, i32* %err, align 4, !dbg !50
  br label %if.end, !dbg !50

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !51
  %4 = icmp ne i32 %3, 16, !dbg !51
  br i1 %4, label %then1, label %if.end3, !dbg !51

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !52
  %5 = load i32, i32* %err, align 4, !dbg !52
  br label %if.end3, !dbg !52

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !53
  %7 = icmp ne i32 %6, 16, !dbg !53
  br i1 %7, label %then4, label %if.end6, !dbg !53

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !54
  %8 = load i32, i32* %err, align 4, !dbg !54
  br label %if.end6, !dbg !54

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !55
  %10 = icmp ne i32 %9, 0, !dbg !55
  br i1 %10, label %then7, label %if.end9, !dbg !55

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !56
  %11 = load i32, i32* %err, align 4, !dbg !56
  br label %if.end9, !dbg !56

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !57
  %13 = icmp ne i32 %12, 0, !dbg !57
  br i1 %13, label %then10, label %if.end12, !dbg !57

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !58
  %14 = load i32, i32* %err, align 4, !dbg !58
  br label %if.end12, !dbg !58

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !59
  %16 = icmp eq i32 %15, 0, !dbg !59
  %. = select i1 %16, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @1, i32 0, i32 0), !dbg !60
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !60
  %18 = load i32, i32* %err, align 4, !dbg !61
  ret i32 %18, !dbg !61
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
!13 = !DILocation(line: 6, column: 5, scope: !2)
!14 = !DILocation(line: 9, column: 5, scope: !2)
!15 = !DILocation(line: 11, column: 3, scope: !2)
!16 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !1, line: 14, type: !3, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!17 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 16, type: !5)
!18 = !DILocation(line: 16, column: 3, scope: !16)
!19 = !DILocalVariable(name: "count", scope: !16, file: !1, line: 15, type: !5)
!20 = !DILocation(line: 15, column: 3, scope: !16)
!21 = !DILocalVariable(name: "n", arg: 1, scope: !16, file: !1, line: 14, type: !5)
!22 = !DILocation(line: 14, column: 5, scope: !16)
!23 = !DILocation(line: 17, column: 3, scope: !16)
!24 = !DILocation(line: 18, column: 5, scope: !16)
!25 = !DILocation(line: 19, column: 7, scope: !16)
!26 = !DILocation(line: 20, column: 7, scope: !16)
!27 = !DILocation(line: 22, column: 5, scope: !16)
!28 = !DILocation(line: 23, column: 5, scope: !16)
!29 = !DILocation(line: 25, column: 3, scope: !16)
!30 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !1, line: 28, type: !3, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!31 = !DILocalVariable(name: "i", scope: !30, file: !1, line: 30, type: !5)
!32 = !DILocation(line: 30, column: 3, scope: !30)
!33 = !DILocalVariable(name: "count", scope: !30, file: !1, line: 29, type: !5)
!34 = !DILocation(line: 29, column: 3, scope: !30)
!35 = !DILocalVariable(name: "n", arg: 1, scope: !30, file: !1, line: 28, type: !5)
!36 = !DILocation(line: 28, column: 5, scope: !30)
!37 = !DILocation(line: 31, column: 3, scope: !30)
!38 = !DILocation(line: 32, column: 5, scope: !30)
!39 = !DILocation(line: 33, column: 7, scope: !30)
!40 = !DILocation(line: 34, column: 7, scope: !30)
!41 = !DILocation(line: 36, column: 5, scope: !30)
!42 = !DILocation(line: 37, column: 5, scope: !30)
!43 = !DILocation(line: 39, column: 3, scope: !30)
!44 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 42, type: !45, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!45 = !DISubroutineType(types: !46)
!46 = !{!5}
!47 = !DILocalVariable(name: "err", scope: !44, file: !1, line: 43, type: !5)
!48 = !DILocation(line: 43, column: 3, scope: !44)
!49 = !DILocation(line: 45, column: 3, scope: !44)
!50 = !DILocation(line: 45, column: 34, scope: !44)
!51 = !DILocation(line: 46, column: 3, scope: !44)
!52 = !DILocation(line: 46, column: 35, scope: !44)
!53 = !DILocation(line: 47, column: 3, scope: !44)
!54 = !DILocation(line: 47, column: 35, scope: !44)
!55 = !DILocation(line: 48, column: 3, scope: !44)
!56 = !DILocation(line: 48, column: 32, scope: !44)
!57 = !DILocation(line: 49, column: 3, scope: !44)
!58 = !DILocation(line: 49, column: 32, scope: !44)
!59 = !DILocation(line: 51, column: 3, scope: !44)
!60 = !DILocation(line: 0, scope: !44)
!61 = !DILocation(line: 56, column: 3, scope: !44)
