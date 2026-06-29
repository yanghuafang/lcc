; ModuleID = 'lcc'
source_filename = "lcc"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i8 @gradeOfScore(i32 %0) !dbg !2 {
entry:
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !8, !DIExpression(), !9)
  %score = alloca i32, align 4
    #dbg_declare(ptr %score, !10, !DIExpression(), !11)
  store i32 %0, ptr %score, align 4, !dbg !11
  %1 = load i32, ptr %score, align 4, !dbg !12
  %2 = icmp eq i32 %1, 1, !dbg !12
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !12

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2, !dbg !12
  br i1 %3, label %case.1, label %switch.compare.1, !dbg !12

switch.compare.1:                                 ; preds = %switch.compare.0
  %4 = icmp eq i32 %1, 3, !dbg !12
  br i1 %4, label %case.2, label %switch.compare.2, !dbg !12

switch.compare.2:                                 ; preds = %switch.compare.1
  %5 = icmp eq i32 %1, 4, !dbg !12
  br i1 %5, label %case.3, label %switch.compare.3, !dbg !12

switch.compare.3:                                 ; preds = %switch.compare.2
  %6 = icmp eq i32 %1, 5, !dbg !12
  br i1 %6, label %case.4, label %switch.compare.4, !dbg !12

switch.compare.4:                                 ; preds = %switch.compare.3
  %7 = icmp eq i32 %1, 6, !dbg !12
  br i1 %7, label %case.5, label %switch.compare.5, !dbg !12

switch.compare.5:                                 ; preds = %switch.compare.4
  %8 = icmp eq i32 %1, 7, !dbg !12
  br i1 %8, label %case.6, label %switch.compare.6, !dbg !12

switch.compare.6:                                 ; preds = %switch.compare.5
  %9 = icmp eq i32 %1, 8, !dbg !12
  br i1 %9, label %case.7, label %switch.compare.7, !dbg !12

switch.compare.7:                                 ; preds = %switch.compare.6
  %10 = icmp eq i32 %1, 9, !dbg !12
  br i1 %10, label %case.8, label %switch.compare.8, !dbg !12

switch.compare.8:                                 ; preds = %switch.compare.7
  %11 = icmp eq i32 %1, 10, !dbg !12
  br i1 %11, label %case.9, label %switch.compare.9, !dbg !12

switch.compare.9:                                 ; preds = %switch.compare.8
  br label %case.10, !dbg !12

case.0:                                           ; preds = %entry
  br label %case.1, !dbg !13

case.1:                                           ; preds = %case.0, %switch.compare.0
  br label %case.2, !dbg !14

case.2:                                           ; preds = %case.1, %switch.compare.1
  br label %case.3, !dbg !15

case.3:                                           ; preds = %case.2, %switch.compare.2
  br label %case.4, !dbg !16

case.4:                                           ; preds = %case.3, %switch.compare.3
  store i8 68, ptr %grade, align 1, !dbg !17
  %12 = load i8, ptr %grade, align 1, !dbg !17
  br label %switch.end, !dbg !18

case.5:                                           ; preds = %switch.compare.4
  store i8 67, ptr %grade, align 1, !dbg !19
  %13 = load i8, ptr %grade, align 1, !dbg !19
  br label %switch.end, !dbg !20

case.6:                                           ; preds = %switch.compare.5
  br label %case.7, !dbg !21

case.7:                                           ; preds = %case.6, %switch.compare.6
  store i8 66, ptr %grade, align 1, !dbg !22
  %14 = load i8, ptr %grade, align 1, !dbg !22
  br label %switch.end, !dbg !23

case.8:                                           ; preds = %switch.compare.7
  br label %case.9, !dbg !24

case.9:                                           ; preds = %case.8, %switch.compare.8
  store i8 65, ptr %grade, align 1, !dbg !25
  %15 = load i8, ptr %grade, align 1, !dbg !25
  br label %switch.end, !dbg !26

case.10:                                          ; preds = %switch.compare.9
  store i8 69, ptr %grade, align 1, !dbg !27
  %16 = load i8, ptr %grade, align 1, !dbg !27
  br label %switch.end, !dbg !28

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %17 = load i8, ptr %grade, align 1, !dbg !29
  ret i8 %17, !dbg !29
}

define i32 @main() !dbg !30 {
entry:
  %boundary = alloca i32, align 4
    #dbg_declare(ptr %boundary, !33, !DIExpression(), !34)
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !35, !DIExpression(), !36)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !37, !DIExpression(), !38)
  store i32 0, ptr %err, align 4, !dbg !38
  %0 = call i8 @gradeOfScore(i32 3), !dbg !39
  %1 = sext i8 %0 to i32, !dbg !39
  %2 = icmp ne i32 %1, 68, !dbg !39
  br i1 %2, label %then, label %else, !dbg !39

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !40
  %3 = load i32, ptr %err, align 4, !dbg !40
  br label %if.end, !dbg !40

else:                                             ; preds = %entry
  br label %if.end, !dbg !40

if.end:                                           ; preds = %else, %then
  %4 = call i8 @gradeOfScore(i32 5), !dbg !41
  %5 = sext i8 %4 to i32, !dbg !41
  %6 = icmp ne i32 %5, 68, !dbg !41
  br i1 %6, label %then1, label %else2, !dbg !41

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !42
  %7 = load i32, ptr %err, align 4, !dbg !42
  br label %if.end3, !dbg !42

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %else2, %then1
  %8 = call i8 @gradeOfScore(i32 6), !dbg !43
  %9 = sext i8 %8 to i32, !dbg !43
  %10 = icmp ne i32 %9, 67, !dbg !43
  br i1 %10, label %then4, label %else5, !dbg !43

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !44
  %11 = load i32, ptr %err, align 4, !dbg !44
  br label %if.end6, !dbg !44

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !44

if.end6:                                          ; preds = %else5, %then4
  %12 = call i8 @gradeOfScore(i32 8), !dbg !45
  %13 = sext i8 %12 to i32, !dbg !45
  %14 = icmp ne i32 %13, 66, !dbg !45
  br i1 %14, label %then7, label %else8, !dbg !45

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !46
  %15 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end9, !dbg !46

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !46

if.end9:                                          ; preds = %else8, %then7
  %16 = call i8 @gradeOfScore(i32 9), !dbg !47
  %17 = sext i8 %16 to i32, !dbg !47
  %18 = icmp ne i32 %17, 65, !dbg !47
  br i1 %18, label %then10, label %else11, !dbg !47

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !48
  %19 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end12, !dbg !48

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !48

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %boundary, align 4, !dbg !34
  %20 = load i32, ptr %boundary, align 4, !dbg !49
  br label %case.0, !dbg !49

case.0:                                           ; preds = %if.end12
  store i8 69, ptr %grade, align 1, !dbg !50
  %21 = load i8, ptr %grade, align 1, !dbg !50
  br label %switch.end, !dbg !51

switch.end:                                       ; preds = %case.0
  %22 = load i8, ptr %grade, align 1, !dbg !52
  %23 = sext i8 %22 to i32, !dbg !52
  %24 = icmp ne i32 %23, 69, !dbg !52
  br i1 %24, label %then13, label %else14, !dbg !52

then13:                                           ; preds = %switch.end
  store i32 1, ptr %err, align 4, !dbg !53
  %25 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end15, !dbg !53

else14:                                           ; preds = %switch.end
  br label %if.end15, !dbg !53

if.end15:                                         ; preds = %else14, %then13
  %26 = load i32, ptr %err, align 4, !dbg !54
  %27 = icmp eq i32 %26, 0, !dbg !54
  br i1 %27, label %then16, label %else17, !dbg !54

then16:                                           ; preds = %if.end15
  %28 = call i32 (ptr, ...) @printf(ptr @0), !dbg !55
  br label %if.end18, !dbg !55

else17:                                           ; preds = %if.end15
  %29 = call i32 (ptr, ...) @printf(ptr @1), !dbg !57
  br label %if.end18, !dbg !57

if.end18:                                         ; preds = %else17, %then16
  %30 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %30, !dbg !59
}

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "18.switch_case.c", directory: "../tests")
!2 = distinct !DISubprogram(name: "gradeOfScore", linkageName: "gradeOfScore", scope: null, file: !1, line: 3, type: !3, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!3 = !DISubroutineType(types: !4)
!4 = !{!5, !6}
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{}
!8 = !DILocalVariable(name: "grade", scope: !2, file: !1, line: 4, type: !5)
!9 = !DILocation(line: 4, column: 3, scope: !2)
!10 = !DILocalVariable(name: "score", arg: 1, scope: !2, file: !1, line: 3, type: !6)
!11 = !DILocation(line: 3, column: 6, scope: !2)
!12 = !DILocation(line: 5, column: 3, scope: !2)
!13 = !DILocation(line: 6, column: 5, scope: !2)
!14 = !DILocation(line: 7, column: 5, scope: !2)
!15 = !DILocation(line: 8, column: 5, scope: !2)
!16 = !DILocation(line: 9, column: 5, scope: !2)
!17 = !DILocation(line: 11, column: 7, scope: !2)
!18 = !DILocation(line: 12, column: 7, scope: !2)
!19 = !DILocation(line: 14, column: 7, scope: !2)
!20 = !DILocation(line: 15, column: 7, scope: !2)
!21 = !DILocation(line: 16, column: 5, scope: !2)
!22 = !DILocation(line: 18, column: 7, scope: !2)
!23 = !DILocation(line: 19, column: 7, scope: !2)
!24 = !DILocation(line: 20, column: 5, scope: !2)
!25 = !DILocation(line: 22, column: 7, scope: !2)
!26 = !DILocation(line: 23, column: 7, scope: !2)
!27 = !DILocation(line: 25, column: 7, scope: !2)
!28 = !DILocation(line: 26, column: 7, scope: !2)
!29 = !DILocation(line: 28, column: 3, scope: !2)
!30 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 31, type: !31, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !7)
!31 = !DISubroutineType(types: !32)
!32 = !{!6}
!33 = !DILocalVariable(name: "boundary", scope: !30, file: !1, line: 41, type: !6)
!34 = !DILocation(line: 41, column: 3, scope: !30)
!35 = !DILocalVariable(name: "grade", scope: !30, file: !1, line: 40, type: !5)
!36 = !DILocation(line: 40, column: 3, scope: !30)
!37 = !DILocalVariable(name: "err", scope: !30, file: !1, line: 32, type: !6)
!38 = !DILocation(line: 32, column: 3, scope: !30)
!39 = !DILocation(line: 34, column: 3, scope: !30)
!40 = !DILocation(line: 34, column: 31, scope: !30)
!41 = !DILocation(line: 35, column: 3, scope: !30)
!42 = !DILocation(line: 35, column: 31, scope: !30)
!43 = !DILocation(line: 36, column: 3, scope: !30)
!44 = !DILocation(line: 36, column: 31, scope: !30)
!45 = !DILocation(line: 37, column: 3, scope: !30)
!46 = !DILocation(line: 37, column: 31, scope: !30)
!47 = !DILocation(line: 38, column: 3, scope: !30)
!48 = !DILocation(line: 38, column: 31, scope: !30)
!49 = !DILocation(line: 42, column: 3, scope: !30)
!50 = !DILocation(line: 44, column: 7, scope: !30)
!51 = !DILocation(line: 45, column: 7, scope: !30)
!52 = !DILocation(line: 47, column: 3, scope: !30)
!53 = !DILocation(line: 47, column: 21, scope: !30)
!54 = !DILocation(line: 49, column: 3, scope: !30)
!55 = !DILocation(line: 50, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !30, file: !1, line: 49, column: 17)
!57 = !DILocation(line: 52, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !30, file: !1, line: 51, column: 10)
!59 = !DILocation(line: 54, column: 3, scope: !30)
