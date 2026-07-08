; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

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
  br label %while.cond, !dbg !15

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !15
  %2 = load i32, ptr %n, align 4, !dbg !15
  %3 = icmp sle i32 %1, %2, !dbg !15
  br i1 %3, label %while.loop, label %while.end, !dbg !15

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !16
  %5 = load i32, ptr %sum, align 4, !dbg !16
  %6 = add i32 %5, %4, !dbg !16
  store i32 %6, ptr %sum, align 4, !dbg !16
  %7 = load i32, ptr %sum, align 4, !dbg !16
  %8 = load i32, ptr %i, align 4, !dbg !18
  %9 = add i32 %8, 1, !dbg !18
  store i32 %9, ptr %i, align 4, !dbg !18
  %10 = load i32, ptr %i, align 4, !dbg !18
  br label %while.cond, !dbg !18

while.end:                                        ; preds = %while.cond
  %11 = load i32, ptr %sum, align 4, !dbg !19
  ret i32 %11, !dbg !19
}

define i32 @countSum2(i32 %0) !dbg !20 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !21, !DIExpression(), !22)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !23, !DIExpression(), !24)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !25, !DIExpression(), !26)
  store i32 %0, ptr %n, align 4, !dbg !26
  store i32 0, ptr %sum, align 4, !dbg !24
  store i32 0, ptr %i, align 4, !dbg !22
  br label %do.loop, !dbg !27

do.loop:                                          ; preds = %do.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !28
  %2 = load i32, ptr %sum, align 4, !dbg !28
  %3 = add i32 %2, %1, !dbg !28
  store i32 %3, ptr %sum, align 4, !dbg !28
  %4 = load i32, ptr %sum, align 4, !dbg !28
  %5 = load i32, ptr %i, align 4, !dbg !30
  %6 = add i32 %5, 1, !dbg !30
  store i32 %6, ptr %i, align 4, !dbg !30
  %7 = load i32, ptr %i, align 4, !dbg !30
  %8 = load i32, ptr %i, align 4, !dbg !30
  %9 = load i32, ptr %n, align 4, !dbg !30
  %10 = icmp sle i32 %8, %9, !dbg !30
  br i1 %10, label %do.loop, label %do.end, !dbg !30

do.end:                                           ; preds = %do.loop
  %11 = load i32, ptr %sum, align 4, !dbg !31
  ret i32 %11, !dbg !31
}

define i32 @main() !dbg !32 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !35, !DIExpression(), !36)
  store i32 0, ptr %err, align 4, !dbg !36
  %0 = call i32 @countSum(i32 100), !dbg !37
  %1 = icmp ne i32 %0, 5050, !dbg !37
  br i1 %1, label %then, label %if.end, !dbg !37

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !38
  %2 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end, !dbg !38

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countSum2(i32 100), !dbg !39
  %4 = icmp ne i32 %3, 5050, !dbg !39
  br i1 %4, label %then1, label %if.end3, !dbg !39

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !40
  %5 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countSum(i32 0), !dbg !41
  %7 = icmp ne i32 %6, 0, !dbg !41
  br i1 %7, label %then4, label %if.end6, !dbg !41

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !42
  %8 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end6, !dbg !42

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !43
  %10 = icmp ne i32 %9, 0, !dbg !43
  br i1 %10, label %then7, label %if.end9, !dbg !43

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !44
  %11 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end9, !dbg !44

if.end9:                                          ; preds = %if.end6, %then7
  %12 = load i32, ptr %err, align 4, !dbg !45
  %13 = icmp eq i32 %12, 0, !dbg !45
  %. = select i1 %13, ptr @0, ptr @1, !dbg !46
  %14 = call i32 (ptr, ...) @printf(ptr %.), !dbg !46
  %15 = load i32, ptr %err, align 4, !dbg !47
  ret i32 %15, !dbg !47
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "20.do_while.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 3, scope: !4)
!11 = !DILocalVariable(name: "sum", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!14 = !DILocation(line: 3, column: 5, scope: !4)
!15 = !DILocation(line: 6, column: 3, scope: !4)
!16 = !DILocation(line: 7, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !4, file: !1, line: 6, column: 18)
!18 = !DILocation(line: 8, column: 5, scope: !17)
!19 = !DILocation(line: 10, column: 3, scope: !4)
!20 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 13, type: !5, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!21 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 15, type: !7)
!22 = !DILocation(line: 15, column: 3, scope: !20)
!23 = !DILocalVariable(name: "sum", scope: !20, file: !1, line: 14, type: !7)
!24 = !DILocation(line: 14, column: 3, scope: !20)
!25 = !DILocalVariable(name: "n", arg: 1, scope: !20, file: !1, line: 13, type: !7)
!26 = !DILocation(line: 13, column: 5, scope: !20)
!27 = !DILocation(line: 16, column: 3, scope: !20)
!28 = !DILocation(line: 17, column: 5, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !1, line: 16, column: 6)
!30 = !DILocation(line: 18, column: 5, scope: !29)
!31 = !DILocation(line: 20, column: 3, scope: !20)
!32 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 23, type: !33, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!33 = !DISubroutineType(types: !34)
!34 = !{!7}
!35 = !DILocalVariable(name: "err", scope: !32, file: !1, line: 24, type: !7)
!36 = !DILocation(line: 24, column: 3, scope: !32)
!37 = !DILocation(line: 26, column: 3, scope: !32)
!38 = !DILocation(line: 26, column: 30, scope: !32)
!39 = !DILocation(line: 27, column: 3, scope: !32)
!40 = !DILocation(line: 27, column: 31, scope: !32)
!41 = !DILocation(line: 28, column: 3, scope: !32)
!42 = !DILocation(line: 28, column: 25, scope: !32)
!43 = !DILocation(line: 29, column: 3, scope: !32)
!44 = !DILocation(line: 29, column: 26, scope: !32)
!45 = !DILocation(line: 31, column: 3, scope: !32)
!46 = !DILocation(line: 0, scope: !32)
!47 = !DILocation(line: 36, column: 3, scope: !32)
