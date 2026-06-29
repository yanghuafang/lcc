; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

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
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !7
  %2 = load i32, ptr %n, align 4, !dbg !7
  %3 = icmp sle i32 %1, %2, !dbg !7
  br i1 %3, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !12
  %5 = load i32, ptr %sum, align 4, !dbg !12
  %6 = add i32 %5, %4, !dbg !12
  store i32 %6, ptr %sum, align 4, !dbg !12
  %7 = load i32, ptr %sum, align 4, !dbg !12
  br label %for.update, !dbg !12

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4, !dbg !12
  %9 = add i32 %8, 1, !dbg !12
  store i32 %9, ptr %i, align 4, !dbg !12
  %10 = load i32, ptr %i, align 4, !dbg !12
  br label %for.cond, !dbg !12

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !14
  ret i32 %11, !dbg !14
}

define i32 @countSum2(i32 %0) !dbg !15 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !16, !DIExpression(), !17)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !18, !DIExpression(), !19)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !20, !DIExpression(), !21)
  store i32 %0, ptr %n, align 4, !dbg !21
  store i32 0, ptr %sum, align 4, !dbg !19
  store i32 1, ptr %i, align 4, !dbg !17
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !22
  %2 = load i32, ptr %n, align 4, !dbg !22
  %3 = icmp sle i32 %1, %2, !dbg !22
  br i1 %3, label %for.loop, label %for.end, !dbg !22

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !23
  %5 = load i32, ptr %sum, align 4, !dbg !23
  %6 = add i32 %5, %4, !dbg !23
  store i32 %6, ptr %sum, align 4, !dbg !23
  %7 = load i32, ptr %sum, align 4, !dbg !23
  br label %for.update, !dbg !23

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4, !dbg !23
  %9 = add i32 %8, 1, !dbg !23
  store i32 %9, ptr %i, align 4, !dbg !23
  %10 = load i32, ptr %i, align 4, !dbg !23
  br label %for.cond, !dbg !23

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !25
  ret i32 %11, !dbg !25
}

define i32 @countSum3(i32 %0) !dbg !26 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !27, !DIExpression(), !28)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !29, !DIExpression(), !30)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !31, !DIExpression(), !32)
  store i32 %0, ptr %n, align 4, !dbg !32
  store i32 0, ptr %sum, align 4, !dbg !30
  store i32 1, ptr %i, align 4, !dbg !33
  %1 = load i32, ptr %i, align 4, !dbg !33
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !33
  %3 = load i32, ptr %n, align 4, !dbg !33
  %4 = icmp sle i32 %2, %3, !dbg !33
  br i1 %4, label %for.loop, label %for.end, !dbg !33

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !34
  %6 = load i32, ptr %sum, align 4, !dbg !34
  %7 = add i32 %6, %5, !dbg !34
  store i32 %7, ptr %sum, align 4, !dbg !34
  %8 = load i32, ptr %sum, align 4, !dbg !34
  br label %for.update, !dbg !34

for.update:                                       ; preds = %for.loop
  %9 = load i32, ptr %i, align 4, !dbg !34
  %10 = add i32 %9, 1, !dbg !34
  store i32 %10, ptr %i, align 4, !dbg !34
  %11 = load i32, ptr %i, align 4, !dbg !34
  br label %for.cond, !dbg !34

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !36
  ret i32 %12, !dbg !36
}

define i32 @main() !dbg !37 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !40, !DIExpression(), !41)
  store i32 0, ptr %err, align 4, !dbg !41
  %0 = call i32 @countSum(i32 100), !dbg !42
  %1 = icmp ne i32 %0, 5050, !dbg !42
  br i1 %1, label %then, label %else, !dbg !42

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !43
  %2 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end, !dbg !43

else:                                             ; preds = %entry
  br label %if.end, !dbg !43

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !44
  %4 = icmp ne i32 %3, 5050, !dbg !44
  br i1 %4, label %then1, label %else2, !dbg !44

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !45
  %5 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end3, !dbg !45

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !46
  %7 = icmp ne i32 %6, 5050, !dbg !46
  br i1 %7, label %then4, label %else5, !dbg !46

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !47
  %8 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end6, !dbg !47

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !47

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum(i32 0), !dbg !48
  %10 = icmp ne i32 %9, 0, !dbg !48
  br i1 %10, label %then7, label %else8, !dbg !48

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !49
  %11 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end9, !dbg !49

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !49

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countSum(i32 1), !dbg !50
  %13 = icmp ne i32 %12, 1, !dbg !50
  br i1 %13, label %then10, label %else11, !dbg !50

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !51
  %14 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end12, !dbg !51

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !51

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !52
  %16 = icmp eq i32 %15, 0, !dbg !52
  br i1 %16, label %then13, label %else14, !dbg !52

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !53
  br label %if.end15, !dbg !53

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !55
  br label %if.end15, !dbg !55

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !57
  ret i32 %19, !dbg !57
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 8, scope: !2)
!8 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !1, line: 3, type: !5)
!11 = !DILocation(line: 3, column: 5, scope: !2)
!12 = !DILocation(line: 6, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 35)
!14 = !DILocation(line: 8, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !3, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 13, type: !5)
!17 = !DILocation(line: 13, column: 3, scope: !15)
!18 = !DILocalVariable(name: "sum", scope: !15, file: !1, line: 12, type: !5)
!19 = !DILocation(line: 12, column: 3, scope: !15)
!20 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !1, line: 11, type: !5)
!21 = !DILocation(line: 11, column: 5, scope: !15)
!22 = !DILocation(line: 14, column: 3, scope: !15)
!23 = !DILocation(line: 15, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !15, file: !1, line: 14, column: 26)
!25 = !DILocation(line: 17, column: 3, scope: !15)
!26 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !1, line: 20, type: !3, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0)
!27 = !DILocalVariable(name: "i", scope: !26, file: !1, line: 22, type: !5)
!28 = !DILocation(line: 22, column: 3, scope: !26)
!29 = !DILocalVariable(name: "sum", scope: !26, file: !1, line: 21, type: !5)
!30 = !DILocation(line: 21, column: 3, scope: !26)
!31 = !DILocalVariable(name: "n", arg: 1, scope: !26, file: !1, line: 20, type: !5)
!32 = !DILocation(line: 20, column: 5, scope: !26)
!33 = !DILocation(line: 23, column: 3, scope: !26)
!34 = !DILocation(line: 24, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !1, line: 23, column: 31)
!36 = !DILocation(line: 26, column: 3, scope: !26)
!37 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !38, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0)
!38 = !DISubroutineType(types: !39)
!39 = !{!5}
!40 = !DILocalVariable(name: "err", scope: !37, file: !1, line: 30, type: !5)
!41 = !DILocation(line: 30, column: 3, scope: !37)
!42 = !DILocation(line: 32, column: 3, scope: !37)
!43 = !DILocation(line: 32, column: 30, scope: !37)
!44 = !DILocation(line: 33, column: 3, scope: !37)
!45 = !DILocation(line: 33, column: 31, scope: !37)
!46 = !DILocation(line: 34, column: 3, scope: !37)
!47 = !DILocation(line: 34, column: 31, scope: !37)
!48 = !DILocation(line: 35, column: 3, scope: !37)
!49 = !DILocation(line: 35, column: 25, scope: !37)
!50 = !DILocation(line: 36, column: 3, scope: !37)
!51 = !DILocation(line: 36, column: 25, scope: !37)
!52 = !DILocation(line: 38, column: 3, scope: !37)
!53 = !DILocation(line: 39, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !37, file: !1, line: 38, column: 17)
!55 = !DILocation(line: 41, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !37, file: !1, line: 40, column: 10)
!57 = !DILocation(line: 43, column: 3, scope: !37)
