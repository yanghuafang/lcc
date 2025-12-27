; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [29 x i8] c"42.switch_no_default.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [29 x i8] c"42.switch_no_default.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @grade(i32 %0) !dbg !4 {
entry:
  %r = alloca i32, align 4
    #dbg_declare(ptr %r, !9, !DIExpression(), !10)
  %score = alloca i32, align 4
    #dbg_declare(ptr %score, !11, !DIExpression(), !12)
  store i32 %0, ptr %score, align 4, !dbg !12
  store i32 0, ptr %r, align 4, !dbg !10
  %1 = load i32, ptr %score, align 4, !dbg !13
  %2 = icmp eq i32 %1, 1, !dbg !13
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !13

switch.compare.0:                                 ; preds = %entry
  %3 = icmp eq i32 %1, 2, !dbg !13
  br i1 %3, label %case.1, label %switch.end, !dbg !13

case.0:                                           ; preds = %entry
  store i32 10, ptr %r, align 4, !dbg !14
  %4 = load i32, ptr %r, align 4, !dbg !14
  br label %switch.end, !dbg !15

case.1:                                           ; preds = %switch.compare.0
  store i32 20, ptr %r, align 4, !dbg !16
  %5 = load i32, ptr %r, align 4, !dbg !16
  br label %switch.end, !dbg !17

switch.end:                                       ; preds = %case.1, %case.0, %switch.compare.0
  %6 = load i32, ptr %r, align 4, !dbg !18
  ret i32 %6, !dbg !18
}

define i32 @allReturn(i32 %0) !dbg !19 {
entry:
  %x = alloca i32, align 4
    #dbg_declare(ptr %x, !20, !DIExpression(), !21)
  store i32 %0, ptr %x, align 4, !dbg !21
  %1 = load i32, ptr %x, align 4, !dbg !22
  %2 = icmp eq i32 %1, 1, !dbg !22
  br i1 %2, label %case.0, label %switch.compare.0, !dbg !22

switch.compare.0:                                 ; preds = %entry
  br label %case.1, !dbg !22

case.0:                                           ; preds = %entry
  ret i32 100, !dbg !23

case.1:                                           ; preds = %switch.compare.0
  ret i32 200, !dbg !24
}

define i32 @main() !dbg !25 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !28, !DIExpression(), !29)
  store i32 0, ptr %err, align 4, !dbg !29
  %0 = call i32 @grade(i32 1), !dbg !30
  %1 = icmp ne i32 %0, 10, !dbg !30
  br i1 %1, label %then, label %else, !dbg !30

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !31
  %2 = load i32, ptr %err, align 4, !dbg !31
  br label %if.end, !dbg !31

else:                                             ; preds = %entry
  br label %if.end, !dbg !31

if.end:                                           ; preds = %else, %then
  %3 = call i32 @grade(i32 2), !dbg !32
  %4 = icmp ne i32 %3, 20, !dbg !32
  br i1 %4, label %then1, label %else2, !dbg !32

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !33
  %5 = load i32, ptr %err, align 4, !dbg !33
  br label %if.end3, !dbg !33

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @grade(i32 7), !dbg !34
  %7 = icmp ne i32 %6, 0, !dbg !34
  br i1 %7, label %then4, label %else5, !dbg !34

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !35
  %8 = load i32, ptr %err, align 4, !dbg !35
  br label %if.end6, !dbg !35

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !35

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @allReturn(i32 1), !dbg !36
  %10 = icmp ne i32 %9, 100, !dbg !36
  br i1 %10, label %then7, label %else8, !dbg !36

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !37
  %11 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end9, !dbg !37

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !37

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @allReturn(i32 3), !dbg !38
  %13 = icmp ne i32 %12, 200, !dbg !38
  br i1 %13, label %then10, label %else11, !dbg !38

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !39
  %14 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end12, !dbg !39

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !39

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !40
  %16 = icmp eq i32 %15, 0, !dbg !40
  br i1 %16, label %then13, label %else14, !dbg !40

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !41
  br label %if.end15, !dbg !41

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !43
  br label %if.end15, !dbg !43

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !45
  ret i32 %19, !dbg !45
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "42.switch_no_default.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "grade", linkageName: "grade", scope: null, file: !3, line: 11, type: !5, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "r", scope: !4, file: !3, line: 12, type: !7)
!10 = !DILocation(line: 12, column: 3, scope: !4)
!11 = !DILocalVariable(name: "score", arg: 1, scope: !4, file: !3, line: 11, type: !7)
!12 = !DILocation(line: 11, column: 5, scope: !4)
!13 = !DILocation(line: 13, column: 3, scope: !4)
!14 = !DILocation(line: 15, column: 7, scope: !4)
!15 = !DILocation(line: 16, column: 7, scope: !4)
!16 = !DILocation(line: 18, column: 7, scope: !4)
!17 = !DILocation(line: 19, column: 7, scope: !4)
!18 = !DILocation(line: 21, column: 3, scope: !4)
!19 = distinct !DISubprogram(name: "allReturn", linkageName: "allReturn", scope: null, file: !3, line: 25, type: !5, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!20 = !DILocalVariable(name: "x", arg: 1, scope: !19, file: !3, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 5, scope: !19)
!22 = !DILocation(line: 26, column: 3, scope: !19)
!23 = !DILocation(line: 28, column: 7, scope: !19)
!24 = !DILocation(line: 30, column: 7, scope: !19)
!25 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 34, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !8)
!26 = !DISubroutineType(types: !27)
!27 = !{!7}
!28 = !DILocalVariable(name: "err", scope: !25, file: !3, line: 35, type: !7)
!29 = !DILocation(line: 35, column: 3, scope: !25)
!30 = !DILocation(line: 37, column: 3, scope: !25)
!31 = !DILocation(line: 37, column: 23, scope: !25)
!32 = !DILocation(line: 38, column: 3, scope: !25)
!33 = !DILocation(line: 38, column: 23, scope: !25)
!34 = !DILocation(line: 39, column: 3, scope: !25)
!35 = !DILocation(line: 39, column: 22, scope: !25)
!36 = !DILocation(line: 41, column: 3, scope: !25)
!37 = !DILocation(line: 41, column: 28, scope: !25)
!38 = !DILocation(line: 42, column: 3, scope: !25)
!39 = !DILocation(line: 42, column: 28, scope: !25)
!40 = !DILocation(line: 44, column: 3, scope: !25)
!41 = !DILocation(line: 45, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !25, file: !3, line: 44, column: 17)
!43 = !DILocation(line: 47, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !25, file: !3, line: 46, column: 10)
!45 = !DILocation(line: 49, column: 3, scope: !25)
