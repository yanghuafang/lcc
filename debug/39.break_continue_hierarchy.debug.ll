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
  store i32 0, i32* %i, align 4, !dbg !8
  br label %for.cond, !dbg !8

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !8
  %1 = icmp slt i32 %0, 10, !dbg !8
  br i1 %1, label %for.loop, label %for.end, !dbg !8

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !9
  %3 = icmp eq i32 %2, 3, !dbg !9
  br i1 %3, label %for.update, label %if.end, !dbg !9

if.end:                                           ; preds = %for.loop
  %4 = load i32, i32* %i, align 4, !dbg !10
  %5 = icmp eq i32 %4, 7, !dbg !10
  br i1 %5, label %for.end, label %if.end3, !dbg !10

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %sum, align 4, !dbg !11
  %7 = load i32, i32* %i, align 4, !dbg !11
  %8 = add i32 %6, %7, !dbg !11
  store i32 %8, i32* %sum, align 4, !dbg !11
  %9 = load i32, i32* %sum, align 4, !dbg !11
  br label %for.update, !dbg !11

for.update:                                       ; preds = %for.loop, %if.end3
  %10 = load i32, i32* %i, align 4, !dbg !11
  %11 = add i32 %10, 1, !dbg !11
  store i32 %11, i32* %i, align 4, !dbg !11
  br label %for.cond, !dbg !11

for.end:                                          ; preds = %if.end, %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !12
  ret i32 %12, !dbg !12
}

define i32 @switch_break_fallthrough() !dbg !13 {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 1, i32* %x, align 4, !dbg !14
  store i32 0, i32* %r, align 4, !dbg !15
  %0 = load i32, i32* %x, align 4, !dbg !16
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !16

case.0:                                           ; preds = %entry
  %1 = load i32, i32* %r, align 4, !dbg !17
  %2 = add i32 %1, 1, !dbg !17
  store i32 %2, i32* %r, align 4, !dbg !17
  %3 = load i32, i32* %r, align 4, !dbg !17
  br label %case.1, !dbg !17

case.1:                                           ; preds = %entry, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !18
  %5 = add i32 %4, 10, !dbg !18
  store i32 %5, i32* %r, align 4, !dbg !18
  %6 = load i32, i32* %r, align 4, !dbg !18
  br label %switch.end, !dbg !19

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !20
  %7 = load i32, i32* %r, align 4, !dbg !20
  br label %switch.end, !dbg !21

switch.end:                                       ; preds = %case.2, %case.1
  %8 = load i32, i32* %r, align 4, !dbg !22
  ret i32 %8, !dbg !22
}

define i32 @switch_break_only() !dbg !23 {
entry:
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 2, i32* %x, align 4, !dbg !24
  store i32 0, i32* %r, align 4, !dbg !25
  %0 = load i32, i32* %x, align 4, !dbg !26
  switch i32 %0, label %case.2 [
    i32 1, label %case.0
    i32 2, label %case.1
  ], !dbg !26

case.0:                                           ; preds = %entry
  store i32 10, i32* %r, align 4, !dbg !27
  %1 = load i32, i32* %r, align 4, !dbg !27
  br label %switch.end, !dbg !28

case.1:                                           ; preds = %entry
  store i32 20, i32* %r, align 4, !dbg !29
  %2 = load i32, i32* %r, align 4, !dbg !29
  br label %switch.end, !dbg !30

case.2:                                           ; preds = %entry
  store i32 99, i32* %r, align 4, !dbg !31
  %3 = load i32, i32* %r, align 4, !dbg !31
  br label %switch.end, !dbg !32

switch.end:                                       ; preds = %case.2, %case.1, %case.0
  %4 = load i32, i32* %r, align 4, !dbg !33
  ret i32 %4, !dbg !33
}

define i32 @for_switch_break_continue() !dbg !34 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4, !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.update, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %1 = icmp slt i32 %0, 6, !dbg !36
  br i1 %1, label %for.loop, label %for.end, !dbg !36

for.loop:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !37
  switch i32 %2, label %case.3 [
    i32 1, label %for.update
    i32 3, label %for.update
    i32 5, label %case.2
  ], !dbg !37

case.2:                                           ; preds = %for.loop
  %3 = load i32, i32* %sum, align 4, !dbg !38
  %4 = add i32 %3, 100, !dbg !38
  store i32 %4, i32* %sum, align 4, !dbg !38
  %5 = load i32, i32* %sum, align 4, !dbg !38
  br label %for.update, !dbg !39

case.3:                                           ; preds = %for.loop
  %6 = load i32, i32* %sum, align 4, !dbg !40
  %7 = load i32, i32* %i, align 4, !dbg !40
  %8 = add i32 %6, %7, !dbg !40
  store i32 %8, i32* %sum, align 4, !dbg !40
  %9 = load i32, i32* %sum, align 4, !dbg !40
  br label %for.update, !dbg !41

for.update:                                       ; preds = %case.2, %case.3, %for.loop, %for.loop
  %10 = load i32, i32* %i, align 4, !dbg !41
  %11 = add i32 %10, 1, !dbg !41
  store i32 %11, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !41

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !42
  ret i32 %12, !dbg !42
}

define i32 @switch_for_break_continue() !dbg !43 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %x = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %r, align 4, !dbg !44
  store i32 1, i32* %x, align 4, !dbg !45
  %0 = load i32, i32* %x, align 4, !dbg !46
  %1 = icmp eq i32 %0, 1, !dbg !46
  br i1 %1, label %case.0, label %case.1, !dbg !46

case.0:                                           ; preds = %entry
  store i32 0, i32* %sum, align 4, !dbg !47
  store i32 0, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.update, %case.0
  %2 = load i32, i32* %i, align 4, !dbg !48
  %3 = icmp slt i32 %2, 5, !dbg !48
  br i1 %3, label %for.loop, label %for.end, !dbg !48

for.loop:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !49
  %5 = icmp eq i32 %4, 2, !dbg !49
  br i1 %5, label %for.update, label %if.end, !dbg !49

if.end:                                           ; preds = %for.loop
  %6 = load i32, i32* %i, align 4, !dbg !50
  %7 = icmp eq i32 %6, 4, !dbg !50
  br i1 %7, label %for.end, label %if.end3, !dbg !50

if.end3:                                          ; preds = %if.end
  %8 = load i32, i32* %sum, align 4, !dbg !51
  %9 = load i32, i32* %i, align 4, !dbg !51
  %10 = add i32 %8, %9, !dbg !51
  store i32 %10, i32* %sum, align 4, !dbg !51
  %11 = load i32, i32* %sum, align 4, !dbg !51
  br label %for.update, !dbg !51

for.update:                                       ; preds = %for.loop, %if.end3
  %12 = load i32, i32* %i, align 4, !dbg !51
  %13 = add i32 %12, 1, !dbg !51
  store i32 %13, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !51

for.end:                                          ; preds = %if.end, %for.cond
  %14 = load i32, i32* %sum, align 4, !dbg !52
  store i32 %14, i32* %r, align 4, !dbg !52
  %15 = load i32, i32* %r, align 4, !dbg !52
  br label %switch.end, !dbg !53

case.1:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4, !dbg !54
  %16 = load i32, i32* %r, align 4, !dbg !54
  br label %switch.end, !dbg !55

switch.end:                                       ; preds = %case.1, %for.end
  %17 = load i32, i32* %r, align 4, !dbg !56
  ret i32 %17, !dbg !56
}

define i32 @main() !dbg !57 {
entry:
  %err = alloca i32, align 4
  store i32 0, i32* %err, align 4, !dbg !58
  %0 = call i32 @for_break_continue(), !dbg !59
  %1 = icmp ne i32 %0, 18, !dbg !59
  br i1 %1, label %then, label %if.end, !dbg !59

then:                                             ; preds = %entry
  store i32 1, i32* %err, align 4, !dbg !60
  %2 = load i32, i32* %err, align 4, !dbg !60
  br label %if.end, !dbg !60

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @switch_break_fallthrough(), !dbg !61
  %4 = icmp ne i32 %3, 11, !dbg !61
  br i1 %4, label %then1, label %if.end3, !dbg !61

then1:                                            ; preds = %if.end
  store i32 1, i32* %err, align 4, !dbg !62
  %5 = load i32, i32* %err, align 4, !dbg !62
  br label %if.end3, !dbg !62

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @switch_break_only(), !dbg !63
  %7 = icmp ne i32 %6, 20, !dbg !63
  br i1 %7, label %then4, label %if.end6, !dbg !63

then4:                                            ; preds = %if.end3
  store i32 1, i32* %err, align 4, !dbg !64
  %8 = load i32, i32* %err, align 4, !dbg !64
  br label %if.end6, !dbg !64

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @for_switch_break_continue(), !dbg !65
  %10 = icmp ne i32 %9, 106, !dbg !65
  br i1 %10, label %then7, label %if.end9, !dbg !65

then7:                                            ; preds = %if.end6
  store i32 1, i32* %err, align 4, !dbg !66
  %11 = load i32, i32* %err, align 4, !dbg !66
  br label %if.end9, !dbg !66

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @switch_for_break_continue(), !dbg !67
  %13 = icmp ne i32 %12, 4, !dbg !67
  br i1 %13, label %then10, label %if.end12, !dbg !67

then10:                                           ; preds = %if.end9
  store i32 1, i32* %err, align 4, !dbg !68
  %14 = load i32, i32* %err, align 4, !dbg !68
  br label %if.end12, !dbg !68

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, i32* %err, align 4, !dbg !69
  %16 = icmp eq i32 %15, 0, !dbg !69
  %. = select i1 %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), !dbg !70
  %17 = call i32 (i8*, ...) @printf(i8* %.), !dbg !70
  %18 = load i32, i32* %err, align 4, !dbg !71
  ret i32 %18, !dbg !71
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "39.break_continue_hierarchy.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "for_break_continue", linkageName: "for_break_continue", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!3 = !DISubroutineType(types: !4)
!4 = !{!5}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{}
!7 = !DILocation(line: 4, column: 3, scope: !2)
!8 = !DILocation(line: 5, column: 8, scope: !2)
!9 = !DILocation(line: 6, column: 5, scope: !2)
!10 = !DILocation(line: 9, column: 5, scope: !2)
!11 = !DILocation(line: 12, column: 5, scope: !2)
!12 = !DILocation(line: 14, column: 3, scope: !2)
!13 = distinct !DISubprogram(name: "switch_break_fallthrough", linkageName: "switch_break_fallthrough", scope: null, file: !1, line: 17, type: !3, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!14 = !DILocation(line: 18, column: 3, scope: !13)
!15 = !DILocation(line: 19, column: 3, scope: !13)
!16 = !DILocation(line: 20, column: 3, scope: !13)
!17 = !DILocation(line: 22, column: 7, scope: !13)
!18 = !DILocation(line: 24, column: 7, scope: !13)
!19 = !DILocation(line: 25, column: 7, scope: !13)
!20 = !DILocation(line: 27, column: 7, scope: !13)
!21 = !DILocation(line: 28, column: 7, scope: !13)
!22 = !DILocation(line: 30, column: 3, scope: !13)
!23 = distinct !DISubprogram(name: "switch_break_only", linkageName: "switch_break_only", scope: null, file: !1, line: 33, type: !3, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!24 = !DILocation(line: 34, column: 3, scope: !23)
!25 = !DILocation(line: 35, column: 3, scope: !23)
!26 = !DILocation(line: 36, column: 3, scope: !23)
!27 = !DILocation(line: 38, column: 7, scope: !23)
!28 = !DILocation(line: 39, column: 7, scope: !23)
!29 = !DILocation(line: 41, column: 7, scope: !23)
!30 = !DILocation(line: 42, column: 7, scope: !23)
!31 = !DILocation(line: 44, column: 7, scope: !23)
!32 = !DILocation(line: 45, column: 7, scope: !23)
!33 = !DILocation(line: 47, column: 3, scope: !23)
!34 = distinct !DISubprogram(name: "for_switch_break_continue", linkageName: "for_switch_break_continue", scope: null, file: !1, line: 50, type: !3, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!35 = !DILocation(line: 51, column: 3, scope: !34)
!36 = !DILocation(line: 52, column: 8, scope: !34)
!37 = !DILocation(line: 53, column: 5, scope: !34)
!38 = !DILocation(line: 59, column: 9, scope: !34)
!39 = !DILocation(line: 60, column: 9, scope: !34)
!40 = !DILocation(line: 62, column: 9, scope: !34)
!41 = !DILocation(line: 63, column: 9, scope: !34)
!42 = !DILocation(line: 66, column: 3, scope: !34)
!43 = distinct !DISubprogram(name: "switch_for_break_continue", linkageName: "switch_for_break_continue", scope: null, file: !1, line: 69, type: !3, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!44 = !DILocation(line: 70, column: 3, scope: !43)
!45 = !DILocation(line: 71, column: 3, scope: !43)
!46 = !DILocation(line: 72, column: 3, scope: !43)
!47 = !DILocation(line: 75, column: 9, scope: !43)
!48 = !DILocation(line: 76, column: 14, scope: !43)
!49 = !DILocation(line: 77, column: 11, scope: !43)
!50 = !DILocation(line: 80, column: 11, scope: !43)
!51 = !DILocation(line: 83, column: 11, scope: !43)
!52 = !DILocation(line: 85, column: 9, scope: !43)
!53 = !DILocation(line: 87, column: 7, scope: !43)
!54 = !DILocation(line: 89, column: 7, scope: !43)
!55 = !DILocation(line: 90, column: 7, scope: !43)
!56 = !DILocation(line: 92, column: 3, scope: !43)
!57 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 95, type: !3, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !6)
!58 = !DILocation(line: 96, column: 3, scope: !57)
!59 = !DILocation(line: 98, column: 3, scope: !57)
!60 = !DILocation(line: 98, column: 35, scope: !57)
!61 = !DILocation(line: 99, column: 3, scope: !57)
!62 = !DILocation(line: 99, column: 41, scope: !57)
!63 = !DILocation(line: 100, column: 3, scope: !57)
!64 = !DILocation(line: 100, column: 34, scope: !57)
!65 = !DILocation(line: 101, column: 3, scope: !57)
!66 = !DILocation(line: 101, column: 43, scope: !57)
!67 = !DILocation(line: 102, column: 3, scope: !57)
!68 = !DILocation(line: 102, column: 41, scope: !57)
!69 = !DILocation(line: 104, column: 3, scope: !57)
!70 = !DILocation(line: 0, scope: !57)
!71 = !DILocation(line: 109, column: 3, scope: !57)
