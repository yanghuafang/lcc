; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

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
  br label %for.cond, !dbg !9

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !9
  %2 = load i32, ptr %n, align 4, !dbg !9
  %3 = icmp sle i32 %1, %2, !dbg !9
  br i1 %3, label %for.loop, label %for.end, !dbg !9

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !14
  %5 = load i32, ptr %sum, align 4, !dbg !14
  %6 = add i32 %5, %4, !dbg !14
  store i32 %6, ptr %sum, align 4, !dbg !14
  %7 = load i32, ptr %sum, align 4, !dbg !14
  br label %for.update, !dbg !14

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4, !dbg !14
  %9 = add i32 %8, 1, !dbg !14
  store i32 %9, ptr %i, align 4, !dbg !14
  %10 = load i32, ptr %i, align 4, !dbg !14
  br label %for.cond, !dbg !14

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !16
  ret i32 %11, !dbg !16
}

define i32 @countSum2(i32 %0) !dbg !17 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !18, !DIExpression(), !19)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !20, !DIExpression(), !21)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !22, !DIExpression(), !23)
  store i32 %0, ptr %n, align 4, !dbg !23
  store i32 0, ptr %sum, align 4, !dbg !21
  store i32 1, ptr %i, align 4, !dbg !19
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !24
  %2 = load i32, ptr %n, align 4, !dbg !24
  %3 = icmp sle i32 %1, %2, !dbg !24
  br i1 %3, label %for.loop, label %for.end, !dbg !24

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !25
  %5 = load i32, ptr %sum, align 4, !dbg !25
  %6 = add i32 %5, %4, !dbg !25
  store i32 %6, ptr %sum, align 4, !dbg !25
  %7 = load i32, ptr %sum, align 4, !dbg !25
  br label %for.update, !dbg !25

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4, !dbg !25
  %9 = add i32 %8, 1, !dbg !25
  store i32 %9, ptr %i, align 4, !dbg !25
  %10 = load i32, ptr %i, align 4, !dbg !25
  br label %for.cond, !dbg !25

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !27
  ret i32 %11, !dbg !27
}

define i32 @countSum3(i32 %0) !dbg !28 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !29, !DIExpression(), !30)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !31, !DIExpression(), !32)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !33, !DIExpression(), !34)
  store i32 %0, ptr %n, align 4, !dbg !34
  store i32 0, ptr %sum, align 4, !dbg !32
  store i32 1, ptr %i, align 4, !dbg !35
  %1 = load i32, ptr %i, align 4, !dbg !35
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !35
  %3 = load i32, ptr %n, align 4, !dbg !35
  %4 = icmp sle i32 %2, %3, !dbg !35
  br i1 %4, label %for.loop, label %for.end, !dbg !35

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !36
  %6 = load i32, ptr %sum, align 4, !dbg !36
  %7 = add i32 %6, %5, !dbg !36
  store i32 %7, ptr %sum, align 4, !dbg !36
  %8 = load i32, ptr %sum, align 4, !dbg !36
  br label %for.update, !dbg !36

for.update:                                       ; preds = %for.loop
  %9 = load i32, ptr %i, align 4, !dbg !36
  %10 = add i32 %9, 1, !dbg !36
  store i32 %10, ptr %i, align 4, !dbg !36
  %11 = load i32, ptr %i, align 4, !dbg !36
  br label %for.cond, !dbg !36

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !38
  ret i32 %12, !dbg !38
}

define i32 @main() !dbg !39 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !42, !DIExpression(), !43)
  store i32 0, ptr %err, align 4, !dbg !43
  %0 = call i32 @countSum(i32 100), !dbg !44
  %1 = icmp ne i32 %0, 5050, !dbg !44
  br i1 %1, label %then, label %else, !dbg !44

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !45
  %2 = load i32, ptr %err, align 4, !dbg !45
  br label %if.end, !dbg !45

else:                                             ; preds = %entry
  br label %if.end, !dbg !45

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !46
  %4 = icmp ne i32 %3, 5050, !dbg !46
  br i1 %4, label %then1, label %else2, !dbg !46

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !47
  %5 = load i32, ptr %err, align 4, !dbg !47
  br label %if.end3, !dbg !47

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !48
  %7 = icmp ne i32 %6, 5050, !dbg !48
  br i1 %7, label %then4, label %else5, !dbg !48

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !49
  %8 = load i32, ptr %err, align 4, !dbg !49
  br label %if.end6, !dbg !49

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !49

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum(i32 0), !dbg !50
  %10 = icmp ne i32 %9, 0, !dbg !50
  br i1 %10, label %then7, label %else8, !dbg !50

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !51
  %11 = load i32, ptr %err, align 4, !dbg !51
  br label %if.end9, !dbg !51

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !51

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countSum(i32 1), !dbg !52
  %13 = icmp ne i32 %12, 1, !dbg !52
  br i1 %13, label %then10, label %else11, !dbg !52

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !53
  %14 = load i32, ptr %err, align 4, !dbg !53
  br label %if.end12, !dbg !53

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !53

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !54
  %16 = icmp eq i32 %15, 0, !dbg !54
  br i1 %16, label %then13, label %else14, !dbg !54

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !55
  br label %if.end15, !dbg !55

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !57
  br label %if.end15, !dbg !57

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !59
  ret i32 %19, !dbg !59
}

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!4 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !3, line: 6, type: !5, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DILocalVariable(name: "i", scope: !4, file: !3, line: 8, type: !7)
!9 = !DILocation(line: 8, column: 8, scope: !4)
!10 = !DILocalVariable(name: "sum", scope: !4, file: !3, line: 7, type: !7)
!11 = !DILocation(line: 7, column: 3, scope: !4)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !3, line: 6, type: !7)
!13 = !DILocation(line: 6, column: 5, scope: !4)
!14 = !DILocation(line: 9, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !4, file: !3, line: 8, column: 35)
!16 = !DILocation(line: 11, column: 3, scope: !4)
!17 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !3, line: 14, type: !5, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2)
!18 = !DILocalVariable(name: "i", scope: !17, file: !3, line: 16, type: !7)
!19 = !DILocation(line: 16, column: 3, scope: !17)
!20 = !DILocalVariable(name: "sum", scope: !17, file: !3, line: 15, type: !7)
!21 = !DILocation(line: 15, column: 3, scope: !17)
!22 = !DILocalVariable(name: "n", arg: 1, scope: !17, file: !3, line: 14, type: !7)
!23 = !DILocation(line: 14, column: 5, scope: !17)
!24 = !DILocation(line: 17, column: 3, scope: !17)
!25 = !DILocation(line: 18, column: 5, scope: !26)
!26 = distinct !DILexicalBlock(scope: !17, file: !3, line: 17, column: 26)
!27 = !DILocation(line: 20, column: 3, scope: !17)
!28 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !3, line: 23, type: !5, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2)
!29 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 25, type: !7)
!30 = !DILocation(line: 25, column: 3, scope: !28)
!31 = !DILocalVariable(name: "sum", scope: !28, file: !3, line: 24, type: !7)
!32 = !DILocation(line: 24, column: 3, scope: !28)
!33 = !DILocalVariable(name: "n", arg: 1, scope: !28, file: !3, line: 23, type: !7)
!34 = !DILocation(line: 23, column: 5, scope: !28)
!35 = !DILocation(line: 26, column: 3, scope: !28)
!36 = !DILocation(line: 27, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !3, line: 26, column: 31)
!38 = !DILocation(line: 29, column: 3, scope: !28)
!39 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !3, line: 32, type: !40, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!7}
!42 = !DILocalVariable(name: "err", scope: !39, file: !3, line: 33, type: !7)
!43 = !DILocation(line: 33, column: 3, scope: !39)
!44 = !DILocation(line: 35, column: 3, scope: !39)
!45 = !DILocation(line: 35, column: 30, scope: !39)
!46 = !DILocation(line: 36, column: 3, scope: !39)
!47 = !DILocation(line: 36, column: 31, scope: !39)
!48 = !DILocation(line: 37, column: 3, scope: !39)
!49 = !DILocation(line: 37, column: 31, scope: !39)
!50 = !DILocation(line: 38, column: 3, scope: !39)
!51 = !DILocation(line: 38, column: 25, scope: !39)
!52 = !DILocation(line: 39, column: 3, scope: !39)
!53 = !DILocation(line: 39, column: 25, scope: !39)
!54 = !DILocation(line: 41, column: 3, scope: !39)
!55 = !DILocation(line: 42, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !39, file: !3, line: 41, column: 17)
!57 = !DILocation(line: 44, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !39, file: !3, line: 43, column: 10)
!59 = !DILocation(line: 46, column: 3, scope: !39)
