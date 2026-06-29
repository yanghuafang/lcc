; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @for_break_continue() !dbg !2 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !7, !DIExpression(), !8)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !9, !DIExpression(), !10)
  store i32 0, ptr %sum, align 4, !dbg !10
  store i32 0, ptr %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !8
  %1 = icmp slt i32 %0, 10, !dbg !8
  br i1 %1, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !11
  %3 = icmp eq i32 %2, 3, !dbg !11
  br i1 %3, label %then, label %else, !dbg !11

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !13

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !13

if.end:                                           ; preds = %else
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = icmp eq i32 %4, 7, !dbg !15
  br i1 %5, label %then1, label %else2, !dbg !15

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !16

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !16

if.end3:                                          ; preds = %else2
  %6 = load i32, ptr %sum, align 4, !dbg !18
  %7 = load i32, ptr %i, align 4, !dbg !18
  %8 = add i32 %6, %7, !dbg !18
  store i32 %8, ptr %sum, align 4, !dbg !18
  %9 = load i32, ptr %sum, align 4, !dbg !18
  br label %for.update, !dbg !18

for.update:                                       ; preds = %if.end3, %then
  %10 = load i32, ptr %i, align 4, !dbg !18
  %11 = add i32 %10, 1, !dbg !18
  store i32 %11, ptr %i, align 4, !dbg !18
  br label %for.cond, !dbg !18

for.end:                                          ; preds = %then1, %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !19
  ret i32 %12, !dbg !19
}

define i32 @switch_break_fallthrough() !dbg !20 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !21, !DIExpression(), !22)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !23, !DIExpression(), !24)
  store i32 1, ptr %x, align 4, !dbg !24
  store i32 0, ptr %r, align 4, !dbg !22
  %0 = load i32, ptr %x, align 4, !dbg !25
  %1 = icmp eq i32 %0, 1, !dbg !25
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !25

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !25
  br i1 %2, label %case.1, label %switch.compare.1, !dbg !25

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2, !dbg !25

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %r, align 4, !dbg !26
  %4 = add i32 %3, 1, !dbg !26
  store i32 %4, ptr %r, align 4, !dbg !26
  %5 = load i32, ptr %r, align 4, !dbg !26
  br label %case.1, !dbg !26

case.1:                                           ; preds = %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4, !dbg !27
  %7 = add i32 %6, 10, !dbg !27
  store i32 %7, ptr %r, align 4, !dbg !27
  %8 = load i32, ptr %r, align 4, !dbg !27
  br label %switch.end, !dbg !28

case.2:                                           ; preds = %switch.compare.1
  store i32 99, ptr %r, align 4, !dbg !29
  %9 = load i32, ptr %r, align 4, !dbg !29
  br label %switch.end, !dbg !30

switch.end:                                       ; preds = %case.2, %case.1
  %10 = load i32, ptr %r, align 4, !dbg !31
  ret i32 %10, !dbg !31
}

define i32 @switch_break_only() !dbg !32 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !33, !DIExpression(), !34)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !35, !DIExpression(), !36)
  store i32 2, ptr %x, align 4, !dbg !36
  store i32 0, ptr %r, align 4, !dbg !34
  %0 = load i32, ptr %x, align 4, !dbg !37
  %1 = icmp eq i32 %0, 1, !dbg !37
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !37

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !37
  br i1 %2, label %case.1, label %switch.compare.1, !dbg !37

switch.compare.1:                                 ; preds = %switch.compare.0
  br label %case.2, !dbg !37

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4, !dbg !38
  %3 = load i32, ptr %r, align 4, !dbg !38
  br label %switch.end, !dbg !39

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4, !dbg !40
  %4 = load i32, ptr %r, align 4, !dbg !40
  br label %switch.end, !dbg !41

case.2:                                           ; preds = %switch.compare.1
  store i32 99, ptr %r, align 4, !dbg !42
  %5 = load i32, ptr %r, align 4, !dbg !42
  br label %switch.end, !dbg !43

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %6 = load i32, ptr %r, align 4, !dbg !44
  ret i32 %6, !dbg !44
}

define i32 @for_switch_break_continue() !dbg !45 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !46, !DIExpression(), !47)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !48, !DIExpression(), !49)
  store i32 0, ptr %sum, align 4, !dbg !49
  store i32 0, ptr %i, align 4, !dbg !47
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !47
  %1 = icmp slt i32 %0, 6, !dbg !47
  br i1 %1, label %for.loop, label %for.end, !dbg !47

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !50
  %3 = icmp eq i32 %2, 1, !dbg !50
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !50

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3, !dbg !50
  br i1 %4, label %case.1, label %switch.compare.1, !dbg !50

switch.compare.1:                                 ; preds = %switch.compare.0
  %5 = icmp eq i32 %2, 5, !dbg !50
  br i1 %5, label %case.2, label %switch.compare.2, !dbg !50

switch.compare.2:                                 ; preds = %switch.compare.1
  br label %case.3, !dbg !50

case.0:                                           ; preds = %for.loop
  br label %for.update, !dbg !52

case.1:                                           ; preds = %switch.compare.0
  br label %switch.end, !dbg !53

case.2:                                           ; preds = %switch.compare.1
  %6 = load i32, ptr %sum, align 4, !dbg !54
  %7 = add i32 %6, 100, !dbg !54
  store i32 %7, ptr %sum, align 4, !dbg !54
  %8 = load i32, ptr %sum, align 4, !dbg !54
  br label %switch.end, !dbg !55

case.3:                                           ; preds = %switch.compare.2
  %9 = load i32, ptr %sum, align 4, !dbg !56
  %10 = load i32, ptr %i, align 4, !dbg !56
  %11 = add i32 %9, %10, !dbg !56
  store i32 %11, ptr %sum, align 4, !dbg !56
  %12 = load i32, ptr %sum, align 4, !dbg !56
  br label %switch.end, !dbg !57

switch.end:                                       ; preds = %case.3, %case.2, %case.1
  br label %for.update, !dbg !57

for.update:                                       ; preds = %switch.end, %case.0
  %13 = load i32, ptr %i, align 4, !dbg !57
  %14 = add i32 %13, 1, !dbg !57
  store i32 %14, ptr %i, align 4, !dbg !57
  br label %for.cond, !dbg !57

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %sum, align 4, !dbg !58
  ret i32 %15, !dbg !58
}

define i32 @switch_for_break_continue() !dbg !59 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !60, !DIExpression(), !62)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !63, !DIExpression(), !64)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !65, !DIExpression(), !66)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !67, !DIExpression(), !68)
  store i32 0, ptr %r, align 4, !dbg !68
  store i32 1, ptr %x, align 4, !dbg !66
  %0 = load i32, ptr %x, align 4, !dbg !69
  %1 = icmp eq i32 %0, 1, !dbg !69
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !69

switch.compare.0:                                 ; preds = %entry
  br label %case.1, !dbg !69

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4, !dbg !64
  store i32 0, ptr %i, align 4, !dbg !62
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, ptr %i, align 4, !dbg !62
  %3 = icmp slt i32 %2, 5, !dbg !62
  br i1 %3, label %for.loop, label %for.end, !dbg !62

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !70
  %5 = icmp eq i32 %4, 2, !dbg !70
  br i1 %5, label %then, label %else, !dbg !70

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !72

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !72

if.end:                                           ; preds = %else
  %6 = load i32, ptr %i, align 4, !dbg !74
  %7 = icmp eq i32 %6, 4, !dbg !74
  br i1 %7, label %then1, label %else2, !dbg !74

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !75

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !75

if.end3:                                          ; preds = %else2
  %8 = load i32, ptr %sum, align 4, !dbg !77
  %9 = load i32, ptr %i, align 4, !dbg !77
  %10 = add i32 %8, %9, !dbg !77
  store i32 %10, ptr %sum, align 4, !dbg !77
  %11 = load i32, ptr %sum, align 4, !dbg !77
  br label %for.update, !dbg !77

for.update:                                       ; preds = %if.end3, %then
  %12 = load i32, ptr %i, align 4, !dbg !77
  %13 = add i32 %12, 1, !dbg !77
  store i32 %13, ptr %i, align 4, !dbg !77
  br label %for.cond, !dbg !77

for.end:                                          ; preds = %then1, %for.cond
  %14 = load i32, ptr %sum, align 4, !dbg !78
  store i32 %14, ptr %r, align 4, !dbg !78
  %15 = load i32, ptr %r, align 4, !dbg !78
  br label %switch.end, !dbg !79

case.1:                                           ; preds = %switch.compare.0
  store i32 -1, ptr %r, align 4, !dbg !80
  %16 = load i32, ptr %r, align 4, !dbg !80
  br label %switch.end, !dbg !81

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, ptr %r, align 4, !dbg !82
  ret i32 %17, !dbg !82
}

define i32 @main() !dbg !83 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !84, !DIExpression(), !85)
  store i32 0, ptr %err, align 4, !dbg !85
  %0 = call i32 @for_break_continue(), !dbg !86
  %1 = icmp ne i32 %0, 18, !dbg !86
  br i1 %1, label %then, label %else, !dbg !86

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !87
  %2 = load i32, ptr %err, align 4, !dbg !87
  br label %if.end, !dbg !87

else:                                             ; preds = %entry
  br label %if.end, !dbg !87

if.end:                                           ; preds = %else, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !88
  %4 = icmp ne i32 %3, 11, !dbg !88
  br i1 %4, label %then1, label %else2, !dbg !88

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !89
  %5 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end3, !dbg !89

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !89

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @switch_break_only(), !dbg !90
  %7 = icmp ne i32 %6, 20, !dbg !90
  br i1 %7, label %then4, label %else5, !dbg !90

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !91
  %8 = load i32, ptr %err, align 4, !dbg !91
  br label %if.end6, !dbg !91

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !91

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !92
  %10 = icmp ne i32 %9, 106, !dbg !92
  br i1 %10, label %then7, label %else8, !dbg !92

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !93
  %11 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end9, !dbg !93

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !93

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !94
  %13 = icmp ne i32 %12, 4, !dbg !94
  br i1 %13, label %then10, label %else11, !dbg !94

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !95
  %14 = load i32, ptr %err, align 4, !dbg !95
  br label %if.end12, !dbg !95

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !95

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !96
  %16 = icmp eq i32 %15, 0, !dbg !96
  br i1 %16, label %then13, label %else14, !dbg !96

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !97
  br label %if.end15, !dbg !97

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !99
  br label %if.end15, !dbg !99

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !101
  ret i32 %19, !dbg !101
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocalVariable(name: "i", scope: !2, file: !1, line: 5, type: !5)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocalVariable(name: "sum", scope: !2, file: !1, line: 4, type: !5)
!10 = !DILocation(line: 4, column: 3, scope: !2)
!11 = !DILocation(line: 6, column: 5, scope: !12)
!12 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 32)
!13 = !DILocation(line: 7, column: 7, scope: !14)
!14 = distinct !DILexicalBlock(scope: !12, file: !1, line: 6, column: 17)
!15 = !DILocation(line: 9, column: 5, scope: !12)
!16 = !DILocation(line: 10, column: 7, scope: !17)
!17 = distinct !DILexicalBlock(scope: !12, file: !1, line: 9, column: 17)
!18 = !DILocation(line: 12, column: 5, scope: !12)
!19 = !DILocation(line: 14, column: 3, scope: !2)
!20 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!21 = !DILocalVariable(name: "r", scope: !20, file: !1, line: 19, type: !5)
!22 = !DILocation(line: 19, column: 3, scope: !20)
!23 = !DILocalVariable(name: "x", scope: !20, file: !1, line: 18, type: !5)
!24 = !DILocation(line: 18, column: 3, scope: !20)
!25 = !DILocation(line: 20, column: 3, scope: !20)
!26 = !DILocation(line: 22, column: 7, scope: !20)
!27 = !DILocation(line: 24, column: 7, scope: !20)
!28 = !DILocation(line: 25, column: 7, scope: !20)
!29 = !DILocation(line: 27, column: 7, scope: !20)
!30 = !DILocation(line: 28, column: 7, scope: !20)
!31 = !DILocation(line: 30, column: 3, scope: !20)
!32 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !3, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!33 = !DILocalVariable(name: "r", scope: !32, file: !1, line: 35, type: !5)
!34 = !DILocation(line: 35, column: 3, scope: !32)
!35 = !DILocalVariable(name: "x", scope: !32, file: !1, line: 34, type: !5)
!36 = !DILocation(line: 34, column: 3, scope: !32)
!37 = !DILocation(line: 36, column: 3, scope: !32)
!38 = !DILocation(line: 38, column: 7, scope: !32)
!39 = !DILocation(line: 39, column: 7, scope: !32)
!40 = !DILocation(line: 41, column: 7, scope: !32)
!41 = !DILocation(line: 42, column: 7, scope: !32)
!42 = !DILocation(line: 44, column: 7, scope: !32)
!43 = !DILocation(line: 45, column: 7, scope: !32)
!44 = !DILocation(line: 47, column: 3, scope: !32)
!45 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !3, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!46 = !DILocalVariable(name: "i", scope: !45, file: !1, line: 52, type: !5)
!47 = !DILocation(line: 52, column: 8, scope: !45)
!48 = !DILocalVariable(name: "sum", scope: !45, file: !1, line: 51, type: !5)
!49 = !DILocation(line: 51, column: 3, scope: !45)
!50 = !DILocation(line: 53, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !1, line: 52, column: 31)
!52 = !DILocation(line: 55, column: 9, scope: !51)
!53 = !DILocation(line: 57, column: 9, scope: !51)
!54 = !DILocation(line: 59, column: 9, scope: !51)
!55 = !DILocation(line: 60, column: 9, scope: !51)
!56 = !DILocation(line: 62, column: 9, scope: !51)
!57 = !DILocation(line: 63, column: 9, scope: !51)
!58 = !DILocation(line: 66, column: 3, scope: !45)
!59 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !3, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!60 = !DILocalVariable(name: "i", scope: !61, file: !1, line: 76, type: !5)
!61 = distinct !DILexicalBlock(scope: !59, file: !1, line: 74, column: 7)
!62 = !DILocation(line: 76, column: 14, scope: !61)
!63 = !DILocalVariable(name: "sum", scope: !61, file: !1, line: 75, type: !5)
!64 = !DILocation(line: 75, column: 9, scope: !61)
!65 = !DILocalVariable(name: "x", scope: !59, file: !1, line: 71, type: !5)
!66 = !DILocation(line: 71, column: 3, scope: !59)
!67 = !DILocalVariable(name: "r", scope: !59, file: !1, line: 70, type: !5)
!68 = !DILocation(line: 70, column: 3, scope: !59)
!69 = !DILocation(line: 72, column: 3, scope: !59)
!70 = !DILocation(line: 77, column: 11, scope: !71)
!71 = distinct !DILexicalBlock(scope: !61, file: !1, line: 76, column: 37)
!72 = !DILocation(line: 78, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !71, file: !1, line: 77, column: 23)
!74 = !DILocation(line: 80, column: 11, scope: !71)
!75 = !DILocation(line: 81, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 80, column: 23)
!77 = !DILocation(line: 83, column: 11, scope: !71)
!78 = !DILocation(line: 85, column: 9, scope: !61)
!79 = !DILocation(line: 87, column: 7, scope: !59)
!80 = !DILocation(line: 89, column: 7, scope: !59)
!81 = !DILocation(line: 90, column: 7, scope: !59)
!82 = !DILocation(line: 92, column: 3, scope: !59)
!83 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !3, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!84 = !DILocalVariable(name: "err", scope: !83, file: !1, line: 96, type: !5)
!85 = !DILocation(line: 96, column: 3, scope: !83)
!86 = !DILocation(line: 98, column: 3, scope: !83)
!87 = !DILocation(line: 98, column: 35, scope: !83)
!88 = !DILocation(line: 99, column: 3, scope: !83)
!89 = !DILocation(line: 99, column: 41, scope: !83)
!90 = !DILocation(line: 100, column: 3, scope: !83)
!91 = !DILocation(line: 100, column: 34, scope: !83)
!92 = !DILocation(line: 101, column: 3, scope: !83)
!93 = !DILocation(line: 101, column: 43, scope: !83)
!94 = !DILocation(line: 102, column: 3, scope: !83)
!95 = !DILocation(line: 102, column: 41, scope: !83)
!96 = !DILocation(line: 104, column: 3, scope: !83)
!97 = !DILocation(line: 105, column: 5, scope: !98)
!98 = distinct !DILexicalBlock(scope: !83, file: !1, line: 104, column: 17)
!99 = !DILocation(line: 107, column: 5, scope: !100)
!100 = distinct !DILexicalBlock(scope: !83, file: !1, line: 106, column: 10)
!101 = !DILocation(line: 109, column: 3, scope: !83)
