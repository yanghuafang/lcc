; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [23 x i8] c"18.switch_case.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [23 x i8] c"18.switch_case.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i8 @gradeOfScore(i32 %0) !dbg !4 {
entry:
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !9, !DIExpression(), !10)
  %score = alloca i32, align 4
    #dbg_declare(ptr %score, !11, !DIExpression(), !12)
  store i32 %0, ptr %score, align 4, !dbg !12
  %1 = load i32, ptr %score, align 4, !dbg !13
  %2 = icmp eq i32 %1, 1, !dbg !13
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !13

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2, !dbg !13
  br i1 %3, label %case.1, label %switch.compare.1, !dbg !13

switch.compare.1:                                 ; preds = %switch.compare.0
  %4 = icmp eq i32 %1, 3, !dbg !13
  br i1 %4, label %case.2, label %switch.compare.2, !dbg !13

switch.compare.2:                                 ; preds = %switch.compare.1
  %5 = icmp eq i32 %1, 4, !dbg !13
  br i1 %5, label %case.3, label %switch.compare.3, !dbg !13

switch.compare.3:                                 ; preds = %switch.compare.2
  %6 = icmp eq i32 %1, 5, !dbg !13
  br i1 %6, label %case.4, label %switch.compare.4, !dbg !13

switch.compare.4:                                 ; preds = %switch.compare.3
  %7 = icmp eq i32 %1, 6, !dbg !13
  br i1 %7, label %case.5, label %switch.compare.5, !dbg !13

switch.compare.5:                                 ; preds = %switch.compare.4
  %8 = icmp eq i32 %1, 7, !dbg !13
  br i1 %8, label %case.6, label %switch.compare.6, !dbg !13

switch.compare.6:                                 ; preds = %switch.compare.5
  %9 = icmp eq i32 %1, 8, !dbg !13
  br i1 %9, label %case.7, label %switch.compare.7, !dbg !13

switch.compare.7:                                 ; preds = %switch.compare.6
  %10 = icmp eq i32 %1, 9, !dbg !13
  br i1 %10, label %case.8, label %switch.compare.8, !dbg !13

switch.compare.8:                                 ; preds = %switch.compare.7
  %11 = icmp eq i32 %1, 10, !dbg !13
  br i1 %11, label %case.9, label %case.10, !dbg !13

case.0:                                           ; preds = %entry
  br label %case.1, !dbg !14

case.1:                                           ; preds = %case.0, %switch.compare.0
  br label %case.2, !dbg !15

case.2:                                           ; preds = %case.1, %switch.compare.1
  br label %case.3, !dbg !16

case.3:                                           ; preds = %case.2, %switch.compare.2
  br label %case.4, !dbg !17

case.4:                                           ; preds = %case.3, %switch.compare.3
  store i8 68, ptr %grade, align 1, !dbg !18
  %12 = load i8, ptr %grade, align 1, !dbg !18
  br label %switch.end, !dbg !19

case.5:                                           ; preds = %switch.compare.4
  store i8 67, ptr %grade, align 1, !dbg !20
  %13 = load i8, ptr %grade, align 1, !dbg !20
  br label %switch.end, !dbg !21

case.6:                                           ; preds = %switch.compare.5
  br label %case.7, !dbg !22

case.7:                                           ; preds = %case.6, %switch.compare.6
  store i8 66, ptr %grade, align 1, !dbg !23
  %14 = load i8, ptr %grade, align 1, !dbg !23
  br label %switch.end, !dbg !24

case.8:                                           ; preds = %switch.compare.7
  br label %case.9, !dbg !25

case.9:                                           ; preds = %case.8, %switch.compare.8
  store i8 65, ptr %grade, align 1, !dbg !26
  %15 = load i8, ptr %grade, align 1, !dbg !26
  br label %switch.end, !dbg !27

case.10:                                          ; preds = %switch.compare.8
  store i8 69, ptr %grade, align 1, !dbg !28
  %16 = load i8, ptr %grade, align 1, !dbg !28
  br label %switch.end, !dbg !29

switch.end:                                       ; preds = %case.10, %case.9, %case.7, %case.5, %case.4
  %17 = load i8, ptr %grade, align 1, !dbg !30
  ret i8 %17, !dbg !30
}

define i32 @main() !dbg !31 {
entry:
  %boundary = alloca i32, align 4
    #dbg_declare(ptr %boundary, !34, !DIExpression(), !35)
  %grade = alloca i8, align 1
    #dbg_declare(ptr %grade, !36, !DIExpression(), !37)
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !38, !DIExpression(), !39)
  store i32 0, ptr %err, align 4, !dbg !39
  %0 = call i8 @gradeOfScore(i32 3), !dbg !40
  %1 = sext i8 %0 to i32, !dbg !40
  %2 = icmp ne i32 %1, 68, !dbg !40
  br i1 %2, label %then, label %else, !dbg !40

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !41
  %3 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end, !dbg !41

else:                                             ; preds = %entry
  br label %if.end, !dbg !41

if.end:                                           ; preds = %else, %then
  %4 = call i8 @gradeOfScore(i32 5), !dbg !42
  %5 = sext i8 %4 to i32, !dbg !42
  %6 = icmp ne i32 %5, 68, !dbg !42
  br i1 %6, label %then1, label %else2, !dbg !42

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !43
  %7 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end3, !dbg !43

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %else2, %then1
  %8 = call i8 @gradeOfScore(i32 6), !dbg !44
  %9 = sext i8 %8 to i32, !dbg !44
  %10 = icmp ne i32 %9, 67, !dbg !44
  br i1 %10, label %then4, label %else5, !dbg !44

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !45
  %11 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end6, !dbg !45

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !45

if.end6:                                          ; preds = %else5, %then4
  %12 = call i8 @gradeOfScore(i32 8), !dbg !46
  %13 = sext i8 %12 to i32, !dbg !46
  %14 = icmp ne i32 %13, 66, !dbg !46
  br i1 %14, label %then7, label %else8, !dbg !46

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !47
  %15 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end9, !dbg !47

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !47

if.end9:                                          ; preds = %else8, %then7
  %16 = call i8 @gradeOfScore(i32 9), !dbg !48
  %17 = sext i8 %16 to i32, !dbg !48
  %18 = icmp ne i32 %17, 65, !dbg !48
  br i1 %18, label %then10, label %else11, !dbg !48

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !49
  %19 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end12, !dbg !49

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !49

if.end12:                                         ; preds = %else11, %then10
  store i32 0, ptr %boundary, align 4, !dbg !35
  %20 = load i32, ptr %boundary, align 4, !dbg !50
  br label %case.0, !dbg !50

case.0:                                           ; preds = %if.end12
  store i8 69, ptr %grade, align 1, !dbg !51
  %21 = load i8, ptr %grade, align 1, !dbg !51
  br label %switch.end, !dbg !52

switch.end:                                       ; preds = %case.0
  %22 = load i8, ptr %grade, align 1, !dbg !53
  %23 = sext i8 %22 to i32, !dbg !53
  %24 = icmp ne i32 %23, 69, !dbg !53
  br i1 %24, label %then13, label %else14, !dbg !53

then13:                                           ; preds = %switch.end
  store i32 1, ptr %err, align 4, !dbg !54
  %25 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end15, !dbg !54

else14:                                           ; preds = %switch.end
  br label %if.end15, !dbg !54

if.end15:                                         ; preds = %else14, %then13
  %26 = load i32, ptr %err, align 4, !dbg !55
  %27 = icmp eq i32 %26, 0, !dbg !55
  br i1 %27, label %then16, label %else17, !dbg !55

then16:                                           ; preds = %if.end15
  %28 = call i32 (ptr, ...) @printf(ptr @0), !dbg !56
  br label %if.end18, !dbg !56

else17:                                           ; preds = %if.end15
  %29 = call i32 (ptr, ...) @printf(ptr @1), !dbg !58
  br label %if.end18, !dbg !58

if.end18:                                         ; preds = %else17, %then16
  %30 = load i32, ptr %err, align 4, !dbg !60
  ret i32 %30, !dbg !60
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "18.switch_case.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "gradeOfScore", linkageName: "gradeOfScore", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !8}
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DILocalVariable(name: "grade", scope: !4, file: !3, line: 7, type: !7)
!10 = !DILocation(line: 7, column: 3, scope: !4)
!11 = !DILocalVariable(name: "score", arg: 1, scope: !4, file: !3, line: 6, type: !8)
!12 = !DILocation(line: 6, column: 6, scope: !4)
!13 = !DILocation(line: 8, column: 3, scope: !4)
!14 = !DILocation(line: 9, column: 5, scope: !4)
!15 = !DILocation(line: 10, column: 5, scope: !4)
!16 = !DILocation(line: 11, column: 5, scope: !4)
!17 = !DILocation(line: 12, column: 5, scope: !4)
!18 = !DILocation(line: 14, column: 7, scope: !4)
!19 = !DILocation(line: 15, column: 7, scope: !4)
!20 = !DILocation(line: 17, column: 7, scope: !4)
!21 = !DILocation(line: 18, column: 7, scope: !4)
!22 = !DILocation(line: 19, column: 5, scope: !4)
!23 = !DILocation(line: 21, column: 7, scope: !4)
!24 = !DILocation(line: 22, column: 7, scope: !4)
!25 = !DILocation(line: 23, column: 5, scope: !4)
!26 = !DILocation(line: 25, column: 7, scope: !4)
!27 = !DILocation(line: 26, column: 7, scope: !4)
!28 = !DILocation(line: 28, column: 7, scope: !4)
!29 = !DILocation(line: 29, column: 7, scope: !4)
!30 = !DILocation(line: 31, column: 3, scope: !4)
!31 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 34, type: !32, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!8}
!34 = !DILocalVariable(name: "boundary", scope: !31, file: !3, line: 44, type: !8)
!35 = !DILocation(line: 44, column: 3, scope: !31)
!36 = !DILocalVariable(name: "grade", scope: !31, file: !3, line: 43, type: !7)
!37 = !DILocation(line: 43, column: 3, scope: !31)
!38 = !DILocalVariable(name: "err", scope: !31, file: !3, line: 35, type: !8)
!39 = !DILocation(line: 35, column: 3, scope: !31)
!40 = !DILocation(line: 37, column: 3, scope: !31)
!41 = !DILocation(line: 37, column: 31, scope: !31)
!42 = !DILocation(line: 38, column: 3, scope: !31)
!43 = !DILocation(line: 38, column: 31, scope: !31)
!44 = !DILocation(line: 39, column: 3, scope: !31)
!45 = !DILocation(line: 39, column: 31, scope: !31)
!46 = !DILocation(line: 40, column: 3, scope: !31)
!47 = !DILocation(line: 40, column: 31, scope: !31)
!48 = !DILocation(line: 41, column: 3, scope: !31)
!49 = !DILocation(line: 41, column: 31, scope: !31)
!50 = !DILocation(line: 45, column: 3, scope: !31)
!51 = !DILocation(line: 47, column: 7, scope: !31)
!52 = !DILocation(line: 48, column: 7, scope: !31)
!53 = !DILocation(line: 50, column: 3, scope: !31)
!54 = !DILocation(line: 50, column: 21, scope: !31)
!55 = !DILocation(line: 52, column: 3, scope: !31)
!56 = !DILocation(line: 53, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !31, file: !3, line: 52, column: 17)
!58 = !DILocation(line: 55, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !31, file: !3, line: 54, column: 10)
!60 = !DILocation(line: 57, column: 3, scope: !31)
