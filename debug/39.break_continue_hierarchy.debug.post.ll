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
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !11, !DIExpression(), !12)
  store i32 0, ptr %sum, align 4, !dbg !12
  store i32 0, ptr %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !10
  %1 = icmp slt i32 %0, 10, !dbg !10
  br i1 %1, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !13
  %3 = icmp eq i32 %2, 3, !dbg !13
  br i1 %3, label %then, label %else, !dbg !13

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !15

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !15

if.end:                                           ; preds = %else
  %4 = load i32, ptr %i, align 4, !dbg !17
  %5 = icmp eq i32 %4, 7, !dbg !17
  br i1 %5, label %then1, label %else2, !dbg !17

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !18

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !18

if.end3:                                          ; preds = %else2
  %6 = load i32, ptr %sum, align 4, !dbg !20
  %7 = load i32, ptr %i, align 4, !dbg !20
  %8 = add i32 %6, %7, !dbg !20
  store i32 %8, ptr %sum, align 4, !dbg !20
  %9 = load i32, ptr %sum, align 4, !dbg !20
  br label %for.update, !dbg !20

for.update:                                       ; preds = %if.end3, %then
  %10 = load i32, ptr %i, align 4, !dbg !20
  %11 = add i32 %10, 1, !dbg !20
  store i32 %11, ptr %i, align 4, !dbg !20
  br label %for.cond, !dbg !20

for.end:                                          ; preds = %then1, %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !21
  ret i32 %12, !dbg !21
}

define i32 @switch_break_fallthrough() !dbg !22 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !23, !DIExpression(), !24)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !25, !DIExpression(), !26)
  store i32 1, ptr %x, align 4, !dbg !26
  store i32 0, ptr %r, align 4, !dbg !24
  %0 = load i32, ptr %x, align 4, !dbg !27
  %1 = icmp eq i32 %0, 1, !dbg !27
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !27

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !27
  br i1 %2, label %case.1, label %case.2, !dbg !27

case.0:                                           ; preds = %entry
  %3 = load i32, ptr %r, align 4, !dbg !28
  %4 = add i32 %3, 1, !dbg !28
  store i32 %4, ptr %r, align 4, !dbg !28
  %5 = load i32, ptr %r, align 4, !dbg !28
  br label %case.1, !dbg !28

case.1:                                           ; preds = %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4, !dbg !29
  %7 = add i32 %6, 10, !dbg !29
  store i32 %7, ptr %r, align 4, !dbg !29
  %8 = load i32, ptr %r, align 4, !dbg !29
  br label %switch.end, !dbg !30

case.2:                                           ; preds = %switch.compare.0
  store i32 99, ptr %r, align 4, !dbg !31
  %9 = load i32, ptr %r, align 4, !dbg !31
  br label %switch.end, !dbg !32

switch.end:                                       ; preds = %case.2, %case.1
  %10 = load i32, ptr %r, align 4, !dbg !33
  ret i32 %10, !dbg !33
}

define i32 @switch_break_only() !dbg !34 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !35, !DIExpression(), !36)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !37, !DIExpression(), !38)
  store i32 2, ptr %x, align 4, !dbg !38
  store i32 0, ptr %r, align 4, !dbg !36
  %0 = load i32, ptr %x, align 4, !dbg !39
  %1 = icmp eq i32 %0, 1, !dbg !39
  br i1 %1, label %case.0, label %switch.compare.0, !dbg !39

switch.compare.0:                                 ; preds = %entry
  %2 = icmp eq i32 %0, 2, !dbg !39
  br i1 %2, label %case.1, label %case.2, !dbg !39

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4, !dbg !40
  %3 = load i32, ptr %r, align 4, !dbg !40
  br label %switch.end, !dbg !41

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4, !dbg !42
  %4 = load i32, ptr %r, align 4, !dbg !42
  br label %switch.end, !dbg !43

case.2:                                           ; preds = %switch.compare.0
  store i32 99, ptr %r, align 4, !dbg !44
  %5 = load i32, ptr %r, align 4, !dbg !44
  br label %switch.end, !dbg !45

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %6 = load i32, ptr %r, align 4, !dbg !46
  ret i32 %6, !dbg !46
}

define i32 @for_switch_break_continue() !dbg !47 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !48, !DIExpression(), !49)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !50, !DIExpression(), !51)
  store i32 0, ptr %sum, align 4, !dbg !51
  store i32 0, ptr %i, align 4, !dbg !49
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, ptr %i, align 4, !dbg !49
  %1 = icmp slt i32 %0, 6, !dbg !49
  br i1 %1, label %for.loop, label %for.end, !dbg !49

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !52
  %3 = icmp eq i32 %2, 1, !dbg !52
  br i1 %3, label %case.0, label %switch.compare.0, !dbg !52

switch.compare.0:                                 ; preds = %for.loop
  %4 = icmp eq i32 %2, 3, !dbg !52
  br i1 %4, label %case.1, label %switch.compare.1, !dbg !52

switch.compare.1:                                 ; preds = %switch.compare.0
  %5 = icmp eq i32 %2, 5, !dbg !52
  br i1 %5, label %case.2, label %case.3, !dbg !52

case.0:                                           ; preds = %for.loop
  br label %for.update, !dbg !54

case.1:                                           ; preds = %switch.compare.0
  br label %switch.end, !dbg !55

case.2:                                           ; preds = %switch.compare.1
  %6 = load i32, ptr %sum, align 4, !dbg !56
  %7 = add i32 %6, 100, !dbg !56
  store i32 %7, ptr %sum, align 4, !dbg !56
  %8 = load i32, ptr %sum, align 4, !dbg !56
  br label %switch.end, !dbg !57

case.3:                                           ; preds = %switch.compare.1
  %9 = load i32, ptr %sum, align 4, !dbg !58
  %10 = load i32, ptr %i, align 4, !dbg !58
  %11 = add i32 %9, %10, !dbg !58
  store i32 %11, ptr %sum, align 4, !dbg !58
  %12 = load i32, ptr %sum, align 4, !dbg !58
  br label %switch.end, !dbg !59

switch.end:                                       ; preds = %case.3, %case.2, %case.1
  br label %for.update, !dbg !59

for.update:                                       ; preds = %switch.end, %case.0
  %13 = load i32, ptr %i, align 4, !dbg !59
  %14 = add i32 %13, 1, !dbg !59
  store i32 %14, ptr %i, align 4, !dbg !59
  br label %for.cond, !dbg !59

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %sum, align 4, !dbg !60
  ret i32 %15, !dbg !60
}

define i32 @switch_for_break_continue() !dbg !61 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !62, !DIExpression(), !64)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !65, !DIExpression(), !66)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !67, !DIExpression(), !68)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !69, !DIExpression(), !70)
  store i32 0, ptr %r, align 4, !dbg !70
  store i32 1, ptr %x, align 4, !dbg !68
  %0 = load i32, ptr %x, align 4, !dbg !71
  %1 = icmp eq i32 %0, 1, !dbg !71
  br i1 %1, label %case.0, label %case.1, !dbg !71

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4, !dbg !66
  store i32 0, ptr %i, align 4, !dbg !64
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, ptr %i, align 4, !dbg !64
  %3 = icmp slt i32 %2, 5, !dbg !64
  br i1 %3, label %for.loop, label %for.end, !dbg !64

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !72
  %5 = icmp eq i32 %4, 2, !dbg !72
  br i1 %5, label %then, label %else, !dbg !72

then:                                             ; preds = %for.loop
  br label %for.update, !dbg !74

else:                                             ; preds = %for.loop
  br label %if.end, !dbg !74

if.end:                                           ; preds = %else
  %6 = load i32, ptr %i, align 4, !dbg !76
  %7 = icmp eq i32 %6, 4, !dbg !76
  br i1 %7, label %then1, label %else2, !dbg !76

then1:                                            ; preds = %if.end
  br label %for.end, !dbg !77

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !77

if.end3:                                          ; preds = %else2
  %8 = load i32, ptr %sum, align 4, !dbg !79
  %9 = load i32, ptr %i, align 4, !dbg !79
  %10 = add i32 %8, %9, !dbg !79
  store i32 %10, ptr %sum, align 4, !dbg !79
  %11 = load i32, ptr %sum, align 4, !dbg !79
  br label %for.update, !dbg !79

for.update:                                       ; preds = %if.end3, %then
  %12 = load i32, ptr %i, align 4, !dbg !79
  %13 = add i32 %12, 1, !dbg !79
  store i32 %13, ptr %i, align 4, !dbg !79
  br label %for.cond, !dbg !79

for.end:                                          ; preds = %then1, %for.cond
  %14 = load i32, ptr %sum, align 4, !dbg !80
  store i32 %14, ptr %r, align 4, !dbg !80
  %15 = load i32, ptr %r, align 4, !dbg !80
  br label %switch.end, !dbg !81

case.1:                                           ; preds = %entry
  store i32 -1, ptr %r, align 4, !dbg !82
  %16 = load i32, ptr %r, align 4, !dbg !82
  br label %switch.end, !dbg !83

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, ptr %r, align 4, !dbg !84
  ret i32 %17, !dbg !84
}

define i32 @main() !dbg !85 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !86, !DIExpression(), !87)
  store i32 0, ptr %err, align 4, !dbg !87
  %0 = call i32 @for_break_continue(), !dbg !88
  %1 = icmp ne i32 %0, 18, !dbg !88
  br i1 %1, label %then, label %else, !dbg !88

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !89
  %2 = load i32, ptr %err, align 4, !dbg !89
  br label %if.end, !dbg !89

else:                                             ; preds = %entry
  br label %if.end, !dbg !89

if.end:                                           ; preds = %else, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !90
  %4 = icmp ne i32 %3, 11, !dbg !90
  br i1 %4, label %then1, label %else2, !dbg !90

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !91
  %5 = load i32, ptr %err, align 4, !dbg !91
  br label %if.end3, !dbg !91

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !91

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @switch_break_only(), !dbg !92
  %7 = icmp ne i32 %6, 20, !dbg !92
  br i1 %7, label %then4, label %else5, !dbg !92

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !93
  %8 = load i32, ptr %err, align 4, !dbg !93
  br label %if.end6, !dbg !93

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !93

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !94
  %10 = icmp ne i32 %9, 106, !dbg !94
  br i1 %10, label %then7, label %else8, !dbg !94

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !95
  %11 = load i32, ptr %err, align 4, !dbg !95
  br label %if.end9, !dbg !95

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !95

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !96
  %13 = icmp ne i32 %12, 4, !dbg !96
  br i1 %13, label %then10, label %else11, !dbg !96

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !97
  %14 = load i32, ptr %err, align 4, !dbg !97
  br label %if.end12, !dbg !97

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !97

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !98
  %16 = icmp eq i32 %15, 0, !dbg !98
  br i1 %16, label %then13, label %else14, !dbg !98

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !99
  br label %if.end15, !dbg !99

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !101
  br label %if.end15, !dbg !101

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !103
  ret i32 %19, !dbg !103
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !3, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 9, type: !7)
!10 = !DILocation(line: 9, column: 8, scope: !4)
!11 = !DILocalVariable(name: "sum", scope: !4, file: !3, line: 8, type: !7)
!12 = !DILocation(line: 8, column: 3, scope: !4)
!13 = !DILocation(line: 10, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !4, file: !3, line: 9, column: 32)
!15 = !DILocation(line: 11, column: 7, scope: !16)
!16 = distinct !DILexicalBlock(scope: !14, file: !3, line: 10, column: 17)
!17 = !DILocation(line: 13, column: 5, scope: !14)
!18 = !DILocation(line: 14, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !3, line: 13, column: 17)
!20 = !DILocation(line: 16, column: 5, scope: !14)
!21 = !DILocation(line: 18, column: 3, scope: !4)
!22 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !3, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!23 = !DILocalVariable(name: "r", scope: !22, file: !3, line: 23, type: !7)
!24 = !DILocation(line: 23, column: 3, scope: !22)
!25 = !DILocalVariable(name: "x", scope: !22, file: !3, line: 22, type: !7)
!26 = !DILocation(line: 22, column: 3, scope: !22)
!27 = !DILocation(line: 24, column: 3, scope: !22)
!28 = !DILocation(line: 26, column: 7, scope: !22)
!29 = !DILocation(line: 28, column: 7, scope: !22)
!30 = !DILocation(line: 29, column: 7, scope: !22)
!31 = !DILocation(line: 31, column: 7, scope: !22)
!32 = !DILocation(line: 32, column: 7, scope: !22)
!33 = !DILocation(line: 34, column: 3, scope: !22)
!34 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !3, line: 37, type: !5, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!35 = !DILocalVariable(name: "r", scope: !34, file: !3, line: 39, type: !7)
!36 = !DILocation(line: 39, column: 3, scope: !34)
!37 = !DILocalVariable(name: "x", scope: !34, file: !3, line: 38, type: !7)
!38 = !DILocation(line: 38, column: 3, scope: !34)
!39 = !DILocation(line: 40, column: 3, scope: !34)
!40 = !DILocation(line: 42, column: 7, scope: !34)
!41 = !DILocation(line: 43, column: 7, scope: !34)
!42 = !DILocation(line: 45, column: 7, scope: !34)
!43 = !DILocation(line: 46, column: 7, scope: !34)
!44 = !DILocation(line: 48, column: 7, scope: !34)
!45 = !DILocation(line: 49, column: 7, scope: !34)
!46 = !DILocation(line: 51, column: 3, scope: !34)
!47 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !3, line: 54, type: !5, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!48 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 56, type: !7)
!49 = !DILocation(line: 56, column: 8, scope: !47)
!50 = !DILocalVariable(name: "sum", scope: !47, file: !3, line: 55, type: !7)
!51 = !DILocation(line: 55, column: 3, scope: !47)
!52 = !DILocation(line: 57, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !3, line: 56, column: 31)
!54 = !DILocation(line: 59, column: 9, scope: !53)
!55 = !DILocation(line: 61, column: 9, scope: !53)
!56 = !DILocation(line: 63, column: 9, scope: !53)
!57 = !DILocation(line: 64, column: 9, scope: !53)
!58 = !DILocation(line: 66, column: 9, scope: !53)
!59 = !DILocation(line: 67, column: 9, scope: !53)
!60 = !DILocation(line: 70, column: 3, scope: !47)
!61 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !3, line: 73, type: !5, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!62 = !DILocalVariable(name: "i", scope: !63, file: !3, line: 79, type: !7)
!63 = distinct !DILexicalBlock(scope: !61, file: !3, line: 77, column: 13)
!64 = !DILocation(line: 79, column: 12, scope: !63)
!65 = !DILocalVariable(name: "sum", scope: !63, file: !3, line: 78, type: !7)
!66 = !DILocation(line: 78, column: 7, scope: !63)
!67 = !DILocalVariable(name: "x", scope: !61, file: !3, line: 75, type: !7)
!68 = !DILocation(line: 75, column: 3, scope: !61)
!69 = !DILocalVariable(name: "r", scope: !61, file: !3, line: 74, type: !7)
!70 = !DILocation(line: 74, column: 3, scope: !61)
!71 = !DILocation(line: 76, column: 3, scope: !61)
!72 = !DILocation(line: 80, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !3, line: 79, column: 35)
!74 = !DILocation(line: 81, column: 11, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !3, line: 80, column: 21)
!76 = !DILocation(line: 83, column: 9, scope: !73)
!77 = !DILocation(line: 84, column: 11, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !3, line: 83, column: 21)
!79 = !DILocation(line: 86, column: 9, scope: !73)
!80 = !DILocation(line: 88, column: 7, scope: !63)
!81 = !DILocation(line: 89, column: 7, scope: !61)
!82 = !DILocation(line: 91, column: 7, scope: !61)
!83 = !DILocation(line: 92, column: 7, scope: !61)
!84 = !DILocation(line: 94, column: 3, scope: !61)
!85 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 97, type: !5, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!86 = !DILocalVariable(name: "err", scope: !85, file: !3, line: 98, type: !7)
!87 = !DILocation(line: 98, column: 3, scope: !85)
!88 = !DILocation(line: 100, column: 3, scope: !85)
!89 = !DILocation(line: 100, column: 35, scope: !85)
!90 = !DILocation(line: 101, column: 3, scope: !85)
!91 = !DILocation(line: 101, column: 41, scope: !85)
!92 = !DILocation(line: 102, column: 3, scope: !85)
!93 = !DILocation(line: 102, column: 34, scope: !85)
!94 = !DILocation(line: 103, column: 3, scope: !85)
!95 = !DILocation(line: 103, column: 43, scope: !85)
!96 = !DILocation(line: 104, column: 3, scope: !85)
!97 = !DILocation(line: 104, column: 41, scope: !85)
!98 = !DILocation(line: 106, column: 3, scope: !85)
!99 = !DILocation(line: 107, column: 5, scope: !100)
!100 = distinct !DILexicalBlock(scope: !85, file: !3, line: 106, column: 17)
!101 = !DILocation(line: 109, column: 5, scope: !102)
!102 = distinct !DILexicalBlock(scope: !85, file: !3, line: 108, column: 10)
!103 = !DILocation(line: 111, column: 3, scope: !85)
