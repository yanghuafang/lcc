; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [20 x i8] c"20.do_while.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"20.do_while.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !8, !DIExpression(), !9)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !10, !DIExpression(), !11)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !12, !DIExpression(), !13)
  store i32 %0, ptr %n, align 4, !dbg !13
  store i32 0, ptr %sum, align 4, !dbg !11
  store i32 1, ptr %i, align 4, !dbg !9
  br label %while.cond, !dbg !14

while.cond:                                       ; preds = %while.loop, %entry
  %1 = load i32, ptr %i, align 4, !dbg !14
  %2 = load i32, ptr %n, align 4, !dbg !14
  %3 = icmp sle i32 %1, %2, !dbg !14
  br i1 %3, label %while.loop, label %while.end, !dbg !14

while.loop:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = load i32, ptr %sum, align 4, !dbg !15
  %6 = add i32 %5, %4, !dbg !15
  store i32 %6, ptr %sum, align 4, !dbg !15
  %7 = load i32, ptr %sum, align 4, !dbg !15
  %8 = load i32, ptr %i, align 4, !dbg !17
  %9 = add i32 %8, 1, !dbg !17
  store i32 %9, ptr %i, align 4, !dbg !17
  %10 = load i32, ptr %i, align 4, !dbg !17
  br label %while.cond, !dbg !17

while.end:                                        ; preds = %while.cond
  %11 = load i32, ptr %sum, align 4, !dbg !18
  ret i32 %11, !dbg !18
}

define i32 @countSum2(i32 %0) !dbg !19 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !20, !DIExpression(), !21)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !22, !DIExpression(), !23)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !24, !DIExpression(), !25)
  store i32 %0, ptr %n, align 4, !dbg !25
  store i32 0, ptr %sum, align 4, !dbg !23
  store i32 0, ptr %i, align 4, !dbg !21
  br label %do.loop, !dbg !26

do.loop:                                          ; preds = %do.cond, %entry
  %1 = load i32, ptr %i, align 4, !dbg !27
  %2 = load i32, ptr %sum, align 4, !dbg !27
  %3 = add i32 %2, %1, !dbg !27
  store i32 %3, ptr %sum, align 4, !dbg !27
  %4 = load i32, ptr %sum, align 4, !dbg !27
  %5 = load i32, ptr %i, align 4, !dbg !29
  %6 = add i32 %5, 1, !dbg !29
  store i32 %6, ptr %i, align 4, !dbg !29
  %7 = load i32, ptr %i, align 4, !dbg !29
  br label %do.cond, !dbg !29

do.cond:                                          ; preds = %do.loop
  %8 = load i32, ptr %i, align 4, !dbg !29
  %9 = load i32, ptr %n, align 4, !dbg !29
  %10 = icmp sle i32 %8, %9, !dbg !29
  br i1 %10, label %do.loop, label %do.end, !dbg !29

do.end:                                           ; preds = %do.cond
  %11 = load i32, ptr %sum, align 4, !dbg !30
  ret i32 %11, !dbg !30
}

define i32 @main() !dbg !31 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !34, !DIExpression(), !35)
  store i32 0, ptr %err, align 4, !dbg !35
  %0 = call i32 @countSum(i32 100), !dbg !36
  %1 = icmp ne i32 %0, 5050, !dbg !36
  br i1 %1, label %then, label %else, !dbg !36

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !37
  %2 = load i32, ptr %err, align 4, !dbg !37
  br label %if.end, !dbg !37

else:                                             ; preds = %entry
  br label %if.end, !dbg !37

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !38
  %4 = icmp ne i32 %3, 5050, !dbg !38
  br i1 %4, label %then1, label %else2, !dbg !38

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !39
  %5 = load i32, ptr %err, align 4, !dbg !39
  br label %if.end3, !dbg !39

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum(i32 0), !dbg !40
  %7 = icmp ne i32 %6, 0, !dbg !40
  br i1 %7, label %then4, label %else5, !dbg !40

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !41
  %8 = load i32, ptr %err, align 4, !dbg !41
  br label %if.end6, !dbg !41

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !41

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum2(i32 0), !dbg !42
  %10 = icmp ne i32 %9, 0, !dbg !42
  br i1 %10, label %then7, label %else8, !dbg !42

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !43
  %11 = load i32, ptr %err, align 4, !dbg !43
  br label %if.end9, !dbg !43

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !43

if.end9:                                          ; preds = %else8, %then7
  %12 = load i32, ptr %err, align 4, !dbg !44
  %13 = icmp eq i32 %12, 0, !dbg !44
  br i1 %13, label %then10, label %else11, !dbg !44

then10:                                           ; preds = %if.end9
  %14 = call i32 (ptr, ...) @printf(ptr @0), !dbg !45
  br label %if.end12, !dbg !45

else11:                                           ; preds = %if.end9
  %15 = call i32 (ptr, ...) @printf(ptr @1), !dbg !47
  br label %if.end12, !dbg !47

if.end12:                                         ; preds = %else11, %then10
  %16 = load i32, ptr %err, align 4, !dbg !49
  ret i32 %16, !dbg !49
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "20.do_while.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 8, type: !7)
!9 = !DILocation(line: 8, column: 3, scope: !4)
!10 = !DILocalVariable(name: "sum", scope: !4, file: !3, line: 7, type: !7)
!11 = !DILocation(line: 7, column: 3, scope: !4)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !3, line: 6, type: !7)
!13 = !DILocation(line: 6, column: 5, scope: !4)
!14 = !DILocation(line: 9, column: 3, scope: !4)
!15 = !DILocation(line: 10, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !3, line: 9, column: 18)
!17 = !DILocation(line: 11, column: 5, scope: !16)
!18 = !DILocation(line: 13, column: 3, scope: !4)
!19 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !3, line: 16, type: !5, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !2)
!20 = !DILocalVariable(name: "i", scope: !19, file: !3, line: 18, type: !7)
!21 = !DILocation(line: 18, column: 3, scope: !19)
!22 = !DILocalVariable(name: "sum", scope: !19, file: !3, line: 17, type: !7)
!23 = !DILocation(line: 17, column: 3, scope: !19)
!24 = !DILocalVariable(name: "n", arg: 1, scope: !19, file: !3, line: 16, type: !7)
!25 = !DILocation(line: 16, column: 5, scope: !19)
!26 = !DILocation(line: 19, column: 3, scope: !19)
!27 = !DILocation(line: 20, column: 5, scope: !28)
!28 = distinct !DILexicalBlock(scope: !19, file: !3, line: 19, column: 6)
!29 = !DILocation(line: 21, column: 5, scope: !28)
!30 = !DILocation(line: 23, column: 3, scope: !19)
!31 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 26, type: !32, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!7}
!34 = !DILocalVariable(name: "err", scope: !31, file: !3, line: 27, type: !7)
!35 = !DILocation(line: 27, column: 3, scope: !31)
!36 = !DILocation(line: 29, column: 3, scope: !31)
!37 = !DILocation(line: 29, column: 30, scope: !31)
!38 = !DILocation(line: 30, column: 3, scope: !31)
!39 = !DILocation(line: 30, column: 31, scope: !31)
!40 = !DILocation(line: 31, column: 3, scope: !31)
!41 = !DILocation(line: 31, column: 25, scope: !31)
!42 = !DILocation(line: 32, column: 3, scope: !31)
!43 = !DILocation(line: 32, column: 26, scope: !31)
!44 = !DILocation(line: 34, column: 3, scope: !31)
!45 = !DILocation(line: 35, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !3, line: 34, column: 17)
!47 = !DILocation(line: 37, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !31, file: !3, line: 36, column: 10)
!49 = !DILocation(line: 39, column: 3, scope: !31)
