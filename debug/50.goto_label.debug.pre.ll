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
    #dbg_declare(ptr %i, !8, !DIExpression(), !9)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !10, !DIExpression(), !11)
  store i32 %0, ptr %n, align 4, !dbg !11
  store i32 0, ptr %i, align 4, !dbg !9
  br label %label.top, !dbg !12

label.top:                                        ; preds = %then, %entry
  %1 = load i32, ptr %i, align 4, !dbg !13
  %2 = add i32 %1, 1, !dbg !13
  store i32 %2, ptr %i, align 4, !dbg !13
  %3 = load i32, ptr %i, align 4, !dbg !13
  %4 = load i32, ptr %i, align 4, !dbg !14
  %5 = load i32, ptr %n, align 4, !dbg !14
  %6 = icmp slt i32 %4, %5, !dbg !14
  br i1 %6, label %then, label %else, !dbg !14

then:                                             ; preds = %label.top
  br label %label.top, !dbg !15

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !15

else:                                             ; preds = %label.top
  br label %if.end, !dbg !15

if.end:                                           ; preds = %else, %goto.cont
  %7 = load i32, ptr %i, align 4, !dbg !17
  ret i32 %7, !dbg !17
}

define i32 @skip(i32 %0) !dbg !18 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !19, !DIExpression(), !20)
  %flag = alloca i32, align 4
    #dbg_declare(ptr %flag, !21, !DIExpression(), !22)
  store i32 %0, ptr %flag, align 4, !dbg !22
  store i32 1, ptr %r, align 4, !dbg !20
  %1 = load i32, ptr %flag, align 4, !dbg !23
  %2 = icmp ne i32 %1, 0, !dbg !23
  br i1 %2, label %then, label %else, !dbg !23

then:                                             ; preds = %entry
  br label %label.done, !dbg !24

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !24

else:                                             ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %else, %goto.cont
  store i32 2, ptr %r, align 4, !dbg !26
  %3 = load i32, ptr %r, align 4, !dbg !26
  br label %label.done, !dbg !27

label.done:                                       ; preds = %if.end, %then
  %4 = load i32, ptr %r, align 4, !dbg !28
  ret i32 %4, !dbg !28
}

define i32 @firstPair(i32 %0, i32 %1) !dbg !29 {
entry:
  %found = alloca i32, align 4
    #dbg_declare(ptr %found, !32, !DIExpression(), !33)
  %j = alloca i32, align 4
    #dbg_declare(ptr %j, !34, !DIExpression(), !35)
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !36, !DIExpression(), !37)
  %target = alloca i32, align 4
    #dbg_declare(ptr %target, !38, !DIExpression(), !39)
  %limit = alloca i32, align 4
    #dbg_declare(ptr %limit, !40, !DIExpression(), !39)
  store i32 %0, ptr %limit, align 4, !dbg !39
  store i32 %1, ptr %target, align 4, !dbg !39
  store i32 0, ptr %i, align 4, !dbg !37
  store i32 -1, ptr %found, align 4, !dbg !33
  br label %while.cond, !dbg !41

while.cond:                                       ; preds = %while.end, %entry
  %2 = load i32, ptr %i, align 4, !dbg !41
  %3 = load i32, ptr %limit, align 4, !dbg !41
  %4 = icmp slt i32 %2, %3, !dbg !41
  br i1 %4, label %while.loop, label %while.end3, !dbg !41

while.loop:                                       ; preds = %while.cond
  store i32 0, ptr %j, align 4, !dbg !42
  %5 = load i32, ptr %j, align 4, !dbg !42
  br label %while.cond1, !dbg !44

while.cond1:                                      ; preds = %if.end, %while.loop
  %6 = load i32, ptr %j, align 4, !dbg !44
  %7 = load i32, ptr %limit, align 4, !dbg !44
  %8 = icmp slt i32 %6, %7, !dbg !44
  br i1 %8, label %while.loop2, label %while.end, !dbg !44

while.loop2:                                      ; preds = %while.cond1
  %9 = load i32, ptr %i, align 4, !dbg !45
  %10 = mul i32 %9, 10, !dbg !45
  %11 = load i32, ptr %j, align 4, !dbg !45
  %12 = add i32 %10, %11, !dbg !45
  %13 = load i32, ptr %target, align 4, !dbg !45
  %14 = icmp eq i32 %12, %13, !dbg !45
  br i1 %14, label %then, label %else, !dbg !45

then:                                             ; preds = %while.loop2
  %15 = load i32, ptr %i, align 4, !dbg !47
  %16 = mul i32 %15, 10, !dbg !47
  %17 = load i32, ptr %j, align 4, !dbg !47
  %18 = add i32 %16, %17, !dbg !47
  store i32 %18, ptr %found, align 4, !dbg !47
  %19 = load i32, ptr %found, align 4, !dbg !47
  br label %label.out, !dbg !49

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !49

else:                                             ; preds = %while.loop2
  br label %if.end, !dbg !49

if.end:                                           ; preds = %else, %goto.cont
  %20 = load i32, ptr %j, align 4, !dbg !50
  %21 = add i32 %20, 1, !dbg !50
  store i32 %21, ptr %j, align 4, !dbg !50
  %22 = load i32, ptr %j, align 4, !dbg !50
  br label %while.cond1, !dbg !50

while.end:                                        ; preds = %while.cond1
  %23 = load i32, ptr %i, align 4, !dbg !51
  %24 = add i32 %23, 1, !dbg !51
  store i32 %24, ptr %i, align 4, !dbg !51
  %25 = load i32, ptr %i, align 4, !dbg !51
  br label %while.cond, !dbg !51

while.end3:                                       ; preds = %while.cond
  br label %label.out, !dbg !52

label.out:                                        ; preds = %while.end3, %then
  %26 = load i32, ptr %found, align 4, !dbg !53
  ret i32 %26, !dbg !53
}

define i32 @afterReturn(i32 %0) !dbg !54 {
entry:
  %flag = alloca i32, align 4
    #dbg_declare(ptr %flag, !55, !DIExpression(), !56)
  store i32 %0, ptr %flag, align 4, !dbg !56
  %1 = load i32, ptr %flag, align 4, !dbg !57
  %2 = icmp ne i32 %1, 0, !dbg !57
  br i1 %2, label %then, label %else, !dbg !57

then:                                             ; preds = %entry
  br label %label.tail, !dbg !58

goto.cont:                                        ; No predecessors!
  br label %if.end, !dbg !58

else:                                             ; preds = %entry
  br label %if.end, !dbg !58

if.end:                                           ; preds = %else, %goto.cont
  ret i32 1, !dbg !60

label.pred:                                       ; No predecessors!
  br label %label.tail, !dbg !61

label.tail:                                       ; preds = %label.pred, %then
  ret i32 2, !dbg !62
}

define i32 @fromSwitch(i32 %0) !dbg !63 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !64, !DIExpression(), !65)
  store i32 %0, ptr %x, align 4, !dbg !65
  %1 = load i32, ptr %x, align 4, !dbg !66
  %2 = icmp eq i32 %1, 1, !dbg !66
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !66

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2, !dbg !66
  br i1 %3, label %case.1, label %case.2, !dbg !66

case.0:                                           ; preds = %entry
  br label %label.one, !dbg !67

goto.cont:                                        ; No predecessors!
  br label %case.1, !dbg !67

case.1:                                           ; preds = %goto.cont, %switch.compare.0
  ret i32 20, !dbg !68

case.2:                                           ; preds = %switch.compare.0
  br label %switch.end, !dbg !69

switch.end:                                       ; preds = %case.2
  ret i32 0, !dbg !70

label.pred:                                       ; No predecessors!
  br label %label.one, !dbg !71

label.one:                                        ; preds = %label.pred, %case.0
  ret i32 10, !dbg !72
}

define i32 @main() !dbg !73 {
entry:
  %failed = alloca i32, align 4
    #dbg_declare(ptr %failed, !76, !DIExpression(), !77)
  store i32 0, ptr %failed, align 4, !dbg !77
  %0 = call i32 @countTo(i32 5), !dbg !78
  %1 = icmp ne i32 %0, 5, !dbg !78
  br i1 %1, label %then, label %else, !dbg !78

then:                                             ; preds = %entry
  store i32 1, ptr %failed, align 4, !dbg !79
  %2 = load i32, ptr %failed, align 4, !dbg !79
  br label %if.end, !dbg !79

else:                                             ; preds = %entry
  br label %if.end, !dbg !79

if.end:                                           ; preds = %else, %then
  %3 = call i32 @skip(i32 1), !dbg !81
  %4 = icmp ne i32 %3, 1, !dbg !81
  br i1 %4, label %lor.end, label %lor.rhs, !dbg !81

lor.rhs:                                          ; preds = %if.end
  %5 = call i32 @skip(i32 0), !dbg !81
  %6 = icmp ne i32 %5, 2, !dbg !81
  br label %lor.end, !dbg !81

lor.end:                                          ; preds = %lor.rhs, %if.end
  %7 = phi i1 [ true, %if.end ], [ %6, %lor.rhs ], !dbg !81
  br i1 %7, label %then1, label %else2, !dbg !81

then1:                                            ; preds = %lor.end
  store i32 1, ptr %failed, align 4, !dbg !82
  %8 = load i32, ptr %failed, align 4, !dbg !82
  br label %if.end3, !dbg !82

else2:                                            ; preds = %lor.end
  br label %if.end3, !dbg !82

if.end3:                                          ; preds = %else2, %then1
  %9 = call i32 @firstPair(i32 5, i32 23), !dbg !84
  %10 = icmp ne i32 %9, 23, !dbg !84
  br i1 %10, label %lor.end5, label %lor.rhs4, !dbg !84

lor.rhs4:                                         ; preds = %if.end3
  %11 = call i32 @firstPair(i32 3, i32 99), !dbg !84
  %12 = icmp ne i32 %11, -1, !dbg !84
  br label %lor.end5, !dbg !84

lor.end5:                                         ; preds = %lor.rhs4, %if.end3
  %13 = phi i1 [ true, %if.end3 ], [ %12, %lor.rhs4 ], !dbg !84
  br i1 %13, label %then6, label %else7, !dbg !84

then6:                                            ; preds = %lor.end5
  store i32 1, ptr %failed, align 4, !dbg !85
  %14 = load i32, ptr %failed, align 4, !dbg !85
  br label %if.end8, !dbg !85

else7:                                            ; preds = %lor.end5
  br label %if.end8, !dbg !85

if.end8:                                          ; preds = %else7, %then6
  %15 = call i32 @afterReturn(i32 1), !dbg !87
  %16 = icmp ne i32 %15, 2, !dbg !87
  br i1 %16, label %lor.end10, label %lor.rhs9, !dbg !87

lor.rhs9:                                         ; preds = %if.end8
  %17 = call i32 @afterReturn(i32 0), !dbg !87
  %18 = icmp ne i32 %17, 1, !dbg !87
  br label %lor.end10, !dbg !87

lor.end10:                                        ; preds = %lor.rhs9, %if.end8
  %19 = phi i1 [ true, %if.end8 ], [ %18, %lor.rhs9 ], !dbg !87
  br i1 %19, label %then11, label %else12, !dbg !87

then11:                                           ; preds = %lor.end10
  store i32 1, ptr %failed, align 4, !dbg !88
  %20 = load i32, ptr %failed, align 4, !dbg !88
  br label %if.end13, !dbg !88

else12:                                           ; preds = %lor.end10
  br label %if.end13, !dbg !88

if.end13:                                         ; preds = %else12, %then11
  %21 = call i32 @fromSwitch(i32 1), !dbg !90
  %22 = icmp ne i32 %21, 10, !dbg !90
  br i1 %22, label %lor.end15, label %lor.rhs14, !dbg !90

lor.rhs14:                                        ; preds = %if.end13
  %23 = call i32 @fromSwitch(i32 2), !dbg !90
  %24 = icmp ne i32 %23, 20, !dbg !90
  br label %lor.end15, !dbg !90

lor.end15:                                        ; preds = %lor.rhs14, %if.end13
  %25 = phi i1 [ true, %if.end13 ], [ %24, %lor.rhs14 ], !dbg !90
  br i1 %25, label %lor.end17, label %lor.rhs16, !dbg !90

lor.rhs16:                                        ; preds = %lor.end15
  %26 = call i32 @fromSwitch(i32 9), !dbg !90
  %27 = icmp ne i32 %26, 0, !dbg !90
  br label %lor.end17, !dbg !90

lor.end17:                                        ; preds = %lor.rhs16, %lor.end15
  %28 = phi i1 [ true, %lor.end15 ], [ %27, %lor.rhs16 ], !dbg !90
  br i1 %28, label %then18, label %else19, !dbg !90

then18:                                           ; preds = %lor.end17
  store i32 1, ptr %failed, align 4, !dbg !91
  %29 = load i32, ptr %failed, align 4, !dbg !91
  br label %if.end20, !dbg !91

else19:                                           ; preds = %lor.end17
  br label %if.end20, !dbg !91

if.end20:                                         ; preds = %else19, %then18
  %30 = load i32, ptr %failed, align 4, !dbg !93
  %31 = icmp eq i32 %30, 0, !dbg !93
  br i1 %31, label %then21, label %else22, !dbg !93

then21:                                           ; preds = %if.end20
  %32 = call i32 (ptr, ...) @printf(ptr @0), !dbg !94
  ret i32 0, !dbg !96

else22:                                           ; preds = %if.end20
  br label %if.end23, !dbg !96

if.end23:                                         ; preds = %else22
  %33 = call i32 (ptr, ...) @printf(ptr @1), !dbg !97
  ret i32 1, !dbg !98
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "50.goto_label.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countTo", linkageName: "countTo", scope: null, file: !3, line: 18, type: !5, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 19, type: !7)
!9 = !DILocation(line: 19, column: 3, scope: !4)
!10 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !3, line: 18, type: !7)
!11 = !DILocation(line: 18, column: 5, scope: !4)
!12 = !DILocation(line: 20, column: 1, scope: !4)
!13 = !DILocation(line: 21, column: 3, scope: !4)
!14 = !DILocation(line: 22, column: 3, scope: !4)
!15 = !DILocation(line: 23, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !3, line: 22, column: 14)
!17 = !DILocation(line: 25, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "skip", linkageName: "skip", scope: null, file: !3, line: 29, type: !5, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2)
!19 = !DILocalVariable(name: "r", scope: !18, file: !3, line: 30, type: !7)
!20 = !DILocation(line: 30, column: 3, scope: !18)
!21 = !DILocalVariable(name: "flag", arg: 1, scope: !18, file: !3, line: 29, type: !7)
!22 = !DILocation(line: 29, column: 5, scope: !18)
!23 = !DILocation(line: 31, column: 3, scope: !18)
!24 = !DILocation(line: 32, column: 5, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !3, line: 31, column: 13)
!26 = !DILocation(line: 34, column: 3, scope: !18)
!27 = !DILocation(line: 35, column: 1, scope: !18)
!28 = !DILocation(line: 36, column: 3, scope: !18)
!29 = distinct !DISubprogram(name: "firstPair", linkageName: "firstPair", scope: null, file: !3, line: 40, type: !30, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!7, !7, !7}
!32 = !DILocalVariable(name: "found", scope: !29, file: !3, line: 43, type: !7)
!33 = !DILocation(line: 43, column: 3, scope: !29)
!34 = !DILocalVariable(name: "j", scope: !29, file: !3, line: 42, type: !7)
!35 = !DILocation(line: 42, column: 3, scope: !29)
!36 = !DILocalVariable(name: "i", scope: !29, file: !3, line: 41, type: !7)
!37 = !DILocation(line: 41, column: 3, scope: !29)
!38 = !DILocalVariable(name: "target", arg: 2, scope: !29, file: !3, line: 40, type: !7)
!39 = !DILocation(line: 40, column: 5, scope: !29)
!40 = !DILocalVariable(name: "limit", arg: 1, scope: !29, file: !3, line: 40, type: !7)
!41 = !DILocation(line: 44, column: 3, scope: !29)
!42 = !DILocation(line: 45, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !29, file: !3, line: 44, column: 21)
!44 = !DILocation(line: 46, column: 5, scope: !43)
!45 = !DILocation(line: 47, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 46, column: 23)
!47 = !DILocation(line: 48, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !3, line: 47, column: 33)
!49 = !DILocation(line: 49, column: 9, scope: !48)
!50 = !DILocation(line: 51, column: 7, scope: !46)
!51 = !DILocation(line: 53, column: 5, scope: !43)
!52 = !DILocation(line: 55, column: 1, scope: !29)
!53 = !DILocation(line: 56, column: 3, scope: !29)
!54 = distinct !DISubprogram(name: "afterReturn", linkageName: "afterReturn", scope: null, file: !3, line: 60, type: !5, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !2)
!55 = !DILocalVariable(name: "flag", arg: 1, scope: !54, file: !3, line: 60, type: !7)
!56 = !DILocation(line: 60, column: 5, scope: !54)
!57 = !DILocation(line: 61, column: 3, scope: !54)
!58 = !DILocation(line: 62, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !3, line: 61, column: 13)
!60 = !DILocation(line: 64, column: 3, scope: !54)
!61 = !DILocation(line: 65, column: 1, scope: !54)
!62 = !DILocation(line: 66, column: 3, scope: !54)
!63 = distinct !DISubprogram(name: "fromSwitch", linkageName: "fromSwitch", scope: null, file: !3, line: 70, type: !5, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !2)
!64 = !DILocalVariable(name: "x", arg: 1, scope: !63, file: !3, line: 70, type: !7)
!65 = !DILocation(line: 70, column: 5, scope: !63)
!66 = !DILocation(line: 71, column: 3, scope: !63)
!67 = !DILocation(line: 73, column: 7, scope: !63)
!68 = !DILocation(line: 75, column: 7, scope: !63)
!69 = !DILocation(line: 77, column: 7, scope: !63)
!70 = !DILocation(line: 79, column: 3, scope: !63)
!71 = !DILocation(line: 80, column: 1, scope: !63)
!72 = !DILocation(line: 81, column: 3, scope: !63)
!73 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 84, type: !74, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7}
!76 = !DILocalVariable(name: "failed", scope: !73, file: !3, line: 85, type: !7)
!77 = !DILocation(line: 85, column: 3, scope: !73)
!78 = !DILocation(line: 87, column: 3, scope: !73)
!79 = !DILocation(line: 88, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !3, line: 87, column: 24)
!81 = !DILocation(line: 90, column: 3, scope: !73)
!82 = !DILocation(line: 91, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !3, line: 90, column: 37)
!84 = !DILocation(line: 93, column: 3, scope: !73)
!85 = !DILocation(line: 94, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !73, file: !3, line: 93, column: 57)
!87 = !DILocation(line: 96, column: 3, scope: !73)
!88 = !DILocation(line: 97, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !73, file: !3, line: 96, column: 51)
!90 = !DILocation(line: 99, column: 3, scope: !73)
!91 = !DILocation(line: 100, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !73, file: !3, line: 99, column: 73)
!93 = !DILocation(line: 103, column: 3, scope: !73)
!94 = !DILocation(line: 104, column: 5, scope: !95)
!95 = distinct !DILexicalBlock(scope: !73, file: !3, line: 103, column: 20)
!96 = !DILocation(line: 105, column: 5, scope: !95)
!97 = !DILocation(line: 107, column: 3, scope: !73)
!98 = !DILocation(line: 108, column: 3, scope: !73)
