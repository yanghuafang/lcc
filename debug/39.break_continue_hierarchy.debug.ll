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
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4, !dbg !7
  store i32 0, i32* %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !7
  %1 = icmp slt i32 %0, 10, !dbg !7
  br i1 %1, label %for.loop, label %for.end, !dbg !7

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !7
  %3 = icmp eq i32 %2, 3, !dbg !7
  br i1 %3, label %for.update, label %if.end, !dbg !7

if.end:                                           ; preds = %for.loop
  %4 = load i32, i32* %i, align 4, !dbg !7
  %5 = icmp eq i32 %4, 7, !dbg !7
  br i1 %5, label %for.end, label %if.end3, !dbg !7

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %sum, align 4, !dbg !7
  %7 = load i32, i32* %i, align 4, !dbg !7
  %8 = add i32 %6, %7, !dbg !7
  store i32 %8, i32* %sum, align 4, !dbg !7
  %9 = load i32, i32* %sum, align 4, !dbg !7
  br label %for.update, !dbg !7

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, i32* %i, align 4, !dbg !7
  %11 = add i32 %10, 1, !dbg !7
  store i32 %11, i32* %i, align 4, !dbg !7
  br label %for.cond, !dbg !7

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !7
  ret i32 %12, !dbg !7
}

define i32 @switch_break_fallthrough() !dbg !8 {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 1, i32* %x, align 4, !dbg !9
  store i32 0, i32* %r, align 4, !dbg !9
  %0 = load i32, i32* %x, align 4, !dbg !9
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !9

case.0:                                           ; preds = %entry
  %1 = load i32, i32* %r, align 4, !dbg !9
  %2 = add i32 %1, 1, !dbg !9
  store i32 %2, i32* %r, align 4, !dbg !9
  %3 = load i32, i32* %r, align 4, !dbg !9
  br label %case.1, !dbg !9

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !9
  %5 = add i32 %4, 10, !dbg !9
  store i32 %5, i32* %r, align 4, !dbg !9
  %6 = load i32, i32* %r, align 4, !dbg !9
  br label %switch.end, !dbg !9

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !9
  %7 = load i32, i32* %r, align 4, !dbg !9
  br label %switch.end, !dbg !9

switch.end:                                       ; preds = %case.2, %case.1
  %8 = load i32, i32* %r, align 4, !dbg !9
  ret i32 %8, !dbg !9
}

define i32 @switch_break_only() !dbg !10 {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 2, i32* %x, align 4, !dbg !11
  store i32 0, i32* %r, align 4, !dbg !11
  %0 = load i32, i32* %x, align 4, !dbg !11
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !11

case.0:                                           ; preds = %entry
  store i32 10, i32* %r, align 4, !dbg !11
  %1 = load i32, i32* %r, align 4, !dbg !11
  br label %switch.end, !dbg !11

case.1:                                           ; preds = %entry
  store i32 20, i32* %r, align 4, !dbg !11
  %2 = load i32, i32* %r, align 4, !dbg !11
  br label %switch.end, !dbg !11

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !11
  %3 = load i32, i32* %r, align 4, !dbg !11
  br label %switch.end, !dbg !11

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !11
  ret i32 %4, !dbg !11
}

define i32 @for_switch_break_continue() !dbg !12 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4, !dbg !13
  store i32 0, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !13
  %1 = icmp slt i32 %0, 6, !dbg !13
  br i1 %1, label %for.loop, label %for.end, !dbg !13

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !13
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !13

case.2:                                           ; preds = %for.loop
  %3 = load i32, i32* %sum, align 4, !dbg !13
  %4 = add i32 %3, 100, !dbg !13
  store i32 %4, i32* %sum, align 4, !dbg !13
  %5 = load i32, i32* %sum, align 4, !dbg !13
  br label %for.update, !dbg !13

case.3:                                           ; preds = %for.loop
  %6 = load i32, i32* %sum, align 4, !dbg !13
  %7 = load i32, i32* %i, align 4, !dbg !13
  %8 = add i32 %6, %7, !dbg !13
  store i32 %8, i32* %sum, align 4, !dbg !13
  %9 = load i32, i32* %sum, align 4, !dbg !13
  br label %for.update, !dbg !13

for.update:                                       ; preds = %case.2, %case.3, %for.loop, %for.loop
  %10 = load i32, i32* %i, align 4, !dbg !13
  %11 = add i32 %10, 1, !dbg !13
  store i32 %11, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !13

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !13
  ret i32 %12, !dbg !13
}

define i32 @switch_for_break_continue() !dbg !14 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %x = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %r, align 4, !dbg !15
  store i32 1, i32* %x, align 4, !dbg !15
  %0 = load i32, i32* %x, align 4, !dbg !15
  %1 = icmp eq i32 %0, 1, !dbg !15
  br i1 %1, label %case.0, label %case.1, !dbg !15

case.0:                                           ; preds = %entry
  store i32 0, i32* %sum, align 4, !dbg !15
  store i32 0, i32* %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, i32* %i, align 4, !dbg !15
  %3 = icmp slt i32 %2, 5, !dbg !15
  br i1 %3, label %for.loop, label %for.end, !dbg !15

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !15
  %5 = icmp eq i32 %4, 2, !dbg !15
  br i1 %5, label %for.update, label %if.end, !dbg !15

if.end:                                           ; preds = %for.loop
  %6 = load i32, i32* %i, align 4, !dbg !15
  %7 = icmp eq i32 %6, 4, !dbg !15
  br i1 %7, label %for.end, label %if.end3, !dbg !15

if.end3:                                          ; preds = %if.end
  %8 = load i32, i32* %sum, align 4, !dbg !15
  %9 = load i32, i32* %i, align 4, !dbg !15
  %10 = add i32 %8, %9, !dbg !15
  store i32 %10, i32* %sum, align 4, !dbg !15
  %11 = load i32, i32* %sum, align 4, !dbg !15
  br label %for.update, !dbg !15

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, i32* %i, align 4, !dbg !15
  %13 = add i32 %12, 1, !dbg !15
  store i32 %13, i32* %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, i32* %sum, align 4, !dbg !15
  store i32 %14, i32* %r, align 4, !dbg !15
  %15 = load i32, i32* %r, align 4, !dbg !15
  br label %switch.end, !dbg !15

case.1:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4, !dbg !15
  %16 = load i32, i32* %r, align 4, !dbg !15
  br label %switch.end, !dbg !15

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, i32* %r, align 4, !dbg !15
  ret i32 %17, !dbg !15
}

define i32 @main() !dbg !16 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !17
  %0 = call i32 @for_break_continue(), !dbg !17
  %1 = icmp ne i32 %0, 18, !dbg !17
  br i1 %1, label %then, label %if.end, !dbg !17

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !17
  %2 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end, !dbg !17

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !17
  %4 = icmp ne i32 %3, 11, !dbg !17
  br i1 %4, label %then1, label %if.end3, !dbg !17

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !17
  %5 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end3, !dbg !17

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !17
  %7 = icmp ne i32 %6, 20, !dbg !17
  br i1 %7, label %then4, label %if.end6, !dbg !17

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !17
  %8 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end6, !dbg !17

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !17
  %10 = icmp ne i32 %9, 106, !dbg !17
  br i1 %10, label %then7, label %if.end9, !dbg !17

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !17
  %11 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end9, !dbg !17

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !17
  %13 = icmp ne i32 %12, 4, !dbg !17
  br i1 %13, label %then10, label %if.end12, !dbg !17

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !17
  %14 = load i32, i32* %err, align 4, !dbg !17
  br label %if.end12, !dbg !17

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !17
  %16 = icmp eq i32 %15, 0, !dbg !17
  %. = select i1 %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), !dbg !17
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !17
  %18 = load i32, i32* %err, align 4, !dbg !17
  ret i32 %18, !dbg !17
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 1, column: 1, scope: !2)
!8 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!9 = !DILocation(line: 1, column: 1, scope: !8)
!10 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!11 = !DILocation(line: 1, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!13 = !DILocation(line: 1, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!15 = !DILocation(line: 1, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 1, type: !3, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!17 = !DILocation(line: 1, column: 1, scope: !16)
