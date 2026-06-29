; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !6, !DIExpression(), !7)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !8, !DIExpression(), !9)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !10, !DIExpression(), !11)
  store i32 %0, ptr %n, align 4, !dbg !11
  store i32 0, ptr %sum, align 4, !dbg !9
  store i32 1, ptr %i, align 4, !dbg !7
  br label %while.cond, !dbg !12

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !12
  %2 = load i32, ptr %n, align 4, !dbg !12
  %3 = icmp sle i32 %1, %2, !dbg !12
  br i1 %3, label %while.loop, label %while.end, !dbg !12

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !13
  %5 = load i32, ptr %sum, align 4, !dbg !13
  %6 = add i32 %5, %4, !dbg !13
  store i32 %6, ptr %sum, align 4, !dbg !13
  %7 = load i32, ptr %sum, align 4, !dbg !13
  %8 = load i32, ptr %i, align 4, !dbg !15
  %9 = add i32 %8, 1, !dbg !15
  store i32 %9, ptr %i, align 4, !dbg !15
  %10 = load i32, ptr %i, align 4, !dbg !15
  br label %while.cond, !dbg !15

while.end:                                        ; preds = %while.cond
  %11 = load i32, ptr %sum, align 4, !dbg !16
  ret i32 %11, !dbg !16
}

define i32 @countSum2(i32 %0) !dbg !17 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !18, !DIExpression(), !19)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !20, !DIExpression(), !21)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !22, !DIExpression(), !23)
  store i32 %0, ptr %n, align 4, !dbg !23
  store i32 0, ptr %sum, align 4, !dbg !21
  store i32 0, ptr %i, align 4, !dbg !19
  br label %do.loop, !dbg !24

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !25
  %2 = load i32, ptr %sum, align 4, !dbg !25
  %3 = add i32 %2, %1, !dbg !25
  store i32 %3, ptr %sum, align 4, !dbg !25
  %4 = load i32, ptr %sum, align 4, !dbg !25
  %5 = load i32, ptr %i, align 4, !dbg !27
  %6 = add i32 %5, 1, !dbg !27
  store i32 %6, ptr %i, align 4, !dbg !27
  %7 = load i32, ptr %i, align 4, !dbg !27
  br label %do.cond, !dbg !27

do.cond:                                          ; preds = %do.loop
  %8 = load i32, ptr %i, align 4, !dbg !27
  %9 = load i32, ptr %n, align 4, !dbg !27
  %10 = icmp sle i32 %8, %9, !dbg !27
  br i1 %10, label %do.loop, label %do.end, !dbg !27

do.end:                                           ; preds = %do.cond
  %11 = load i32, ptr %sum, align 4, !dbg !28
  ret i32 %11, !dbg !28
}

define i32 @main() !dbg !29 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !32, !DIExpression(), !33)
  store i32 0, ptr %err, align 4, !dbg !33
  %0 = call i32 @countSum(i32 100), !dbg !34
  %1 = icmp ne i32 %0, 5050, !dbg !34
  br i1 %1, label %then, label %else, !dbg !34

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !35
  %2 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end, !dbg !35

else:                                             ; preds = %entry
  br label %if.end, !dbg !35

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !36
  %4 = icmp ne i32 %3, 5050, !dbg !36
  br i1 %4, label %then1, label %else2, !dbg !36

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !37
  %5 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end3, !dbg !37

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum(i32 0), !dbg !38
  %7 = icmp ne i32 %6, 0, !dbg !38
  br i1 %7, label %then4, label %else5, !dbg !38

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !39
  %8 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end6, !dbg !39

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !39

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !40
  %10 = icmp ne i32 %9, 0, !dbg !40
  br i1 %10, label %then7, label %else8, !dbg !40

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !41
  %11 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end9, !dbg !41

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !41

if.end9:                                          ; preds = %else8, %then7
  %12 = load i32, ptr %err, align 4, !dbg !42
  %13 = icmp eq i32 %12, 0, !dbg !42
  br i1 %13, label %then10, label %else11, !dbg !42

then10:                                           ; preds = %if.end9
  %14 = call i32 (ptr, ...) @printf(ptr @0), !dbg !43
  br label %if.end12, !dbg !43

else11:                                           ; preds = %if.end9
  %15 = call i32 (ptr, ...) @printf(ptr @1), !dbg !45
  br label %if.end12, !dbg !45

if.end12:                                         ; preds = %else11, %then10
  %16 = load i32, ptr %err, align 4, !dbg !47
  ret i32 %16, !dbg !47
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "20.do_while.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 3, scope: !2)
!8 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!11 = !DILocation(line: 3, column: 5, scope: !2)
!12 = !DILocation(line: 6, column: 3, scope: !2)
!13 = !DILocation(line: 7, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !2, file: !1, line: 6, column: 18)
!15 = !DILocation(line: 8, column: 5, scope: !14)
!16 = !DILocation(line: 10, column: 3, scope: !2)
!17 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 13, type: !3, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0)
!18 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 15, type: !5)
!19 = !DILocation(line: 15, column: 3, scope: !17)
!20 = !DILocalVariable(name: "sum", scope: !17, file: !1, line: 14, type: !5)
!21 = !DILocation(line: 14, column: 3, scope: !17)
!22 = !DILocalVariable(name: "n", arg: 1, scope: !17, file: !1, line: 13, type: !5)
!23 = !DILocation(line: 13, column: 5, scope: !17)
!24 = !DILocation(line: 16, column: 3, scope: !17)
!25 = !DILocation(line: 17, column: 5, scope: !26)
!26 = distinct !DILexicalBlock(scope: !17, file: !1, line: 16, column: 6)
!27 = !DILocation(line: 18, column: 5, scope: !26)
!28 = !DILocation(line: 20, column: 3, scope: !17)
!29 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 23, type: !30, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0)
!30 = !DISubroutineType(types: !31)
!31 = !{!5}
!32 = !DILocalVariable(name: "err", scope: !29, file: !1, line: 24, type: !5)
!33 = !DILocation(line: 24, column: 3, scope: !29)
!34 = !DILocation(line: 26, column: 3, scope: !29)
!35 = !DILocation(line: 26, column: 30, scope: !29)
!36 = !DILocation(line: 27, column: 3, scope: !29)
!37 = !DILocation(line: 27, column: 31, scope: !29)
!38 = !DILocation(line: 28, column: 3, scope: !29)
!39 = !DILocation(line: 28, column: 25, scope: !29)
!40 = !DILocation(line: 29, column: 3, scope: !29)
!41 = !DILocation(line: 29, column: 26, scope: !29)
!42 = !DILocation(line: 31, column: 3, scope: !29)
!43 = !DILocation(line: 32, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !29, file: !1, line: 31, column: 17)
!45 = !DILocation(line: 34, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !29, file: !1, line: 33, column: 10)
!47 = !DILocation(line: 36, column: 3, scope: !29)
