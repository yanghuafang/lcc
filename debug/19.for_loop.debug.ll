; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !7, !DIExpression(), !8)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !9, !DIExpression(), !10)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !11, !DIExpression(), !12)
  store i32 %0, ptr %n, align 4, !dbg !12
  store i32 0, ptr %sum, align 4, !dbg !10
  store i32 1, ptr %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !8
  %2 = load i32, ptr %n, align 4, !dbg !8
  %3 = icmp sle i32 %1, %2, !dbg !8
  br i1 %3, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !13
  %5 = load i32, ptr %sum, align 4, !dbg !13
  %6 = add i32 %5, %4, !dbg !13
  store i32 %6, ptr %sum, align 4, !dbg !13
  %7 = load i32, ptr %sum, align 4, !dbg !13
  %8 = load i32, ptr %i, align 4, !dbg !13
  %9 = add i32 %8, 1, !dbg !13
  store i32 %9, ptr %i, align 4, !dbg !13
  %10 = load i32, ptr %i, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !15
  ret i32 %11, !dbg !15
}

define i32 @countSum2(i32 %0) !dbg !16 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !17, !DIExpression(), !18)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !19, !DIExpression(), !20)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !21, !DIExpression(), !22)
  store i32 %0, ptr %n, align 4, !dbg !22
  store i32 0, ptr %sum, align 4, !dbg !20
  store i32 1, ptr %i, align 4, !dbg !18
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !23
  %2 = load i32, ptr %n, align 4, !dbg !23
  %3 = icmp sle i32 %1, %2, !dbg !23
  br i1 %3, label %for.loop, label %for.end, !dbg !23

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !24
  %5 = load i32, ptr %sum, align 4, !dbg !24
  %6 = add i32 %5, %4, !dbg !24
  store i32 %6, ptr %sum, align 4, !dbg !24
  %7 = load i32, ptr %sum, align 4, !dbg !24
  %8 = load i32, ptr %i, align 4, !dbg !24
  %9 = add i32 %8, 1, !dbg !24
  store i32 %9, ptr %i, align 4, !dbg !24
  %10 = load i32, ptr %i, align 4, !dbg !24
  br label %for.cond, !dbg !24

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !26
  ret i32 %11, !dbg !26
}

define i32 @countSum3(i32 %0) !dbg !27 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !28, !DIExpression(), !29)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !30, !DIExpression(), !31)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !32, !DIExpression(), !33)
  store i32 %0, ptr %n, align 4, !dbg !33
  store i32 0, ptr %sum, align 4, !dbg !31
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.loop, %entry
  %.sink = phi i32 [ %10, %for.loop ], [ 1, %entry ]
  store i32 %.sink, ptr %i, align 4, !dbg !35
  %1 = load i32, ptr %i, align 4, !dbg !35
  %2 = load i32, ptr %i, align 4, !dbg !34
  %3 = load i32, ptr %n, align 4, !dbg !34
  %4 = icmp sle i32 %2, %3, !dbg !34
  br i1 %4, label %for.loop, label %for.end, !dbg !34

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !36
  %6 = load i32, ptr %sum, align 4, !dbg !36
  %7 = add i32 %6, %5, !dbg !36
  store i32 %7, ptr %sum, align 4, !dbg !36
  %8 = load i32, ptr %sum, align 4, !dbg !36
  %9 = load i32, ptr %i, align 4, !dbg !36
  %10 = add i32 %9, 1, !dbg !36
  br label %for.cond, !dbg !36

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !38
  ret i32 %11, !dbg !38
}

define i32 @main() !dbg !39 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !42, !DIExpression(), !43)
  store i32 0, ptr %err, align 4, !dbg !43
  %0 = call i32 @countSum(i32 100), !dbg !44
  %1 = icmp ne i32 %0, 5050, !dbg !44
  br i1 %1, label %then, label %if.end, !dbg !44

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !45
  %2 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end, !dbg !45

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !46
  %4 = icmp ne i32 %3, 5050, !dbg !46
  br i1 %4, label %then1, label %if.end3, !dbg !46

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !47
  %5 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !48
  %7 = icmp ne i32 %6, 5050, !dbg !48
  br i1 %7, label %then4, label %if.end6, !dbg !48

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !49
  %8 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end6, !dbg !49

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum(i32 0), !dbg !50
  %10 = icmp ne i32 %9, 0, !dbg !50
  br i1 %10, label %then7, label %if.end9, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !51
  %11 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countSum(i32 1), !dbg !52
  %13 = icmp ne i32 %12, 1, !dbg !52
  br i1 %13, label %then10, label %if.end12, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !53
  %14 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, ptr %err, align 4, !dbg !54
  %16 = icmp eq i32 %15, 0, !dbg !54
  %. = select i1 %16, ptr @0, ptr @1, !dbg !55
  %17 = call i32 (ptr, ...) @printf(ptr %.), !dbg !55
  %18 = load i32, ptr %err, align 4, !dbg !56
  ret i32 %18, !dbg !56
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!12 = !DILocation(line: 3, column: 5, scope: !2)
!13 = !DILocation(line: 6, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 35)
!15 = !DILocation(line: 8, column: 3, scope: !2)
!16 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!17 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 13, type: !5)
!18 = !DILocation(line: 13, column: 3, scope: !16)
!19 = !DILocalVariable(name: "sum", scope: !16, file: !1, line: 12, type: !5)
!20 = !DILocation(line: 12, column: 3, scope: !16)
!21 = !DILocalVariable(name: "n", arg: 1, scope: !16, file: !1, line: 11, type: !5)
!22 = !DILocation(line: 11, column: 5, scope: !16)
!23 = !DILocation(line: 14, column: 3, scope: !16)
!24 = !DILocation(line: 15, column: 5, scope: !25)
!25 = distinct !DILexicalBlock(scope: !16, file: !1, line: 14, column: 26)
!26 = !DILocation(line: 17, column: 3, scope: !16)
!27 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !1, line: 20, type: !3, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!28 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 22, type: !5)
!29 = !DILocation(line: 22, column: 3, scope: !27)
!30 = !DILocalVariable(name: "sum", scope: !27, file: !1, line: 21, type: !5)
!31 = !DILocation(line: 21, column: 3, scope: !27)
!32 = !DILocalVariable(name: "n", arg: 1, scope: !27, file: !1, line: 20, type: !5)
!33 = !DILocation(line: 20, column: 5, scope: !27)
!34 = !DILocation(line: 23, column: 3, scope: !27)
!35 = !DILocation(line: 0, scope: !27)
!36 = !DILocation(line: 24, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !27, file: !1, line: 23, column: 31)
!38 = !DILocation(line: 26, column: 3, scope: !27)
!39 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !40, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!40 = !DISubroutineType(types: !41)
!41 = !{!5}
!42 = !DILocalVariable(name: "err", scope: !39, file: !1, line: 30, type: !5)
!43 = !DILocation(line: 30, column: 3, scope: !39)
!44 = !DILocation(line: 32, column: 3, scope: !39)
!45 = !DILocation(line: 32, column: 30, scope: !39)
!46 = !DILocation(line: 33, column: 3, scope: !39)
!47 = !DILocation(line: 33, column: 31, scope: !39)
!48 = !DILocation(line: 34, column: 3, scope: !39)
!49 = !DILocation(line: 34, column: 31, scope: !39)
!50 = !DILocation(line: 35, column: 3, scope: !39)
!51 = !DILocation(line: 35, column: 25, scope: !39)
!52 = !DILocation(line: 36, column: 3, scope: !39)
!53 = !DILocation(line: 36, column: 25, scope: !39)
!54 = !DILocation(line: 38, column: 3, scope: !39)
!55 = !DILocation(line: 0, scope: !39)
!56 = !DILocation(line: 43, column: 3, scope: !39)
