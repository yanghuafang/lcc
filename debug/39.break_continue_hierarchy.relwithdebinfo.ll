; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

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
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.update, %entry
  %.sink = phi i32 [ %11, %for.update ], [ 0, %entry ]
  store i32 %.sink, ptr %i, align 4, !dbg !11
  %0 = load i32, ptr %i, align 4, !dbg !8
  %1 = icmp slt i32 %0, 10, !dbg !8
  br i1 %1, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !12
  %3 = icmp eq i32 %2, 3, !dbg !12
  br i1 %3, label %for.update, label %if.end, !dbg !12

if.end:                                           ; preds = %for.loop
  %4 = load i32, ptr %i, align 4, !dbg !14
  %5 = icmp eq i32 %4, 7, !dbg !14
  br i1 %5, label %for.end, label %if.end3, !dbg !14

if.end3:                                          ; preds = %if.end
  %6 = load i32, ptr %sum, align 4, !dbg !15
  %7 = load i32, ptr %i, align 4, !dbg !15
  %8 = add i32 %6, %7, !dbg !15
  store i32 %8, ptr %sum, align 4, !dbg !15
  %9 = load i32, ptr %sum, align 4, !dbg !15
  br label %for.update, !dbg !15

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, ptr %i, align 4, !dbg !15
  %11 = add i32 %10, 1, !dbg !15
  br label %for.cond, !dbg !15

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !16
  ret i32 %12, !dbg !16
}

define i32 @switch_break_fallthrough() !dbg !17 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !18, !DIExpression(), !19)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !20, !DIExpression(), !21)
  store i32 1, ptr %x, align 4, !dbg !21
  store i32 0, ptr %r, align 4, !dbg !19
  %0 = load i32, ptr %x, align 4, !dbg !22
  switch i32 %0, label %switch.end [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !22

case.0:                                           ; preds = %entry
  %1 = load i32, ptr %r, align 4, !dbg !23
  %2 = add i32 %1, 1, !dbg !23
  store i32 %2, ptr %r, align 4, !dbg !23
  %3 = load i32, ptr %r, align 4, !dbg !23
  br label %case.1, !dbg !23

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, ptr %r, align 4, !dbg !24
  %5 = add i32 %4, 10, !dbg !24
  br label %switch.end, !dbg !25

switch.end:                                       ; preds = %entry, %case.1
  %.sink = phi i32 [ %5, %case.1 ], [ 99, %entry ]
  store i32 %.sink, ptr %r, align 4, !dbg !26
  %6 = load i32, ptr %r, align 4, !dbg !26
  %7 = load i32, ptr %r, align 4, !dbg !27
  ret i32 %7, !dbg !27
}

define i32 @switch_break_only() !dbg !28 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !29, !DIExpression(), !30)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !31, !DIExpression(), !32)
  store i32 2, ptr %x, align 4, !dbg !32
  store i32 0, ptr %r, align 4, !dbg !30
  %0 = load i32, ptr %x, align 4, !dbg !33
  %switch.selectcmp = icmp eq i32 %0, 2, !dbg !33
  %switch.select = select i1 %switch.selectcmp, i32 20, i32 99, !dbg !33
  %switch.selectcmp1 = icmp eq i32 %0, 1, !dbg !33
  %switch.select2 = select i1 %switch.selectcmp1, i32 10, i32 %switch.select, !dbg !33
  store i32 %switch.select2, ptr %r, align 4, !dbg !34
  %1 = load i32, ptr %r, align 4, !dbg !34
  %2 = load i32, ptr %r, align 4, !dbg !35
  ret i32 %2, !dbg !35
}

define i32 @for_switch_break_continue() !dbg !36 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !39, !DIExpression(), !40)
  store i32 0, ptr %sum, align 4, !dbg !40
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.update, %entry
  %.sink = phi i32 [ %10, %for.update ], [ 0, %entry ]
  store i32 %.sink, ptr %i, align 4, !dbg !41
  %0 = load i32, ptr %i, align 4, !dbg !38
  %1 = icmp slt i32 %0, 6, !dbg !38
  br i1 %1, label %for.loop, label %for.end, !dbg !38

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !42
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !42

case.2:                                           ; preds = %for.loop
  %3 = load i32, ptr %sum, align 4, !dbg !44
  %4 = add i32 %3, 100, !dbg !44
  br label %switch.end.sink.split, !dbg !45

case.3:                                           ; preds = %for.loop
  %5 = load i32, ptr %sum, align 4, !dbg !46
  %6 = load i32, ptr %i, align 4, !dbg !46
  %7 = add i32 %5, %6, !dbg !46
  br label %switch.end.sink.split, !dbg !47

switch.end.sink.split:                            ; preds = %case.2, %case.3
  %.sink1 = phi i32 [ %7, %case.3 ], [ %4, %case.2 ]
  store i32 %.sink1, ptr %sum, align 4, !dbg !48
  %8 = load i32, ptr %sum, align 4, !dbg !48
  br label %for.update, !dbg !47

for.update:                                       ; preds = %for.loop, %switch.end.sink.split, %for.loop
  %9 = load i32, ptr %i, align 4, !dbg !47
  %10 = add i32 %9, 1, !dbg !47
  br label %for.cond, !dbg !47

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !49
  ret i32 %11, !dbg !49
}

define i32 @switch_for_break_continue() !dbg !50 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !51, !DIExpression(), !53)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !54, !DIExpression(), !55)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !56, !DIExpression(), !57)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !58, !DIExpression(), !59)
  store i32 0, ptr %r, align 4, !dbg !59
  store i32 1, ptr %x, align 4, !dbg !57
  %0 = load i32, ptr %x, align 4, !dbg !60
  %1 = icmp eq i32 %0, 1, !dbg !60
  br i1 %1, label %case.0, label %switch.end, !dbg !60

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4, !dbg !55
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.update, %case.0
  %.sink = phi i32 [ %13, %for.update ], [ 0, %case.0 ]
  store i32 %.sink, ptr %i, align 4, !dbg !61
  %2 = load i32, ptr %i, align 4, !dbg !53
  %3 = icmp slt i32 %2, 5, !dbg !53
  br i1 %3, label %for.loop, label %for.end, !dbg !53

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !62
  %5 = icmp eq i32 %4, 2, !dbg !62
  br i1 %5, label %for.update, label %if.end, !dbg !62

if.end:                                           ; preds = %for.loop
  %6 = load i32, ptr %i, align 4, !dbg !64
  %7 = icmp eq i32 %6, 4, !dbg !64
  br i1 %7, label %for.end, label %if.end3, !dbg !64

if.end3:                                          ; preds = %if.end
  %8 = load i32, ptr %sum, align 4, !dbg !65
  %9 = load i32, ptr %i, align 4, !dbg !65
  %10 = add i32 %8, %9, !dbg !65
  store i32 %10, ptr %sum, align 4, !dbg !65
  %11 = load i32, ptr %sum, align 4, !dbg !65
  br label %for.update, !dbg !65

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, ptr %i, align 4, !dbg !65
  %13 = add i32 %12, 1, !dbg !65
  br label %for.cond, !dbg !65

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, ptr %sum, align 4, !dbg !66
  br label %switch.end, !dbg !67

switch.end:                                       ; preds = %entry, %for.end
  %.sink4 = phi i32 [ %14, %for.end ], [ -1, %entry ]
  store i32 %.sink4, ptr %r, align 4, !dbg !68
  %15 = load i32, ptr %r, align 4, !dbg !68
  %16 = load i32, ptr %r, align 4, !dbg !69
  ret i32 %16, !dbg !69
}

define i32 @main() !dbg !70 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !71, !DIExpression(), !72)
  store i32 0, ptr %err, align 4, !dbg !72
  %0 = call i32 @for_break_continue(), !dbg !73
  %1 = icmp ne i32 %0, 18, !dbg !73
  br i1 %1, label %then, label %if.end, !dbg !73

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !74
  %2 = load i32, ptr %err, align 4, !dbg !74
  br label %if.end, !dbg !74

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !75
  %4 = icmp ne i32 %3, 11, !dbg !75
  br i1 %4, label %then1, label %if.end3, !dbg !75

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !76
  %5 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end3, !dbg !76

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !77
  %7 = icmp ne i32 %6, 20, !dbg !77
  br i1 %7, label %then4, label %if.end6, !dbg !77

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !78
  %8 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end6, !dbg !78

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !79
  %10 = icmp ne i32 %9, 106, !dbg !79
  br i1 %10, label %then7, label %if.end9, !dbg !79

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !80
  %11 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end9, !dbg !80

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !81
  %13 = icmp ne i32 %12, 4, !dbg !81
  br i1 %13, label %then10, label %if.end12, !dbg !81

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !82
  %14 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end12, !dbg !82

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, ptr %err, align 4, !dbg !83
  %16 = icmp eq i32 %15, 0, !dbg !83
  %. = select i1 %16, ptr @0, ptr @1, !dbg !84
  %17 = call i32 (ptr, ...) @printf(ptr %.), !dbg !84
  %18 = load i32, ptr %err, align 4, !dbg !85
  ret i32 %18, !dbg !85
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
!11 = !DILocation(line: 0, scope: !2)
!12 = !DILocation(line: 6, column: 5, scope: !13)
!13 = distinct !DILexicalBlock(scope: !2, file: !1, line: 5, column: 32)
!14 = !DILocation(line: 9, column: 5, scope: !13)
!15 = !DILocation(line: 12, column: 5, scope: !13)
!16 = !DILocation(line: 14, column: 3, scope: !2)
!17 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!18 = !DILocalVariable(name: "r", scope: !17, file: !1, line: 19, type: !5)
!19 = !DILocation(line: 19, column: 3, scope: !17)
!20 = !DILocalVariable(name: "x", scope: !17, file: !1, line: 18, type: !5)
!21 = !DILocation(line: 18, column: 3, scope: !17)
!22 = !DILocation(line: 20, column: 3, scope: !17)
!23 = !DILocation(line: 22, column: 7, scope: !17)
!24 = !DILocation(line: 24, column: 7, scope: !17)
!25 = !DILocation(line: 25, column: 7, scope: !17)
!26 = !DILocation(line: 0, scope: !17)
!27 = !DILocation(line: 30, column: 3, scope: !17)
!28 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !3, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!29 = !DILocalVariable(name: "r", scope: !28, file: !1, line: 35, type: !5)
!30 = !DILocation(line: 35, column: 3, scope: !28)
!31 = !DILocalVariable(name: "x", scope: !28, file: !1, line: 34, type: !5)
!32 = !DILocation(line: 34, column: 3, scope: !28)
!33 = !DILocation(line: 36, column: 3, scope: !28)
!34 = !DILocation(line: 0, scope: !28)
!35 = !DILocation(line: 47, column: 3, scope: !28)
!36 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !3, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!37 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 52, type: !5)
!38 = !DILocation(line: 52, column: 8, scope: !36)
!39 = !DILocalVariable(name: "sum", scope: !36, file: !1, line: 51, type: !5)
!40 = !DILocation(line: 51, column: 3, scope: !36)
!41 = !DILocation(line: 0, scope: !36)
!42 = !DILocation(line: 53, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !1, line: 52, column: 31)
!44 = !DILocation(line: 59, column: 9, scope: !43)
!45 = !DILocation(line: 60, column: 9, scope: !43)
!46 = !DILocation(line: 62, column: 9, scope: !43)
!47 = !DILocation(line: 63, column: 9, scope: !43)
!48 = !DILocation(line: 0, scope: !43)
!49 = !DILocation(line: 66, column: 3, scope: !36)
!50 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !3, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!51 = !DILocalVariable(name: "i", scope: !52, file: !1, line: 76, type: !5)
!52 = distinct !DILexicalBlock(scope: !50, file: !1, line: 74, column: 7)
!53 = !DILocation(line: 76, column: 14, scope: !52)
!54 = !DILocalVariable(name: "sum", scope: !52, file: !1, line: 75, type: !5)
!55 = !DILocation(line: 75, column: 9, scope: !52)
!56 = !DILocalVariable(name: "x", scope: !50, file: !1, line: 71, type: !5)
!57 = !DILocation(line: 71, column: 3, scope: !50)
!58 = !DILocalVariable(name: "r", scope: !50, file: !1, line: 70, type: !5)
!59 = !DILocation(line: 70, column: 3, scope: !50)
!60 = !DILocation(line: 72, column: 3, scope: !50)
!61 = !DILocation(line: 0, scope: !52)
!62 = !DILocation(line: 77, column: 11, scope: !63)
!63 = distinct !DILexicalBlock(scope: !52, file: !1, line: 76, column: 37)
!64 = !DILocation(line: 80, column: 11, scope: !63)
!65 = !DILocation(line: 83, column: 11, scope: !63)
!66 = !DILocation(line: 85, column: 9, scope: !52)
!67 = !DILocation(line: 87, column: 7, scope: !50)
!68 = !DILocation(line: 0, scope: !50)
!69 = !DILocation(line: 92, column: 3, scope: !50)
!70 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !3, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!71 = !DILocalVariable(name: "err", scope: !70, file: !1, line: 96, type: !5)
!72 = !DILocation(line: 96, column: 3, scope: !70)
!73 = !DILocation(line: 98, column: 3, scope: !70)
!74 = !DILocation(line: 98, column: 35, scope: !70)
!75 = !DILocation(line: 99, column: 3, scope: !70)
!76 = !DILocation(line: 99, column: 41, scope: !70)
!77 = !DILocation(line: 100, column: 3, scope: !70)
!78 = !DILocation(line: 100, column: 34, scope: !70)
!79 = !DILocation(line: 101, column: 3, scope: !70)
!80 = !DILocation(line: 101, column: 43, scope: !70)
!81 = !DILocation(line: 102, column: 3, scope: !70)
!82 = !DILocation(line: 102, column: 41, scope: !70)
!83 = !DILocation(line: 104, column: 3, scope: !70)
!84 = !DILocation(line: 0, scope: !70)
!85 = !DILocation(line: 109, column: 3, scope: !70)
