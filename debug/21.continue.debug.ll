; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"21.continue.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"21.continue.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countEvenNumber(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !11, !DIExpression(), !12)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !13, !DIExpression(), !14)
  store i32 %0, ptr %n, align 4, !dbg !14
  store i32 0, ptr %count, align 4, !dbg !12
  store i32 1, ptr %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !10
  %2 = load i32, ptr %n, align 4, !dbg !10
  %3 = icmp sle i32 %1, %2, !dbg !10
  br i1 %3, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = srem i32 %4, 2, !dbg !15
  %6 = icmp ne i32 %5, 0, !dbg !15
  br i1 %6, label %for.update, label %if.end, !dbg !15

if.end:                                           ; preds = %for.loop
  %7 = load i32, ptr %count, align 4, !dbg !17
  %8 = add i32 %7, 1, !dbg !17
  store i32 %8, ptr %count, align 4, !dbg !17
  %9 = load i32, ptr %count, align 4, !dbg !17
  br label %for.update, !dbg !17

for.update:                                       ; preds = %for.loop, %if.end
  %10 = load i32, ptr %i, align 4, !dbg !17
  %11 = add i32 %10, 1, !dbg !17
  store i32 %11, ptr %i, align 4, !dbg !17
  %12 = load i32, ptr %i, align 4, !dbg !17
  br label %for.cond, !dbg !17

for.end:                                          ; preds = %for.cond
  %13 = load i32, ptr %count, align 4, !dbg !18
  ret i32 %13, !dbg !18
}

define i32 @countEvenNumber2(i32 %0) !dbg !19 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !20, !DIExpression(), !21)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !22, !DIExpression(), !23)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !24, !DIExpression(), !25)
  store i32 %0, ptr %n, align 4, !dbg !25
  store i32 0, ptr %count, align 4, !dbg !23
  store i32 1, ptr %i, align 4, !dbg !21
  br label %while.cond, !dbg !26

while.cond:                                       ; preds = %if.end, %then, %entry
  %1 = load i32, ptr %i, align 4, !dbg !26
  %2 = load i32, ptr %n, align 4, !dbg !26
  %3 = icmp sle i32 %1, %2, !dbg !26
  br i1 %3, label %while.loop, label %while.end, !dbg !26

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !27
  %5 = srem i32 %4, 2, !dbg !27
  %6 = icmp ne i32 %5, 0, !dbg !27
  br i1 %6, label %then, label %if.end, !dbg !27

then:                                             ; preds = %while.loop
  %7 = load i32, ptr %i, align 4, !dbg !29
  %8 = add i32 %7, 1, !dbg !29
  store i32 %8, ptr %i, align 4, !dbg !29
  %9 = load i32, ptr %i, align 4, !dbg !29
  br label %while.cond, !dbg !31

if.end:                                           ; preds = %while.loop
  %10 = load i32, ptr %count, align 4, !dbg !32
  %11 = add i32 %10, 1, !dbg !32
  store i32 %11, ptr %count, align 4, !dbg !32
  %12 = load i32, ptr %count, align 4, !dbg !32
  %13 = load i32, ptr %i, align 4, !dbg !33
  %14 = add i32 %13, 1, !dbg !33
  store i32 %14, ptr %i, align 4, !dbg !33
  %15 = load i32, ptr %i, align 4, !dbg !33
  br label %while.cond, !dbg !33

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %count, align 4, !dbg !34
  ret i32 %16, !dbg !34
}

define i32 @countEvenNumber3(i32 %0) !dbg !35 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !36, !DIExpression(), !37)
  %count = alloca i32, align 4
    #dbg_declare(ptr %count, !38, !DIExpression(), !39)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !40, !DIExpression(), !41)
  store i32 %0, ptr %n, align 4, !dbg !41
  store i32 0, ptr %count, align 4, !dbg !39
  store i32 1, ptr %i, align 4, !dbg !37
  br label %do.loop, !dbg !42

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !43
  %2 = srem i32 %1, 2, !dbg !43
  %3 = icmp ne i32 %2, 0, !dbg !43
  br i1 %3, label %do.cond, label %if.end, !dbg !43

if.end:                                           ; preds = %do.loop
  %4 = load i32, ptr %count, align 4, !dbg !45
  %5 = add i32 %4, 1, !dbg !45
  store i32 %5, ptr %count, align 4, !dbg !45
  %6 = load i32, ptr %count, align 4, !dbg !45
  br label %do.cond, !dbg !46

do.cond:                                          ; preds = %do.loop, %if.end
  %7 = load i32, ptr %i, align 4, !dbg !47
  %8 = add i32 %7, 1, !dbg !47
  store i32 %8, ptr %i, align 4, !dbg !47
  %9 = load i32, ptr %i, align 4, !dbg !47
  %10 = load i32, ptr %i, align 4, !dbg !46
  %11 = load i32, ptr %n, align 4, !dbg !46
  %12 = icmp sle i32 %10, %11, !dbg !46
  br i1 %12, label %do.loop, label %do.end, !dbg !46

do.end:                                           ; preds = %do.cond
  %13 = load i32, ptr %count, align 4, !dbg !48
  ret i32 %13, !dbg !48
}

define i32 @main() !dbg !49 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !52, !DIExpression(), !53)
  store i32 0, ptr %err, align 4, !dbg !53
  %0 = call i32 @countEvenNumber(i32 32), !dbg !54
  %1 = icmp ne i32 %0, 16, !dbg !54
  br i1 %1, label %then, label %if.end, !dbg !54

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !55
  %2 = load i32, ptr %err, align 4, !dbg !55
  br label %if.end, !dbg !55

if.end:                                           ; preds = %entry, %then
  %3 = call i32 @countEvenNumber2(i32 32), !dbg !56
  %4 = icmp ne i32 %3, 16, !dbg !56
  br i1 %4, label %then1, label %if.end3, !dbg !56

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !57
  %5 = load i32, ptr %err, align 4, !dbg !57
  br label %if.end3, !dbg !57

if.end3:                                          ; preds = %if.end, %then1
  %6 = call i32 @countEvenNumber3(i32 32), !dbg !58
  %7 = icmp ne i32 %6, 16, !dbg !58
  br i1 %7, label %then4, label %if.end6, !dbg !58

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !59
  %8 = load i32, ptr %err, align 4, !dbg !59
  br label %if.end6, !dbg !59

if.end6:                                          ; preds = %if.end3, %then4
  %9 = call i32 @countEvenNumber(i32 0), !dbg !60
  %10 = icmp ne i32 %9, 0, !dbg !60
  br i1 %10, label %then7, label %if.end9, !dbg !60

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !61
  %11 = load i32, ptr %err, align 4, !dbg !61
  br label %if.end9, !dbg !61

if.end9:                                          ; preds = %if.end6, %then7
  %12 = call i32 @countEvenNumber(i32 1), !dbg !62
  %13 = icmp ne i32 %12, 0, !dbg !62
  br i1 %13, label %then10, label %if.end12, !dbg !62

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !63
  %14 = load i32, ptr %err, align 4, !dbg !63
  br label %if.end12, !dbg !63

if.end12:                                         ; preds = %if.end9, %then10
  %15 = load i32, ptr %err, align 4, !dbg !64
  %16 = icmp eq i32 %15, 0, !dbg !64
  %. = select i1 %16, ptr @0, ptr @1, !dbg !65
  %17 = call i32 (ptr, ...) @printf(ptr %.), !dbg !65
  %18 = load i32, ptr %err, align 4, !dbg !66
  ret i32 %18, !dbg !66
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "21.continue.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "countEvenNumber", linkageName: "countEvenNumber", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 8, scope: !4)
!11 = !DILocalVariable(name: "count", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!14 = !DILocation(line: 3, column: 5, scope: !4)
!15 = !DILocation(line: 6, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 35)
!17 = !DILocation(line: 9, column: 5, scope: !16)
!18 = !DILocation(line: 11, column: 3, scope: !4)
!19 = distinct !DISubprogram(name: "countEvenNumber2", linkageName: "countEvenNumber2", scope: null, file: !1, line: 14, type: !5, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!20 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 16, type: !7)
!21 = !DILocation(line: 16, column: 3, scope: !19)
!22 = !DILocalVariable(name: "count", scope: !19, file: !1, line: 15, type: !7)
!23 = !DILocation(line: 15, column: 3, scope: !19)
!24 = !DILocalVariable(name: "n", arg: 1, scope: !19, file: !1, line: 14, type: !7)
!25 = !DILocation(line: 14, column: 5, scope: !19)
!26 = !DILocation(line: 17, column: 3, scope: !19)
!27 = !DILocation(line: 18, column: 5, scope: !28)
!28 = distinct !DILexicalBlock(scope: !19, file: !1, line: 17, column: 18)
!29 = !DILocation(line: 19, column: 7, scope: !30)
!30 = distinct !DILexicalBlock(scope: !28, file: !1, line: 18, column: 21)
!31 = !DILocation(line: 20, column: 7, scope: !30)
!32 = !DILocation(line: 22, column: 5, scope: !28)
!33 = !DILocation(line: 23, column: 5, scope: !28)
!34 = !DILocation(line: 25, column: 3, scope: !19)
!35 = distinct !DISubprogram(name: "countEvenNumber3", linkageName: "countEvenNumber3", scope: null, file: !1, line: 28, type: !5, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!36 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 30, type: !7)
!37 = !DILocation(line: 30, column: 3, scope: !35)
!38 = !DILocalVariable(name: "count", scope: !35, file: !1, line: 29, type: !7)
!39 = !DILocation(line: 29, column: 3, scope: !35)
!40 = !DILocalVariable(name: "n", arg: 1, scope: !35, file: !1, line: 28, type: !7)
!41 = !DILocation(line: 28, column: 5, scope: !35)
!42 = !DILocation(line: 31, column: 3, scope: !35)
!43 = !DILocation(line: 32, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !1, line: 31, column: 6)
!45 = !DILocation(line: 36, column: 5, scope: !44)
!46 = !DILocation(line: 37, column: 5, scope: !44)
!47 = !DILocation(line: 0, scope: !44)
!48 = !DILocation(line: 39, column: 3, scope: !35)
!49 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 42, type: !50, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!50 = !DISubroutineType(types: !51)
!51 = !{!7}
!52 = !DILocalVariable(name: "err", scope: !49, file: !1, line: 43, type: !7)
!53 = !DILocation(line: 43, column: 3, scope: !49)
!54 = !DILocation(line: 45, column: 3, scope: !49)
!55 = !DILocation(line: 45, column: 34, scope: !49)
!56 = !DILocation(line: 46, column: 3, scope: !49)
!57 = !DILocation(line: 46, column: 35, scope: !49)
!58 = !DILocation(line: 47, column: 3, scope: !49)
!59 = !DILocation(line: 47, column: 35, scope: !49)
!60 = !DILocation(line: 48, column: 3, scope: !49)
!61 = !DILocation(line: 48, column: 32, scope: !49)
!62 = !DILocation(line: 49, column: 3, scope: !49)
!63 = !DILocation(line: 49, column: 32, scope: !49)
!64 = !DILocation(line: 51, column: 3, scope: !49)
!65 = !DILocation(line: 0, scope: !49)
!66 = !DILocation(line: 56, column: 3, scope: !49)
