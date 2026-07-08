; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

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
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %.sink = phi i32 [ %11, %for.update ], [ 0, %entry ]
  store i32 %.sink, ptr %i, align 4, !dbg !13
  %0 = load i32, ptr %i, align 4, !dbg !10
  %1 = icmp slt i32 %0, 10, !dbg !10
  br i1 %1, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !14
  %3 = icmp eq i32 %2, 3, !dbg !14
  br i1 %3, label %for.update, label %if.end, !dbg !14

if.end:                                           ; preds = %for.loop
  %4 = load i32, ptr %i, align 4, !dbg !16
  %5 = icmp eq i32 %4, 7, !dbg !16
  br i1 %5, label %for.end, label %if.end3, !dbg !16

if.end3:                                          ; preds = %if.end
  %6 = load i32, ptr %sum, align 4, !dbg !17
  %7 = load i32, ptr %i, align 4, !dbg !17
  %8 = add i32 %6, %7, !dbg !17
  store i32 %8, ptr %sum, align 4, !dbg !17
  %9 = load i32, ptr %sum, align 4, !dbg !17
  br label %for.update, !dbg !17

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, ptr %i, align 4, !dbg !17
  %11 = add i32 %10, 1, !dbg !17
  br label %for.cond, !dbg !17

for.end:                                          ; preds = %if.end, %for.cond
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
  switch i32 %0, label %switch.end [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !24

case.0:                                           ; preds = %entry
  %1 = load i32, ptr %r, align 4, !dbg !25
  %2 = add i32 %1, 1, !dbg !25
  store i32 %2, ptr %r, align 4, !dbg !25
  %3 = load i32, ptr %r, align 4, !dbg !25
  br label %case.1, !dbg !25

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, ptr %r, align 4, !dbg !26
  %5 = add i32 %4, 10, !dbg !26
  br label %switch.end, !dbg !27

switch.end:                                       ; preds = %entry, %case.1
  %.sink = phi i32 [ %5, %case.1 ], [ 99, %entry ]
  store i32 %.sink, ptr %r, align 4, !dbg !28
  %6 = load i32, ptr %r, align 4, !dbg !28
  %7 = load i32, ptr %r, align 4, !dbg !29
  ret i32 %7, !dbg !29
}

define i32 @switch_break_only() !dbg !30 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !31, !DIExpression(), !32)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !33, !DIExpression(), !34)
  store i32 2, ptr %x, align 4, !dbg !34
  store i32 0, ptr %r, align 4, !dbg !32
  %0 = load i32, ptr %x, align 4, !dbg !35
  %switch.selectcmp = icmp eq i32 %0, 2, !dbg !35
  %switch.select = select i1 %switch.selectcmp, i32 20, i32 99, !dbg !35
  %switch.selectcmp1 = icmp eq i32 %0, 1, !dbg !35
  %switch.select2 = select i1 %switch.selectcmp1, i32 10, i32 %switch.select, !dbg !35
  store i32 %switch.select2, ptr %r, align 4, !dbg !36
  %1 = load i32, ptr %r, align 4, !dbg !36
  %2 = load i32, ptr %r, align 4, !dbg !37
  ret i32 %2, !dbg !37
}

define i32 @for_switch_break_continue() !dbg !38 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !39, !DIExpression(), !40)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !41, !DIExpression(), !42)
  store i32 0, ptr %sum, align 4, !dbg !42
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.update, %entry
  %.sink = phi i32 [ %10, %for.update ], [ 0, %entry ]
  store i32 %.sink, ptr %i, align 4, !dbg !43
  %0 = load i32, ptr %i, align 4, !dbg !40
  %1 = icmp slt i32 %0, 6, !dbg !40
  br i1 %1, label %for.loop, label %for.end, !dbg !40

for.loop:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !44
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !44

case.2:                                           ; preds = %for.loop
  %3 = load i32, ptr %sum, align 4, !dbg !46
  %4 = add i32 %3, 100, !dbg !46
  br label %switch.end.sink.split, !dbg !47

case.3:                                           ; preds = %for.loop
  %5 = load i32, ptr %sum, align 4, !dbg !48
  %6 = load i32, ptr %i, align 4, !dbg !48
  %7 = add i32 %5, %6, !dbg !48
  br label %switch.end.sink.split, !dbg !49

switch.end.sink.split:                            ; preds = %case.2, %case.3
  %.sink1 = phi i32 [ %7, %case.3 ], [ %4, %case.2 ]
  store i32 %.sink1, ptr %sum, align 4, !dbg !50
  %8 = load i32, ptr %sum, align 4, !dbg !50
  br label %for.update, !dbg !49

for.update:                                       ; preds = %for.loop, %switch.end.sink.split, %for.loop
  %9 = load i32, ptr %i, align 4, !dbg !49
  %10 = add i32 %9, 1, !dbg !49
  br label %for.cond, !dbg !49

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !51
  ret i32 %11, !dbg !51
}

define i32 @switch_for_break_continue() !dbg !52 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !53, !DIExpression(), !55)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !56, !DIExpression(), !57)
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !58, !DIExpression(), !59)
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !60, !DIExpression(), !61)
  store i32 0, ptr %r, align 4, !dbg !61
  store i32 1, ptr %x, align 4, !dbg !59
  %0 = load i32, ptr %x, align 4, !dbg !62
  %1 = icmp eq i32 %0, 1, !dbg !62
  br i1 %1, label %case.0, label %switch.end, !dbg !62

case.0:                                           ; preds = %entry
  store i32 0, ptr %sum, align 4, !dbg !57
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.update, %case.0
  %.sink = phi i32 [ %13, %for.update ], [ 0, %case.0 ]
  store i32 %.sink, ptr %i, align 4, !dbg !63
  %2 = load i32, ptr %i, align 4, !dbg !55
  %3 = icmp slt i32 %2, 5, !dbg !55
  br i1 %3, label %for.loop, label %for.end, !dbg !55

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !64
  %5 = icmp eq i32 %4, 2, !dbg !64
  br i1 %5, label %for.update, label %if.end, !dbg !64

if.end:                                           ; preds = %for.loop
  %6 = load i32, ptr %i, align 4, !dbg !66
  %7 = icmp eq i32 %6, 4, !dbg !66
  br i1 %7, label %for.end, label %if.end3, !dbg !66

if.end3:                                          ; preds = %if.end
  %8 = load i32, ptr %sum, align 4, !dbg !67
  %9 = load i32, ptr %i, align 4, !dbg !67
  %10 = add i32 %8, %9, !dbg !67
  store i32 %10, ptr %sum, align 4, !dbg !67
  %11 = load i32, ptr %sum, align 4, !dbg !67
  br label %for.update, !dbg !67

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, ptr %i, align 4, !dbg !67
  %13 = add i32 %12, 1, !dbg !67
  br label %for.cond, !dbg !67

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, ptr %sum, align 4, !dbg !68
  br label %switch.end, !dbg !69

switch.end:                                       ; preds = %entry, %for.end
  %.sink4 = phi i32 [ %14, %for.end ], [ -1, %entry ]
  store i32 %.sink4, ptr %r, align 4, !dbg !70
  %15 = load i32, ptr %r, align 4, !dbg !70
  %16 = load i32, ptr %r, align 4, !dbg !71
  ret i32 %16, !dbg !71
}

define i32 @main() !dbg !72 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !73, !DIExpression(), !74)
  store i32 0, ptr %err, align 4, !dbg !74
  %0 = call i32 @for_break_continue(), !dbg !75
  %1 = icmp ne i32 %0, 18, !dbg !75
  br i1 %1, label %then, label %if.end, !dbg !75

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !76
  %2 = load i32, ptr %err, align 4, !dbg !76
  br label %if.end, !dbg !76

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !77
  %4 = icmp ne i32 %3, 11, !dbg !77
  br i1 %4, label %then1, label %if.end3, !dbg !77

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !78
  %5 = load i32, ptr %err, align 4, !dbg !78
  br label %if.end3, !dbg !78

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !79
  %7 = icmp ne i32 %6, 20, !dbg !79
  br i1 %7, label %then4, label %if.end6, !dbg !79

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !80
  %8 = load i32, ptr %err, align 4, !dbg !80
  br label %if.end6, !dbg !80

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !81
  %10 = icmp ne i32 %9, 106, !dbg !81
  br i1 %10, label %then7, label %if.end9, !dbg !81

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !82
  %11 = load i32, ptr %err, align 4, !dbg !82
  br label %if.end9, !dbg !82

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !83
  %13 = icmp ne i32 %12, 4, !dbg !83
  br i1 %13, label %then10, label %if.end12, !dbg !83

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !84
  %14 = load i32, ptr %err, align 4, !dbg !84
  br label %if.end12, !dbg !84

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, ptr %err, align 4, !dbg !85
  %16 = icmp eq i32 %15, 0, !dbg !85
  %. = select i1 %16, ptr @0, ptr @1, !dbg !86
  %17 = call i32 (ptr, ...) @printf(ptr %.), !dbg !86
  %18 = load i32, ptr %err, align 4, !dbg !87
  ret i32 %18, !dbg !87
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 8, scope: !4)
!11 = !DILocalVariable(name: "sum", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocation(line: 0, scope: !4)
!14 = !DILocation(line: 6, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 32)
!16 = !DILocation(line: 9, column: 5, scope: !15)
!17 = !DILocation(line: 12, column: 5, scope: !15)
!18 = !DILocation(line: 14, column: 3, scope: !4)
!19 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!20 = !DILocalVariable(name: "r", scope: !19, file: !1, line: 19, type: !7)
!21 = !DILocation(line: 19, column: 3, scope: !19)
!22 = !DILocalVariable(name: "x", scope: !19, file: !1, line: 18, type: !7)
!23 = !DILocation(line: 18, column: 3, scope: !19)
!24 = !DILocation(line: 20, column: 3, scope: !19)
!25 = !DILocation(line: 22, column: 7, scope: !19)
!26 = !DILocation(line: 24, column: 7, scope: !19)
!27 = !DILocation(line: 25, column: 7, scope: !19)
!28 = !DILocation(line: 0, scope: !19)
!29 = !DILocation(line: 30, column: 3, scope: !19)
!30 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !5, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!31 = !DILocalVariable(name: "r", scope: !30, file: !1, line: 35, type: !7)
!32 = !DILocation(line: 35, column: 3, scope: !30)
!33 = !DILocalVariable(name: "x", scope: !30, file: !1, line: 34, type: !7)
!34 = !DILocation(line: 34, column: 3, scope: !30)
!35 = !DILocation(line: 36, column: 3, scope: !30)
!36 = !DILocation(line: 0, scope: !30)
!37 = !DILocation(line: 47, column: 3, scope: !30)
!38 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !5, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!39 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 52, type: !7)
!40 = !DILocation(line: 52, column: 8, scope: !38)
!41 = !DILocalVariable(name: "sum", scope: !38, file: !1, line: 51, type: !7)
!42 = !DILocation(line: 51, column: 3, scope: !38)
!43 = !DILocation(line: 0, scope: !38)
!44 = !DILocation(line: 53, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 52, column: 31)
!46 = !DILocation(line: 59, column: 9, scope: !45)
!47 = !DILocation(line: 60, column: 9, scope: !45)
!48 = !DILocation(line: 62, column: 9, scope: !45)
!49 = !DILocation(line: 63, column: 9, scope: !45)
!50 = !DILocation(line: 0, scope: !45)
!51 = !DILocation(line: 66, column: 3, scope: !38)
!52 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !5, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!53 = !DILocalVariable(name: "i", scope: !54, file: !1, line: 76, type: !7)
!54 = distinct !DILexicalBlock(scope: !52, file: !1, line: 74, column: 7)
!55 = !DILocation(line: 76, column: 14, scope: !54)
!56 = !DILocalVariable(name: "sum", scope: !54, file: !1, line: 75, type: !7)
!57 = !DILocation(line: 75, column: 9, scope: !54)
!58 = !DILocalVariable(name: "x", scope: !52, file: !1, line: 71, type: !7)
!59 = !DILocation(line: 71, column: 3, scope: !52)
!60 = !DILocalVariable(name: "r", scope: !52, file: !1, line: 70, type: !7)
!61 = !DILocation(line: 70, column: 3, scope: !52)
!62 = !DILocation(line: 72, column: 3, scope: !52)
!63 = !DILocation(line: 0, scope: !54)
!64 = !DILocation(line: 77, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !54, file: !1, line: 76, column: 37)
!66 = !DILocation(line: 80, column: 11, scope: !65)
!67 = !DILocation(line: 83, column: 11, scope: !65)
!68 = !DILocation(line: 85, column: 9, scope: !54)
!69 = !DILocation(line: 87, column: 7, scope: !52)
!70 = !DILocation(line: 0, scope: !52)
!71 = !DILocation(line: 92, column: 3, scope: !52)
!72 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !5, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!73 = !DILocalVariable(name: "err", scope: !72, file: !1, line: 96, type: !7)
!74 = !DILocation(line: 96, column: 3, scope: !72)
!75 = !DILocation(line: 98, column: 3, scope: !72)
!76 = !DILocation(line: 98, column: 35, scope: !72)
!77 = !DILocation(line: 99, column: 3, scope: !72)
!78 = !DILocation(line: 99, column: 41, scope: !72)
!79 = !DILocation(line: 100, column: 3, scope: !72)
!80 = !DILocation(line: 100, column: 34, scope: !72)
!81 = !DILocation(line: 101, column: 3, scope: !72)
!82 = !DILocation(line: 101, column: 43, scope: !72)
!83 = !DILocation(line: 102, column: 3, scope: !72)
!84 = !DILocation(line: 102, column: 41, scope: !72)
!85 = !DILocation(line: 104, column: 3, scope: !72)
!86 = !DILocation(line: 0, scope: !72)
!87 = !DILocation(line: 109, column: 3, scope: !72)
