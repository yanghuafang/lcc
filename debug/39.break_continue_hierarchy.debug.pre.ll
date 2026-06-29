; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @for_break_continue() !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !6, !DIExpression(), !7)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !8, !DIExpression(), !9)
  store i32 0, ptr %sum, align 4, !dbg !9
  store i32 0, ptr %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !7
  %1 = icmp slt i32 %0, 10, !dbg !7
  br i1 %1, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !10
  %3 = icmp eq i32 %2, 3, !dbg !10
  br i1 %3, label %then, label %else, !dbg !10

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !12

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !12

if.end:                                           ; preds = %else
  %4 = load i32, ptr %i, align 4, !dbg !14
  %5 = icmp eq i32 %4, 7, !dbg !14
  br i1 %5, label %then1, label %else2, !dbg !14

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !15

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !15

if.end3:                                          ; preds = %else2
  %6 = load i32, ptr %sum, align 4, !dbg !17
  %7 = load i32, ptr %i, align 4, !dbg !17
  %8 = add i32 %6, %7, !dbg !17
  store i32 %8, ptr %sum, align 4, !dbg !17
  %9 = load i32, ptr %sum, align 4, !dbg !17
  br label %for.update, !dbg !17

for.update:                                       ; preds = %if.end3, %then
  %10 = load i32, ptr %i, align 4, !dbg !17
  %11 = add i32 %10, 1, !dbg !17
  store i32 %11, ptr %i, align 4, !dbg !17
  br label %for.cond, !dbg !17

for.end:                                          ; preds = %then1, %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !18
  ret i32 %12, !dbg !18
}

define i32 @switch_break_fallthrough() !dbg !19 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !20, !DIExpression(), !21)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !22, !DIExpression(), !23)
  store i32 1, ptr %x, align 4, !dbg !23
  store i32 0, ptr %r, align 4, !dbg !21
  %0 = load i32, ptr %x, align 4, !dbg !24
  %1 = icmp eq i32 %0, 1, !dbg !24
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !24

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !24
  br i1 %2, label %case.1, label %switch.compare.1, !dbg !24

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2, !dbg !24

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %r, align 4, !dbg !25
  %4 = add i32 %3, 1, !dbg !25
  store i32 %4, ptr %r, align 4, !dbg !25
  %5 = load i32, ptr %r, align 4, !dbg !25
  br label %case.1, !dbg !25

case.1:                                           ; preds = %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4, !dbg !26
  %7 = add i32 %6, 10, !dbg !26
  store i32 %7, ptr %r, align 4, !dbg !26
  %8 = load i32, ptr %r, align 4, !dbg !26
  br label %switch.end, !dbg !27

case.2:                                           ; preds = %switch.compare.1
  store i32 99, ptr %r, align 4, !dbg !28
  %9 = load i32, ptr %r, align 4, !dbg !28
  br label %switch.end, !dbg !29

switch.end:                                       ; preds = %case.2, %case.1
  %10 = load i32, ptr %r, align 4, !dbg !30
  ret i32 %10, !dbg !30
}

define i32 @switch_break_only() !dbg !31 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !32, !DIExpression(), !33)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !34, !DIExpression(), !35)
  store i32 2, ptr %x, align 4, !dbg !35
  store i32 0, ptr %r, align 4, !dbg !33
  %0 = load i32, ptr %x, align 4, !dbg !36
  %1 = icmp eq i32 %0, 1, !dbg !36
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !36

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !36
  br i1 %2, label %case.1, label %switch.compare.1, !dbg !36

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2, !dbg !36

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4, !dbg !37
  %3 = load i32, ptr %r, align 4, !dbg !37
  br label %switch.end, !dbg !38

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4, !dbg !39
  %4 = load i32, ptr %r, align 4, !dbg !39
  br label %switch.end, !dbg !40

case.2:                                           ; preds = %switch.compare.1
  store i32 99, ptr %r, align 4, !dbg !41
  %5 = load i32, ptr %r, align 4, !dbg !41
  br label %switch.end, !dbg !42

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %6 = load i32, ptr %r, align 4, !dbg !43
  ret i32 %6, !dbg !43
}

define i32 @for_switch_break_continue() !dbg !44 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !45, !DIExpression(), !46)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !47, !DIExpression(), !48)
  store i32 0, ptr %sum, align 4, !dbg !48
  store i32 0, ptr %i, align 4, !dbg !46
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !46
  %1 = icmp slt i32 %0, 6, !dbg !46
  br i1 %1, label %for.loop, label %for.end, !dbg !46

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !49
  %3 = icmp eq i32 %2, 1, !dbg !49
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !49

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3, !dbg !49
  br i1 %4, label %case.1, label %switch.compare.1, !dbg !49

switch.compare.1:                                 ; preds = %switch.compare.0
  %5 = icmp eq i32 %2, 5, !dbg !49
  br i1 %5, label %case.2, label %switch.compare.2, !dbg !49

switch.compare.2:                                 ; preds = %switch.compare.1
  br label %case.3, !dbg !49

case.0:                                           ; preds = %for.loop
  br label %for.update, !dbg !51

case.1:                                           ; preds = %switch.compare.0
  br label %switch.end, !dbg !52

case.2:                                           ; preds = %switch.compare.1
  %6 = load i32, ptr %sum, align 4, !dbg !53
  %7 = add i32 %6, 100, !dbg !53
  store i32 %7, ptr %sum, align 4, !dbg !53
  %8 = load i32, ptr %sum, align 4, !dbg !53
  br label %switch.end, !dbg !54

case.3:                                           ; preds = %switch.compare.2
  %9 = load i32, ptr %sum, align 4, !dbg !55
  %10 = load i32, ptr %i, align 4, !dbg !55
  %11 = add i32 %9, %10, !dbg !55
  store i32 %11, ptr %sum, align 4, !dbg !55
  %12 = load i32, ptr %sum, align 4, !dbg !55
  br label %switch.end, !dbg !56

switch.end:                                       ; preds = %case.3, %case.2, %case.1
  br label %for.update, !dbg !56

for.update:                                       ; preds = %switch.end, %case.0
  %13 = load i32, ptr %i, align 4, !dbg !56
  %14 = add i32 %13, 1, !dbg !56
  store i32 %14, ptr %i, align 4, !dbg !56
  br label %for.cond, !dbg !56

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %sum, align 4, !dbg !57
  ret i32 %15, !dbg !57
}

define i32 @switch_for_break_continue() !dbg !58 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !59, !DIExpression(), !61)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !62, !DIExpression(), !63)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !64, !DIExpression(), !65)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !66, !DIExpression(), !67)
  store i32 0, ptr %r, align 4, !dbg !67
  store i32 1, ptr %x, align 4, !dbg !65
  %0 = load i32, ptr %x, align 4, !dbg !68
  %1 = icmp eq i32 %0, 1, !dbg !68
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !68

switch.compare.0:                                 ; preds = %entry
  br label %case.1, !dbg !68

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4, !dbg !63
  store i32 0, ptr %i, align 4, !dbg !61
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, ptr %i, align 4, !dbg !61
  %3 = icmp slt i32 %2, 5, !dbg !61
  br i1 %3, label %for.loop, label %for.end, !dbg !61

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !69
  %5 = icmp eq i32 %4, 2, !dbg !69
  br i1 %5, label %then, label %else, !dbg !69

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !71

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !71

if.end:                                           ; preds = %else
  %6 = load i32, ptr %i, align 4, !dbg !73
  %7 = icmp eq i32 %6, 4, !dbg !73
  br i1 %7, label %then1, label %else2, !dbg !73

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !74

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !74

if.end3:                                          ; preds = %else2
  %8 = load i32, ptr %sum, align 4, !dbg !76
  %9 = load i32, ptr %i, align 4, !dbg !76
  %10 = add i32 %8, %9, !dbg !76
  store i32 %10, ptr %sum, align 4, !dbg !76
  %11 = load i32, ptr %sum, align 4, !dbg !76
  br label %for.update, !dbg !76

for.update:                                       ; preds = %if.end3, %then
  %12 = load i32, ptr %i, align 4, !dbg !76
  %13 = add i32 %12, 1, !dbg !76
  store i32 %13, ptr %i, align 4, !dbg !76
  br label %for.cond, !dbg !76

for.end:                                          ; preds = %then1, %for.cond
  %14 = load i32, ptr %sum, align 4, !dbg !77
  store i32 %14, ptr %r, align 4, !dbg !77
  %15 = load i32, ptr %r, align 4, !dbg !77
  br label %switch.end, !dbg !78

case.1:                                           ; preds = %switch.compare.0
  store i32 -1, ptr %r, align 4, !dbg !79
  %16 = load i32, ptr %r, align 4, !dbg !79
  br label %switch.end, !dbg !80

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, ptr %r, align 4, !dbg !81
  ret i32 %17, !dbg !81
}

define i32 @main() !dbg !82 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !83, !DIExpression(), !84)
  store i32 0, ptr %err, align 4, !dbg !84
  %0 = call i32 @for_break_continue(), !dbg !85
  %1 = icmp ne i32 %0, 18, !dbg !85
  br i1 %1, label %then, label %else, !dbg !85

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !86
  %2 = load i32, ptr %err, align 4, !dbg !86
  br label %if.end, !dbg !86

else:                                             ; preds = %entry
  br label %if.end, !dbg !86

if.end:                                           ; preds = %else, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !87
  %4 = icmp ne i32 %3, 11, !dbg !87
  br i1 %4, label %then1, label %else2, !dbg !87

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !88
  %5 = load i32, ptr %err, align 4, !dbg !88
  br label %if.end3, !dbg !88

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !88

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @switch_break_only(), !dbg !89
  %7 = icmp ne i32 %6, 20, !dbg !89
  br i1 %7, label %then4, label %else5, !dbg !89

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !90
  %8 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end6, !dbg !90

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !90

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !91
  %10 = icmp ne i32 %9, 106, !dbg !91
  br i1 %10, label %then7, label %else8, !dbg !91

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !92
  %11 = load i32, ptr %err, align 4, !dbg !92
  br label %if.end9, !dbg !92

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !92

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !93
  %13 = icmp ne i32 %12, 4, !dbg !93
  br i1 %13, label %then10, label %else11, !dbg !93

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !94
  %14 = load i32, ptr %err, align 4, !dbg !94
  br label %if.end12, !dbg !94

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !94

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !95
  %16 = icmp eq i32 %15, 0, !dbg !95
  br i1 %16, label %then13, label %else14, !dbg !95

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !96
  br label %if.end15, !dbg !96

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !98
  br label %if.end15, !dbg !98

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !100
  ret i32 %19, !dbg !100
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!7 = !DILocation(line: 5, column: 8, scope: !2)
!8 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocation(line: 6, column: 5, scope: !11)
!11 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 32)
!12 = !DILocation(line: 7, column: 7, scope: !13)
!13 = distinct !DILexicalBlock(scope: !11, file: !1, line: 6, column: 17)
!14 = !DILocation(line: 9, column: 5, scope: !11)
!15 = !DILocation(line: 10, column: 7, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !1, line: 9, column: 17)
!17 = !DILocation(line: 12, column: 5, scope: !11)
!18 = !DILocation(line: 14, column: 3, scope: !2)
!19 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0)
!20 = !DILocalVariable(name: "r", scope: !19, file: !1, line: 19, type: !5)
!21 = !DILocation(line: 19, column: 3, scope: !19)
!22 = !DILocalVariable(name: "x", scope: !19, file: !1, line: 18, type: !5)
!23 = !DILocation(line: 18, column: 3, scope: !19)
!24 = !DILocation(line: 20, column: 3, scope: !19)
!25 = !DILocation(line: 22, column: 7, scope: !19)
!26 = !DILocation(line: 24, column: 7, scope: !19)
!27 = !DILocation(line: 25, column: 7, scope: !19)
!28 = !DILocation(line: 27, column: 7, scope: !19)
!29 = !DILocation(line: 28, column: 7, scope: !19)
!30 = !DILocation(line: 30, column: 3, scope: !19)
!31 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !3, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0)
!32 = !DILocalVariable(name: "r", scope: !31, file: !1, line: 35, type: !5)
!33 = !DILocation(line: 35, column: 3, scope: !31)
!34 = !DILocalVariable(name: "x", scope: !31, file: !1, line: 34, type: !5)
!35 = !DILocation(line: 34, column: 3, scope: !31)
!36 = !DILocation(line: 36, column: 3, scope: !31)
!37 = !DILocation(line: 38, column: 7, scope: !31)
!38 = !DILocation(line: 39, column: 7, scope: !31)
!39 = !DILocation(line: 41, column: 7, scope: !31)
!40 = !DILocation(line: 42, column: 7, scope: !31)
!41 = !DILocation(line: 44, column: 7, scope: !31)
!42 = !DILocation(line: 45, column: 7, scope: !31)
!43 = !DILocation(line: 47, column: 3, scope: !31)
!44 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !3, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0)
!45 = !DILocalVariable(name: "i", scope: !44, file: !1, line: 52, type: !5)
!46 = !DILocation(line: 52, column: 8, scope: !44)
!47 = !DILocalVariable(name: "sum", scope: !44, file: !1, line: 51, type: !5)
!48 = !DILocation(line: 51, column: 3, scope: !44)
!49 = !DILocation(line: 53, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 52, column: 31)
!51 = !DILocation(line: 55, column: 9, scope: !50)
!52 = !DILocation(line: 57, column: 9, scope: !50)
!53 = !DILocation(line: 59, column: 9, scope: !50)
!54 = !DILocation(line: 60, column: 9, scope: !50)
!55 = !DILocation(line: 62, column: 9, scope: !50)
!56 = !DILocation(line: 63, column: 9, scope: !50)
!57 = !DILocation(line: 66, column: 3, scope: !44)
!58 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !3, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0)
!59 = !DILocalVariable(name: "i", scope: !60, file: !1, line: 76, type: !5)
!60 = distinct !DILexicalBlock(scope: !58, file: !1, line: 74, column: 7)
!61 = !DILocation(line: 76, column: 14, scope: !60)
!62 = !DILocalVariable(name: "sum", scope: !60, file: !1, line: 75, type: !5)
!63 = !DILocation(line: 75, column: 9, scope: !60)
!64 = !DILocalVariable(name: "x", scope: !58, file: !1, line: 71, type: !5)
!65 = !DILocation(line: 71, column: 3, scope: !58)
!66 = !DILocalVariable(name: "r", scope: !58, file: !1, line: 70, type: !5)
!67 = !DILocation(line: 70, column: 3, scope: !58)
!68 = !DILocation(line: 72, column: 3, scope: !58)
!69 = !DILocation(line: 77, column: 11, scope: !70)
!70 = distinct !DILexicalBlock(scope: !60, file: !1, line: 76, column: 37)
!71 = !DILocation(line: 78, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !70, file: !1, line: 77, column: 23)
!73 = !DILocation(line: 80, column: 11, scope: !70)
!74 = !DILocation(line: 81, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 80, column: 23)
!76 = !DILocation(line: 83, column: 11, scope: !70)
!77 = !DILocation(line: 85, column: 9, scope: !60)
!78 = !DILocation(line: 87, column: 7, scope: !58)
!79 = !DILocation(line: 89, column: 7, scope: !58)
!80 = !DILocation(line: 90, column: 7, scope: !58)
!81 = !DILocation(line: 92, column: 3, scope: !58)
!82 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !3, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0)
!83 = !DILocalVariable(name: "err", scope: !82, file: !1, line: 96, type: !5)
!84 = !DILocation(line: 96, column: 3, scope: !82)
!85 = !DILocation(line: 98, column: 3, scope: !82)
!86 = !DILocation(line: 98, column: 35, scope: !82)
!87 = !DILocation(line: 99, column: 3, scope: !82)
!88 = !DILocation(line: 99, column: 41, scope: !82)
!89 = !DILocation(line: 100, column: 3, scope: !82)
!90 = !DILocation(line: 100, column: 34, scope: !82)
!91 = !DILocation(line: 101, column: 3, scope: !82)
!92 = !DILocation(line: 101, column: 43, scope: !82)
!93 = !DILocation(line: 102, column: 3, scope: !82)
!94 = !DILocation(line: 102, column: 41, scope: !82)
!95 = !DILocation(line: 104, column: 3, scope: !82)
!96 = !DILocation(line: 105, column: 5, scope: !97)
!97 = distinct !DILexicalBlock(scope: !82, file: !1, line: 104, column: 17)
!98 = !DILocation(line: 107, column: 5, scope: !99)
!99 = distinct !DILexicalBlock(scope: !82, file: !1, line: 106, column: 10)
!100 = !DILocation(line: 109, column: 3, scope: !82)
