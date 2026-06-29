; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

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
  br label %while.cond, !dbg !13

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !13
  %2 = load i32, ptr %n, align 4, !dbg !13
  %3 = icmp sle i32 %1, %2, !dbg !13
  br i1 %3, label %while.loop, label %while.end, !dbg !13

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !14
  %5 = load i32, ptr %sum, align 4, !dbg !14
  %6 = add i32 %5, %4, !dbg !14
  store i32 %6, ptr %sum, align 4, !dbg !14
  %7 = load i32, ptr %sum, align 4, !dbg !14
  %8 = load i32, ptr %i, align 4, !dbg !16
  %9 = add i32 %8, 1, !dbg !16
  store i32 %9, ptr %i, align 4, !dbg !16
  %10 = load i32, ptr %i, align 4, !dbg !16
  br label %while.cond, !dbg !16

while.end:                                        ; preds = %while.cond
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
  store i32 0, ptr %i, align 4, !dbg !20
  br label %do.loop, !dbg !25

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !26
  %2 = load i32, ptr %sum, align 4, !dbg !26
  %3 = add i32 %2, %1, !dbg !26
  store i32 %3, ptr %sum, align 4, !dbg !26
  %4 = load i32, ptr %sum, align 4, !dbg !26
  %5 = load i32, ptr %i, align 4, !dbg !28
  %6 = add i32 %5, 1, !dbg !28
  store i32 %6, ptr %i, align 4, !dbg !28
  %7 = load i32, ptr %i, align 4, !dbg !28
  br label %do.cond, !dbg !28

do.cond:                                          ; preds = %do.loop
  %8 = load i32, ptr %i, align 4, !dbg !28
  %9 = load i32, ptr %n, align 4, !dbg !28
  %10 = icmp sle i32 %8, %9, !dbg !28
  br i1 %10, label %do.loop, label %do.end, !dbg !28

do.end:                                           ; preds = %do.cond
  %11 = load i32, ptr %sum, align 4, !dbg !29
  ret i32 %11, !dbg !29
}

define i32 @main() !dbg !30 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !33, !DIExpression(), !34)
  store i32 0, ptr %err, align 4, !dbg !34
  %0 = call i32 @countSum(i32 100), !dbg !35
  %1 = icmp ne i32 %0, 5050, !dbg !35
  br i1 %1, label %then, label %else, !dbg !35

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !36
  %2 = load i32, ptr %err, align 4, !dbg !36
  br label %if.end, !dbg !36

else:                                             ; preds = %entry
  br label %if.end, !dbg !36

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !37
  %4 = icmp ne i32 %3, 5050, !dbg !37
  br i1 %4, label %then1, label %else2, !dbg !37

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !38
  %5 = load i32, ptr %err, align 4, !dbg !38
  br label %if.end3, !dbg !38

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum(i32 0), !dbg !39
  %7 = icmp ne i32 %6, 0, !dbg !39
  br i1 %7, label %then4, label %else5, !dbg !39

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !40
  %8 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end6, !dbg !40

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !40

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !41
  %10 = icmp ne i32 %9, 0, !dbg !41
  br i1 %10, label %then7, label %else8, !dbg !41

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !42
  %11 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end9, !dbg !42

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !42

if.end9:                                          ; preds = %else8, %then7
  %12 = load i32, ptr %err, align 4, !dbg !43
  %13 = icmp eq i32 %12, 0, !dbg !43
  br i1 %13, label %then10, label %else11, !dbg !43

then10:                                           ; preds = %if.end9
  %14 = call i32 (ptr, ...) @printf(ptr @0), !dbg !44
  br label %if.end12, !dbg !44

else11:                                           ; preds = %if.end9
  %15 = call i32 (ptr, ...) @printf(ptr @1), !dbg !46
  br label %if.end12, !dbg !46

if.end12:                                         ; preds = %else11, %then10
  %16 = load i32, ptr %err, align 4, !dbg !48
  ret i32 %16, !dbg !48
}

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
!44 = !DILocation(line: 32, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !30, file: !1, line: 31, column: 17)
!46 = !DILocation(line: 34, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !30, file: !1, line: 33, column: 10)
!48 = !DILocation(line: 36, column: 3, scope: !30)
