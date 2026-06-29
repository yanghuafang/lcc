; ModuleID = 'lcc'
source_filename = "lcc"

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

for.cond:                                         ; preds = %for.update, %entry
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
  br label %for.update, !dbg !13

for.update:                                       ; preds = %for.loop
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

for.cond:                                         ; preds = %for.update, %entry
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
  br label %for.update, !dbg !24

for.update:                                       ; preds = %for.loop
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
  store i32 1, ptr %i, align 4, !dbg !34
  %1 = load i32, ptr %i, align 4, !dbg !34
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !34
  %3 = load i32, ptr %n, align 4, !dbg !34
  %4 = icmp sle i32 %2, %3, !dbg !34
  br i1 %4, label %for.loop, label %for.end, !dbg !34

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !35
  %6 = load i32, ptr %sum, align 4, !dbg !35
  %7 = add i32 %6, %5, !dbg !35
  store i32 %7, ptr %sum, align 4, !dbg !35
  %8 = load i32, ptr %sum, align 4, !dbg !35
  br label %for.update, !dbg !35

for.update:                                       ; preds = %for.loop
  %9 = load i32, ptr %i, align 4, !dbg !35
  %10 = add i32 %9, 1, !dbg !35
  store i32 %10, ptr %i, align 4, !dbg !35
  %11 = load i32, ptr %i, align 4, !dbg !35
  br label %for.cond, !dbg !35

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !37
  ret i32 %12, !dbg !37
}

define i32 @main() !dbg !38 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !41, !DIExpression(), !42)
  store i32 0, ptr %err, align 4, !dbg !42
  %0 = call i32 @countSum(i32 100), !dbg !43
  %1 = icmp ne i32 %0, 5050, !dbg !43
  br i1 %1, label %then, label %else, !dbg !43

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !44
  %2 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end, !dbg !44

else:                                             ; preds = %entry
  br label %if.end, !dbg !44

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !45
  %4 = icmp ne i32 %3, 5050, !dbg !45
  br i1 %4, label %then1, label %else2, !dbg !45

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !46
  %5 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end3, !dbg !46

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !46

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !47
  %7 = icmp ne i32 %6, 5050, !dbg !47
  br i1 %7, label %then4, label %else5, !dbg !47

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !48
  %8 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end6, !dbg !48

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !48

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum(i32 0), !dbg !49
  %10 = icmp ne i32 %9, 0, !dbg !49
  br i1 %10, label %then7, label %else8, !dbg !49

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !50
  %11 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end9, !dbg !50

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !50

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countSum(i32 1), !dbg !51
  %13 = icmp ne i32 %12, 1, !dbg !51
  br i1 %13, label %then10, label %else11, !dbg !51

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !52
  %14 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end12, !dbg !52

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !52

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !53
  %16 = icmp eq i32 %15, 0, !dbg !53
  br i1 %16, label %then13, label %else14, !dbg !53

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !54
  br label %if.end15, !dbg !54

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !56
  br label %if.end15, !dbg !56

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !58
  ret i32 %19, !dbg !58
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
!35 = !DILocation(line: 24, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !1, line: 23, column: 31)
!37 = !DILocation(line: 26, column: 3, scope: !27)
!38 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !39, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!39 = !DISubroutineType(types: !40)
!40 = !{!5}
!41 = !DILocalVariable(name: "err", scope: !38, file: !1, line: 30, type: !5)
!42 = !DILocation(line: 30, column: 3, scope: !38)
!43 = !DILocation(line: 32, column: 3, scope: !38)
!44 = !DILocation(line: 32, column: 30, scope: !38)
!45 = !DILocation(line: 33, column: 3, scope: !38)
!46 = !DILocation(line: 33, column: 31, scope: !38)
!47 = !DILocation(line: 34, column: 3, scope: !38)
!48 = !DILocation(line: 34, column: 31, scope: !38)
!49 = !DILocation(line: 35, column: 3, scope: !38)
!50 = !DILocation(line: 35, column: 25, scope: !38)
!51 = !DILocation(line: 36, column: 3, scope: !38)
!52 = !DILocation(line: 36, column: 25, scope: !38)
!53 = !DILocation(line: 38, column: 3, scope: !38)
!54 = !DILocation(line: 39, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !38, file: !1, line: 38, column: 17)
!56 = !DILocation(line: 41, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !38, file: !1, line: 40, column: 10)
!58 = !DILocation(line: 43, column: 3, scope: !38)
