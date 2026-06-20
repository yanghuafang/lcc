; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [36 x i8] c"39.break_continue_hierarchy.c FAIL\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @for_break_continue() !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !7, metadata !DIExpression()), !dbg !8
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !9, metadata !DIExpression()), !dbg !10
  store i32 0, i32* %sum, align 4, !dbg !10
  store i32 0, i32* %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !8
  %1 = icmp slt i32 %0, 10, !dbg !8
  br i1 %1, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !11
  %3 = icmp eq i32 %2, 3, !dbg !11
  br i1 %3, label %for.update, label %if.end, !dbg !11

if.end:                                           ; preds = %for.loop
  %4 = load i32, i32* %i, align 4, !dbg !13
  %5 = icmp eq i32 %4, 7, !dbg !13
  br i1 %5, label %for.end, label %if.end3, !dbg !13

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %sum, align 4, !dbg !14
  %7 = load i32, i32* %i, align 4, !dbg !14
  %8 = add i32 %6, %7, !dbg !14
  store i32 %8, i32* %sum, align 4, !dbg !14
  %9 = load i32, i32* %sum, align 4, !dbg !14
  br label %for.update, !dbg !14

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, i32* %i, align 4, !dbg !14
  %11 = add i32 %10, 1, !dbg !14
  store i32 %11, i32* %i, align 4, !dbg !14
  br label %for.cond, !dbg !14

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !15
  ret i32 %12, !dbg !15
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @switch_break_fallthrough() !dbg !16 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !17, metadata !DIExpression()), !dbg !18
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 1, i32* %x, align 4, !dbg !20
  store i32 0, i32* %r, align 4, !dbg !18
  %0 = load i32, i32* %x, align 4, !dbg !21
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !21

case.0:                                           ; preds = %entry
  %1 = load i32, i32* %r, align 4, !dbg !22
  %2 = add i32 %1, 1, !dbg !22
  store i32 %2, i32* %r, align 4, !dbg !22
  %3 = load i32, i32* %r, align 4, !dbg !22
  br label %case.1, !dbg !22

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !23
  %5 = add i32 %4, 10, !dbg !23
  store i32 %5, i32* %r, align 4, !dbg !23
  %6 = load i32, i32* %r, align 4, !dbg !23
  br label %switch.end, !dbg !24

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !25
  %7 = load i32, i32* %r, align 4, !dbg !25
  br label %switch.end, !dbg !26

switch.end:                                       ; preds = %case.2, %case.1
  %8 = load i32, i32* %r, align 4, !dbg !27
  ret i32 %8, !dbg !27
}

define i32 @switch_break_only() !dbg !28 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !29, metadata !DIExpression()), !dbg !30
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 2, i32* %x, align 4, !dbg !32
  store i32 0, i32* %r, align 4, !dbg !30
  %0 = load i32, i32* %x, align 4, !dbg !33
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !33

case.0:                                           ; preds = %entry
  store i32 10, i32* %r, align 4, !dbg !34
  %1 = load i32, i32* %r, align 4, !dbg !34
  br label %switch.end, !dbg !35

case.1:                                           ; preds = %entry
  store i32 20, i32* %r, align 4, !dbg !36
  %2 = load i32, i32* %r, align 4, !dbg !36
  br label %switch.end, !dbg !37

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !38
  %3 = load i32, i32* %r, align 4, !dbg !38
  br label %switch.end, !dbg !39

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !40
  ret i32 %4, !dbg !40
}

define i32 @for_switch_break_continue() !dbg !41 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !43
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %sum, align 4, !dbg !45
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !43
  %1 = icmp slt i32 %0, 6, !dbg !43
  br i1 %1, label %for.loop, label %for.end, !dbg !43

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !46
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !46

case.2:                                           ; preds = %for.loop
  %3 = load i32, i32* %sum, align 4, !dbg !48
  %4 = add i32 %3, 100, !dbg !48
  store i32 %4, i32* %sum, align 4, !dbg !48
  %5 = load i32, i32* %sum, align 4, !dbg !48
  br label %for.update, !dbg !49

case.3:                                           ; preds = %for.loop
  %6 = load i32, i32* %sum, align 4, !dbg !50
  %7 = load i32, i32* %i, align 4, !dbg !50
  %8 = add i32 %6, %7, !dbg !50
  store i32 %8, i32* %sum, align 4, !dbg !50
  %9 = load i32, i32* %sum, align 4, !dbg !50
  br label %for.update, !dbg !51

for.update:                                       ; preds = %case.2, %case.3, %for.loop, %for.loop
  %10 = load i32, i32* %i, align 4, !dbg !51
  %11 = add i32 %10, 1, !dbg !51
  store i32 %11, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !51

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !52
  ret i32 %12, !dbg !52
}

define i32 @switch_for_break_continue() !dbg !53 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !56
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !57, metadata !DIExpression()), !dbg !58
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !59, metadata !DIExpression()), !dbg !60
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 0, i32* %r, align 4, !dbg !62
  store i32 1, i32* %x, align 4, !dbg !60
  %0 = load i32, i32* %x, align 4, !dbg !63
  %1 = icmp eq i32 %0, 1, !dbg !63
  br i1 %1, label %case.0, label %case.1, !dbg !63

case.0:                                           ; preds = %entry
  store i32 0, i32* %sum, align 4, !dbg !58
  store i32 0, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, i32* %i, align 4, !dbg !56
  %3 = icmp slt i32 %2, 5, !dbg !56
  br i1 %3, label %for.loop, label %for.end, !dbg !56

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !64
  %5 = icmp eq i32 %4, 2, !dbg !64
  br i1 %5, label %for.update, label %if.end, !dbg !64

if.end:                                           ; preds = %for.loop
  %6 = load i32, i32* %i, align 4, !dbg !66
  %7 = icmp eq i32 %6, 4, !dbg !66
  br i1 %7, label %for.end, label %if.end3, !dbg !66

if.end3:                                          ; preds = %if.end
  %8 = load i32, i32* %sum, align 4, !dbg !67
  %9 = load i32, i32* %i, align 4, !dbg !67
  %10 = add i32 %8, %9, !dbg !67
  store i32 %10, i32* %sum, align 4, !dbg !67
  %11 = load i32, i32* %sum, align 4, !dbg !67
  br label %for.update, !dbg !67

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, i32* %i, align 4, !dbg !67
  %13 = add i32 %12, 1, !dbg !67
  store i32 %13, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !67

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, i32* %sum, align 4, !dbg !68
  store i32 %14, i32* %r, align 4, !dbg !68
  %15 = load i32, i32* %r, align 4, !dbg !68
  br label %switch.end, !dbg !69

case.1:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4, !dbg !70
  %16 = load i32, i32* %r, align 4, !dbg !70
  br label %switch.end, !dbg !71

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, i32* %r, align 4, !dbg !72
  ret i32 %17, !dbg !72
}

define i32 @main() !dbg !73 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 0, i32* %err, align 4, !dbg !75
  %0 = call i32 @for_break_continue(), !dbg !76
  %1 = icmp ne i32 %0, 18, !dbg !76
  br i1 %1, label %then, label %if.end, !dbg !76

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !77
  %2 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end, !dbg !77

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !78
  %4 = icmp ne i32 %3, 11, !dbg !78
  br i1 %4, label %then1, label %if.end3, !dbg !78

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !79
  %5 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end3, !dbg !79

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !80
  %7 = icmp ne i32 %6, 20, !dbg !80
  br i1 %7, label %then4, label %if.end6, !dbg !80

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !81
  %8 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end6, !dbg !81

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !82
  %10 = icmp ne i32 %9, 106, !dbg !82
  br i1 %10, label %then7, label %if.end9, !dbg !82

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !83
  %11 = load i32, i32* %err, align 4, !dbg !83
  br label %if.end9, !dbg !83

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !84
  %13 = icmp ne i32 %12, 4, !dbg !84
  br i1 %13, label %then10, label %if.end12, !dbg !84

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !85
  %14 = load i32, i32* %err, align 4, !dbg !85
  br label %if.end12, !dbg !85

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !86
  %16 = icmp eq i32 %15, 0, !dbg !86
  %. = select i1 %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), !dbg !87
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !87
  %18 = load i32, i32* %err, align 4, !dbg !88
  ret i32 %18, !dbg !88
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

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
!13 = !DILocation(line: 9, column: 5, scope: !12)
!14 = !DILocation(line: 12, column: 5, scope: !12)
!15 = !DILocation(line: 14, column: 3, scope: !2)
!16 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!17 = !DILocalVariable(name: "r", scope: !16, file: !1, line: 19, type: !5)
!18 = !DILocation(line: 19, column: 3, scope: !16)
!19 = !DILocalVariable(name: "x", scope: !16, file: !1, line: 18, type: !5)
!20 = !DILocation(line: 18, column: 3, scope: !16)
!21 = !DILocation(line: 20, column: 3, scope: !16)
!22 = !DILocation(line: 22, column: 7, scope: !16)
!23 = !DILocation(line: 24, column: 7, scope: !16)
!24 = !DILocation(line: 25, column: 7, scope: !16)
!25 = !DILocation(line: 27, column: 7, scope: !16)
!26 = !DILocation(line: 28, column: 7, scope: !16)
!27 = !DILocation(line: 30, column: 3, scope: !16)
!28 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !3, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!29 = !DILocalVariable(name: "r", scope: !28, file: !1, line: 35, type: !5)
!30 = !DILocation(line: 35, column: 3, scope: !28)
!31 = !DILocalVariable(name: "x", scope: !28, file: !1, line: 34, type: !5)
!32 = !DILocation(line: 34, column: 3, scope: !28)
!33 = !DILocation(line: 36, column: 3, scope: !28)
!34 = !DILocation(line: 38, column: 7, scope: !28)
!35 = !DILocation(line: 39, column: 7, scope: !28)
!36 = !DILocation(line: 41, column: 7, scope: !28)
!37 = !DILocation(line: 42, column: 7, scope: !28)
!38 = !DILocation(line: 44, column: 7, scope: !28)
!39 = !DILocation(line: 45, column: 7, scope: !28)
!40 = !DILocation(line: 47, column: 3, scope: !28)
!41 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !3, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!42 = !DILocalVariable(name: "i", scope: !41, file: !1, line: 52, type: !5)
!43 = !DILocation(line: 52, column: 8, scope: !41)
!44 = !DILocalVariable(name: "sum", scope: !41, file: !1, line: 51, type: !5)
!45 = !DILocation(line: 51, column: 3, scope: !41)
!46 = !DILocation(line: 53, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !1, line: 52, column: 31)
!48 = !DILocation(line: 59, column: 9, scope: !47)
!49 = !DILocation(line: 60, column: 9, scope: !47)
!50 = !DILocation(line: 62, column: 9, scope: !47)
!51 = !DILocation(line: 63, column: 9, scope: !47)
!52 = !DILocation(line: 66, column: 3, scope: !41)
!53 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !3, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!54 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 76, type: !5)
!55 = distinct !DILexicalBlock(scope: !53, file: !1, line: 74, column: 7)
!56 = !DILocation(line: 76, column: 14, scope: !55)
!57 = !DILocalVariable(name: "sum", scope: !55, file: !1, line: 75, type: !5)
!58 = !DILocation(line: 75, column: 9, scope: !55)
!59 = !DILocalVariable(name: "x", scope: !53, file: !1, line: 71, type: !5)
!60 = !DILocation(line: 71, column: 3, scope: !53)
!61 = !DILocalVariable(name: "r", scope: !53, file: !1, line: 70, type: !5)
!62 = !DILocation(line: 70, column: 3, scope: !53)
!63 = !DILocation(line: 72, column: 3, scope: !53)
!64 = !DILocation(line: 77, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !1, line: 76, column: 37)
!66 = !DILocation(line: 80, column: 11, scope: !65)
!67 = !DILocation(line: 83, column: 11, scope: !65)
!68 = !DILocation(line: 85, column: 9, scope: !55)
!69 = !DILocation(line: 87, column: 7, scope: !53)
!70 = !DILocation(line: 89, column: 7, scope: !53)
!71 = !DILocation(line: 90, column: 7, scope: !53)
!72 = !DILocation(line: 92, column: 3, scope: !53)
!73 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !3, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!74 = !DILocalVariable(name: "err", scope: !73, file: !1, line: 96, type: !5)
!75 = !DILocation(line: 96, column: 3, scope: !73)
!76 = !DILocation(line: 98, column: 3, scope: !73)
!77 = !DILocation(line: 98, column: 35, scope: !73)
!78 = !DILocation(line: 99, column: 3, scope: !73)
!79 = !DILocation(line: 99, column: 41, scope: !73)
!80 = !DILocation(line: 100, column: 3, scope: !73)
!81 = !DILocation(line: 100, column: 34, scope: !73)
!82 = !DILocation(line: 101, column: 3, scope: !73)
!83 = !DILocation(line: 101, column: 43, scope: !73)
!84 = !DILocation(line: 102, column: 3, scope: !73)
!85 = !DILocation(line: 102, column: 41, scope: !73)
!86 = !DILocation(line: 104, column: 3, scope: !73)
!87 = !DILocation(line: 0, scope: !73)
!88 = !DILocation(line: 109, column: 3, scope: !73)
