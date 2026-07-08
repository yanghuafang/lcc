; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !11, !DIExpression(), !12)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !13, !DIExpression(), !14)
  store i32 %0, ptr %n, align 4, !dbg !14
  store i32 0, ptr %sum, align 4, !dbg !12
  store i32 1, ptr %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !10
  %2 = load i32, ptr %n, align 4, !dbg !10
  %3 = icmp sle i32 %1, %2, !dbg !10
  br i1 %3, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = load i32, ptr %sum, align 4, !dbg !15
  %6 = add i32 %5, %4, !dbg !15
  store i32 %6, ptr %sum, align 4, !dbg !15
  %7 = load i32, ptr %sum, align 4, !dbg !15
  %8 = load i32, ptr %i, align 4, !dbg !15
  %9 = add i32 %8, 1, !dbg !15
  store i32 %9, ptr %i, align 4, !dbg !15
  %10 = load i32, ptr %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !17
  ret i32 %11, !dbg !17
}

define i32 @countSum2(i32 %0) !dbg !18 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !19, !DIExpression(), !20)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !21, !DIExpression(), !22)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !23, !DIExpression(), !24)
  store i32 %0, ptr %n, align 4, !dbg !24
  store i32 0, ptr %sum, align 4, !dbg !22
  store i32 1, ptr %i, align 4, !dbg !20
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !25
  %2 = load i32, ptr %n, align 4, !dbg !25
  %3 = icmp sle i32 %1, %2, !dbg !25
  br i1 %3, label %for.loop, label %for.end, !dbg !25

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !26
  %5 = load i32, ptr %sum, align 4, !dbg !26
  %6 = add i32 %5, %4, !dbg !26
  store i32 %6, ptr %sum, align 4, !dbg !26
  %7 = load i32, ptr %sum, align 4, !dbg !26
  %8 = load i32, ptr %i, align 4, !dbg !26
  %9 = add i32 %8, 1, !dbg !26
  store i32 %9, ptr %i, align 4, !dbg !26
  %10 = load i32, ptr %i, align 4, !dbg !26
  br label %for.cond, !dbg !26

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !28
  ret i32 %11, !dbg !28
}

define i32 @countSum3(i32 %0) !dbg !29 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !30, !DIExpression(), !31)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !32, !DIExpression(), !33)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !34, !DIExpression(), !35)
  store i32 %0, ptr %n, align 4, !dbg !35
  store i32 0, ptr %sum, align 4, !dbg !33
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.loop, %entry
  %.sink = phi i32 [ %10, %for.loop ], [ 1, %entry ]
  store i32 %.sink, ptr %i, align 4, !dbg !37
  %1 = load i32, ptr %i, align 4, !dbg !37
  %2 = load i32, ptr %i, align 4, !dbg !36
  %3 = load i32, ptr %n, align 4, !dbg !36
  %4 = icmp sle i32 %2, %3, !dbg !36
  br i1 %4, label %for.loop, label %for.end, !dbg !36

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !38
  %6 = load i32, ptr %sum, align 4, !dbg !38
  %7 = add i32 %6, %5, !dbg !38
  store i32 %7, ptr %sum, align 4, !dbg !38
  %8 = load i32, ptr %sum, align 4, !dbg !38
  %9 = load i32, ptr %i, align 4, !dbg !38
  %10 = add i32 %9, 1, !dbg !38
  br label %for.cond, !dbg !38

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !40
  ret i32 %11, !dbg !40
}

define i32 @main() !dbg !41 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !44, !DIExpression(), !45)
  store i32 0, ptr %err, align 4, !dbg !45
  %0 = call i32 @countSum(i32 100), !dbg !46
  %1 = icmp ne i32 %0, 5050, !dbg !46
  br i1 %1, label %then, label %if.end, !dbg !46

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !47
  %2 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end, !dbg !47

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !48
  %4 = icmp ne i32 %3, 5050, !dbg !48
  br i1 %4, label %then1, label %if.end3, !dbg !48

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !49
  %5 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end3, !dbg !49

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !50
  %7 = icmp ne i32 %6, 5050, !dbg !50
  br i1 %7, label %then4, label %if.end6, !dbg !50

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !51
  %8 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end6, !dbg !51

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum(i32 0), !dbg !52
  %10 = icmp ne i32 %9, 0, !dbg !52
  br i1 %10, label %then7, label %if.end9, !dbg !52

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !53
  %11 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end9, !dbg !53

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countSum(i32 1), !dbg !54
  %13 = icmp ne i32 %12, 1, !dbg !54
  br i1 %13, label %then10, label %if.end12, !dbg !54

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !55
  %14 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end12, !dbg !55

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, ptr %err, align 4, !dbg !56
  %16 = icmp eq i32 %15, 0, !dbg !56
  %. = select i1 %16, ptr @0, ptr @1, !dbg !57
  %17 = call i32 (ptr, ...) @printf(ptr %.), !dbg !57
  %18 = load i32, ptr %err, align 4, !dbg !58
  ret i32 %18, !dbg !58
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 8, scope: !4)
!11 = !DILocalVariable(name: "sum", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!14 = !DILocation(line: 3, column: 5, scope: !4)
!15 = !DILocation(line: 6, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 35)
!17 = !DILocation(line: 8, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !5, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!19 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 13, type: !7)
!20 = !DILocation(line: 13, column: 3, scope: !18)
!21 = !DILocalVariable(name: "sum", scope: !18, file: !1, line: 12, type: !7)
!22 = !DILocation(line: 12, column: 3, scope: !18)
!23 = !DILocalVariable(name: "n", arg: 1, scope: !18, file: !1, line: 11, type: !7)
!24 = !DILocation(line: 11, column: 5, scope: !18)
!25 = !DILocation(line: 14, column: 3, scope: !18)
!26 = !DILocation(line: 15, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 26)
!28 = !DILocation(line: 17, column: 3, scope: !18)
!29 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !1, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!30 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 22, type: !7)
!31 = !DILocation(line: 22, column: 3, scope: !29)
!32 = !DILocalVariable(name: "sum", scope: !29, file: !1, line: 21, type: !7)
!33 = !DILocation(line: 21, column: 3, scope: !29)
!34 = !DILocalVariable(name: "n", arg: 1, scope: !29, file: !1, line: 20, type: !7)
!35 = !DILocation(line: 20, column: 5, scope: !29)
!36 = !DILocation(line: 23, column: 3, scope: !29)
!37 = !DILocation(line: 0, scope: !29)
!38 = !DILocation(line: 24, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !1, line: 23, column: 31)
!40 = !DILocation(line: 26, column: 3, scope: !29)
!41 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !42, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!42 = !DISubroutineType(types: !43)
!43 = !{!7}
!44 = !DILocalVariable(name: "err", scope: !41, file: !1, line: 30, type: !7)
!45 = !DILocation(line: 30, column: 3, scope: !41)
!46 = !DILocation(line: 32, column: 3, scope: !41)
!47 = !DILocation(line: 32, column: 30, scope: !41)
!48 = !DILocation(line: 33, column: 3, scope: !41)
!49 = !DILocation(line: 33, column: 31, scope: !41)
!50 = !DILocation(line: 34, column: 3, scope: !41)
!51 = !DILocation(line: 34, column: 31, scope: !41)
!52 = !DILocation(line: 35, column: 3, scope: !41)
!53 = !DILocation(line: 35, column: 25, scope: !41)
!54 = !DILocation(line: 36, column: 3, scope: !41)
!55 = !DILocation(line: 36, column: 25, scope: !41)
!56 = !DILocation(line: 38, column: 3, scope: !41)
!57 = !DILocation(line: 0, scope: !41)
!58 = !DILocation(line: 43, column: 3, scope: !41)
