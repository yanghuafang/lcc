; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i8 @gradeOfScore(i32 %0) !dbg !2 {
entry:
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !7, !DIExpression(), !8)
  %score = alloca i32, align 4
    #dbg_declare(ptr %score, !9, !DIExpression(), !10)
  store i32 %0, ptr %score, align 4, !dbg !10
  %1 = load i32, ptr %score, align 4, !dbg !11
  %2 = icmp eq i32 %1, 1, !dbg !11
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !11

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2, !dbg !11
  br i1 %3, label %case.1, label %switch.compare.1, !dbg !11

switch.compare.1:                                 ; preds = %switch.compare.0
  %4 = icmp eq i32 %1, 3, !dbg !11
  br i1 %4, label %case.2, label %switch.compare.2, !dbg !11

switch.compare.2:                                 ; preds = %switch.compare.1
  %5 = icmp eq i32 %1, 4, !dbg !11
  br i1 %5, label %case.3, label %switch.compare.3, !dbg !11

switch.compare.3:                                 ; preds = %switch.compare.2
  %6 = icmp eq i32 %1, 5, !dbg !11
  br i1 %6, label %case.4, label %switch.compare.4, !dbg !11

switch.compare.4:                                 ; preds = %switch.compare.3
  %7 = icmp eq i32 %1, 6, !dbg !11
  br i1 %7, label %case.5, label %switch.compare.5, !dbg !11

switch.compare.5:                                 ; preds = %switch.compare.4
  %8 = icmp eq i32 %1, 7, !dbg !11
  br i1 %8, label %case.6, label %switch.compare.6, !dbg !11

switch.compare.6:                                 ; preds = %switch.compare.5
  %9 = icmp eq i32 %1, 8, !dbg !11
  br i1 %9, label %case.7, label %switch.compare.7, !dbg !11

switch.compare.7:                                 ; preds = %switch.compare.6
  %10 = icmp eq i32 %1, 9, !dbg !11
  br i1 %10, label %case.8, label %switch.compare.8, !dbg !11

switch.compare.8:                                 ; preds = %switch.compare.7
  %11 = icmp eq i32 %1, 10, !dbg !11
  br i1 %11, label %case.9, label %switch.compare.9, !dbg !11

switch.compare.9:                                 ; preds = %switch.compare.8
  br label %case.10, !dbg !11

case.0:                                           ; preds = %entry
  br label %case.1, !dbg !12

case.1:                                           ; preds = %case.0, %switch.compare.0
  br label %case.2, !dbg !13

case.2:                                           ; preds = %case.1, %switch.compare.1
  br label %case.3, !dbg !14

case.3:                                           ; preds = %case.2, %switch.compare.2
  br label %case.4, !dbg !15

case.4:                                           ; preds = %case.3, %switch.compare.3
  store i8 68, ptr %grade, align 1, !dbg !16
  %12 = load i8, ptr %grade, align 1, !dbg !16
  br label %switch.end, !dbg !17

case.5:                                           ; preds = %switch.compare.4
  store i8 67, ptr %grade, align 1, !dbg !18
  %13 = load i8, ptr %grade, align 1, !dbg !18
  br label %switch.end, !dbg !19

case.6:                                           ; preds = %switch.compare.5
  br label %case.7, !dbg !20

case.7:                                           ; preds = %case.6, %switch.compare.6
  store i8 66, ptr %grade, align 1, !dbg !21
  %14 = load i8, ptr %grade, align 1, !dbg !21
  br label %switch.end, !dbg !22

case.8:                                           ; preds = %switch.compare.7
  br label %case.9, !dbg !23

case.9:                                           ; preds = %case.8, %switch.compare.8
  store i8 65, ptr %grade, align 1, !dbg !24
  %15 = load i8, ptr %grade, align 1, !dbg !24
  br label %switch.end, !dbg !25

case.10:                                          ; preds = %switch.compare.9
  store i8 69, ptr %grade, align 1, !dbg !26
  %16 = load i8, ptr %grade, align 1, !dbg !26
  br label %switch.end, !dbg !27

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %17 = load i8, ptr %grade, align 1, !dbg !28
  ret i8 %17, !dbg !28
}

define i32 @main() !dbg !29 {
entry:
  %boundary = alloca i32, align 4
    #dbg_declare(ptr %boundary, !32, !DIExpression(), !33)
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !34, !DIExpression(), !35)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !36, !DIExpression(), !37)
  store i32 0, ptr %err, align 4, !dbg !37
  %0 = call i8 @gradeOfScore(i32 3), !dbg !38
  %1 = sext i8 %0 to i32, !dbg !38
  %2 = icmp ne i32 %1, 68, !dbg !38
  br i1 %2, label %then, label %else, !dbg !38

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !39
  %3 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end, !dbg !39

else:                                             ; preds = %entry
  br label %if.end, !dbg !39

if.end:                                           ; preds = %else, %then
  %4 = call i8 @gradeOfScore(i32 5), !dbg !40
  %5 = sext i8 %4 to i32, !dbg !40
  %6 = icmp ne i32 %5, 68, !dbg !40
  br i1 %6, label %then1, label %else2, !dbg !40

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !41
  %7 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end3, !dbg !41

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %else2, %then1
  %8 = call i8 @gradeOfScore(i32 6), !dbg !42
  %9 = sext i8 %8 to i32, !dbg !42
  %10 = icmp ne i32 %9, 67, !dbg !42
  br i1 %10, label %then4, label %else5, !dbg !42

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !43
  %11 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end6, !dbg !43

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !43

if.end6:                                          ; preds = %else5, %then4
  %12 = call i8 @gradeOfScore(i32 8), !dbg !44
  %13 = sext i8 %12 to i32, !dbg !44
  %14 = icmp ne i32 %13, 66, !dbg !44
  br i1 %14, label %then7, label %else8, !dbg !44

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !45
  %15 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end9, !dbg !45

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !45

if.end9:                                          ; preds = %else8, %then7
  %16 = call i8 @gradeOfScore(i32 9), !dbg !46
  %17 = sext i8 %16 to i32, !dbg !46
  %18 = icmp ne i32 %17, 65, !dbg !46
  br i1 %18, label %then10, label %else11, !dbg !46

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !47
  %19 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end12, !dbg !47

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !47

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %boundary, align 4, !dbg !33
  %20 = load i32, ptr %boundary, align 4, !dbg !48
  br label %case.0, !dbg !48

case.0:                                           ; preds = %if.end12
  store i8 69, ptr %grade, align 1, !dbg !49
  %21 = load i8, ptr %grade, align 1, !dbg !49
  br label %switch.end, !dbg !50

switch.end:                                       ; preds = %case.0
  %22 = load i8, ptr %grade, align 1, !dbg !51
  %23 = sext i8 %22 to i32, !dbg !51
  %24 = icmp ne i32 %23, 69, !dbg !51
  br i1 %24, label %then13, label %else14, !dbg !51

then13:                                           ; preds = %switch.end
  store i32 1, ptr %err, align 4, !dbg !52
  %25 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end15, !dbg !52

else14:                                           ; preds = %switch.end
  br label %if.end15, !dbg !52

if.end15:                                         ; preds = %else14, %then13
  %26 = load i32, ptr %err, align 4, !dbg !53
  %27 = icmp eq i32 %26, 0, !dbg !53
  br i1 %27, label %then16, label %else17, !dbg !53

then16:                                           ; preds = %if.end15
  %28 = call i32 (ptr, ...) @printf(ptr @0), !dbg !54
  br label %if.end18, !dbg !54

else17:                                           ; preds = %if.end15
  %29 = call i32 (ptr, ...) @printf(ptr @1), !dbg !56
  br label %if.end18, !dbg !56

if.end18:                                         ; preds = %else17, %then16
  %30 = load i32, ptr %err, align 4, !dbg !58
  ret i32 %30, !dbg !58
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "18.switch_case.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "gradeOfScore", linkageName: "gradeOfScore", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DILocalVariable(name: "grade", scope: !2, file: !1, line: 4, type: !5)
!8 = !DILocation(line: 4, column: 3, scope: !2)
!9 = !DILocalVariable(name: "score", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!10 = !DILocation(line: 3, column: 6, scope: !2)
!11 = !DILocation(line: 5, column: 3, scope: !2)
!12 = !DILocation(line: 6, column: 5, scope: !2)
!13 = !DILocation(line: 7, column: 5, scope: !2)
!14 = !DILocation(line: 8, column: 5, scope: !2)
!15 = !DILocation(line: 9, column: 5, scope: !2)
!16 = !DILocation(line: 11, column: 7, scope: !2)
!17 = !DILocation(line: 12, column: 7, scope: !2)
!18 = !DILocation(line: 14, column: 7, scope: !2)
!19 = !DILocation(line: 15, column: 7, scope: !2)
!20 = !DILocation(line: 16, column: 5, scope: !2)
!21 = !DILocation(line: 18, column: 7, scope: !2)
!22 = !DILocation(line: 19, column: 7, scope: !2)
!23 = !DILocation(line: 20, column: 5, scope: !2)
!24 = !DILocation(line: 22, column: 7, scope: !2)
!25 = !DILocation(line: 23, column: 7, scope: !2)
!26 = !DILocation(line: 25, column: 7, scope: !2)
!27 = !DILocation(line: 26, column: 7, scope: !2)
!28 = !DILocation(line: 28, column: 3, scope: !2)
!29 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 31, type: !30, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0)
!30 = !DISubroutineType(types: !31)
!31 = !{!6}
!32 = !DILocalVariable(name: "boundary", scope: !29, file: !1, line: 41, type: !6)
!33 = !DILocation(line: 41, column: 3, scope: !29)
!34 = !DILocalVariable(name: "grade", scope: !29, file: !1, line: 40, type: !5)
!35 = !DILocation(line: 40, column: 3, scope: !29)
!36 = !DILocalVariable(name: "err", scope: !29, file: !1, line: 32, type: !6)
!37 = !DILocation(line: 32, column: 3, scope: !29)
!38 = !DILocation(line: 34, column: 3, scope: !29)
!39 = !DILocation(line: 34, column: 31, scope: !29)
!40 = !DILocation(line: 35, column: 3, scope: !29)
!41 = !DILocation(line: 35, column: 31, scope: !29)
!42 = !DILocation(line: 36, column: 3, scope: !29)
!43 = !DILocation(line: 36, column: 31, scope: !29)
!44 = !DILocation(line: 37, column: 3, scope: !29)
!45 = !DILocation(line: 37, column: 31, scope: !29)
!46 = !DILocation(line: 38, column: 3, scope: !29)
!47 = !DILocation(line: 38, column: 31, scope: !29)
!48 = !DILocation(line: 42, column: 3, scope: !29)
!49 = !DILocation(line: 44, column: 7, scope: !29)
!50 = !DILocation(line: 45, column: 7, scope: !29)
!51 = !DILocation(line: 47, column: 3, scope: !29)
!52 = !DILocation(line: 47, column: 21, scope: !29)
!53 = !DILocation(line: 49, column: 3, scope: !29)
!54 = !DILocation(line: 50, column: 5, scope: !55)
!55 = distinct !DILexicalBlock(scope: !29, file: !1, line: 49, column: 17)
!56 = !DILocation(line: 52, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !29, file: !1, line: 51, column: 10)
!58 = !DILocation(line: 54, column: 3, scope: !29)
