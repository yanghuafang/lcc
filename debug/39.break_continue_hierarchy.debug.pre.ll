; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @for_break_continue() !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !8, !DIExpression(), !9)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !10, !DIExpression(), !11)
  store i32 0, ptr %sum, align 4, !dbg !11
  store i32 0, ptr %i, align 4, !dbg !9
  br label %for.cond, !dbg !9

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !9
  %1 = icmp slt i32 %0, 10, !dbg !9
  br i1 %1, label %for.loop, label %for.end, !dbg !9

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !12
  %3 = icmp eq i32 %2, 3, !dbg !12
  br i1 %3, label %then, label %else, !dbg !12

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !14

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !14

if.end:                                           ; preds = %else
  %4 = load i32, ptr %i, align 4, !dbg !16
  %5 = icmp eq i32 %4, 7, !dbg !16
  br i1 %5, label %then1, label %else2, !dbg !16

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !17

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !17

if.end3:                                          ; preds = %else2
  %6 = load i32, ptr %sum, align 4, !dbg !19
  %7 = load i32, ptr %i, align 4, !dbg !19
  %8 = add i32 %6, %7, !dbg !19
  store i32 %8, ptr %sum, align 4, !dbg !19
  %9 = load i32, ptr %sum, align 4, !dbg !19
  br label %for.update, !dbg !19

for.update:                                       ; preds = %if.end3, %then
  %10 = load i32, ptr %i, align 4, !dbg !19
  %11 = add i32 %10, 1, !dbg !19
  store i32 %11, ptr %i, align 4, !dbg !19
  br label %for.cond, !dbg !19

for.end:                                          ; preds = %then1, %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !20
  ret i32 %12, !dbg !20
}

define i32 @switch_break_fallthrough() !dbg !21 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !22, !DIExpression(), !23)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !24, !DIExpression(), !25)
  store i32 1, ptr %x, align 4, !dbg !25
  store i32 0, ptr %r, align 4, !dbg !23
  %0 = load i32, ptr %x, align 4, !dbg !26
  %1 = icmp eq i32 %0, 1, !dbg !26
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !26

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !26
  br i1 %2, label %case.1, label %case.2, !dbg !26

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %r, align 4, !dbg !27
  %4 = add i32 %3, 1, !dbg !27
  store i32 %4, ptr %r, align 4, !dbg !27
  %5 = load i32, ptr %r, align 4, !dbg !27
  br label %case.1, !dbg !27

case.1:                                           ; preds = %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4, !dbg !28
  %7 = add i32 %6, 10, !dbg !28
  store i32 %7, ptr %r, align 4, !dbg !28
  %8 = load i32, ptr %r, align 4, !dbg !28
  br label %switch.end, !dbg !29

case.2:                                           ; preds = %switch.compare.0
  store i32 99, ptr %r, align 4, !dbg !30
  %9 = load i32, ptr %r, align 4, !dbg !30
  br label %switch.end, !dbg !31

switch.end:                                       ; preds = %case.2, %case.1
  %10 = load i32, ptr %r, align 4, !dbg !32
  ret i32 %10, !dbg !32
}

define i32 @switch_break_only() !dbg !33 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !34, !DIExpression(), !35)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !36, !DIExpression(), !37)
  store i32 2, ptr %x, align 4, !dbg !37
  store i32 0, ptr %r, align 4, !dbg !35
  %0 = load i32, ptr %x, align 4, !dbg !38
  %1 = icmp eq i32 %0, 1, !dbg !38
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !38

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !38
  br i1 %2, label %case.1, label %case.2, !dbg !38

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4, !dbg !39
  %3 = load i32, ptr %r, align 4, !dbg !39
  br label %switch.end, !dbg !40

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4, !dbg !41
  %4 = load i32, ptr %r, align 4, !dbg !41
  br label %switch.end, !dbg !42

case.2:                                           ; preds = %switch.compare.0
  store i32 99, ptr %r, align 4, !dbg !43
  %5 = load i32, ptr %r, align 4, !dbg !43
  br label %switch.end, !dbg !44

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %6 = load i32, ptr %r, align 4, !dbg !45
  ret i32 %6, !dbg !45
}

define i32 @for_switch_break_continue() !dbg !46 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !47, !DIExpression(), !48)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !49, !DIExpression(), !50)
  store i32 0, ptr %sum, align 4, !dbg !50
  store i32 0, ptr %i, align 4, !dbg !48
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !48
  %1 = icmp slt i32 %0, 6, !dbg !48
  br i1 %1, label %for.loop, label %for.end, !dbg !48

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !51
  %3 = icmp eq i32 %2, 1, !dbg !51
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !51

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3, !dbg !51
  br i1 %4, label %case.1, label %switch.compare.1, !dbg !51

switch.compare.1:                                 ; preds = %switch.compare.0
  %5 = icmp eq i32 %2, 5, !dbg !51
  br i1 %5, label %case.2, label %case.3, !dbg !51

case.0:                                           ; preds = %for.loop
  br label %for.update, !dbg !53

case.1:                                           ; preds = %switch.compare.0
  br label %switch.end, !dbg !54

case.2:                                           ; preds = %switch.compare.1
  %6 = load i32, ptr %sum, align 4, !dbg !55
  %7 = add i32 %6, 100, !dbg !55
  store i32 %7, ptr %sum, align 4, !dbg !55
  %8 = load i32, ptr %sum, align 4, !dbg !55
  br label %switch.end, !dbg !56

case.3:                                           ; preds = %switch.compare.1
  %9 = load i32, ptr %sum, align 4, !dbg !57
  %10 = load i32, ptr %i, align 4, !dbg !57
  %11 = add i32 %9, %10, !dbg !57
  store i32 %11, ptr %sum, align 4, !dbg !57
  %12 = load i32, ptr %sum, align 4, !dbg !57
  br label %switch.end, !dbg !58

switch.end:                                       ; preds = %case.3, %case.2, %case.1
  br label %for.update, !dbg !58

for.update:                                       ; preds = %switch.end, %case.0
  %13 = load i32, ptr %i, align 4, !dbg !58
  %14 = add i32 %13, 1, !dbg !58
  store i32 %14, ptr %i, align 4, !dbg !58
  br label %for.cond, !dbg !58

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %sum, align 4, !dbg !59
  ret i32 %15, !dbg !59
}

define i32 @switch_for_break_continue() !dbg !60 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !61, !DIExpression(), !63)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !64, !DIExpression(), !65)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !66, !DIExpression(), !67)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !68, !DIExpression(), !69)
  store i32 0, ptr %r, align 4, !dbg !69
  store i32 1, ptr %x, align 4, !dbg !67
  %0 = load i32, ptr %x, align 4, !dbg !70
  %1 = icmp eq i32 %0, 1, !dbg !70
  br i1 %1, label %case.0, label %case.1, !dbg !70

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4, !dbg !65
  store i32 0, ptr %i, align 4, !dbg !63
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, ptr %i, align 4, !dbg !63
  %3 = icmp slt i32 %2, 5, !dbg !63
  br i1 %3, label %for.loop, label %for.end, !dbg !63

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !71
  %5 = icmp eq i32 %4, 2, !dbg !71
  br i1 %5, label %then, label %else, !dbg !71

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !73

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !73

if.end:                                           ; preds = %else
  %6 = load i32, ptr %i, align 4, !dbg !75
  %7 = icmp eq i32 %6, 4, !dbg !75
  br i1 %7, label %then1, label %else2, !dbg !75

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !76

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !76

if.end3:                                          ; preds = %else2
  %8 = load i32, ptr %sum, align 4, !dbg !78
  %9 = load i32, ptr %i, align 4, !dbg !78
  %10 = add i32 %8, %9, !dbg !78
  store i32 %10, ptr %sum, align 4, !dbg !78
  %11 = load i32, ptr %sum, align 4, !dbg !78
  br label %for.update, !dbg !78

for.update:                                       ; preds = %if.end3, %then
  %12 = load i32, ptr %i, align 4, !dbg !78
  %13 = add i32 %12, 1, !dbg !78
  store i32 %13, ptr %i, align 4, !dbg !78
  br label %for.cond, !dbg !78

for.end:                                          ; preds = %then1, %for.cond
  %14 = load i32, ptr %sum, align 4, !dbg !79
  store i32 %14, ptr %r, align 4, !dbg !79
  %15 = load i32, ptr %r, align 4, !dbg !79
  br label %switch.end, !dbg !80

case.1:                                           ; preds = %entry
  store i32 -1, ptr %r, align 4, !dbg !81
  %16 = load i32, ptr %r, align 4, !dbg !81
  br label %switch.end, !dbg !82

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, ptr %r, align 4, !dbg !83
  ret i32 %17, !dbg !83
}

define i32 @main() !dbg !84 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !85, !DIExpression(), !86)
  store i32 0, ptr %err, align 4, !dbg !86
  %0 = call i32 @for_break_continue(), !dbg !87
  %1 = icmp ne i32 %0, 18, !dbg !87
  br i1 %1, label %then, label %else, !dbg !87

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !88
  %2 = load i32, ptr %err, align 4, !dbg !88
  br label %if.end, !dbg !88

else:                                             ; preds = %entry
  br label %if.end, !dbg !88

if.end:                                           ; preds = %else, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !89
  %4 = icmp ne i32 %3, 11, !dbg !89
  br i1 %4, label %then1, label %else2, !dbg !89

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !90
  %5 = load i32, ptr %err, align 4, !dbg !90
  br label %if.end3, !dbg !90

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !90

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @switch_break_only(), !dbg !91
  %7 = icmp ne i32 %6, 20, !dbg !91
  br i1 %7, label %then4, label %else5, !dbg !91

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !92
  %8 = load i32, ptr %err, align 4, !dbg !92
  br label %if.end6, !dbg !92

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !92

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !93
  %10 = icmp ne i32 %9, 106, !dbg !93
  br i1 %10, label %then7, label %else8, !dbg !93

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !94
  %11 = load i32, ptr %err, align 4, !dbg !94
  br label %if.end9, !dbg !94

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !94

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !95
  %13 = icmp ne i32 %12, 4, !dbg !95
  br i1 %13, label %then10, label %else11, !dbg !95

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !96
  %14 = load i32, ptr %err, align 4, !dbg !96
  br label %if.end12, !dbg !96

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !96

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !97
  %16 = icmp eq i32 %15, 0, !dbg !97
  br i1 %16, label %then13, label %else14, !dbg !97

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !98
  br label %if.end15, !dbg !98

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !100
  br label %if.end15, !dbg !100

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !102
  ret i32 %19, !dbg !102
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !3, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 9, type: !7)
!9 = !DILocation(line: 9, column: 8, scope: !4)
!10 = !DILocalVariable(name: "sum", scope: !4, file: !3, line: 8, type: !7)
!11 = !DILocation(line: 8, column: 3, scope: !4)
!12 = !DILocation(line: 10, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !4, file: !3, line: 9, column: 32)
!14 = !DILocation(line: 11, column: 7, scope: !15)
!15 = distinct !DILexicalBlock(scope: !13, file: !3, line: 10, column: 17)
!16 = !DILocation(line: 13, column: 5, scope: !13)
!17 = !DILocation(line: 14, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !13, file: !3, line: 13, column: 17)
!19 = !DILocation(line: 16, column: 5, scope: !13)
!20 = !DILocation(line: 18, column: 3, scope: !4)
!21 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !3, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2)
!22 = !DILocalVariable(name: "r", scope: !21, file: !3, line: 23, type: !7)
!23 = !DILocation(line: 23, column: 3, scope: !21)
!24 = !DILocalVariable(name: "x", scope: !21, file: !3, line: 22, type: !7)
!25 = !DILocation(line: 22, column: 3, scope: !21)
!26 = !DILocation(line: 24, column: 3, scope: !21)
!27 = !DILocation(line: 26, column: 7, scope: !21)
!28 = !DILocation(line: 28, column: 7, scope: !21)
!29 = !DILocation(line: 29, column: 7, scope: !21)
!30 = !DILocation(line: 31, column: 7, scope: !21)
!31 = !DILocation(line: 32, column: 7, scope: !21)
!32 = !DILocation(line: 34, column: 3, scope: !21)
!33 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !3, line: 37, type: !5, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2)
!34 = !DILocalVariable(name: "r", scope: !33, file: !3, line: 39, type: !7)
!35 = !DILocation(line: 39, column: 3, scope: !33)
!36 = !DILocalVariable(name: "x", scope: !33, file: !3, line: 38, type: !7)
!37 = !DILocation(line: 38, column: 3, scope: !33)
!38 = !DILocation(line: 40, column: 3, scope: !33)
!39 = !DILocation(line: 42, column: 7, scope: !33)
!40 = !DILocation(line: 43, column: 7, scope: !33)
!41 = !DILocation(line: 45, column: 7, scope: !33)
!42 = !DILocation(line: 46, column: 7, scope: !33)
!43 = !DILocation(line: 48, column: 7, scope: !33)
!44 = !DILocation(line: 49, column: 7, scope: !33)
!45 = !DILocation(line: 51, column: 3, scope: !33)
!46 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !3, line: 54, type: !5, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !2)
!47 = !DILocalVariable(name: "i", scope: !46, file: !3, line: 56, type: !7)
!48 = !DILocation(line: 56, column: 8, scope: !46)
!49 = !DILocalVariable(name: "sum", scope: !46, file: !3, line: 55, type: !7)
!50 = !DILocation(line: 55, column: 3, scope: !46)
!51 = !DILocation(line: 57, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !3, line: 56, column: 31)
!53 = !DILocation(line: 59, column: 9, scope: !52)
!54 = !DILocation(line: 61, column: 9, scope: !52)
!55 = !DILocation(line: 63, column: 9, scope: !52)
!56 = !DILocation(line: 64, column: 9, scope: !52)
!57 = !DILocation(line: 66, column: 9, scope: !52)
!58 = !DILocation(line: 67, column: 9, scope: !52)
!59 = !DILocation(line: 70, column: 3, scope: !46)
!60 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !3, line: 73, type: !5, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2)
!61 = !DILocalVariable(name: "i", scope: !62, file: !3, line: 79, type: !7)
!62 = distinct !DILexicalBlock(scope: !60, file: !3, line: 77, column: 13)
!63 = !DILocation(line: 79, column: 12, scope: !62)
!64 = !DILocalVariable(name: "sum", scope: !62, file: !3, line: 78, type: !7)
!65 = !DILocation(line: 78, column: 7, scope: !62)
!66 = !DILocalVariable(name: "x", scope: !60, file: !3, line: 75, type: !7)
!67 = !DILocation(line: 75, column: 3, scope: !60)
!68 = !DILocalVariable(name: "r", scope: !60, file: !3, line: 74, type: !7)
!69 = !DILocation(line: 74, column: 3, scope: !60)
!70 = !DILocation(line: 76, column: 3, scope: !60)
!71 = !DILocation(line: 80, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !62, file: !3, line: 79, column: 35)
!73 = !DILocation(line: 81, column: 11, scope: !74)
!74 = distinct !DILexicalBlock(scope: !72, file: !3, line: 80, column: 21)
!75 = !DILocation(line: 83, column: 9, scope: !72)
!76 = !DILocation(line: 84, column: 11, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 83, column: 21)
!78 = !DILocation(line: 86, column: 9, scope: !72)
!79 = !DILocation(line: 88, column: 7, scope: !62)
!80 = !DILocation(line: 89, column: 7, scope: !60)
!81 = !DILocation(line: 91, column: 7, scope: !60)
!82 = !DILocation(line: 92, column: 7, scope: !60)
!83 = !DILocation(line: 94, column: 3, scope: !60)
!84 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 97, type: !5, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2)
!85 = !DILocalVariable(name: "err", scope: !84, file: !3, line: 98, type: !7)
!86 = !DILocation(line: 98, column: 3, scope: !84)
!87 = !DILocation(line: 100, column: 3, scope: !84)
!88 = !DILocation(line: 100, column: 35, scope: !84)
!89 = !DILocation(line: 101, column: 3, scope: !84)
!90 = !DILocation(line: 101, column: 41, scope: !84)
!91 = !DILocation(line: 102, column: 3, scope: !84)
!92 = !DILocation(line: 102, column: 34, scope: !84)
!93 = !DILocation(line: 103, column: 3, scope: !84)
!94 = !DILocation(line: 103, column: 43, scope: !84)
!95 = !DILocation(line: 104, column: 3, scope: !84)
!96 = !DILocation(line: 104, column: 41, scope: !84)
!97 = !DILocation(line: 106, column: 3, scope: !84)
!98 = !DILocation(line: 107, column: 5, scope: !99)
!99 = distinct !DILexicalBlock(scope: !84, file: !3, line: 106, column: 17)
!100 = !DILocation(line: 109, column: 5, scope: !101)
!101 = distinct !DILexicalBlock(scope: !84, file: !3, line: 108, column: 10)
!102 = !DILocation(line: 111, column: 3, scope: !84)
