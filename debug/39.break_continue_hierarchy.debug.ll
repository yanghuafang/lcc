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
  %4 = load i32, i32* %i, align 4, !dbg !12
  %5 = icmp eq i32 %4, 7, !dbg !12
  br i1 %5, label %for.end, label %if.end3, !dbg !12

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %sum, align 4, !dbg !13
  %7 = load i32, i32* %i, align 4, !dbg !13
  %8 = add i32 %6, %7, !dbg !13
  store i32 %8, i32* %sum, align 4, !dbg !13
  %9 = load i32, i32* %sum, align 4, !dbg !13
  br label %for.update, !dbg !13

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, i32* %i, align 4, !dbg !13
  %11 = add i32 %10, 1, !dbg !13
  store i32 %11, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !14
  ret i32 %12, !dbg !14
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #0

define i32 @switch_break_fallthrough() !dbg !15 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !16, metadata !DIExpression()), !dbg !17
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 1, i32* %x, align 4, !dbg !19
  store i32 0, i32* %r, align 4, !dbg !17
  %0 = load i32, i32* %x, align 4, !dbg !20
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !20

case.0:                                           ; preds = %entry
  %1 = load i32, i32* %r, align 4, !dbg !21
  %2 = add i32 %1, 1, !dbg !21
  store i32 %2, i32* %r, align 4, !dbg !21
  %3 = load i32, i32* %r, align 4, !dbg !21
  br label %case.1, !dbg !21

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !22
  %5 = add i32 %4, 10, !dbg !22
  store i32 %5, i32* %r, align 4, !dbg !22
  %6 = load i32, i32* %r, align 4, !dbg !22
  br label %switch.end, !dbg !23

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !24
  %7 = load i32, i32* %r, align 4, !dbg !24
  br label %switch.end, !dbg !25

switch.end:                                       ; preds = %case.2, %case.1
  %8 = load i32, i32* %r, align 4, !dbg !26
  ret i32 %8, !dbg !26
}

define i32 @switch_break_only() !dbg !27 {
entry:
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !28, metadata !DIExpression()), !dbg !29
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 2, i32* %x, align 4, !dbg !31
  store i32 0, i32* %r, align 4, !dbg !29
  %0 = load i32, i32* %x, align 4, !dbg !32
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !32

case.0:                                           ; preds = %entry
  store i32 10, i32* %r, align 4, !dbg !33
  %1 = load i32, i32* %r, align 4, !dbg !33
  br label %switch.end, !dbg !34

case.1:                                           ; preds = %entry
  store i32 20, i32* %r, align 4, !dbg !35
  %2 = load i32, i32* %r, align 4, !dbg !35
  br label %switch.end, !dbg !36

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !37
  %3 = load i32, i32* %r, align 4, !dbg !37
  br label %switch.end, !dbg !38

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !39
  ret i32 %4, !dbg !39
}

define i32 @for_switch_break_continue() !dbg !40 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !42
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 0, i32* %sum, align 4, !dbg !44
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !42
  %1 = icmp slt i32 %0, 6, !dbg !42
  br i1 %1, label %for.loop, label %for.end, !dbg !42

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !45
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !45

case.2:                                           ; preds = %for.loop
  %3 = load i32, i32* %sum, align 4, !dbg !46
  %4 = add i32 %3, 100, !dbg !46
  store i32 %4, i32* %sum, align 4, !dbg !46
  %5 = load i32, i32* %sum, align 4, !dbg !46
  br label %for.update, !dbg !47

case.3:                                           ; preds = %for.loop
  %6 = load i32, i32* %sum, align 4, !dbg !48
  %7 = load i32, i32* %i, align 4, !dbg !48
  %8 = add i32 %6, %7, !dbg !48
  store i32 %8, i32* %sum, align 4, !dbg !48
  %9 = load i32, i32* %sum, align 4, !dbg !48
  br label %for.update, !dbg !49

for.update:                                       ; preds = %case.2, %case.3, %for.loop, %for.loop
  %10 = load i32, i32* %i, align 4, !dbg !49
  %11 = add i32 %10, 1, !dbg !49
  store i32 %11, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !49

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !50
  ret i32 %12, !dbg !50
}

define i32 @switch_for_break_continue() !dbg !51 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !DIExpression()), !dbg !53
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !54, metadata !DIExpression()), !dbg !55
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !56, metadata !DIExpression()), !dbg !57
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %r, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 0, i32* %r, align 4, !dbg !59
  store i32 1, i32* %x, align 4, !dbg !57
  %0 = load i32, i32* %x, align 4, !dbg !60
  %1 = icmp eq i32 %0, 1, !dbg !60
  br i1 %1, label %case.0, label %case.1, !dbg !60

case.0:                                           ; preds = %entry
  store i32 0, i32* %sum, align 4, !dbg !55
  store i32 0, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, i32* %i, align 4, !dbg !53
  %3 = icmp slt i32 %2, 5, !dbg !53
  br i1 %3, label %for.loop, label %for.end, !dbg !53

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !61
  %5 = icmp eq i32 %4, 2, !dbg !61
  br i1 %5, label %for.update, label %if.end, !dbg !61

if.end:                                           ; preds = %for.loop
  %6 = load i32, i32* %i, align 4, !dbg !62
  %7 = icmp eq i32 %6, 4, !dbg !62
  br i1 %7, label %for.end, label %if.end3, !dbg !62

if.end3:                                          ; preds = %if.end
  %8 = load i32, i32* %sum, align 4, !dbg !63
  %9 = load i32, i32* %i, align 4, !dbg !63
  %10 = add i32 %8, %9, !dbg !63
  store i32 %10, i32* %sum, align 4, !dbg !63
  %11 = load i32, i32* %sum, align 4, !dbg !63
  br label %for.update, !dbg !63

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, i32* %i, align 4, !dbg !63
  %13 = add i32 %12, 1, !dbg !63
  store i32 %13, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !63

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, i32* %sum, align 4, !dbg !64
  store i32 %14, i32* %r, align 4, !dbg !64
  %15 = load i32, i32* %r, align 4, !dbg !64
  br label %switch.end, !dbg !65

case.1:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4, !dbg !66
  %16 = load i32, i32* %r, align 4, !dbg !66
  br label %switch.end, !dbg !67

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, i32* %r, align 4, !dbg !68
  ret i32 %17, !dbg !68
}

define i32 @main() !dbg !69 {
entry:
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %err, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 0, i32* %err, align 4, !dbg !71
  %0 = call i32 @for_break_continue(), !dbg !72
  %1 = icmp ne i32 %0, 18, !dbg !72
  br i1 %1, label %then, label %if.end, !dbg !72

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !73
  %2 = load i32, i32* %err, align 4, !dbg !73
  br label %if.end, !dbg !73

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !74
  %4 = icmp ne i32 %3, 11, !dbg !74
  br i1 %4, label %then1, label %if.end3, !dbg !74

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !75
  %5 = load i32, i32* %err, align 4, !dbg !75
  br label %if.end3, !dbg !75

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !76
  %7 = icmp ne i32 %6, 20, !dbg !76
  br i1 %7, label %then4, label %if.end6, !dbg !76

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !77
  %8 = load i32, i32* %err, align 4, !dbg !77
  br label %if.end6, !dbg !77

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !78
  %10 = icmp ne i32 %9, 106, !dbg !78
  br i1 %10, label %then7, label %if.end9, !dbg !78

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !79
  %11 = load i32, i32* %err, align 4, !dbg !79
  br label %if.end9, !dbg !79

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !80
  %13 = icmp ne i32 %12, 4, !dbg !80
  br i1 %13, label %then10, label %if.end12, !dbg !80

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !81
  %14 = load i32, i32* %err, align 4, !dbg !81
  br label %if.end12, !dbg !81

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !82
  %16 = icmp eq i32 %15, 0, !dbg !82
  %. = select i1 %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), !dbg !83
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !83
  %18 = load i32, i32* %err, align 4, !dbg !84
  ret i32 %18, !dbg !84
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
!11 = !DILocation(line: 6, column: 5, scope: !2)
!12 = !DILocation(line: 9, column: 5, scope: !2)
!13 = !DILocation(line: 12, column: 5, scope: !2)
!14 = !DILocation(line: 14, column: 3, scope: !2)
!15 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!16 = !DILocalVariable(name: "r", scope: !15, file: !1, line: 19, type: !5)
!17 = !DILocation(line: 19, column: 3, scope: !15)
!18 = !DILocalVariable(name: "x", scope: !15, file: !1, line: 18, type: !5)
!19 = !DILocation(line: 18, column: 3, scope: !15)
!20 = !DILocation(line: 20, column: 3, scope: !15)
!21 = !DILocation(line: 22, column: 7, scope: !15)
!22 = !DILocation(line: 24, column: 7, scope: !15)
!23 = !DILocation(line: 25, column: 7, scope: !15)
!24 = !DILocation(line: 27, column: 7, scope: !15)
!25 = !DILocation(line: 28, column: 7, scope: !15)
!26 = !DILocation(line: 30, column: 3, scope: !15)
!27 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !3, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!28 = !DILocalVariable(name: "r", scope: !27, file: !1, line: 35, type: !5)
!29 = !DILocation(line: 35, column: 3, scope: !27)
!30 = !DILocalVariable(name: "x", scope: !27, file: !1, line: 34, type: !5)
!31 = !DILocation(line: 34, column: 3, scope: !27)
!32 = !DILocation(line: 36, column: 3, scope: !27)
!33 = !DILocation(line: 38, column: 7, scope: !27)
!34 = !DILocation(line: 39, column: 7, scope: !27)
!35 = !DILocation(line: 41, column: 7, scope: !27)
!36 = !DILocation(line: 42, column: 7, scope: !27)
!37 = !DILocation(line: 44, column: 7, scope: !27)
!38 = !DILocation(line: 45, column: 7, scope: !27)
!39 = !DILocation(line: 47, column: 3, scope: !27)
!40 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !3, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!41 = !DILocalVariable(name: "i", scope: !40, file: !1, line: 52, type: !5)
!42 = !DILocation(line: 52, column: 8, scope: !40)
!43 = !DILocalVariable(name: "sum", scope: !40, file: !1, line: 51, type: !5)
!44 = !DILocation(line: 51, column: 3, scope: !40)
!45 = !DILocation(line: 53, column: 5, scope: !40)
!46 = !DILocation(line: 59, column: 9, scope: !40)
!47 = !DILocation(line: 60, column: 9, scope: !40)
!48 = !DILocation(line: 62, column: 9, scope: !40)
!49 = !DILocation(line: 63, column: 9, scope: !40)
!50 = !DILocation(line: 66, column: 3, scope: !40)
!51 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !3, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!52 = !DILocalVariable(name: "i", scope: !51, file: !1, line: 76, type: !5)
!53 = !DILocation(line: 76, column: 14, scope: !51)
!54 = !DILocalVariable(name: "sum", scope: !51, file: !1, line: 75, type: !5)
!55 = !DILocation(line: 75, column: 9, scope: !51)
!56 = !DILocalVariable(name: "x", scope: !51, file: !1, line: 71, type: !5)
!57 = !DILocation(line: 71, column: 3, scope: !51)
!58 = !DILocalVariable(name: "r", scope: !51, file: !1, line: 70, type: !5)
!59 = !DILocation(line: 70, column: 3, scope: !51)
!60 = !DILocation(line: 72, column: 3, scope: !51)
!61 = !DILocation(line: 77, column: 11, scope: !51)
!62 = !DILocation(line: 80, column: 11, scope: !51)
!63 = !DILocation(line: 83, column: 11, scope: !51)
!64 = !DILocation(line: 85, column: 9, scope: !51)
!65 = !DILocation(line: 87, column: 7, scope: !51)
!66 = !DILocation(line: 89, column: 7, scope: !51)
!67 = !DILocation(line: 90, column: 7, scope: !51)
!68 = !DILocation(line: 92, column: 3, scope: !51)
!69 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !3, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!70 = !DILocalVariable(name: "err", scope: !69, file: !1, line: 96, type: !5)
!71 = !DILocation(line: 96, column: 3, scope: !69)
!72 = !DILocation(line: 98, column: 3, scope: !69)
!73 = !DILocation(line: 98, column: 35, scope: !69)
!74 = !DILocation(line: 99, column: 3, scope: !69)
!75 = !DILocation(line: 99, column: 41, scope: !69)
!76 = !DILocation(line: 100, column: 3, scope: !69)
!77 = !DILocation(line: 100, column: 34, scope: !69)
!78 = !DILocation(line: 101, column: 3, scope: !69)
!79 = !DILocation(line: 101, column: 43, scope: !69)
!80 = !DILocation(line: 102, column: 3, scope: !69)
!81 = !DILocation(line: 102, column: 41, scope: !69)
!82 = !DILocation(line: 104, column: 3, scope: !69)
!83 = !DILocation(line: 0, scope: !69)
!84 = !DILocation(line: 109, column: 3, scope: !69)
