; ModuleID = 'lcc'
source_filename = "lcc"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

@0 = private unnamed_addr constant [20 x i8] c"19.for_loop.c PASS\0A\00", align 1
@1 = private unnamed_addr constant [20 x i8] c"19.for_loop.c FAIL\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @countSum(i32 %0) !dbg !4 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !9, !DIExpression(), !10)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !11, !DIExpression(), !12)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !13, !DIExpression(), !14)
  store i32 %0, ptr %n, align 4, !dbg !14
  store i32 0, ptr %sum, align 4, !dbg !12
  store i32 1, ptr %i, align 4, !dbg !10
  br label %for.cond, !dbg !10

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !10
  %2 = load i32, ptr %n, align 4, !dbg !10
  %3 = icmp sle i32 %1, %2, !dbg !10
  br i1 %3, label %for.loop, label %for.end, !dbg !10

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !15
  %5 = load i32, ptr %sum, align 4, !dbg !15
  %6 = add i32 %5, %4, !dbg !15
  store i32 %6, ptr %sum, align 4, !dbg !15
  %7 = load i32, ptr %sum, align 4, !dbg !15
  br label %for.update, !dbg !15

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4, !dbg !15
  %9 = add i32 %8, 1, !dbg !15
  store i32 %9, ptr %i, align 4, !dbg !15
  %10 = load i32, ptr %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !17
  ret i32 %11, !dbg !17
}

define i32 @countSum2(i32 %0) !dbg !18 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !19, !DIExpression(), !20)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !21, !DIExpression(), !22)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !23, !DIExpression(), !24)
  store i32 %0, ptr %n, align 4, !dbg !24
  store i32 0, ptr %sum, align 4, !dbg !22
  store i32 1, ptr %i, align 4, !dbg !20
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.update, %entry
  %1 = load i32, ptr %i, align 4, !dbg !25
  %2 = load i32, ptr %n, align 4, !dbg !25
  %3 = icmp sle i32 %1, %2, !dbg !25
  br i1 %3, label %for.loop, label %for.end, !dbg !25

for.loop:                                         ; preds = %for.cond
  %4 = load i32, ptr %i, align 4, !dbg !26
  %5 = load i32, ptr %sum, align 4, !dbg !26
  %6 = add i32 %5, %4, !dbg !26
  store i32 %6, ptr %sum, align 4, !dbg !26
  %7 = load i32, ptr %sum, align 4, !dbg !26
  br label %for.update, !dbg !26

for.update:                                       ; preds = %for.loop
  %8 = load i32, ptr %i, align 4, !dbg !26
  %9 = add i32 %8, 1, !dbg !26
  store i32 %9, ptr %i, align 4, !dbg !26
  %10 = load i32, ptr %i, align 4, !dbg !26
  br label %for.cond, !dbg !26

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %sum, align 4, !dbg !28
  ret i32 %11, !dbg !28
}

define i32 @countSum3(i32 %0) !dbg !29 {
entry:
  %i = alloca i32, align 4
    #dbg_declare(ptr %i, !30, !DIExpression(), !31)
  %sum = alloca i32, align 4
    #dbg_declare(ptr %sum, !32, !DIExpression(), !33)
  %n = alloca i32, align 4
    #dbg_declare(ptr %n, !34, !DIExpression(), !35)
  store i32 %0, ptr %n, align 4, !dbg !35
  store i32 0, ptr %sum, align 4, !dbg !33
  store i32 1, ptr %i, align 4, !dbg !36
  %1 = load i32, ptr %i, align 4, !dbg !36
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.update, %entry
  %2 = load i32, ptr %i, align 4, !dbg !36
  %3 = load i32, ptr %n, align 4, !dbg !36
  %4 = icmp sle i32 %2, %3, !dbg !36
  br i1 %4, label %for.loop, label %for.end, !dbg !36

for.loop:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4, !dbg !37
  %6 = load i32, ptr %sum, align 4, !dbg !37
  %7 = add i32 %6, %5, !dbg !37
  store i32 %7, ptr %sum, align 4, !dbg !37
  %8 = load i32, ptr %sum, align 4, !dbg !37
  br label %for.update, !dbg !37

for.update:                                       ; preds = %for.loop
  %9 = load i32, ptr %i, align 4, !dbg !37
  %10 = add i32 %9, 1, !dbg !37
  store i32 %10, ptr %i, align 4, !dbg !37
  %11 = load i32, ptr %i, align 4, !dbg !37
  br label %for.cond, !dbg !37

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %sum, align 4, !dbg !39
  ret i32 %12, !dbg !39
}

define i32 @main() !dbg !40 {
entry:
  %err = alloca i32, align 4
    #dbg_declare(ptr %err, !43, !DIExpression(), !44)
  store i32 0, ptr %err, align 4, !dbg !44
  %0 = call i32 @countSum(i32 100), !dbg !45
  %1 = icmp ne i32 %0, 5050, !dbg !45
  br i1 %1, label %then, label %else, !dbg !45

then:                                             ; preds = %entry
  store i32 1, ptr %err, align 4, !dbg !46
  %2 = load i32, ptr %err, align 4, !dbg !46
  br label %if.end, !dbg !46

else:                                             ; preds = %entry
  br label %if.end, !dbg !46

if.end:                                           ; preds = %else, %then
  %3 = call i32 @countSum2(i32 100), !dbg !47
  %4 = icmp ne i32 %3, 5050, !dbg !47
  br i1 %4, label %then1, label %else2, !dbg !47

then1:                                            ; preds = %if.end
  store i32 1, ptr %err, align 4, !dbg !48
  %5 = load i32, ptr %err, align 4, !dbg !48
  br label %if.end3, !dbg !48

else2:                                            ; preds = %if.end
  br label %if.end3, !dbg !48

if.end3:                                          ; preds = %else2, %then1
  %6 = call i32 @countSum3(i32 100), !dbg !49
  %7 = icmp ne i32 %6, 5050, !dbg !49
  br i1 %7, label %then4, label %else5, !dbg !49

then4:                                            ; preds = %if.end3
  store i32 1, ptr %err, align 4, !dbg !50
  %8 = load i32, ptr %err, align 4, !dbg !50
  br label %if.end6, !dbg !50

else5:                                            ; preds = %if.end3
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %else5, %then4
  %9 = call i32 @countSum(i32 0), !dbg !51
  %10 = icmp ne i32 %9, 0, !dbg !51
  br i1 %10, label %then7, label %else8, !dbg !51

then7:                                            ; preds = %if.end6
  store i32 1, ptr %err, align 4, !dbg !52
  %11 = load i32, ptr %err, align 4, !dbg !52
  br label %if.end9, !dbg !52

else8:                                            ; preds = %if.end6
  br label %if.end9, !dbg !52

if.end9:                                          ; preds = %else8, %then7
  %12 = call i32 @countSum(i32 1), !dbg !53
  %13 = icmp ne i32 %12, 1, !dbg !53
  br i1 %13, label %then10, label %else11, !dbg !53

then10:                                           ; preds = %if.end9
  store i32 1, ptr %err, align 4, !dbg !54
  %14 = load i32, ptr %err, align 4, !dbg !54
  br label %if.end12, !dbg !54

else11:                                           ; preds = %if.end9
  br label %if.end12, !dbg !54

if.end12:                                         ; preds = %else11, %then10
  %15 = load i32, ptr %err, align 4, !dbg !55
  %16 = icmp eq i32 %15, 0, !dbg !55
  br i1 %16, label %then13, label %else14, !dbg !55

then13:                                           ; preds = %if.end12
  %17 = call i32 (ptr, ...) @printf(ptr @0), !dbg !56
  br label %if.end15, !dbg !56

else14:                                           ; preds = %if.end12
  %18 = call i32 (ptr, ...) @printf(ptr @1), !dbg !58
  br label %if.end15, !dbg !58

if.end15:                                         ; preds = %else14, %then13
  %19 = load i32, ptr %err, align 4, !dbg !60
  ret i32 %19, !dbg !60
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "lcc", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "19.for_loop.c", directory: "../tests")
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !DISubprogram(name: "countSum", linkageName: "countSum", scope: null, file: !1, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{}
!9 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 5, type: !7)
!10 = !DILocation(line: 5, column: 8, scope: !4)
!11 = !DILocalVariable(name: "sum", scope: !4, file: !1, line: 4, type: !7)
!12 = !DILocation(line: 4, column: 3, scope: !4)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !4, file: !1, line: 3, type: !7)
!14 = !DILocation(line: 3, column: 5, scope: !4)
!15 = !DILocation(line: 6, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !4, file: !1, line: 5, column: 35)
!17 = !DILocation(line: 8, column: 3, scope: !4)
!18 = distinct !DISubprogram(name: "countSum2", linkageName: "countSum2", scope: null, file: !1, line: 11, type: !5, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!19 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 13, type: !7)
!20 = !DILocation(line: 13, column: 3, scope: !18)
!21 = !DILocalVariable(name: "sum", scope: !18, file: !1, line: 12, type: !7)
!22 = !DILocation(line: 12, column: 3, scope: !18)
!23 = !DILocalVariable(name: "n", arg: 1, scope: !18, file: !1, line: 11, type: !7)
!24 = !DILocation(line: 11, column: 5, scope: !18)
!25 = !DILocation(line: 14, column: 3, scope: !18)
!26 = !DILocation(line: 15, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 26)
!28 = !DILocation(line: 17, column: 3, scope: !18)
!29 = distinct !DISubprogram(name: "countSum3", linkageName: "countSum3", scope: null, file: !1, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!30 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 22, type: !7)
!31 = !DILocation(line: 22, column: 3, scope: !29)
!32 = !DILocalVariable(name: "sum", scope: !29, file: !1, line: 21, type: !7)
!33 = !DILocation(line: 21, column: 3, scope: !29)
!34 = !DILocalVariable(name: "n", arg: 1, scope: !29, file: !1, line: 20, type: !7)
!35 = !DILocation(line: 20, column: 5, scope: !29)
!36 = !DILocation(line: 23, column: 3, scope: !29)
!37 = !DILocation(line: 24, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !1, line: 23, column: 31)
!39 = !DILocation(line: 26, column: 3, scope: !29)
!40 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !1, line: 29, type: !41, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !8)
!41 = !DISubroutineType(types: !42)
!42 = !{!7}
!43 = !DILocalVariable(name: "err", scope: !40, file: !1, line: 30, type: !7)
!44 = !DILocation(line: 30, column: 3, scope: !40)
!45 = !DILocation(line: 32, column: 3, scope: !40)
!46 = !DILocation(line: 32, column: 30, scope: !40)
!47 = !DILocation(line: 33, column: 3, scope: !40)
!48 = !DILocation(line: 33, column: 31, scope: !40)
!49 = !DILocation(line: 34, column: 3, scope: !40)
!50 = !DILocation(line: 34, column: 31, scope: !40)
!51 = !DILocation(line: 35, column: 3, scope: !40)
!52 = !DILocation(line: 35, column: 25, scope: !40)
!53 = !DILocation(line: 36, column: 3, scope: !40)
!54 = !DILocation(line: 36, column: 25, scope: !40)
!55 = !DILocation(line: 38, column: 3, scope: !40)
!56 = !DILocation(line: 39, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !40, file: !1, line: 38, column: 17)
!58 = !DILocation(line: 41, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !40, file: !1, line: 40, column: 10)
!60 = !DILocation(line: 43, column: 3, scope: !40)
