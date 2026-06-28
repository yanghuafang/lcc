; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [22 x i8] c"50.goto_label.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [22 x i8] c"50.goto_label.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countTo(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !11, !DIExpression(), !12)
  store i32 %0, ptr %n, align 4, !dbg !12
  store i32 0, ptr %i, align 4, !dbg !10
  br label %label.top, !dbg !13

label.top:                                        ; preds = %then, %entry
  %1 = load i32, ptr %i, align 4, !dbg !14
  %2 = add i32 %1, 1, !dbg !14
  store i32 %2, ptr %i, align 4, !dbg !14
  %3 = load i32, ptr %i, align 4, !dbg !14
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = load i32, ptr %n, align 4, !dbg !15
  %6 = icmp slt i32 %4, %5, !dbg !15
  br i1 %6, label %then, label %else, !dbg !15

then:                                             ; preds = %label.top
  br label %label.top, !dbg !16

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !16

else:                                             ; preds = %label.top
  br label %if.end, !dbg !16

if.end:                                           ; preds = %else, %goto.cont
  %7 = load i32, ptr %i, align 4, !dbg !18
  ret i32 %7, !dbg !18
}

define i32 @skip(i32 %0) !dbg !19 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !20, !DIExpression(), !21)
  %flag = alloca i32, align 4
    #dbg_declare(ptr %flag, !22, !DIExpression(), !23)
  store i32 %0, ptr %flag, align 4, !dbg !23
  store i32 1, ptr %r, align 4, !dbg !21
  %1 = load i32, ptr %flag, align 4, !dbg !24
  %2 = icmp ne i32 %1, 0, !dbg !24
  br i1 %2, label %then, label %else, !dbg !24

then:                                             ; preds = %entry
  br label %label.done, !dbg !25

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !25

else:                                             ; preds = %entry
  br label %if.end, !dbg !25

if.end:                                           ; preds = %else, %goto.cont
  store i32 2, ptr %r, align 4, !dbg !27
  %3 = load i32, ptr %r, align 4, !dbg !27
  br label %label.done, !dbg !28

label.done:                                       ; preds = %if.end, %then
  %4 = load i32, ptr %r, align 4, !dbg !29
  ret i32 %4, !dbg !29
}

define i32 @firstPair(i32 %0, i32 %1) !dbg !30 {
entry:
  %found = alloca i32, align 4
    #dbg_declare(ptr %found, !33, !DIExpression(), !34)
  %j = alloca i32, align 4
    #dbg_declare(ptr %j, !35, !DIExpression(), !36)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !37, !DIExpression(), !38)
  %target = alloca i32, align 4
    #dbg_declare(ptr %target, !39, !DIExpression(), !40)
  %limit = alloca i32, align 4
    #dbg_declare(ptr %limit, !41, !DIExpression(), !40)
  store i32 %0, ptr %limit, align 4, !dbg !40
  store i32 %1, ptr %target, align 4, !dbg !40
  store i32 0, ptr %i, align 4, !dbg !38
  store i32 -1, ptr %found, align 4, !dbg !34
  br label %while.cond, !dbg !42

while.cond:                                       ; preds = %while.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !42
  %3 = load i32, ptr %limit, align 4, !dbg !42
  %4 = icmp slt i32 %2, %3, !dbg !42
  br i1 %4, label %while.loop, label %while.end3, !dbg !42

while.loop:                                       ; preds = %while.cond
  store i32 0, ptr %j, align 4, !dbg !43
  %5 = load i32, ptr %j, align 4, !dbg !43
  br label %while.cond1, !dbg !45

while.cond1:                                      ; preds = %if.end, %while.loop
  %6 = load i32, ptr %j, align 4, !dbg !45
  %7 = load i32, ptr %limit, align 4, !dbg !45
  %8 = icmp slt i32 %6, %7, !dbg !45
  br i1 %8, label %while.loop2, label %while.end, !dbg !45

while.loop2:                                      ; preds = %while.cond1
  %9 = load i32, ptr %i, align 4, !dbg !46
  %10 = mul i32 %9, 10, !dbg !46
  %11 = load i32, ptr %j, align 4, !dbg !46
  %12 = add i32 %10, %11, !dbg !46
  %13 = load i32, ptr %target, align 4, !dbg !46
  %14 = icmp eq i32 %12, %13, !dbg !46
  br i1 %14, label %then, label %else, !dbg !46

then:                                             ; preds = %while.loop2
  %15 = load i32, ptr %i, align 4, !dbg !48
  %16 = mul i32 %15, 10, !dbg !48
  %17 = load i32, ptr %j, align 4, !dbg !48
  %18 = add i32 %16, %17, !dbg !48
  store i32 %18, ptr %found, align 4, !dbg !48
  %19 = load i32, ptr %found, align 4, !dbg !48
  br label %label.out, !dbg !50

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !50

else:                                             ; preds = %while.loop2
  br label %if.end, !dbg !50

if.end:                                           ; preds = %else, %goto.cont
  %20 = load i32, ptr %j, align 4, !dbg !51
  %21 = add i32 %20, 1, !dbg !51
  store i32 %21, ptr %j, align 4, !dbg !51
  %22 = load i32, ptr %j, align 4, !dbg !51
  br label %while.cond1, !dbg !51

while.end:                                        ; preds = %while.cond1
  %23 = load i32, ptr %i, align 4, !dbg !52
  %24 = add i32 %23, 1, !dbg !52
  store i32 %24, ptr %i, align 4, !dbg !52
  %25 = load i32, ptr %i, align 4, !dbg !52
  br label %while.cond, !dbg !52

while.end3:                                       ; preds = %while.cond
  br label %label.out, !dbg !53

label.out:                                        ; preds = %while.end3, %then
  %26 = load i32, ptr %found, align 4, !dbg !54
  ret i32 %26, !dbg !54
}

define i32 @afterReturn(i32 %0) !dbg !55 {
entry:
  %flag = alloca i32, align 4
    #dbg_declare(ptr %flag, !56, !DIExpression(), !57)
  store i32 %0, ptr %flag, align 4, !dbg !57
  %1 = load i32, ptr %flag, align 4, !dbg !58
  %2 = icmp ne i32 %1, 0, !dbg !58
  br i1 %2, label %then, label %else, !dbg !58

then:                                             ; preds = %entry
  br label %label.tail, !dbg !59

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !59

else:                                             ; preds = %entry
  br label %if.end, !dbg !59

if.end:                                           ; preds = %else, %goto.cont
  ret i32 1, !dbg !61

label.pred:                                       ; No predecessors!
  br label %label.tail, !dbg !62

label.tail:                                       ; preds = %label.pred, %then
  ret i32 2, !dbg !63
}

define i32 @fromSwitch(i32 %0) !dbg !64 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !65, !DIExpression(), !66)
  store i32 %0, ptr %x, align 4, !dbg !66
  %1 = load i32, ptr %x, align 4, !dbg !67
  %2 = icmp eq i32 %1, 1, !dbg !67
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !67

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2, !dbg !67
  br i1 %3, label %case.1, label %case.2, !dbg !67

case.0:                                           ; preds = %entry
  br label %label.one, !dbg !68

goto.cont:                                        ; No predecessors!
  br label %case.1, !dbg !68

case.1:                                           ; preds = %goto.cont, %switch.compare.0
  ret i32 20, !dbg !69

case.2:                                           ; preds = %switch.compare.0
  br label %switch.end, !dbg !70

switch.end:                                       ; preds = %case.2
  ret i32 0, !dbg !71

label.pred:                                       ; No predecessors!
  br label %label.one, !dbg !72

label.one:                                        ; preds = %label.pred, %case.0
  ret i32 10, !dbg !73
}

define i32 @main() !dbg !74 {
entry:
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !77, !DIExpression(), !78)
  store i32 0, ptr %failed, align 4, !dbg !78
  %0 = call i32 @countTo(i32 5), !dbg !79
  %1 = icmp ne i32 %0, 5, !dbg !79
  br i1 %1, label %then, label %else, !dbg !79

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !80
  %2 = load i32, ptr %failed, align 4, !dbg !80
  br label %if.end, !dbg !80

else:                                             ; preds = %entry
  br label %if.end, !dbg !80

if.end:                                           ; preds = %else, %then
  %3 = call i32 @skip(i32 1), !dbg !82
  %4 = icmp ne i32 %3, 1, !dbg !82
  br i1 %4, label %lor.end, label %lor.rhs, !dbg !82

lor.rhs:                                          ; preds = %if.end
  %5 = call i32 @skip(i32 0), !dbg !82
  %6 = icmp ne i32 %5, 2, !dbg !82
  br label %lor.end, !dbg !82

lor.end:                                          ; preds = %lor.rhs, %if.end
  %7 = phi i1 [ true, %if.end ], [ %6, %lor.rhs ], !dbg !82
  br i1 %7, label %then1, label %else2, !dbg !82

then1:                                            ; preds = %lor.end
  store i32 1, ptr %failed, align 4, !dbg !83
  %8 = load i32, ptr %failed, align 4, !dbg !83
  br label %if.end3, !dbg !83

else2:                                            ; preds = %lor.end
  br label %if.end3, !dbg !83

if.end3:                                          ; preds = %else2, %then1
  %9 = call i32 @firstPair(i32 5, i32 23), !dbg !85
  %10 = icmp ne i32 %9, 23, !dbg !85
  br i1 %10, label %lor.end5, label %lor.rhs4, !dbg !85

lor.rhs4:                                         ; preds = %if.end3
  %11 = call i32 @firstPair(i32 3, i32 99), !dbg !85
  %12 = icmp ne i32 %11, -1, !dbg !85
  br label %lor.end5, !dbg !85

lor.end5:                                         ; preds = %lor.rhs4, %if.end3
  %13 = phi i1 [ true, %if.end3 ], [ %12, %lor.rhs4 ], !dbg !85
  br i1 %13, label %then6, label %else7, !dbg !85

then6:                                            ; preds = %lor.end5
  store i32 1, ptr %failed, align 4, !dbg !86
  %14 = load i32, ptr %failed, align 4, !dbg !86
  br label %if.end8, !dbg !86

else7:                                            ; preds = %lor.end5
  br label %if.end8, !dbg !86

if.end8:                                          ; preds = %else7, %then6
  %15 = call i32 @afterReturn(i32 1), !dbg !88
  %16 = icmp ne i32 %15, 2, !dbg !88
  br i1 %16, label %lor.end10, label %lor.rhs9, !dbg !88

lor.rhs9:                                         ; preds = %if.end8
  %17 = call i32 @afterReturn(i32 0), !dbg !88
  %18 = icmp ne i32 %17, 1, !dbg !88
  br label %lor.end10, !dbg !88

lor.end10:                                        ; preds = %lor.rhs9, %if.end8
  %19 = phi i1 [ true, %if.end8 ], [ %18, %lor.rhs9 ], !dbg !88
  br i1 %19, label %then11, label %else12, !dbg !88

then11:                                           ; preds = %lor.end10
  store i32 1, ptr %failed, align 4, !dbg !89
  %20 = load i32, ptr %failed, align 4, !dbg !89
  br label %if.end13, !dbg !89

else12:                                           ; preds = %lor.end10
  br label %if.end13, !dbg !89

if.end13:                                         ; preds = %else12, %then11
  %21 = call i32 @fromSwitch(i32 1), !dbg !91
  %22 = icmp ne i32 %21, 10, !dbg !91
  br i1 %22, label %lor.end15, label %lor.rhs14, !dbg !91

lor.rhs14:                                        ; preds = %if.end13
  %23 = call i32 @fromSwitch(i32 2), !dbg !91
  %24 = icmp ne i32 %23, 20, !dbg !91
  br label %lor.end15, !dbg !91

lor.end15:                                        ; preds = %lor.rhs14, %if.end13
  %25 = phi i1 [ true, %if.end13 ], [ %24, %lor.rhs14 ], !dbg !91
  br i1 %25, label %lor.end17, label %lor.rhs16, !dbg !91

lor.rhs16:                                        ; preds = %lor.end15
  %26 = call i32 @fromSwitch(i32 9), !dbg !91
  %27 = icmp ne i32 %26, 0, !dbg !91
  br label %lor.end17, !dbg !91

lor.end17:                                        ; preds = %lor.rhs16, %lor.end15
  %28 = phi i1 [ true, %lor.end15 ], [ %27, %lor.rhs16 ], !dbg !91
  br i1 %28, label %then18, label %else19, !dbg !91

then18:                                           ; preds = %lor.end17
  store i32 1, ptr %failed, align 4, !dbg !92
  %29 = load i32, ptr %failed, align 4, !dbg !92
  br label %if.end20, !dbg !92

else19:                                           ; preds = %lor.end17
  br label %if.end20, !dbg !92

if.end20:                                         ; preds = %else19, %then18
  %30 = load i32, ptr %failed, align 4, !dbg !94
  %31 = icmp eq i32 %30, 0, !dbg !94
  br i1 %31, label %then21, label %else22, !dbg !94

then21:                                           ; preds = %if.end20
  %32 = call i32 (ptr, ...) @printf(ptr @0), !dbg !95
  ret i32 0, !dbg !97

else22:                                           ; preds = %if.end20
  br label %if.end23, !dbg !97

if.end23:                                         ; preds = %else22
  %33 = call i32 (ptr, ...) @printf(ptr @1), !dbg !98
  ret i32 1, !dbg !99
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "50.goto_label.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countTo", linkageName: "countTo", scope: null, file: !3, line: 18, type: !5, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 19, type: !7)
!10 = !DILocation(line: 19, column: 3, scope: !4)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !3, line: 18, type: !7)
!12 = !DILocation(line: 18, column: 5, scope: !4)
!13 = !DILocation(line: 20, column: 1, scope: !4)
!14 = !DILocation(line: 21, column: 3, scope: !4)
!15 = !DILocation(line: 22, column: 3, scope: !4)
!16 = !DILocation(line: 23, column: 5, scope: !17)
!17 = distinct !DILexicalBlock(scope: !4, file: !3, line: 22, column: 14)
!18 = !DILocation(line: 25, column: 3, scope: !4)
!19 = distinct !DISubprogram(name: "skip", linkageName: "skip", scope: null, file: !3, line: 29, type: !5, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!20 = !DILocalVariable(name: "r", scope: !19, file: !3, line: 30, type: !7)
!21 = !DILocation(line: 30, column: 3, scope: !19)
!22 = !DILocalVariable(name: "flag", arg: 1, scope: !19, file: !3, line: 29, type: !7)
!23 = !DILocation(line: 29, column: 5, scope: !19)
!24 = !DILocation(line: 31, column: 3, scope: !19)
!25 = !DILocation(line: 32, column: 5, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !3, line: 31, column: 13)
!27 = !DILocation(line: 34, column: 3, scope: !19)
!28 = !DILocation(line: 35, column: 1, scope: !19)
!29 = !DILocation(line: 36, column: 3, scope: !19)
!30 = distinct !DISubprogram(name: "firstPair", linkageName: "firstPair", scope: null, file: !3, line: 40, type: !31, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!31 = !DISubroutineType(types: !32)
!32 = !{!7, !7, !7}
!33 = !DILocalVariable(name: "found", scope: !30, file: !3, line: 43, type: !7)
!34 = !DILocation(line: 43, column: 3, scope: !30)
!35 = !DILocalVariable(name: "j", scope: !30, file: !3, line: 42, type: !7)
!36 = !DILocation(line: 42, column: 3, scope: !30)
!37 = !DILocalVariable(name: "i", scope: !30, file: !3, line: 41, type: !7)
!38 = !DILocation(line: 41, column: 3, scope: !30)
!39 = !DILocalVariable(name: "target", arg: 2, scope: !30, file: !3, line: 40, type: !7)
!40 = !DILocation(line: 40, column: 5, scope: !30)
!41 = !DILocalVariable(name: "limit", arg: 1, scope: !30, file: !3, line: 40, type: !7)
!42 = !DILocation(line: 44, column: 3, scope: !30)
!43 = !DILocation(line: 45, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !30, file: !3, line: 44, column: 21)
!45 = !DILocation(line: 46, column: 5, scope: !44)
!46 = !DILocation(line: 47, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 46, column: 23)
!48 = !DILocation(line: 48, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !47, file: !3, line: 47, column: 33)
!50 = !DILocation(line: 49, column: 9, scope: !49)
!51 = !DILocation(line: 51, column: 7, scope: !47)
!52 = !DILocation(line: 53, column: 5, scope: !44)
!53 = !DILocation(line: 55, column: 1, scope: !30)
!54 = !DILocation(line: 56, column: 3, scope: !30)
!55 = distinct !DISubprogram(name: "afterReturn", linkageName: "afterReturn", scope: null, file: !3, line: 60, type: !5, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!56 = !DILocalVariable(name: "flag", arg: 1, scope: !55, file: !3, line: 60, type: !7)
!57 = !DILocation(line: 60, column: 5, scope: !55)
!58 = !DILocation(line: 61, column: 3, scope: !55)
!59 = !DILocation(line: 62, column: 5, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !3, line: 61, column: 13)
!61 = !DILocation(line: 64, column: 3, scope: !55)
!62 = !DILocation(line: 65, column: 1, scope: !55)
!63 = !DILocation(line: 66, column: 3, scope: !55)
!64 = distinct !DISubprogram(name: "fromSwitch", linkageName: "fromSwitch", scope: null, file: !3, line: 70, type: !5, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!65 = !DILocalVariable(name: "x", arg: 1, scope: !64, file: !3, line: 70, type: !7)
!66 = !DILocation(line: 70, column: 5, scope: !64)
!67 = !DILocation(line: 71, column: 3, scope: !64)
!68 = !DILocation(line: 73, column: 7, scope: !64)
!69 = !DILocation(line: 75, column: 7, scope: !64)
!70 = !DILocation(line: 77, column: 7, scope: !64)
!71 = !DILocation(line: 79, column: 3, scope: !64)
!72 = !DILocation(line: 80, column: 1, scope: !64)
!73 = !DILocation(line: 81, column: 3, scope: !64)
!74 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 84, type: !75, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!75 = !DISubroutineType(types: !76)
!76 = !{!7}
!77 = !DILocalVariable(name: "failed", scope: !74, file: !3, line: 85, type: !7)
!78 = !DILocation(line: 85, column: 3, scope: !74)
!79 = !DILocation(line: 87, column: 3, scope: !74)
!80 = !DILocation(line: 88, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !3, line: 87, column: 24)
!82 = !DILocation(line: 90, column: 3, scope: !74)
!83 = !DILocation(line: 91, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !3, line: 90, column: 37)
!85 = !DILocation(line: 93, column: 3, scope: !74)
!86 = !DILocation(line: 94, column: 5, scope: !87)
!87 = distinct !DILexicalBlock(scope: !74, file: !3, line: 93, column: 57)
!88 = !DILocation(line: 96, column: 3, scope: !74)
!89 = !DILocation(line: 97, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !74, file: !3, line: 96, column: 51)
!91 = !DILocation(line: 99, column: 3, scope: !74)
!92 = !DILocation(line: 100, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !74, file: !3, line: 99, column: 73)
!94 = !DILocation(line: 103, column: 3, scope: !74)
!95 = !DILocation(line: 104, column: 5, scope: !96)
!96 = distinct !DILexicalBlock(scope: !74, file: !3, line: 103, column: 20)
!97 = !DILocation(line: 105, column: 5, scope: !96)
!98 = !DILocation(line: 107, column: 3, scope: !74)
!99 = !DILocation(line: 108, column: 3, scope: !74)
