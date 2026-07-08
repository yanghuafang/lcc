; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @for_break_continue() !dbg !4 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !9, metadata !DIExpression()), !dbg !10
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %sum, align 4, !dbg !12
  store i32 0, i32* %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !10
  %1 = icmp slt i32 %0, 10, !dbg !10
  br i1 %1, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !13
  %3 = icmp eq i32 %2, 3, !dbg !13
  br i1 %3, label %for.update, label %if.end, !dbg !13

if.end:                                           ; preds = %for.loop
  %4 = load i32, i32* %i, align 4, !dbg !15
  %5 = icmp eq i32 %4, 7, !dbg !15
  br i1 %5, label %for.end, label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %sum, align 4, !dbg !16
  %7 = load i32, i32* %i, align 4, !dbg !16
  %8 = add i32 %6, %7, !dbg !16
  store i32 %8, i32* %sum, align 4, !dbg !16
  %9 = load i32, i32* %sum, align 4, !dbg !16
  br label %for.update, !dbg !16

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, i32* %i, align 4, !dbg !16
  %11 = add i32 %10, 1, !dbg !16
  store i32 %11, i32* %i, align 4, !dbg !16
  br label %for.cond, !dbg !16

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !17
  ret i32 %12, !dbg !17
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @switch_break_fallthrough() !dbg !18 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !19, metadata !DIExpression()), !dbg !20
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 1, i32* %x, align 4, !dbg !22
  store i32 0, i32* %r, align 4, !dbg !20
  %0 = load i32, i32* %x, align 4, !dbg !23
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !23

case.0:                                           ; preds = %entry
  %1 = load i32, i32* %r, align 4, !dbg !24
  %2 = add i32 %1, 1, !dbg !24
  store i32 %2, i32* %r, align 4, !dbg !24
  %3 = load i32, i32* %r, align 4, !dbg !24
  br label %case.1, !dbg !24

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !25
  %5 = add i32 %4, 10, !dbg !25
  store i32 %5, i32* %r, align 4, !dbg !25
  %6 = load i32, i32* %r, align 4, !dbg !25
  br label %switch.end, !dbg !26

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !27
  %7 = load i32, i32* %r, align 4, !dbg !27
  br label %switch.end, !dbg !28

switch.end:                                       ; preds = %case.2, %case.1
  %8 = load i32, i32* %r, align 4, !dbg !29
  ret i32 %8, !dbg !29
}

define i32 @switch_break_only() !dbg !30 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !31, metadata !DIExpression()), !dbg !32
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 2, i32* %x, align 4, !dbg !34
  store i32 0, i32* %r, align 4, !dbg !32
  %0 = load i32, i32* %x, align 4, !dbg !35
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !35

case.0:                                           ; preds = %entry
  store i32 10, i32* %r, align 4, !dbg !36
  %1 = load i32, i32* %r, align 4, !dbg !36
  br label %switch.end, !dbg !37

case.1:                                           ; preds = %entry
  store i32 20, i32* %r, align 4, !dbg !38
  %2 = load i32, i32* %r, align 4, !dbg !38
  br label %switch.end, !dbg !39

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !40
  %3 = load i32, i32* %r, align 4, !dbg !40
  br label %switch.end, !dbg !41

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !42
  ret i32 %4, !dbg !42
}

define i32 @for_switch_break_continue() !dbg !43 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !45
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 0, i32* %sum, align 4, !dbg !47
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !45
  %1 = icmp slt i32 %0, 6, !dbg !45
  br i1 %1, label %for.loop, label %for.end, !dbg !45

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !48
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !48

case.2:                                           ; preds = %for.loop
  %3 = load i32, i32* %sum, align 4, !dbg !50
  %4 = add i32 %3, 100, !dbg !50
  store i32 %4, i32* %sum, align 4, !dbg !50
  %5 = load i32, i32* %sum, align 4, !dbg !50
  br label %for.update, !dbg !51

case.3:                                           ; preds = %for.loop
  %6 = load i32, i32* %sum, align 4, !dbg !52
  %7 = load i32, i32* %i, align 4, !dbg !52
  %8 = add i32 %6, %7, !dbg !52
  store i32 %8, i32* %sum, align 4, !dbg !52
  %9 = load i32, i32* %sum, align 4, !dbg !52
  br label %for.update, !dbg !53

for.update:                                       ; preds = %case.2, %case.3, %for.loop, %for.loop
  %10 = load i32, i32* %i, align 4, !dbg !53
  %11 = add i32 %10, 1, !dbg !53
  store i32 %11, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !53

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !54
  ret i32 %12, !dbg !54
}

define i32 @switch_for_break_continue() !dbg !55 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !56, metadata !DIExpression()), !dbg !58
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !59, metadata !DIExpression()), !dbg !60
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !61, metadata !DIExpression()), !dbg !62
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 0, i32* %r, align 4, !dbg !64
  store i32 1, i32* %x, align 4, !dbg !62
  %0 = load i32, i32* %x, align 4, !dbg !65
  %1 = icmp eq i32 %0, 1, !dbg !65
  br i1 %1, label %case.0, label %case.1, !dbg !65

case.0:                                           ; preds = %entry
  store i32 0, i32* %sum, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, i32* %i, align 4, !dbg !58
  %3 = icmp slt i32 %2, 5, !dbg !58
  br i1 %3, label %for.loop, label %for.end, !dbg !58

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !66
  %5 = icmp eq i32 %4, 2, !dbg !66
  br i1 %5, label %for.update, label %if.end, !dbg !66

if.end:                                           ; preds = %for.loop
  %6 = load i32, i32* %i, align 4, !dbg !68
  %7 = icmp eq i32 %6, 4, !dbg !68
  br i1 %7, label %for.end, label %if.end3, !dbg !68

if.end3:                                          ; preds = %if.end
  %8 = load i32, i32* %sum, align 4, !dbg !69
  %9 = load i32, i32* %i, align 4, !dbg !69
  %10 = add i32 %8, %9, !dbg !69
  store i32 %10, i32* %sum, align 4, !dbg !69
  %11 = load i32, i32* %sum, align 4, !dbg !69
  br label %for.update, !dbg !69

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, i32* %i, align 4, !dbg !69
  %13 = add i32 %12, 1, !dbg !69
  store i32 %13, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !69

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, i32* %sum, align 4, !dbg !70
  store i32 %14, i32* %r, align 4, !dbg !70
  %15 = load i32, i32* %r, align 4, !dbg !70
  br label %switch.end, !dbg !71

case.1:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4, !dbg !72
  %16 = load i32, i32* %r, align 4, !dbg !72
  br label %switch.end, !dbg !73

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, i32* %r, align 4, !dbg !74
  ret i32 %17, !dbg !74
}

define i32 @main() !dbg !75 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 0, i32* %err, align 4, !dbg !77
  %0 = call i32 @for_break_continue(), !dbg !78
  %1 = icmp ne i32 %0, 18, !dbg !78
  br i1 %1, label %then, label %if.end, !dbg !78

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !79
  %2 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end, !dbg !79

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !80
  %4 = icmp ne i32 %3, 11, !dbg !80
  br i1 %4, label %then1, label %if.end3, !dbg !80

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !81
  %5 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end3, !dbg !81

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !82
  %7 = icmp ne i32 %6, 20, !dbg !82
  br i1 %7, label %then4, label %if.end6, !dbg !82

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !83
  %8 = load i32, i32* %err, align 4, !dbg !83
  br label %if.end6, !dbg !83

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !84
  %10 = icmp ne i32 %9, 106, !dbg !84
  br i1 %10, label %then7, label %if.end9, !dbg !84

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !85
  %11 = load i32, i32* %err, align 4, !dbg !85
  br label %if.end9, !dbg !85

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !86
  %13 = icmp ne i32 %12, 4, !dbg !86
  br i1 %13, label %then10, label %if.end12, !dbg !86

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !87
  %14 = load i32, i32* %err, align 4, !dbg !87
  br label %if.end12, !dbg !87

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !88
  %16 = icmp eq i32 %15, 0, !dbg !88
  %. = select i1 %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), !dbg !89
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !89
  %18 = load i32, i32* %err, align 4, !dbg !90
  ret i32 %18, !dbg !90
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!2 = !{i32 7, !"PIC Level", i32 2}
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
!13 = !DILocation(line: 6, column: 5, scope: !14)
!14 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 32)
!15 = !DILocation(line: 9, column: 5, scope: !14)
!16 = !DILocation(line: 12, column: 5, scope: !14)
!17 = !DILocation(line: 14, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !5, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!19 = !DILocalVariable(name: "r", scope: !18, file: !1, line: 19, type: !7)
!20 = !DILocation(line: 19, column: 3, scope: !18)
!21 = !DILocalVariable(name: "x", scope: !18, file: !1, line: 18, type: !7)
!22 = !DILocation(line: 18, column: 3, scope: !18)
!23 = !DILocation(line: 20, column: 3, scope: !18)
!24 = !DILocation(line: 22, column: 7, scope: !18)
!25 = !DILocation(line: 24, column: 7, scope: !18)
!26 = !DILocation(line: 25, column: 7, scope: !18)
!27 = !DILocation(line: 27, column: 7, scope: !18)
!28 = !DILocation(line: 28, column: 7, scope: !18)
!29 = !DILocation(line: 30, column: 3, scope: !18)
!30 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !5, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!31 = !DILocalVariable(name: "r", scope: !30, file: !1, line: 35, type: !7)
!32 = !DILocation(line: 35, column: 3, scope: !30)
!33 = !DILocalVariable(name: "x", scope: !30, file: !1, line: 34, type: !7)
!34 = !DILocation(line: 34, column: 3, scope: !30)
!35 = !DILocation(line: 36, column: 3, scope: !30)
!36 = !DILocation(line: 38, column: 7, scope: !30)
!37 = !DILocation(line: 39, column: 7, scope: !30)
!38 = !DILocation(line: 41, column: 7, scope: !30)
!39 = !DILocation(line: 42, column: 7, scope: !30)
!40 = !DILocation(line: 44, column: 7, scope: !30)
!41 = !DILocation(line: 45, column: 7, scope: !30)
!42 = !DILocation(line: 47, column: 3, scope: !30)
!43 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !5, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!44 = !DILocalVariable(name: "i", scope: !43, file: !1, line: 52, type: !7)
!45 = !DILocation(line: 52, column: 8, scope: !43)
!46 = !DILocalVariable(name: "sum", scope: !43, file: !1, line: 51, type: !7)
!47 = !DILocation(line: 51, column: 3, scope: !43)
!48 = !DILocation(line: 53, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 52, column: 31)
!50 = !DILocation(line: 59, column: 9, scope: !49)
!51 = !DILocation(line: 60, column: 9, scope: !49)
!52 = !DILocation(line: 62, column: 9, scope: !49)
!53 = !DILocation(line: 63, column: 9, scope: !49)
!54 = !DILocation(line: 66, column: 3, scope: !43)
!55 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !5, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!56 = !DILocalVariable(name: "i", scope: !57, file: !1, line: 76, type: !7)
!57 = distinct !DILexicalBlock(scope: !55, file: !1, line: 74, column: 7)
!58 = !DILocation(line: 76, column: 14, scope: !57)
!59 = !DILocalVariable(name: "sum", scope: !57, file: !1, line: 75, type: !7)
!60 = !DILocation(line: 75, column: 9, scope: !57)
!61 = !DILocalVariable(name: "x", scope: !55, file: !1, line: 71, type: !7)
!62 = !DILocation(line: 71, column: 3, scope: !55)
!63 = !DILocalVariable(name: "r", scope: !55, file: !1, line: 70, type: !7)
!64 = !DILocation(line: 70, column: 3, scope: !55)
!65 = !DILocation(line: 72, column: 3, scope: !55)
!66 = !DILocation(line: 77, column: 11, scope: !67)
!67 = distinct !DILexicalBlock(scope: !57, file: !1, line: 76, column: 37)
!68 = !DILocation(line: 80, column: 11, scope: !67)
!69 = !DILocation(line: 83, column: 11, scope: !67)
!70 = !DILocation(line: 85, column: 9, scope: !57)
!71 = !DILocation(line: 87, column: 7, scope: !55)
!72 = !DILocation(line: 89, column: 7, scope: !55)
!73 = !DILocation(line: 90, column: 7, scope: !55)
!74 = !DILocation(line: 92, column: 3, scope: !55)
!75 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !5, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!76 = !DILocalVariable(name: "err", scope: !75, file: !1, line: 96, type: !7)
!77 = !DILocation(line: 96, column: 3, scope: !75)
!78 = !DILocation(line: 98, column: 3, scope: !75)
!79 = !DILocation(line: 98, column: 35, scope: !75)
!80 = !DILocation(line: 99, column: 3, scope: !75)
!81 = !DILocation(line: 99, column: 41, scope: !75)
!82 = !DILocation(line: 100, column: 3, scope: !75)
!83 = !DILocation(line: 100, column: 34, scope: !75)
!84 = !DILocation(line: 101, column: 3, scope: !75)
!85 = !DILocation(line: 101, column: 43, scope: !75)
!86 = !DILocation(line: 102, column: 3, scope: !75)
!87 = !DILocation(line: 102, column: 41, scope: !75)
!88 = !DILocation(line: 104, column: 3, scope: !75)
!89 = !DILocation(line: 0, scope: !75)
!90 = !DILocation(line: 109, column: 3, scope: !75)
